module Make (Ord: Set.OrderedType) =
struct
  include Set.Make (Ord)
  (* let arg_min f set = min_elt (Set. map f set) *)
  let anything_in_common s1 s2 = exists (fun elem -> mem elem s2) s1
  let rec all_pairs f s1 s2 =
    if is_empty s1 then []
    else
      let elem = choose s1 in
      let rest = remove elem s1 in
      fold (fun x a -> (f elem)::a) s2 (all_pairs f rest s2)
end
