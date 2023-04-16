# Binomial Heap

Binomial Heaps are composed of Binomial Trees. Binomial Trees are defined as -
* A binomial tree of rank 0 is a singleton node.
* A binomial tree of rank `r+1` is formed by linking two binomial 
trees of rank `r`, making one tree the leftmost child of the other.
* More intuitive definition : A binomial tree of rank r is a node with r children with ranks `0` to `r-1` respectively.

A binomial tree of rank `r` contains exactly `2^r` nodes.

A binomial heap is just a list of binomial trees.

```Ocaml
(* Binomial tree - key, rank, child_list *)
type 'a tree = Node of 'a * int * 'a tree list

(* Binomial heap is a list of binomial trees *)
type 'a heap = 'a tree list
```
## Time Complexity ->

| Operation        | Leftist Heaps    | Binomial Heaps    |
| -------------    |:-------------:| -------------:|
| getMin           | O(1)        | O(log n)     |
| deleteMin        | O(log n)    | O(log n)      |
| insert           | O(log n)    | O(log n), Amortised O(1)       |
| merge 		   | O(log n)    | O(log n)        |

## To Do ->
* Right now, Binomial heaps are slower than Leftist heaps (7s vs 2.6s) due to O(log n) implementation of getMin.
* To get O(1) getMin, we can maintain a minimum state in the heap's type. We'll need to update it when insert, merge and deleting min operations are executed.
* There are ways in which even insert and merge can be made to run in O(1) time for various flavors of binomial heaps.
