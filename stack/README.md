# Stack
We have attempted to implement all the major functions of a stack data structure, as outlined in the given [link](https://www.geeksforgeeks.org/stack-in-cpp-stl/), using two methods: utilizing the inbuilt data structure "list", and creating a stack from scratch.

Our modules define a stack data structure, which is a collection of elements that supports two main operations: push and pop. Elements are added and removed from the top of the stack in a last-in, first-out (LIFO) order.

The stack is defined as a variant type, which has two possible states: `Empty` and `Entry of 'a * 'a stack`. An empty stack is represented by the `Empty` constructor. A non-empty stack with an element of type `'a` at the top is represented by the `Entry` constructor, which contains the element and another `'a stack`.

The functions supported by our modules:

* `empty` : `'a stack` : Returns an empty stack of type `'a`. This is simply a stack in the `Empty` state.
* `isempty` : `'a stack -> bool` : Returns `true` if the stack is empty, `false` otherwise. This is implemented by pattern matching the stack type to determine if it is in the `Empty` state.
* `push` : `'a -> 'a stack -> 'a stack` : Adds an element of type `'a` to the top of the stack and returns the new stack. This is done by constructing a new stack using the `Entry` constructor with the new element and the old stack.
* `top` : `'a stack -> 'a` : Returns the top element of the stack of type 'a. This is done by pattern matching the stack type to extract the top element from the `Entry` constructor.
* `pop` : `'a stack -> 'a stack` : Removes the top element from the stack and returns the new stack. This is done by pattern matching the stack type to extract the remaining stack from the `Entry` constructor.
* `size` : `'a stack -> int` : Returns the number of elements in the stack. This is done by recursively counting the elements in the stack, starting from the top.

## Custom Stack
| Operation        | Complexity           |
| ------------- |:-------------:|
| push     | O(1) |
| pop      | O(1)    |
| top | O(1)      |
| size | O(n)     |

To optimize the size operation in our stack implementation, we can include an additional variable that updates with each push and pop operation, allowing us to retrieve the size of the stack in constant time, O(1), instead of O(n). This optimization can significantly improve the efficiency and scalability of our implementation, reducing the computational overhead associated with calculating the size of the stack.

## List Stack
| Operation        | Complexity           |
| ------------- |:-------------:|
| push     | O(1) |
| pop      | O(1)    |
| top | O(1)      |
| size | O(n)     |

In imperative programming, argument lists are destroyed during function execution, while in functional programming, they remain unchanged.

Functional programming allows for persistence of the original data structures, which can help avoid unnecessary memory allocation and copying. However, this persistence comes at a cost of additional memory usage.

The decision to use imperative or functional programming depends on factors such as project requirements, codebase size and complexity, and development team expertise.


This style of programming is greatly simplified by automatic garbage collection. It is crucial to reclaim the space of copies that are no longer needed ,but the pervasive sharing of nodes makes manual garbage collection awkward.

## Suffixes
```Ocaml
(* Exercise 2.1 *)
let rec suffixes xs =
    match xs with
    | [] -> [[]]
    | x::xs' -> xs :: suffixes xs'  
```
