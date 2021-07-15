// intrinsics: (BYYang) barrett_*

#ifndef MULT_PARAMS

#include <stdint.h>
#include "cmsis.h"

//#define INPUT_LEN 1440
#define INPUT_LEN 677
#define q 12902401
typedef int32_t int16x2;


// result range: +/-q/2

static inline int32_t mod_q(int64_t X) {
  int64_t Q = X;
  int64_t up_bound = 6451200;
  int64_t low_bound = -6451200;
  int64_t m = Q/q;
  Q -= m*q;
  while((Q>up_bound)||(Q<low_bound)){
  	if(Q>up_bound){
  		Q-=q;
  	}
  	else{
  		Q+=q;
  	}
  }
  return (int32_t)Q;
}

static inline int16_t mod_2048(int32_t X) {
  int16_t Q = (int16_t)(X & 2047);
  if(Q>=1024){
    return Q-2048;
  }
  else{
    return Q;
  }
}


static inline int16_t mod_2048_v2(int16_t X) {
  int16_t Q = (X & 2047);
  if(Q>=1024){
    return Q-2048;
  }
  else{
    return Q;
  }
}



#define MULT_PARAMS
#endif
