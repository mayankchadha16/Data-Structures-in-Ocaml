module MyBST = struct
  type 'a tree = Node of 'a * 'a tree * 'a tree | Leaf

  let empty =
    Leaf

  (** [mem x t] is true iff [x] is a member of [t]. *)
  let rec mem x = function
    | Leaf -> false
    | Node (y, l, r) ->
      if x < y then mem x l
      else if x > y then mem x r
      else true

  (** [insert x t] is [t] . *)    
  let rec insert x = function
    | Leaf -> Node (x, Leaf, Leaf) 
    | Node (y, l, r) as t -> 
      if x < y then Node (y, insert x l, r)
      else if x > y then Node (y, l, insert x r)
      else t

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