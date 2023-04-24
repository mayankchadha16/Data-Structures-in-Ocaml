module type BINOMIAL_HEAP =
  sig
    type 'a heap

    val empty : 'a heap
    val isEmpty : 'a heap -> bool

    val merge : 'a heap -> 'a heap -> 'a heap
	val insert : 'a -> 'a heap -> 'a heap
    val insert2 : 'a -> 'a heap -> 'a heap
	
    val getMin : 'a heap -> 'a
    val deleteMin : 'a heap -> 'a heap
    val fromList : 'a list -> 'a heap
  end

module BinomialHeap : BINOMIAL_HEAP