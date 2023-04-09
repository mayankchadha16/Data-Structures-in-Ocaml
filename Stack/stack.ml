(* General Stack *)
module MyStack = struct
    type 'a stack = 
        | Empty
        | Entry of 'a * 'a stack

    let empty 
        = Empty

    let isempty = function
        | Empty -> true
        | _ -> false

    let push x s = 
        Entry (x, s)

    let top = function
        | Empty -> failwith "Empty stack"
        | Entry (x, _) -> x

    let pop = function
        | Empty -> failwith "Empty stack"
        | Entry (_,s) -> s

    let rec size = function
        | Entry(_, t) -> 1 + (size t) 
        | Empty -> 0
end

(* Make stack using List *)
module ListStack = struct
    type 'a stack 
        = 'a list

    let empty 
        = []

    let isempty s = 
        s = []
    
    let push x s = 
        x :: s

    let top = function
        | [] -> failwith "Empty stack"
        | x :: _ -> x

    let pop = function
        | [] -> failwith "Empty stack"
        | _ :: s -> s

    let size s = 
        List.length s
end

(* Exercise 2.1 *)
let rec suffixes xs =
    match xs with
    | [] -> [[]]
    | x::xs' -> xs :: suffixes xs'  

let test_case_custom_stack () =
    let s = MyStack.empty in
    let s' = MyStack.push 1 s in
    let s'' = MyStack.push 2 s' in
    let s''' = MyStack.push 3 s'' in
    let expected_top = 3 in
    assert (MyStack.top s''' = expected_top);
    let s'''' = MyStack.pop s''' in
    let expected_top = 2 in
    assert (MyStack.top s'''' = expected_top);
    let expected_size = 2 in
    assert (MyStack.size s'''' = expected_size);
    print_endline "All test cases passed."

let test_case_list_stack () =
    let s = ListStack.empty in
    let s' = ListStack.push 1 s in
    let s'' = ListStack.push 2 s' in
    let s''' = ListStack.push 3 s'' in
    let expected_top = 3 in
    assert (ListStack.top s''' = expected_top);
    let s'''' = ListStack.pop s''' in
    let expected_top = 2 in
    assert (ListStack.top s'''' = expected_top);
    let expected_size = 2 in
    assert (ListStack.size s'''' = expected_size);
    print_endline "All test cases passed."