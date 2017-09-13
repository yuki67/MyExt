include String

let to_list str =
  let rec to_list_rec n l =
    if n < 0
    then l
    else to_list_rec (n - 1) (str.[n]::l) in
  to_list_rec (String.length str - 1) []

let of_char c = make 1 c

let is_numeric str =
  try ignore (int_of_string str); true
  with Failure _ -> false

let pad str width =
  let left = width - String.length str in
  if left <= 0 then str
  else str ^ (Array.fold_left (^) "" (Array.make left " "))

let print_padded str width =
  print_string (pad str width)
