module MyBST = struct
  type 'a tree = 
  | Node of 'a * 'a tree * 'a tree 
  | Leaf

  let empty =
    Leaf

  exception Found
    
  let rec mem x = function
    | Leaf -> false
    | Node (y, left, right) ->
      if x = y then true
      else if x < y then mem x left
      else mem x right

  let rec member_opt x t =
    let rec aux x t candidate =
      match t with
      | Leaf -> candidate = Some x
      | Node (y, left, right) ->
        if x < y then
          aux x left candidate
        else if x > y then
          aux x right (Some y)
        else
          true
    in
    aux x t None

  let rec insert x = function
    | Leaf -> Node (x, Leaf, Leaf)
    | Node (y, left, right) when x < y -> Node (y, insert x left, right)
    | Node (y, left, right) when x > y -> Node (y, left, insert x right)
    | t -> t

  let rec insert_opt x = function
  | Leaf -> Node (x, Leaf, Leaf)
  | Node (y, left, right) ->
    if x < y then
      try Node (y, insert x left, right)
      with Found -> Node (y, left, right)
    else if x > y then
      try Node (y, left, insert x right)
      with Found -> Node (y, left, right)
    else
      raise Found

  let rec height = function  
    | Leaf -> 0
    | Node (_, left, right) -> 1 + max (height left) (height right)

  let rec count= function 
    | Leaf -> 0
    | Node (_, left, right) -> 1 + count left + count right

  let rec complete x d =
    if d = 0 then
      Leaf
    else
      let sub = complete x (d - 1) in
      Node (x, sub, sub)
      
end

let s = MyBST.empty
let h = MyBST.height s
let s = MyBST.insert_opt 3 s
let s = MyBST.insert_opt 2 s
let num = MyBST.count s
let h = MyBST.height s
let s = MyBST.insert_opt 1 s
let h = MyBST.height s
let s = MyBST.insert_opt 5 s
let h = MyBST.height s
let num = MyBST.count s
let check = MyBST.member_opt 3 s
let check = MyBST.member_opt 8 s
let tree1 = MyBST.complete 1 2