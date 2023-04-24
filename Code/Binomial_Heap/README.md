# Binomial Heaps (Version 1)

Binomial Heaps are composed of Binomial Trees. Binomial Trees are defined as -
* A binomial tree of rank 0 is a singleton node.
* A binomial tree of rank `r+1` is formed by linking two binomial 
trees of rank `r`, making one tree the leftmost child of the other.
* More intuitive definition : A binomial tree of rank r is a node with r children with ranks `0` to `r-1` respectively.

A binomial tree of rank `r` contains exactly `2^r` nodes.

## Link Operation ->
Linking two binomial trees of rank `r` to form a binomial heap of rank `r+1` is a simple operation. During this operation, we also ensure that the root of the new tree is the minimum element.

```Ocaml
let link t1 t2 = 
    match t1, t2 with
    |   Node(k1, r1, l1), Node(k2, r2, l2) ->
        if(r1 <> r2) then failwith "Binomial trees have different ranks!"
        else if(k1 < k2) then Node(k1, r1 + 1, t2 :: l1) 
        else Node(k2, r1 + 1, t1 :: l2)
```
## Binomial Heap ->
* A binomial heap is just a list of binomial trees. Trees in a binomial heap of size `n` are equal to the number of ones in the binary representation of `n`. 
* Ex - for a heap of size 21 (10101), we will have 3 trees of rank 0, 2 and 4 (size = 1 + 4 + 16 = 21). 
* Each tree will have the minimum element at its root.

```Ocaml
(* Binomial tree - key, rank, child_list *)
type 'a tree = Node of 'a * int * 'a tree list

(* Binomial heap is a list of binomial trees *)
type 'a heap = 'a tree list
```

## Insert Operation ->
To insert a new key `k` into a binomial heap,
* If the heap doesn't have a rank 0 tree, then insert the node there.
* Else, link with the rank 0 tree to form a rank 1 tree. If rank 1 is empty, insert there, else link with rank 2...
* Keep doing this until we find an empty slot.
```Ocaml
let insert key heap = 
    let rec insTree t h = match h with 
    |   [] -> [t]
    |   (Node(k, r, c) as t' :: tl) -> 
            if rank t < rank t' then t :: h
            else insTree (link t t') tl
    in insTree (singleton key) heap
```

## findMin and deleteMin -> 
To find the minimum element, we simply need to iterate through the roots of all the trees in the binomial heap and output the minimum root. This is an `O(log n)` operation.

To delete the minimum element, 
* First, we find the tree with the minimum root.
* Then we merge its children trees with the remaining trees in heap.

