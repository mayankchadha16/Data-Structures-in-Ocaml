# Table of Contents

- [Binary Search Tree](#section-id-1)
- [Definition and Implementation](#section-id-4)
  - [Two Major Functions](#section-id-7)
    - [Member (Search in the BST)](#section-id-9)
    - [Insert (Insert in the BST)](#section-id-27)
    - [Complexity](#section-id-40)
- [Improvements made to the Code](#section-id-46)
  - [Member Function Modification](#section-id-48)
  - [Insert Function Modification](#section-id-51)
  - [New Functionality Addition](#section-id-54)
  


<div id='section-id-1'/>

# Binary Search Tree
We have attempted to implement all the major functions of the binary search tree, as outlined in the given [link](https://www.geeksforgeeks.org/binary-search-tree-set-1-search-and-insertion/), from scratch. However, in some cases, binary search tree can take the same amount of time O(n) as linear search, so we need to modify our implementation accordingly.

<div id='section-id-4'/>

# Definition and Implementation
Binary search trees are binary trees with elements stored at the interior nodes in symmetric order, meaning that the element at any given node is greater than each element in its left subtree and less than each element in its right subtree.

<div id='section-id-7'/>

## Two Major Functions

<div id='section-id-9'/>

### Member (Search in the BST)
The algorithm for this would be 
1. The search starts at the root node of the tree.
2. The query element is compared to the element at the root.
    * If the query element is smaller than the root element, the left subtree is recursively searched.
    * If the query element is larger than the root element, the right subtree is recursively searched.
    * If the query element is equal to the element at the root, the search is successful and we return true.
3. If we reach an empty node, the search is unsuccessful and we return false.

    ```Ocaml
    let rec mem x = function
        | Leaf -> false
        | Node (y, left, right) ->
          if x = y then true
          else if x < y then mem x left
          else mem x right  
    ```

<div id='section-id-27'/>

### Insert (Insert in the BST)
The algorithm for this would be 
1. The insert function searches the tree using the same strategy as member, except that it copies every node along the way.
2. When it finally reaches an empty node, it replaces the empty node with a node containing the new element.

    ```Ocaml
    let rec insert x = function
        | Leaf -> Node (x, Leaf, Leaf)
        | Node (y, left, right) when x < y -> Node (y, insert x left, right)
        | Node (y, left, right) when x > y -> Node (y, left, insert x right)
        | t -> t
    ```

<div id='section-id-40'/>

### Complexity
| Operation        | Time Complexity           | Space Complexity|
| ------------- |:-------------:|:-------------:|
| insert    | O(log n) | O(n) |
| member      | O(log n)    | O(1) |

<div id='section-id-46'/>

# Improvements made to the Code

<div id='section-id-48'/>

## Member Function Modification
We have modified the member function to ensure that it performs at most `d + 1` comparison operations in the worst-case scenario. This was done to improve the worst-case time complexity of the code.

<div id='section-id-51'/>

## Insert Function Modification
We have modified the insert function to avoid copying the entire search path using exceptions. This was done to improve the space complexity of the code.

<div id='section-id-54'/>

## New Functionality Addition
We have added a new functionality called `complete (x, d)` which creates a complete binary tree of depth `d` with `x` stored in every node. This was done to add a new feature to the code.

Overall, these modifications have improved the performance, efficiency, and functionality of the code.



