module type LEFTIST = sig
    type 'a tree

    val empty : 'a tree
    val isEmpty : 'a tree -> bool
    val singleton : 'a -> 'a tree

    val merge : 'a tree -> 'a tree -> 'a tree
    val insert : 'a -> 'a tree -> 'a tree
    
    val getMin : 'a tree -> 'a
    val deleteMin : 'a tree -> 'a tree

    val fromList : 'a list -> 'a tree
end

module Leftist : LEFTIST = 
struct

    (* Tree -> rank, key, leftTree, rightTree *)
    type 'a tree =
        Node of int * 'a * 'a tree * 'a tree
    |   Leaf;;

    let empty = Leaf
    let isEmpty = function Leaf -> true | Node(_, _, _, _) -> false
    let singleton s = Node(1, s, Leaf, Leaf)

    (* rank of a node = length of path between the node and its rightmost leaf *)
    let rank = function
            Node(r, _, _, _) -> r 
        |   Leaf -> 0

    (* In a leftist tree, the rank of the left subtree is always geq the rank of the right subtree *)
    let updateRank key left right = 
        let rank_left = rank left and rank_right = rank right in 
        if rank_right < rank_left then
            Node(rank_right + 1, key, left, right)
        else
            Node(rank_left + 1, key, right, left)

    (* 
        The merge operation ->
        1. If root of t2 less than t1, then switch them.
        2. Apply the merge operation between t2 and the right subtree of t1
        3. Update rank
    *)
    let rec merge t1 t2 =
        match t1, t2 with 
        |   Leaf, tree | tree, Leaf -> tree 
        |   Node(_, k1, l, r), Node(_, k2, _, _) ->
            if(k1 > k2) then 
                merge t2 t1
            else
                updateRank k1 l (merge r t2)

    (* Insert a new key in heap *)
    let insert key heap = 
        let temp = Node(1, key, Leaf, Leaf) in
        merge heap temp 

    (* get the Minimum element *)
    let getMin = function 
            Leaf -> failwith "empty heap"
        |   Node(_, key, _, _) -> key

    (* delete the minimum element *)
    let deleteMin = function 
            Leaf -> failwith "empty heap"
        |   Node(_, _, l, r) -> merge l r

    (* Create a heap from a list *)
    let fromList l = 
        let rec loop heap = function
                [] -> heap
            |   hd :: tl -> loop (insert hd heap) tl
        in loop empty l
end