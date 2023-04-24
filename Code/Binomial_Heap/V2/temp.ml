    (* Binomial tree - key, rank, child_list *)
    type 'a tree = Node of 'a * int * 'a tree list

    (* Binomial heap is a list of binomial trees *)
    type 'a heap = 'a option * 'a tree list

    let empty = (None, [])
    let isEmpty = function (_, []) -> true | _ -> false
    let rank = function Node(_, r, _) -> r

    (* a singleton binomial tree *)
    let singleton k = Node(k, 0, [])

    (* links to binomial trees with rank r to form a binomial tree with rank r+1 *)
    let link t1 t2 = 
        match t1, t2 with
        |   Node(k1, r1, l1), Node(k2, r2, l2) ->
            if(r1 <> r2) then failwith "Binomial trees have different ranks!"
            else if(k1 < k2) then Node(k1, r1 + 1, t2 :: l1) 
            else Node(k2, r1 + 1, t1 :: l2)

    let insert key (minimum, heap) = 
        let rec insTree t h = match h with 
        |   [] -> [t]
        |   (Node(k, r, c) as t' :: tl) -> 
                if rank t < rank t' then t :: h
                else insTree (link t t') tl
        in 
        let h' = insTree (singleton key) heap in 
            match minimum with 
                |   None -> (Some key, h')
                |   Some m -> (Some (min key m), h')

    let rec merge_ h1 h2 = match h1, h2 with
        |   h, [] -> h
        |   [], h -> h
        |   (Node(_, r1, _) as hd1) :: tl1, (Node(_, r2, _) as hd2) :: tl2 ->
                if(r1 < r2) then hd1 :: (merge_ tl1 h2)
                else if(r1 > r2) then hd2 :: (merge_ h1 tl2)
                else merge_ ((link hd1 hd2) :: tl1) tl2

    let merge (min1, h1) (min2, h2) =  
        let h' = merge_ h1 h2 
        in (min min1 min2, h')

    (* get key of a binomial tree *)
    let getKey = fun(Node(k, _, _)) -> k

    (* query for the minimum element in a binomial heap *)
    let getMin (min, heap) = match min with
        |   None -> failwith "Empty Heap"
        |   Some m -> m

    (* returns the tree with min root node and the list of remaining trees in the heap *)
    let rec removeMinTree = function 
            [] -> failwith "Empty heap"
        |   [t] -> (t, [])
        |   t :: tl -> 
                let (t', tl') = removeMinTree tl in
                if(getKey t < getKey t') then (t, tl)
                else (t', t :: tl')

    (* delete a key from heap *)
    let deleteMin (minimum, heap) = 
        match minimum with 
        |   None -> failwith "Empty heap"
        |   Some m ->
                let (Node(_, _, c), h') = removeMinTree heap in
                let merged = merge_ (List.rev c) h' in
                let newMin = match merged with
                |   [] -> None
                |   Node(hd, _, _)::tl -> List.fold_left (fun acc (Node(k, _, _)) -> min acc k) hd tl
                in
                (newMin, merged)
                
    (* create a heap from list of keys *)
    let fromList l = 
        let rec loop heap = function
                [] -> heap
            |   hd :: tl -> loop (insert hd heap) tl
        in loop empty l

