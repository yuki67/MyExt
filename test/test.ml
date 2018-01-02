open OUnit2

let suite =
  "all" >:::
  [
    Float32.test;
    Int32Ext.test;
  ]

let _ =
  run_test_tt_main suite
