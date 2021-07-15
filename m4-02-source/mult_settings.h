// intrinsics: (BYYang) barrett_*

#ifndef MULT_PARAMS

#include <stdint.h>
#include "cmsis.h"

#define INPUT_LEN 64
#define q 4591
#define qR2inv 935519 // round(2^32/q)
#define _2P15 (1 << 15)
typedef int32_t int16x2;

// result range: +/-2295
static inline int32_t barrett_16x2(int16x2 X) {
  int32_t QL = __SMLAWB(qR2inv, X, _2P15);
  int32_t QH = __SMLAWT(qR2inv, X, _2P15);
  int32_t SL = __SMULBT(q, QL);
  int32_t SH = __SMULBT(q, QH);
  return __SSUB16(X, __PKHBT(SL, SH, 16));
}

// result range: +/-2512
static inline int32_t barrett_32(int32_t X) {
  int32_t Q = __SMMULR(qR2inv, X);
  return __MLS(q, Q, X);
}

#define MULT_PARAMS
#endif
