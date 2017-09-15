include List

let string_of_list string_of_element elems =
  "[" ^ (String.concat ", " (List.map string_of_element elems)) ^ "]"

let raw_string_of_list string_of_element elems =
  "[" ^ (String.concat "; " (List.map string_of_element elems)) ^ "]"

(* lst1 - lst2 *)
let diff lst1 lst2 = filter (fun e1 -> not (mem e1 lst2)) lst1
let inter lst1 lst2 = filter (fun e1 -> mem e1 lst2) lst1

let set_add lst elem =
  if mem elem lst then lst
  else elem::lst

let set_add_ref lst elem =
  lst := set_add !lst elem

let setify lst = rev (fold_left set_add [] lst)

let unions s = setify (fold_right (@) s [])

let arg_min f lst =
  let rec minimize_rec lst (min, min_arg) =
    if lst = []
    then min_arg
    else
      let fx = f (hd lst) in
      if min > fx
      then minimize_rec (tl lst) (fx, hd lst)
      else minimize_rec (tl lst) (min, min_arg) in
  minimize_rec lst (max_int, (List.hd lst))

let arg_max f lst = arg_min (fun x -> - f x) lst

let union s1 s2 =
  setify (s1 @ s2)

let rec all_pairs f lst1 lst2 =
  match lst1 with
  | [] -> []
  | hd::tail ->  fold_left (fun a x -> (f hd x) :: a) (all_pairs f tail lst2) lst2

let rec original_pairs lst =
  match lst with
  | [] -> []
  | hd::tail -> fold_left (fun a x -> (hd, x) :: a) (original_pairs tail) tail

let rec product lst1 lst2 =
  match lst1 with
  | [] -> []
  | hd::tail ->  fold_left (fun a x -> (hd, x) :: a) (product tail lst2) lst2

let rec fold_left_ignore cond f init lst =
  fold_left (fun acc s -> if cond acc s then acc else f acc s) init lst

let rec anything_in_common lst1 lst2 =
  match lst1 with
  | [] -> false
  | x::xs -> mem x lst2 || anything_in_common xs lst2

let rec subset lst1 lst2 = for_all (fun x -> mem x lst2) lst1

let range n =
  assert (n >= 0);
  let rec range i acc =
    if i = n then acc
    else range (i + 1) (n - i - 1::acc)
  in
  range 0 []

let rec subsets_with_size size lst =
  if size = 0 then [[]] else
    match lst with
    | [] -> []
    | h::t -> union (map (fun g -> h::g) (subsets_with_size (size - 1) t)) (subsets_with_size size t)

let graph f s = setify (map (fun x -> (x, f x)) s)
let image f s = setify (map f s)

let assoc_r dic s = assoc s dic

let assoc_extend alist keys def_val =
  map (fun key -> (key, try List.assoc key alist with Not_found -> def_val)) keys

let assoc_collect alst =
  let rec loop acc = function
    | [] -> acc
    | (k, v)::tl ->
        if mem_assoc k acc then
          loop ((k, v::(assoc k acc))::(remove_assoc k acc)) tl
        else
          loop ((k, [v])::(remove_assoc k acc)) tl in
  loop [] alst

let assoc_swap alist = map (fun (x, y) -> y, x) alist
