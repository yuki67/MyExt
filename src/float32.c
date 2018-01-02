// single-precision floating point number using Int32

#include <caml/alloc.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <math.h>

#define FLOAT_OF_BITS32(i) *(float *)&Int32_val((i))
#define RETURN_FLOAT(f) return caml_copy_int32(*(int32_t *)&(f))

CAMLprim value addf32(value a, value b) {
  CAMLparam2(a, b);
  float ans = FLOAT_OF_BITS32(a) + FLOAT_OF_BITS32(b);
  CAMLreturn(caml_copy_int32(*(int32_t *)&ans));
}

CAMLprim value subf32(value a, value b) {
  float ans = FLOAT_OF_BITS32(a) - FLOAT_OF_BITS32(b);
  RETURN_FLOAT(ans);
}

CAMLprim value mulf32(value a, value b) {
  float ans = FLOAT_OF_BITS32(a) * FLOAT_OF_BITS32(b);
  RETURN_FLOAT(ans);
}

CAMLprim value divf32(value a, value b) {
  float ans = FLOAT_OF_BITS32(a) / FLOAT_OF_BITS32(b);
  RETURN_FLOAT(ans);
}

CAMLprim value float32_of_int(value a) {
  CAMLparam1(a);
  float af = (float)Int_val(a);
  value ans = caml_copy_int32(*(int32_t *)&(af));
  CAMLreturn(ans);
}

CAMLprim value float32_of_caml_float(value a) {
  float af = (float)Double_val(a);
  RETURN_FLOAT(af);
}

CAMLprim value absf32(value a) {
  float af = FLOAT_OF_BITS32(a);
  float ans = af > 0.0f ? af : -af;
  RETURN_FLOAT(ans);
}

CAMLprim value sqrtf32(value a) {
  float af = FLOAT_OF_BITS32(a);
  float ans = sqrtf(af);
  RETURN_FLOAT(ans);
}
