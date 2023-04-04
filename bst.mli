module MyBST :
sig
    type 'a tree = Node of 'a * 'a tree * 'a tree | Leaf
    val empty : 'a tree
    val mem : 'a -> 'a tree -> bool
    val insert : 'a -> 'a tree -> 'a tree
    val height : 'a tree -> int
end