This is also an `O(log n) operation.


## Time Complexity ->

| Operation        | Leftist Heaps    | Binomial Heaps    |
| -------------    |:-------------:| -------------:|
| getMin           | O(1)        | O(log n)     |
| deleteMin        | O(log n)    | O(log n)      |
| insert           | O(log n)    | O(log n)      |
| merge 		   | O(log n)    | O(log n)        |

# Improvements -> 

One advantage of leftist heaps over binomial heaps is that getMin takes only `O(1)` time, compared to `O(log n)` for binomial heaps. To improve the running time of getMin, we can attach a `minimum` property to our definition of binomial heap.

```Ocaml
(* minimum element * tree *)
type 'a heap = 'a option * 'a tree list
```

V2 contains the code with updated insert, merge and delete functions. getMin is now O(1).

# Amortized Analysis ->

The intuition behind amortized analysis is that sometimes, we may be interested in knowing the running time of a sequence of operations. We may not care if a few operations in a sequence run in `O(log n)` or even `O(n)` time, provided that the overall cost of the sequence is `O(n)`. So, amortization allows us to measure the performance of a data structure over a sequence of operations, rather than just a single operation.

Mathematically, we need to prove that the actual cost of a sequence is upper bounded by the amortized cost that sequence.

$$ \sum(\text{amortized cost of sequence}) \geq \sum(\text{actual cost of sequence}) $$

Let $a_i$ be the amortized cost of operation i, and $t_i$ be the actual cost of operation i and $m$ be the total number of operations,

$$ \sum_{i=1}^m a_i \geq \sum_{i=1}^{m} t_i $$

* Operations whose actual costs exceed their amortized costs are called **expensive** operations.
* Operations whose actual costs are less than their amortized costs are called **cheap operations**.

There are two main methods to prove amortized bounds -

## Banker's method ->
* We can store *credits* in a bank account.
* During each operation, we can save and spend credits.
$$ \text{Amortized cost of an operation = (actual cost + credits saved - credits spent)} $$
* Now, we jsut need to prove that no operation makes account balance negative. This will guarantee that amortized cost forms an upper bound to the actual cost.

## Physicist's method ->
* Define a *potential energy* of the data structure.
$$ \text{Amortized cost of operation = (actual cost + change in potential energy)} $$
* Now prove that potential energy is never negative.

The banker's method and the physicist's method are actually equivalent.

## Amortized analysis of Binomial Heaps ->

We claim that insert in binomial heaps runs in `O(1)` amortized time.

### Intuition ->

The intuition behind our claim is that insertion in a binomial heap is analogous to adding one to a binary number. In the worst case, if we have to insert an element in a *full* binomial tree (ex. 11111), then we need `O(log n)` operations. However, once this is done, we will have a tree with most lower rank slots empty (11111 + 1 = 100000). Now if we have to insert a new element, then we can insert it in the first slot itself, i.e., it won't take `O(log n)` time. Therefore, the insert operation, averaged over a sequence of operations is amortized constant time.

### Mathematical proof ->
We'll use the physicist's method to prove the amortized bound, 

* Define the potential of a binomial heap to be the number of trees in the heap.
* This corresponds to the number of ones in the binary representation of *n*, the number of elements in the heap. 
* A call to `insert` takes $k + 1$ steps, where k is the number of calls to `link`.
* If initially $t$ trees are present in the heap, then after the insertion there will be $t - k + 1$ trees. This is because we link $k$ trees of lower rank to form 1 tree of higher rank.
* Now we can calculate the change in potential and the amortized cost - 
$$ 
\begin{align*}
\text{Change in potential} &= (t - k + 1) - t \\ &= 1 - k 
\end{align*}
$$
and 

$$ 
\begin{align*}
\text{Amortized cost of insertion} &= \text{Actual cost} + \text{change in potential} \\
							&= (k + 1) + (1 - k) \\
							&= 2
\end{align*}
$$

Therefore, insert runs in O(1) amortized time.

# Amortization and lazy evaluation ->
Functional data structures are *persistent* -
* A data structure is *persistent* if an update doesn't change the existing version of the data structure but instead creates a new version.
* The opposite of persisitent data structures is an *ephemeral* data structure.

Amortized analysis assumes that data structures are used ephemerally. It breaks down if we use the data structures persistently. This is because in an amortized data structure, certain operations are allowed to be more expensive, given that they are balanced by a sufficient number of cheap operations.

However, persistent data structures allow expensive operations to be repeated arbitrarily often. For example, lets suppose we have a binomial heap containing trees of all ranks. If we call insert a value into the heap k times,
```Ocaml
let h1 = insert x h
let h2 = insert x h
...
let hk = insert x h
```
Each of those k `insert` operations have an actual cost of `O(log n)`. Overall the cost is `O(klog n)`. The problem lies in the fact that our amortized analysis only applies to the first insert operation. Note that ephemeral data structures don't allow such a sequence of operations.

## Lazy evaluation ->
Lazy evaluation has two basic properties ->
* The evaluation of an expression is delayed (or suspended) until its result is needed.
* The first time a suspended expression is evaluated, the result is *memoized* or cached so that if it is needed again, we can look it up instead of recomputing it.

Some languages use lazy evaluation by default (Haskell) and some languages support it but doesn't use it by default (OCaml and Standard ML).

Lazy evaluation enables us to account for persistence in amortized analysis. 

* If someone calls an expensive operation, `f x` multiple times, and each call takes the same amount of time, then the amortized bound degrades to worst-case bounds.
* However in lazy evaluation with memoization, the first call to `f` to `x` forces the evaluation of the expression and caches the result. All subsequent calls can then use the memoized result directly.
* Therefore, the total cost again drops down to the amortized cost!
* The logic here is analogous to the fact that although we can spend savings only once, paying off dept more than once does no harm.

## Moving Forward ->
* We can reimplement data structures like Queues and Binomial Heaps using the Lazy module in OCaml to account for persistent behaviour.

* Okasaki, the author of "Purely Functional Data Structures" also talks about *Scheduling*, a technique of converting amortized data structures to worse-case data strucures by systematically forcing lazy components in such a way that no suspension ever takes a long time to execute.