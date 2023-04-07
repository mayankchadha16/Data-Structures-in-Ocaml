module MyBST = struct
  type 'a tree = 
  | Node of 'a * 'a tree * 'a tree 
  | Leaf

  let empty =
    Leaf
    
  let rec mem x = function
    | Leaf -> false
    | Node (y, left, right) ->
      if x = y then true
      else if x < y then mem x left
      else mem x right

  let rec insert x = function
    | Leaf -> Node (x, Leaf, Leaf)
    | Node (y, left, right) when x < y -> Node (y, insert x left, right)
    | Node (y, left, right) when x > y -> Node (y, left, insert x right)
    | t -> t 

  let rec height = function  
    | Leaf -> 0
    | Node (_, left, right) -> 1 + max (height left) (height right)

  let rec count= function 
    | Leaf -> 0
    | Node (_, left, right) -> 1 + count left + count right
end

let s = MyBST.empty
let h = MyBST.height s
let s = MyBST.insert 3 s
let s = MyBST.insert 2 s
let num = MyBST.count s
let h = MyBST.height s
let s = MyBST.insert 1 s
let h = MyBST.height s
let s = MyBST.insert 5 s
let h = MyBST.height s
let num = MyBST.count s
let check = MyBST.mem 3 s
let check = MyBST.mem 8 s