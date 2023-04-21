module Deque :
sig
    type 'a node = {
        value : 'a;
        mutable prev : 'a node option;
        mutable next : 'a node option;
    }
    type 'a t = {
        mutable front : 'a node option;
        mutable back : 'a node option;
    }
    exception Empty
    val empty : int t
    val is_empty : 'a t -> bool
    val push_front : 'a t -> 'a -> unit
    val push_back : 'a t -> 'a -> unit
    val pop_front : 'a t -> 'a option
    val pop_back : 'a t -> 'a option
    val front : 'a t -> 'a option
    val back : 'a t -> 'a option
end

val test_case : unit -> unit