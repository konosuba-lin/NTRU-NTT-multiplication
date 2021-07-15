// template: (Matthias) cyclecount.c
// intrinsics: (BYYang) cmsis.h, barrett_*

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include "../common/stm32wrapper.h"
#include "cmsis.h"
#include "mult_settings.h"

extern void product_scanning(int16_t *, int16_t *, int16_t *);
extern void your_polymul(int16_t *, int16_t *, int16_t *);
extern void gf_polymul_48x48_1s(int16_t *, int16_t *, int16_t *);
extern void gf_polymul_64x64_1s(int16_t *, int16_t *, int16_t *);

int main(void)
{
    clock_setup();
    gpio_setup();
    usart_setup(115200);

    // plainly reading from CYCCNT is more efficient than using the
    // dwt_read_cycle_counter() interface offered by libopencm3,
    // as this adds extra overhead because of the function call

    SCS_DEMCR |= SCS_DEMCR_TRCENA;
    DWT_CYCCNT = 0;
    DWT_CTRL |= DWT_CTRL_CYCCNTENA;

    int i, j;
    int16_t small_gen, xor_checker;
    int16_t CT_in[INPUT_LEN], SK_in[INPUT_LEN];
    int16_t REF_RSLT[INPUT_LEN * 2], YOUR_RSLT[INPUT_LEN * 2], OPT_RSLT[INPUT_LEN * 2];
    unsigned int oldcount, newcount;
    unsigned char buffer_out[15000];

    // The generation of GF(4591) CT-coef + GF(3) SK-coef
    srand(0);
    for (i = 0; i < INPUT_LEN; ++i) {
        j = rand() >> 7;
        j = (j << 8) + (rand() >> 7);
        CT_in[i] = barrett_16x2(barrett_32(j));

        j = rand() >> 7;
        small_gen = 2 - (j & 1);
        small_gen = (j & small_gen) - 1;
        SK_in[i] = small_gen;
    }

    // print CT polynomial
    sprintf((char *)(buffer_out), "CIPHERTEXT in GF(%d):", q);    
    send_USART_str(buffer_out);
    for (i = 0, j = 0; i < (INPUT_LEN - 1); ++i, j += 8) {
        sprintf((char *)(buffer_out + j), "%5d + ", CT_in[i]);
    }
    sprintf((char *)(buffer_out + j), "%5d\n", CT_in[i]);
    send_USART_str(buffer_out);

    // print SK polynomial
    sprintf((char *)(buffer_out), "PRIVATE KEY in GF(3):");    
    send_USART_str(buffer_out);
    for (i = 0, j = 0; i < (INPUT_LEN - 1); ++i, j += 8) {
        sprintf((char *)(buffer_out + j), "%5d + ", SK_in[i]);
    }
    sprintf((char *)(buffer_out + j), "%5d\n", SK_in[i]);
    send_USART_str(buffer_out);

    // benchmark CT * SK: ref implementation
    oldcount = DWT_CYCCNT;
    product_scanning(REF_RSLT, CT_in, SK_in);
    newcount = DWT_CYCCNT - oldcount;
    sprintf((char *)buffer_out, "#cycle = %d", newcount);
    send_USART_str(buffer_out);

    // print ref CT * SK
    for (i = 0, j = 0; i < (INPUT_LEN * 2 - 1); ++i, j += 8) {
        sprintf((char *)(buffer_out + j), "%5d + ", REF_RSLT[i]);
    }
    sprintf((char *)(buffer_out + j), "%5d\n", REF_RSLT[i]);
    send_USART_str(buffer_out);

    // benchmark CT * SK: YOUR WORK
    oldcount = DWT_CYCCNT;
    your_polymul(YOUR_RSLT, CT_in, SK_in);
    newcount = DWT_CYCCNT - oldcount;
    sprintf((char *)buffer_out, "#cycle = %d", newcount);
    send_USART_str(buffer_out);

    // print YOUR CT * SK
    for (i = 0, j = 0; i < (INPUT_LEN * 2 - 1); ++i, j += 8) {
        sprintf((char *)(buffer_out + j), "%5d + ", YOUR_RSLT[i]);
    }
    sprintf((char *)(buffer_out + j), "%5d\n", YOUR_RSLT[i]);
    send_USART_str(buffer_out);

    // benchmark CT * SK: YOUR WORK
    oldcount = DWT_CYCCNT;
    gf_polymul_64x64_1s(OPT_RSLT, CT_in, SK_in);
    newcount = DWT_CYCCNT - oldcount;
    sprintf((char *)buffer_out, "#cycle = %d", newcount);
    send_USART_str(buffer_out);

    // print YOUR CT * SK
    for (i = 0, j = 0; i < (INPUT_LEN * 2 - 1); ++i, j += 8) {
        sprintf((char *)(buffer_out + j), "%5d + ", OPT_RSLT[i]);
    }
    sprintf((char *)(buffer_out + j), "%5d\n", OPT_RSLT[i]);
    send_USART_str(buffer_out);

    // const-time checker
    for (i = 0, xor_checker = 0; i < (INPUT_LEN * 2); ++i) {
        xor_checker |= (YOUR_RSLT[i] ^ REF_RSLT[i]);
    }
    sprintf((char *)(buffer_out), "zero iff. YOUR == REF: %d\n", xor_checker);    
    send_USART_str(buffer_out);

    for (i = 0, xor_checker = 0; i < (INPUT_LEN * 2); ++i) {
        xor_checker |= (OPT_RSLT[i] ^ REF_RSLT[i]);
    }
    sprintf((char *)(buffer_out), "zero iff. OPT == REF: %d\n", xor_checker);    
    send_USART_str(buffer_out);

    return 0;
}
