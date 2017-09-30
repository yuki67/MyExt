include List

let string_of_list string_of_element elems =
  "[" ^ (String.concat ", " (List.map string_of_element elems)) ^ "]"

let raw_string_of_list string_of_element elems =
  "[" ^ (String.concat "; " (List.map string_of_element elems)) ^ "]"

let take lst n =
  let rec loop acc n lst =
    match lst, n with
    | [], _
    |  _, 0 -> rev acc
    | x::xs, _ -> loop (x :: acc) (n - 1) xs in
  loop [] n lst

let rec last = function
  | [] -> failwith "ListExt.last"
  | [x] -> x
  | _::xs -> last xs

(* lst1 - lst2 *)
let diff lst1 lst2 = filter (fun e1 -> not (mem e1 lst2)) lst1
let inter lst1 lst2 = filter (fun e1 -> mem e1 lst2) lst1

let set_add lst elem =
  if mem elem lst then lst
  else elem::lst

let set_add_ref lst elem =
  lst := set_add !lst elem

let setify lst = rev (fold_left set_add [] lst)

let unions s = setify (fold_left (fun x y -> y @ x) [] s)

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

let union_map f lst = unions (map f lst)
let concat_map f lst = flatten (map f lst)

let adjacent_pairs f lst =
  if lst = [] then []
  else
    let rec loop acc prev = function
      | [] -> acc
      | [x] -> (f prev x) :: acc
      | x::xs -> loop ((f prev x)::acc) x xs in
    rev (loop [] (hd lst) (tl lst))

let loop_pairs f lst =
  if lst = [] then []
  else
    let rec loop acc prev = function
      | [] -> f prev (hd lst) :: acc
      | [x] -> f prev x :: acc
      | x::xs -> loop ((f prev x)::acc) x xs in
    rev (loop [] (hd lst) (tl lst))

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

let fold_left_ignore cond f init lst =
  fold_left (fun acc s -> if cond acc s then acc else f acc s) init lst

let rec anything_in_common lst1 lst2 =
  match lst1 with
  | [] -> false
  | x::xs -> mem x lst2 || anything_in_common xs lst2

let subset lst1 lst2 = for_all (fun x -> mem x lst2) lst1

let rec range ?(start=0) ?(step=1) m =
  if start >= m then []
  else start :: range ~start:(start + step) ~step:(step) m

let rec rangef ?(start=0.0) ?(step=1.0) m =
  if start >= m then []
  else start :: rangef ~start:(start +. step) ~step:(step) m

let clones elem length =
  let rec loop acc = function
    | 0 -> acc
    | x -> loop (elem::acc) (x - 1) in
  loop [] length

let linspace a b n =
  let step = (b -. a) /. (float_of_int (n - 1)) in
  let ans, now = Array.make n 0., ref a in
  for i = 0 to (n - 1) do
    ans.(i) <-  !now;
    now := !now +. step
  done;
  Array.to_list ans

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
