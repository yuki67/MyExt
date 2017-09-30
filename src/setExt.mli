module Make (Ord: Set.OrderedType) :
sig
  include Set.S
  (* val arg_min: (elt -> elt) -> t -> elt *)
  val anything_in_common: t -> t -> bool
  val all_pairs: (elt -> 'a) -> t -> t -> 'a list
end
