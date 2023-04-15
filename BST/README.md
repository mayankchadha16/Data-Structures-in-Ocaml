# Binary Search Tree
We have attempted to implement all the major functions of the binary search tree, as outlined in the given [link](https://www.geeksforgeeks.org/binary-search-tree-set-1-search-and-insertion/), from scratch. However, in some cases, binary search tree can take the same amount of time O(n) as linear search, so we need to modify our implementation accordingly.

# Definition and Implementation
Binary search trees are binary trees with elements stored at the interior nodes in symmetric order, meaning that the element at any given node is greater than each element in its left subtree and less than each element in its right subtree.

## Two Major Functions

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

### Complexity
| Operation        | Time Complexity           | Space Complexity|
| ------------- |:-------------:|:-------------:|
| insert    | O(log n) | O(n) |
| member      | O(log n)    | O(1) |

# Improvements made to the Code

## Member Function Modification
We have modified the member function to ensure that it performs at most `d + 1` comparison operations in the worst-case scenario. This was done to improve the worst-case time complexity of the code.

## Insert Function Modification
We have modified the insert function to avoid copying the entire search path using exceptions. This was done to improve the space complexity of the code.

## New Functionality Addition
We have added a new functionality called `complete (x, d)` which creates a complete binary tree of depth `d` with `x` stored in every node. This was done to add a new feature to the code.

Overall, these modifications have improved the performance, efficiency, and functionality of the code.

# Problems in BST
1. The main disadvantage is that we should always implement a balanced binary search tree. Otherwise the cost of operations may not be logarithmic and degenerate into a linear search on an array.
2. They are not guaranteed to be balanced, which means that in the worst case, the height of the tree could be `O(n)` and the time complexity for operations could degrade to `O(n)`. 

