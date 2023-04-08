# Finite Map

In our implementation of maps, we have used two functions: `bind` and `lookup`. These functions are equivalent to the `add` and `search` operations in C++, respectively.

## `bind` function
The `bind` function is used to add a key-value pair to the map. It takes three arguments:

* `k`: the key to be added
* `v`: the value to be associated with the key
* `m`: the map to which the key-value pair is to be added

The bind function returns a new map with the key-value pair added to it.
```Ocaml
let bind k v m =
    (k, v) :: m
```

## `lookup` function
The `lookup` function is used to search for a key in the map and retrieve its corresponding value. It takes two arguments:

`k`: the key to be searched for
`m`: the map to be searched

The lookup function returns `Some v` if the key is found in the map and its value is `v`. If the key is not found, it raises an exception called `NotFound`.

```Ocaml
exception NotFound

let rec lookup k = function
  | [] -> raise NotFound
  | (k', v) :: t ->
      if k = k' then Some v
      else lookup k t

```
Note that we have modified the implementation of the `lookup` function provided by the author to raise an exception called `NotFound` if the key is not found in the map. This is because returning None can sometimes be ambiguous and can lead to unexpected behavior. By raising an exception, we can ensure that the caller is notified of the error and can handle it appropriately.


| Operation        | Complexity           |
| ------------- |:-------------:|
| bind     | O(1) |
| lookup      | O(n)    |


