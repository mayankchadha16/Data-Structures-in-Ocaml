module Map :
sig
    type 'a key = 'a
    type 'a map = ('a * 'a) list
    val empty : 'a list
    val bind : 'a -> 'b -> ('a * 'b) list -> ('a * 'b) list
    val lookup : 'a -> ('a * 'b) list -> 'b option
end

val test_case : unit -> unit