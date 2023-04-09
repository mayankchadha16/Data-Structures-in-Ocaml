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

let test_case () =
  let bst = MyBST.empty in
  let bst' = MyBST.insert_opt 3 bst in
  let bst'' = MyBST.insert_opt 2 bst' in
  let bst''' = MyBST.insert_opt 4 bst'' in
  let expected_tree =   MyBST.Node (3, MyBST.Node (2, MyBST.Leaf, MyBST.Leaf),MyBST.Node (4, MyBST.Leaf, MyBST.Leaf)) in
  let expected_height = 2 in
  let expected_nodes = 3 in
  assert (MyBST.height bst''' = expected_height);
  assert (MyBST.count bst''' = expected_nodes);
  assert (bst''' = expected_tree);
  assert (MyBST.member_opt 3 bst''' = true);
  assert (MyBST.member_opt 8 bst''' = false);
  print_endline "All test cases passed."