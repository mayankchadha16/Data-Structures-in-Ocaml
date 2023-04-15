module Rbt :
sig
    type color = Red | Blk
    type 'a tree = Node of (color * 'a * 'a tree * 'a tree) | Leaf
    val empty : 'a tree
    val mem : 'a -> 'a tree -> bool
    val rotate : color * 'a * 'a tree * 'a tree -> 'a tree
    val insert_aux : 'a -> 'a tree -> 'a tree
    val insert : 'a -> 'a tree -> 'a tree
end

val test_case : unit -> unit