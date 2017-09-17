include Unix

let tee f filename =
  let copy = dup stdout in
  let fd = (descr_of_out_channel (open_out filename)) in
  dup2 fd stdout;
  close fd;
  f ();
  flush_all ();
  dup2 copy stdout;
  close copy;
  print_string "heeeelloo"

let file_diff a b =
  let rec loop () = if (input_line a) <> (input_line b) then false else loop ();
  in try loop () with _ -> true
