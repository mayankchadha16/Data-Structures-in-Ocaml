module type BINOMIAL_HEAP = sig
    type 'a heap

    val empty : 'a heap
    val isEmpty : 'a heap -> bool

    val merge : 'a heap -> 'a heap -> 'a heap
    val insert : 'a -> 'a heap -> 'a heap

    val getMin : 'a heap -> 'a
    val deleteMin : 'a heap -> 'a heap
    val fromList : 'a list -> 'a heap
end

module BinomialHeap : BINOMIAL_HEAP = 
struct

    (* Binomial tree - key, rank, child_list *)
    type 'a tree = Node of 'a * int * 'a tree list

    (* Binomial heap is a list of binomial trees *)
    type 'a heap = 'a tree list

    let empty = []
    let isEmpty = function [] -> true | _ :: _ -> false
    (* a singleton binomial tree *)
    let singleton k = Node(k, 0, [])

    (* links to binomial trees with rank r to form a binomial tree with rank r+1 *)
    let link t1 t2 = 
        match t1, t2 with
        |   Node(k1, r1, l1), Node(k2, r2, l2) ->
            if(r1 <> r2) then failwith "Binomial trees have different ranks!"
            else if(k1 < k2) then Node(k1, r1 + 1, t2 :: l1) 
            else Node(k2, r1 + 1, t1 :: l2)

    (* merges two binomial trees *)
    let rec merge h1 h2 = match h1, h2 with
        |   h, [] -> h
        |   [], h -> h
        |   (Node(_, r1, _) as hd1) :: tl1, (Node(_, r2, _) as hd2) :: tl2 ->
                if(r1 < r2) then hd1 :: (merge tl1 h2)
                else if(r1 > r2) then hd2 :: (merge h1 tl2)
                else merge ((link hd1 hd2) :: tl1) tl2

    (* insert a new key in a binomial heap *)
    let insert key heap = merge [singleton key] heap

    (* get key of a binomial tree *)
    let getKey = fun(Node(k, _, _)) -> k

    (* query for the minimum element in a binomial heap *)
    let getMin = function
        |   [] -> failwith "Empty heap"
        |   Node(key, _, _) :: tl ->
            let rec loop acc = function
                    [] -> acc
                |   Node(key, _, _) :: tl -> loop (min acc key) tl
            in loop key tl

    (* returns the tree with min root node and the list of remaining trees in the heap *)
    let rec removeMinTree = function 
            [] -> failwith "Empty heap"
        |   [t] -> (t, [])
        |   t :: tl -> 
                let (t', tl') = removeMinTree tl in
                if(getKey t < getKey t') then (t, tl)
                else (t', t :: tl')

    (* delete a key from heap *)
    let deleteMin h = 
        let (Node(_, _, l1), l2) = removeMinTree h in
        merge (List.rev l1) l2 

    (* create a heap from list of keys *)
    let fromList l = 
        let rec loop heap = function
                [] -> heap
            |   hd :: tl -> loop (insert hd heap) tl
        in loop empty l

end