(* General Stack *)
module MyStack = struct
    type 'a stack = 
        | Empty
        | Entry of 'a * 'a stack

    let empty = Empty

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
    type 'a stack = 'a list

    let empty = []

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

let s = MyStack.empty
let check = MyStack.isempty
let s = MyStack.push 1 s
let s = MyStack.push 2 s
let s = MyStack.push 3 s
let s = MyStack.push 4 s
let s = MyStack.push 1 s
let x = MyStack.top s
let s = MyStack.pop s
let s = MyStack.pop s
let s = MyStack.push 10 s
let x = MyStack.top s
let l = MyStack.size s

let s = ListStack.empty
let check = MyStack.isempty
let s = ListStack.push 1 s
let s = ListStack.push 2 s
let s = ListStack.push 3 s
let s = ListStack.push 4 s
let s = ListStack.push 1 s
let x = ListStack.top s
let s = ListStack.pop s
let s = ListStack.pop s
let s = ListStack.push 10 s
let x = ListStack.top s
let l = ListStack.size s