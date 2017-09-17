include module type of Unix

val tee : (unit -> unit) -> string -> unit
val file_diff : in_channel -> in_channel -> bool
