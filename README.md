# Data Structures in Ocaml

This project is focused on exploring the concepts of functional programming and data structures.

## Introduction
In the first chapter, we delve into the differences between functional and imperative data structures. We also explore the concept of Strict and Lazy Evaluation, which are important concepts in functional programming.

Throughout the chapter, we introduce and review some terminologies that we were already familiar with from previous programming classes.

Moving forward, we will continue to explore different data structures and concepts in functional programming.

### Functional vs. Imperative Data Structures
Functional data structures are immutable and designed for efficient sharing and reuse of common substructures. They rely on higher-order functions for transformations and are often used in functional programming paradigms.

Imperative data structures, on the other hand, are mutable and designed for direct modification. They are often used in imperative programming paradigms and can be more error-prone and harder to reason about.


### Strict vs. Lazy Evaluation
Strict evaluation, also known as eager evaluation, evaluates expressions as soon as they are bound to variables or passed as arguments to functions. This means that all arguments are evaluated before a function is applied, and any unused arguments are also evaluated.

Lazy evaluation, on the other hand, delays the evaluation of expressions until they are needed. This means that expressions are only evaluated when their results are required to compute the output of a function.

## Functional Data Structures
* No mutable updates: operations take an "old" value and return new value.
* Functional data structures are persistent rather than ephemeral [^1].
* Efficiency and Complexity
  * In general, persistent data structures tend to have higher time and space complexity than their mutable counterparts due to the need to maintain multiple versions  of the data structure.
  *  However, some persistent data structures can have performance comparable to their mutable counterparts in many cases due to the garbage collectors present in Ocaml.

## Data Structures Implemented So Far
1. [Stack](Code/Stack/)
2. [Binary Search Trees](Code/BST/)
3. [Finite Map](Code/Finite_Map)
4. [Leftist Heap](Code/Leftist_Heap/)
5. [Binomial Heap](Code/Binomial_Heap/)
6. [Red-Black Trees](Code/Red_Black_Trees/)
7. [Deque](Code/Deque/)

## Resources and References 
1. [Purely Functional Data Structures by Chris Okasaki](https://www.amazon.in/Purely-Functional-Structures-Chris-Okasaki/dp/0521663504)
2. [Functional Programming in OCaml](https://courses.cs.cornell.edu/cs3110/2021sp/textbook/)
3. [Amortization, Lazy Evaluation and persistence](https://ieeexplore.ieee.org/document/492666)
4. [TypeOCaml](http://typeocaml.com/2015/03/12/heap-leftist-tree/)

[^1]: Functional data structures are persistent because they are designed to be immutable, meaning that any operation that modifies the data structure creates a new version of it while leaving the original version intact. This allows for all previous versions to be accessible even after new versions have been created, making them persistent. In contrast, ephemeral data structures are mutable and do not retain previous versions.


