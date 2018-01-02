open Int32

external add : int32 -> int32 -> int32 = "addf32"
external sub : int32 -> int32 -> int32 = "subf32"
external mul : int32 -> int32 -> int32 = "mulf32"
external div : int32 -> int32 -> int32 = "divf32"
external sqrt : int32 -> int32 = "sqrtf32"
external abs : int32 -> int32 = "absf32"
external of_int : int -> int32 = "float32_of_int"
external of_float : float -> int32 = "float32_of_caml_float"

let to_float = float_of_bits
let to_int x = float_of_bits x |> int_of_float
let to_string x = to_float x |> string_of_float

(* iのnビット目を返す *)
let nth_bit i n =
  logand (shift_right i n) 1l

(* dを2進法で表す幅widthになるまで0埋めする *)
let rec to_bits f =
  ListExt.fold_right
    (fun d s -> s ^ (Int32.to_string (nth_bit f d)))
    (ListExt.range 32)
    ""
