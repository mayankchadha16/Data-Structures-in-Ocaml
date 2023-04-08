# Stack
We have attempted to implement all the major functions of a stack data structure, as outlined in the given [link](https://www.geeksforgeeks.org/stack-in-cpp-stl/), using two methods: utilizing the inbuilt data structure "list", and creating a stack from scratch.

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
