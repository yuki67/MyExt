include Random

let iter f n =
  for i = 0 to (n - 1) do
    f (Random.bits ())
  done

let iter2 f n =
  for i = 0 to (n - 1) do
    f (bits ()) (bits ())
  done

let iterf f max n =
  for i = 0 to (n - 1) do
    f (float max)
  done

let iterf2 f max n =
  for i = 0 to (n - 1) do
    f (float max) (float max)
  done
