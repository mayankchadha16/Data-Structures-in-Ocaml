module type LEFTIST =
  sig
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
module Leftist : LEFTIST