module Rbt =
struct
    type color = 
    | Red 
    | Blk

    type 'a tree = 
    | Node of (color * 'a * 'a tree * 'a tree)
    | Leaf 

    let empty = 
        Leaf

    let rec mem x = function
    | Leaf -> false
    | Node (_, value, left, right) ->
        if x = value then true
        else if x < value then mem x left
        else mem x right

    let rotate = function
        | Blk, z, Node (Red, y, Node (Red, x, a, b), c), d
        | Blk, z, Node (Red, x, a, Node (Red, y, b, c)), d
        | Blk, x, a, Node (Red, z, Node (Red, y, b, c), d)
        | Blk, x, a, Node (Red, y, b, Node (Red, z, c, d)) 
        -> Node (Red, y, Node (Blk, x, a, b), Node (Blk, z, c, d))
        | t -> Node t

    let rec insert_aux x = function
        | Leaf -> Node (Red, x, Leaf, Leaf) (*Color the new node red*)
        | Node (c, value, left, right) as n ->
            if x < value then rotate (c, value, insert_aux x left, right)
            else if x > value then rotate (c, value, left, insert_aux x right)
            else n

    let rec insert x s = 
        match insert_aux x s with 
            | Leaf -> failwith "impossible"
            | Node (_, value, left, right) -> Node (Blk, value, left, right) (*Color root black*)

    let rec gen ?(acc=[]) = function
        | 0 -> acc
        | size ->
            let n = Random.int 1000000 in
            gen ~acc:(n :: acc) (size - 1)

    let time f x =
        let t = Sys.time() in
        let fx = f x in
        Printf.printf "Execution time: %fs\n" (Sys.time() -. t);
        fx

    let fromOrdList lst =
        let rec fromOrdListAux acc = function
            | [] -> acc
            | x :: xs ->
            let tree = insert x acc in
            fromOrdListAux tree xs
        in
        let tree = fromOrdListAux empty lst in
        match tree with
        | Leaf -> Leaf
        | Node (_, value, left, right) -> Node (Blk, value, left, right)

    let rec natural_numbers n =
        if n = 0 then []
        else n :: natural_numbers (n-1);;
    
end

let test_case () =
    let rbt'''' = Rbt.fromOrdList [3; 2; 4; 1] in
    let check = Rbt.mem 1 rbt'''' in
    let check1 = Rbt.mem 4 rbt'''' in
    let check2 = Rbt.mem 3 rbt'''' in
    let check3 = Rbt.mem 9 rbt'''' in
    assert (check = true);
    assert (check1 = true);
    assert (check2 = true);
    assert (check3 = false);
    print_endline "All test cases passed."

(* let time = Rbt.time (Rbt.fromOrdList) (Rbt.gen 10000000) *)
(* let time = Rbt.time (Rbt.fromOrdList) (Rbt.natural_numbers 100000) *)

