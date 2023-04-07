let testcase1 = [4; 2; 65; 6; 9; 0; 10; 16; 11]

let test1 testcase = 
    let heap = Leftist.Leftist.fromList testcase in 
    let rec loop h = 
        if (Leftist.Leftist.isEmpty h) then () 
        else begin
            print_string(string_of_int (Leftist.Leftist.getMin h) ^ " ");
            (* Leftist.Leftist.getMin h; *)
            loop (Leftist.Leftist.deleteMin h);
        end
    in loop heap;;

let time f x =
    let t = Sys.time() in
    let fx = f x in
    Printf.printf "\nExecution time: %fs\n" (Sys.time() -. t);
    fx;;

let random_list () = 
    let rec loop n l = 
        if n > 0 then loop (n - 1) (Random.int 1000000 :: l)
        else l 
    in loop 1000000 [];;

Random.init 456;;
let randomList = random_list ();;

(* time test1 testcase1;; *)
test1 testcase1;;
