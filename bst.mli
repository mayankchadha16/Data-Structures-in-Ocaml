module MyBST :
sig
    type 'a tree = Node of 'a * 'a tree * 'a tree | Leaf
    val empty : 'a tree
    exception Found
    val mem : 'a -> 'a tree -> bool
    val member_opt : 'a -> 'a tree -> bool
    val insert : 'a -> 'a tree -> 'a tree
    val insert_opt : 'a -> 'a tree -> 'a tree
    val height : 'a tree -> int
    val count : 'a tree -> int
end