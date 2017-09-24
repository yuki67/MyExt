include module type of List

val string_of_list : ('a -> string) -> 'a list -> string
val raw_string_of_list : ('a -> string) -> 'a list -> string

val take : 'a list -> int -> 'a list
val last : 'a list -> 'a

val diff : 'a list -> 'a list -> 'a list
val inter : 'a list -> 'a list -> 'a list
val set_add : 'a list -> 'a -> 'a list
val set_add_ref : 'a list ref -> 'a -> unit
val setify : 'a list -> 'a list
val union : 'a list -> 'a list -> 'a list
val unions : 'a list list -> 'a list
val original_pairs : 'a list -> ('a * 'a) list
val product : 'a list -> 'b list -> ('a * 'b) list
val anything_in_common : 'a list -> 'a list -> bool
val subset : 'a list -> 'a list -> bool
val subsets_with_size : int -> 'a list -> 'a list list

val clones : 'a -> int -> 'a list
val range : ?start:int -> ?step:int -> int -> int list
val rangef : ?start:float -> ?step:float -> float -> float list
val linspace : float -> float -> int -> float list

val arg_min : ('a -> int) -> 'a list -> 'a
val arg_max : ('a -> int) -> 'a list -> 'a

val union_map : ('a -> 'b list) -> 'a list -> 'b list
val concat_map : ('a -> ' b list) -> 'a list -> 'b list
val fold_left_ignore : ('a -> 'b -> bool) -> ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a
val adjacent_pairs : ('a -> 'a -> 'b) -> 'a list -> 'b list
val loop_pairs : ('a -> 'a -> 'b) -> 'a list -> 'b list
val all_pairs  : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list

val graph : ('a -> 'b) -> 'a list -> ('a * 'b) list
val image : ('a -> 'b) -> 'a list -> 'b list

val assoc_r : ('a * 'b) list -> 'a -> 'b
val assoc_extend : ('a * 'b) list -> 'a list -> 'b -> ('a * 'b) list
val assoc_collect : ('a * 'b) list -> ('a * 'b list) list
val assoc_swap : ('a * 'b) list -> ('b * 'a) list
