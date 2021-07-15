#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include "../common/stm32wrapper.h"
#include "cmsis.h"
#include "mult_settings.h"

//extern void product_scanning(int32_t *, int32_t *, int32_t *);
//extern void NTT_forword_1440to180(int16_t *input, int32_t* output);
//extern void NTT_backward_1440to180(int32_t *input, int32_t* output);
//extern void NTT_backward_1440to180_part_all(int32_t *input, int32_t* output);
//extern void NTT_forward_180to30(int32_t *input, int32_t* output);
//extern void NTT_forward_180to30_part_0(int32_t *input, int32_t* output);
//extern void NTT_backward_180to30(int32_t *input, int32_t* output);
//extern void NTT_backward_180to30_part_all(int32_t *input, int32_t* output);
//extern void NTT_forward_30to5(int32_t *input, int32_t* output);
//extern void NTT_forward_30to5_part_0(int32_t *input, int32_t* output);
//extern void NTT_backward_30to5(int32_t *input, int32_t* output);
//extern void Schoolbook_5_5(int32_t *input1, int32_t *input2, int32_t* output);

int main(void)
{
    //clock_setup();
    clock_setup(CLOCK_BENCHMARK);
    gpio_setup();
    usart_setup(115200);

    // plainly reading from CYCCNT is more efficient than using the
    // dwt_read_cycle_counter() interface offered by libopencm3,
    // as this adds extra overhead because of the function call

    SCS_DEMCR |= SCS_DEMCR_TRCENA;
    DWT_CYCCNT = 0;
    DWT_CTRL |= DWT_CTRL_CYCCNTENA;

    int i, j;
    int32_t xor_checker;
    //int16_t P[INPUT_LEN];
    int16_t P1[INPUT_LEN];//[INPUT_LEN];
    int16_t P2[INPUT_LEN];

    int16_t REF_RSLT[INPUT_LEN];//[INPUT_LEN];
    int16_t YOUR_RSLT[INPUT_LEN];
    unsigned int oldcount, newcount;
    unsigned char buffer_out[40000];

    // The generation of GF(4591) CT-coef + GF(3) SK-coef
    srand(0);
    /*for (i = 0; i < 677; ++i) {
        j = rand() >> 7;
        j = (j << 8) + (rand() >> 7);
        P[i] = mod_2048(j);
    }
    for (i=678; i<1440; ++i){
        P[i] = 0;
    }*/
    for (i = 0; i < INPUT_LEN; ++i) {
        j = rand() >> 7;
        j = (j << 8) + (rand() >> 7);
        P1[i] = mod_2048(j);
        //if(i>2) P1[i] = 0;
        //else P1[i] = 0;
    }
    for (i = 0; i < INPUT_LEN; ++i) {
        j = rand()%3;
        if(j==2) P2[i] = (int16_t)(-1);
        else P2[i] = (int16_t)j;
        //if(i>2) P2[i] = 0;
        //else P2[i] = 0;
    }
    //P2[4] = 4;
    /*for (i=0;i<10;++i){
        P1[i] = -1024;
        P2[i] = -1024;
    }*/
    /*int32_t k1 = -57584;
    int32_t k2 = -57584;
    int32_t k3 = -1185270;
    int32_t k4 = -1113610;
    for (i = 0; i < INPUT_LEN; ++i) {
        if(i<180) P[i] = 2;
        else if(i<360) P[i]=0;
        else if(i<540) P[i]=1+k2;
        else if(i<720) P[i]=1-k2;
        else if(i<900) P[i]=1+k3;
        else if(i<1080) P[i]=1-k3;
        else if(i<1260) P[i]=1+k4;
        else if(i<1440) P[i]=1-k4;
    }*/
    /*for (i = 0; i < INPUT_LEN; ++i) {
        if(i<30)       P[i]=0;
        else if(i<60)  P[i]=0;
        else if(i<90)  P[i]=1;
        else if(i<120) P[i]=0;
        else if(i<150) P[i]=0;
        else if(i<180) P[i]=0;
    }*/
    /*for (i = 0; i < INPUT_LEN; ++i) {
        if(i<5)       P[i]=1;
        else if(i<10)  P[i]=1;
        else if(i<15)  P[i]=1;
        else if(i<20) P[i]=1;
        else if(i<25) P[i]=1;
        else if(i<30) P[i]=1;
    }*/
    
    int print_len ;
    int print_start;
    int step;
    print_start = 0;
    print_len = 30;//INPUT_LEN;
    step = 1;

    // print P1
    sprintf((char *)(buffer_out), "Polymul:");    
    send_USART_str(buffer_out);
    for (i = 0, j = 0; i < (print_len - 1); ++i, j += 12) {
        sprintf((char *)(buffer_out+j), "%9d + ",P1[print_start+i*step]);
    }
    sprintf((char *)(buffer_out+j), "%9d\n",P1[print_start+i*step]);
    send_USART_str(buffer_out);

    // print P2
    sprintf((char *)(buffer_out), "Polymul:");    
    send_USART_str(buffer_out);
    for (i = 0, j = 0; i < (print_len - 1); ++i, j += 12) {
        sprintf((char *)(buffer_out+j), "%9d + ",P2[print_start+i*step]);
    }
    sprintf((char *)(buffer_out+j), "%9d\n",P2[print_start+i*step]);
    send_USART_str(buffer_out);


    // benchmark ref NTT
    //NTT_1440_to_180(REF_RSLT, P1);
    //NTT_180_to_1440(REF_RSLT, P);
    //NTT_180_to_1440_v2(REF_RSLT, P);
    //NTT_180_to_30(REF_RSLT, P);
    //NTT_180_to_30_v2(REF_RSLT, P,7);
    //NTT_30_to_180(REF_RSLT, P);
    //NTT_30_to_180_v2(REF_RSLT, P);
    //NTT_30_to_5(REF_RSLT, P);
    //NTT_30_to_5_v2(REF_RSLT, P,5);
    //NTT_5_to_30(REF_RSLT, P);
    //ref_Schoolbook_5_5(REF_RSLT,P1,P2);
    oldcount = DWT_CYCCNT;
    ans_poly_Rq_mul(REF_RSLT,P1,P2);
    newcount = DWT_CYCCNT - oldcount;
    sprintf((char *)buffer_out, "#cycle = %d", newcount);
    send_USART_str(buffer_out);

    // print ref NTT
    for (i = 0, j = 0; i < (print_len-1); ++i, j += 12) {
        sprintf((char *)(buffer_out + j), "%9d + ", REF_RSLT[print_start+i*step]);
    }
    sprintf((char *)(buffer_out + j), "%9d\n", REF_RSLT[print_start+i*step]);
    send_USART_str(buffer_out);

    // benchmark your NTT
    
    //NTT_forword_1440to180(P1,YOUR_RSLT);
    // NTT_backward_1440to180(P,YOUR_RSLT);
    //NTT_backward_1440to180_part_all(P,YOUR_RSLT);
    //NTT_forward_180to30(P,YOUR_RSLT);
    //NTT_forward_180to30_part_7(P,YOUR_RSLT);
    //NTT_backward_180to30(P,YOUR_RSLT);
    //NTT_backward_180to30_part_all(P,YOUR_RSLT);
    //NTT_forward_30to5(P,YOUR_RSLT);
    //NTT_forward_30to5_part_5(P,YOUR_RSLT);
    //NTT_backward_30to5(P,YOUR_RSLT);
    //Schoolbook_5_5(P,P2,YOUR_RSLT);
    //ref_poly_Rq_mul(YOUR_RSLT,P1,P2);
    oldcount = DWT_CYCCNT;
    your_poly_Rq_mul(YOUR_RSLT,P1,P2);
    //ref_poly_Rq_mul(YOUR_RSLT,P1,P2);
    newcount = DWT_CYCCNT - oldcount;
    sprintf((char *)buffer_out, "#cycle = %d", newcount);
    send_USART_str(buffer_out);

    // print YOUR CT * SK
    for (i = 0, j = 0; i < (print_len-1); ++i, j += 12) {
        sprintf((char *)(buffer_out + j), "%9d + ", YOUR_RSLT[print_start+i*step]);
    }
    sprintf((char *)(buffer_out + j), "%9d\n", YOUR_RSLT[print_start+i*step]);
    send_USART_str(buffer_out);


    // const-time checker
    int error = 0;
    for (i = 0, xor_checker = 0; i < INPUT_LEN ; ++i) {
        xor_checker |= (YOUR_RSLT[i] ^ REF_RSLT[i]);
        //int temp = (i+1)%360;
        //if((mod_2048_v2(YOUR_RSLT[i])!=mod_2048_v2(REF_RSLT[i]))){
        if((YOUR_RSLT[i]-REF_RSLT[i])%2048!=0){
            sprintf((char *)(buffer_out), "error at %dth. YOUR: %d,  REF: %d, error: %d",i,YOUR_RSLT[i],REF_RSLT[i],YOUR_RSLT[i]-REF_RSLT[i]);
            send_USART_str(buffer_out);
            error += 1;
            break;
        }
        /*if(REF_RSLT[i]!=0){
            sprintf((char *)(buffer_out), "not zero at %dth. REF: %d\n",i,REF_RSLT[i]);
            send_USART_str(buffer_out);
        }*/
    }
    if(error>0){
        sprintf((char *)(buffer_out), "fail");
        send_USART_str(buffer_out);
    }
    else{
        sprintf((char *)(buffer_out), "success");
        send_USART_str(buffer_out);
    }
    /*sprintf((char *)(buffer_out), "zero iff. YOUR == REF: %d\n", xor_checker);    
    send_USART_str(buffer_out);*/


    return 0;
}
