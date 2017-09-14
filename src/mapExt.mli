module Make (Ord: Map.OrderedType) :
sig
  include module type of Map.Make (Ord)
  val from_alist : (key * 'a) list -> 'a t
end
