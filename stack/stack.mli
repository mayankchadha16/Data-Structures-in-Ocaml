module MyStack :
sig
    type 'a stack = Empty | Entry of 'a * 'a stack
    val empty : 'a stack
    val isempty : 'a stack -> bool
    val push : 'a -> 'a stack -> 'a stack
    val top : 'a stack -> 'a
    val pop : 'a stack -> 'a stack
    val size : 'a stack -> int
end

module ListStack :
sig
    type 'a stack = 'a list
    val empty : 'a stack
    val isempty : 'a stack -> bool
    val push : 'a -> 'a stack -> 'a stack
    val top : 'a stack -> 'a
    val pop : 'a stack -> 'a stack
    val size : 'a stack -> int
end

val suffixes : 'a list -> 'a list list

val test_case_custom_stack : unit -> unit

val test_case_list_stack : unit -> unit
