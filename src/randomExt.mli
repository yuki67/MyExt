include module type of Random

val iter : (int -> unit) -> int -> unit
val iter2 : (int -> int -> unit) -> int -> unit
val iterf : (float -> unit) -> float -> int ->  unit
val iterf2 : (float -> float -> unit) -> float -> int ->  unit
