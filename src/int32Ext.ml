include Int32

let lower_bits_of_float f =
  f |> bits_of_float |> logand 65535l

let upper_bits_of_float f =
  shift_right_logical (sub (bits_of_float f)  (lower_bits_of_float f)) 16
