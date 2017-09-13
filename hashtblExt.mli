include module type of Hashtbl

val combine : ('a, 'b) t -> ('a, 'b) t -> unit
val from_list_as_set : 'a list -> ('a, unit) t
val from_alist  : ('a * 'b) list -> ('a, 'b) t
val items : ('a, 'b) t -> ('a * 'b) list
val keys : ('a, 'b) t -> 'a list
val vals : ('a, 'b) t -> 'b list
val is_defined : ('a, 'b) t -> 'a -> bool
