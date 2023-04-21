# Deque
We have attempted to implement all the major functions of a deque data structure, as outlined in the given [link](https://www.geeksforgeeks.org/deque-cpp-stl/).

The deque is implemented using a doubly-linked list of nodes, where each node contains a value and references to the previous and next nodes in the list.

The `node` type is defined as a record with three fields: `value` of type `'a`, `prev` of type ``'a node option``, and ``next`` of type ``'a node option``. The ``prev`` and ``next`` fields are both mutable, so that they can be updated as nodes are added to or removed from the deque.

The ``t`` type is defined as a record with two fields: ``front`` of type ``'a node option``, and ``back`` of type ``'a node option``. These fields are also mutable, and represent the front and back of the deque respectively.

The functions supported by our modules:

* ``empty`` function returns a new, empty deque.
* ``is_empty`` function takes a deque as an argument, and returns true if the deque is empty, false otherwise.
* ``push_front`` function takes a deque and a value as arguments, and adds the value to the front of the deque. It creates a new node with the given value, and sets its ``prev`` field to None and its ``next`` field to the current front node (if there is one). If the deque was empty, both the `front` and ``back`` fields are set to the new node.
* ``push_back`` function is similar to `push_front`, but adds the value to the back of the deque instead.
* ``pop_front`` function removes and returns the value at the front of the deque, or returns None if the deque is empty. It updates the ``front`` field to point to the next node (if there is one), and sets the ``prev`` field of the new front node to None.
* ``pop_back`` function is similar to ``pop_front``, but removes and returns the value at the back of the deque instead.
* ``front`` function returns the value at the front of the deque, or None if the deque is empty.
* ``back`` function is similar to ``front``, but returns the value at the back of the deque instead.

## Custom Stack
| Operation        | Complexity           |
| ------------- |:-------------:|
| push_front     | O(1) |
| push_back     | O(1) |
| pop_front      | O(1)    |
| pop_back      | O(1)    |
| front | O(1)      |
| back | O(1)     |


