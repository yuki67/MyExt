open ListExt
include Hashtbl

let add_pair tbl (k, v) = add tbl k v

let combine tbl1 tbl2 =
  if (length tbl1) < (length tbl2)
  then iter (add tbl2) tbl1
  else iter (add tbl1) tbl2

let from_alist alist =
  let new_table = create (2 * ListExt.length alist) in
  ListExt.iter (add_pair new_table) alist;
  new_table

let from_list_as_set lst = from_alist (map (fun x -> (x, ())) lst)

let items tbl = setify (fold (fun x y a -> set_add a (x, y)) tbl [])
let keys tbl = setify (fold (fun x y a -> set_add a x) tbl [])
let vals tbl = setify (fold (fun x y a -> set_add a y) tbl [])

let is_defined tbl x = try ignore (find tbl x); true with Not_found -> false
