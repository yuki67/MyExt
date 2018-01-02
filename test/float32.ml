open MyExt.Float32
open OUnit2

let test_float32 _ =
  let assert_string =
    assert_equal
      ~printer:(fun x -> x) in

  let assert_float32 =
    assert_equal
      ~cmp:(fun x y -> to_bits x = to_bits y)
      ~printer:to_string in

  assert_string
    ~msg:"to_bits (positive value)"
    (to_bits (of_float 123.456))
    "01000010111101101110100101111001";

  assert_string
    ~msg:"to_bits (negative value)"
    (to_bits (of_float ~-.123.456))
    "11000010111101101110100101111001";

  assert_float32
    ~msg:"add"
    (add (of_int 123) (of_int 456))
    (of_int 579);

  assert_float32
    ~msg:"sub"
    (sub (of_int 123) (of_int 456))
    (of_int ~-333);

  assert_float32
    ~msg:"mul"
    (mul (of_float 123.456) (of_float 456.789))
    (of_float 56393.34375);

  assert_float32
    ~msg:"div"
    (div (of_float 123.456) (of_float ~-.456.789))
    (of_float ~-.0.270269215107);

  assert_float32
    ~msg:"sqrt"
    (sqrt (of_float 393.6256))
    (of_float 19.84);

  assert_float32
    ~msg:"abs"
    (abs (of_float 12.34))
    (of_float 12.34);

  assert_float32
    ~msg:"abs"
    (abs (of_float ~-.12.34))
    (of_float 12.34);

  ()

let test = "float32" >:: test_float32
