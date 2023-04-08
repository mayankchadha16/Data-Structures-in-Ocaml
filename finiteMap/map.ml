module Map =
struct
    type 'a key = 'a
    type 'a map = ('a * 'a) list

    let empty = []

    let bind k v m =
        (k, v) :: m

    let rec lookup k = function
        | [] -> None
        | (k', v) :: t ->
            if k = k' then Some v
            else lookup k t
end

let test_case () =
    let map = Map.empty in
    let map' = Map.bind 1 "one" map in
    let map'' = Map.bind 2 "two" map' in
    let map''' = Map.bind 3 "three" map'' in
    assert (Map.lookup 1 map''' = Some "one");
    assert (Map.lookup 2 map''' = Some "two");
    assert (Map.lookup 3 map''' = Some "three");
    assert (Map.lookup 4 map''' = None);
    print_endline "All test cases passed."