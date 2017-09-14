module Make (Ord:Map.OrderedType) =
struct
  include Map.Make (Ord)
  let from_alist alist =
    ListExt.fold_left (fun acc (k, v) -> add k v acc) empty alist
end
