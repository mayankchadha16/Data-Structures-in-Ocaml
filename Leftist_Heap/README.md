# Leftist Heaps

## Why do we need Leftist Heap? 

In Imperative programming languages, binary heaps are implemented using Arrays.

| Operation        | Complexity           |
| ------------- |:-------------:|
| getMin     | O(1) |
| deleteMin      | O(log n)    |
| insert | O(log n)      |
| merge | O(n)     |

However, in Functional programming, mutable arrays doesn't exist and therefore array implementation is not possible.

---

## Leftist Heap ->
Leftist heaps satisfy the *leftist property* on every node.
* **Leftist Property** - The rank of any left child is greater than or equal to the rank of the right child.
* **Rank** - The rank of a node is defined as the length of the path between the node and its rightmost leaf.

In a leftist heap (or tree) the right subtree is always smaller than the left subtree. These are easy to implement in the functional world.

* In a traditional binary heap, we insert a new element at the end of the tree and then update the heap bottom to top (heapify). This is very efficient because array implementation allows constant time access to the parents. 
* In a leftist heap, we insert a new element top to bottom. We try to replace the root node with the new element, if not then move to the right subtree. Leftist property guarantees that the right subtree is smaller than the left, giving us a performance boost.

A Letist tree can be defined as  ->

```Ocaml
(* Rank, Key, Left subtree, Right subtree *)
type 'a tree =
        Node of int * 'a * 'a tree * 'a tree
    |   Leaf;;
```
The merge algorithm ->

1. We want to merge two trees `merge t1 t2`
2. Compare the two roots. If `k1 > k2` then swap them by `merge t2 t1.` This ensures that `t1` has the smallest keyvalue. 
3. Merge `t1`'s right branch with t2 by `merge r1 t2.`
4. The base case will be when one of the two trees is a leaf. Simply return the other tree in this case.
5. Update the rank. Swap the left and right branches if `rank(l) < rank(r).`

Insertion is simply a merge operation with a singleton.

Time complexity of Leftist heap ->

| Operation        | Complexity           |
| ------------- |:-------------:|
| getMin     | O(1) |
| deleteMin      | O(log n)    |
| insert | O(log n)      |
| merge | O(log n)     |

Leftist heap's merge complexity is better as compared to binary heap.

---

## Benchmarks ->
Our implementation took ~2.6s to make a Heap from a list of 1 million random numbers and then deleting them one by one.