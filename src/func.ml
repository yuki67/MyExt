let rec log2 n =
  assert (n > 0);
  if n = 1 then 0
  else 1 + (log2 (n lsr 1))
