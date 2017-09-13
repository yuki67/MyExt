module Make (Ord:Map.OrderedType) =
struct
  include Map.Make (Ord)
end
