let test1 = 
    let test = [4; 2; 65; 6; 9; 0; 10; 16; 11] in 
    let heap = Leftist.Leftist.fromList test in 
    let rec loop h = 
        if (Leftist.Leftist.isEmpty h) then () 
        else begin
            print_string(string_of_int (Leftist.Leftist.getMin h) ^ " ");
            loop (Leftist.Leftist.deleteMin h);
        end
    in loop heap