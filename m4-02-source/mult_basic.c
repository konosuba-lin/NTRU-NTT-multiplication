#include <stdint.h>
#include "cmsis.h"
#include "mult_settings.h"

// c[INPUT_LEN] and f[INPUT_LEN] as the two inputs
// h[INPUT_LEN * 2] as the output: the product of two inputs
void product_scanning(int16_t *h, int16_t *c, int16_t *f) {
    int i, j;
    int32_t accum;
    int32_t *optr_16x2 = (int32_t *)h;

    for (i = 0; i < INPUT_LEN; ++i) {
        accum = 0;
        for (j = 0; j <= i; ++j) {
            accum += c[j] * f[i - j];
            accum = barrett_32(accum);
        }
        h[i] = accum;
    }
    for (i = INPUT_LEN; i < INPUT_LEN + INPUT_LEN - 1; ++i) {
        accum = 0;
        for (j = i - INPUT_LEN + 1; j < INPUT_LEN; ++j) {
            accum += c[j] * f[i - j];
            accum = barrett_32(accum);
        }
        h[i] = accum;
    }
    h[INPUT_LEN + INPUT_LEN - 1] = 0;

    for (i = 0; i < INPUT_LEN; ++i) optr_16x2[i] = barrett_16x2(optr_16x2[i]);
}

void your_polymul(int16_t *h, int16_t *c, int16_t *f) {
    int i, j;
    int32_t accum;
    int32_t *optr_16x2 = (int32_t *)h;

    for (i = 0; i < INPUT_LEN; ++i) {
        accum = 0;
        for (j = 0; j <= i; ++j) {
            accum += c[j] * f[i - j];
            accum = barrett_32(accum);
        }
        h[i] = accum;
    }
    for (i = INPUT_LEN; i < INPUT_LEN + INPUT_LEN - 1; ++i) {
        accum = 0;
        for (j = i - INPUT_LEN + 1; j < INPUT_LEN; ++j) {
            accum += c[j] * f[i - j];
            accum = barrett_32(accum);
        }
        h[i] = accum;
    }
    h[INPUT_LEN + INPUT_LEN - 1] = 0;

    for (i = 0; i < INPUT_LEN; ++i) optr_16x2[i] = barrett_16x2(optr_16x2[i]);
}
