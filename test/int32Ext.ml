open MyExt.Int32Ext
open OUnit2

let test_int32Ext _ =
  let assert_int32 =
    assert_equal
      ~printer:to_string in

  assert_int32
    (upper_bits_of_float 123.456)
    0b0100001011110110l;

  assert_int32
    (lower_bits_of_float 123.456)
    0b1110100101111001l;

  ()

let test = "int32Ext" >:: test_int32Ext
