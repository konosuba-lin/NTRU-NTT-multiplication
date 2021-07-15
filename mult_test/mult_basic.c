#include <stdint.h>
#include "cmsis.h"
#include "mult_settings.h"

/*extern void NTT_forword_1440to180(int16_t *input, int32_t* output); its f"o"rward
extern void NTT_backward_1440to180_part_all(int32_t *input, int32_t* output);*/
extern void NTT_forward_1440to180(int16_t *input, int32_t* output);
extern void NTT_backward_1440to180(int32_t *input, int32_t* output);
/*extern void NTT_forward_180to30_part_0(int32_t *input, int32_t* output);
extern void NTT_forward_180to30_part_1(int32_t *input, int32_t* output);
extern void NTT_forward_180to30_part_2(int32_t *input, int32_t* output);
extern void NTT_forward_180to30_part_3(int32_t *input, int32_t* output);
extern void NTT_forward_180to30_part_4(int32_t *input, int32_t* output);
extern void NTT_forward_180to30_part_5(int32_t *input, int32_t* output);
extern void NTT_forward_180to30_part_6(int32_t *input, int32_t* output);
extern void NTT_forward_180to30_part_7(int32_t *input, int32_t* output);*/
extern void NTT_forward_180to30(int32_t *input, int32_t* output);
//extern void NTT_backward_180to30_part_all(int32_t *input, int32_t* output);
extern void NTT_backward_180to30(int32_t *input, int32_t* output);
/*extern void NTT_forward_30to5_part_0(int32_t *input, int32_t* output);
extern void NTT_forward_30to5_part_1(int32_t *input, int32_t* output);
extern void NTT_forward_30to5_part_2(int32_t *input, int32_t* output);
extern void NTT_forward_30to5_part_3(int32_t *input, int32_t* output);
extern void NTT_forward_30to5_part_4(int32_t *input, int32_t* output);
extern void NTT_forward_30to5_part_5(int32_t *input, int32_t* output);*/
extern void NTT_forward_30to5(int32_t *input, int32_t* output);
extern void NTT_backward_30to5(int32_t *input, int32_t* output);
//extern void Schoolbook_5_5(int32_t *input1, int32_t *input2, int32_t* output);
extern void school_mul(int32_t *input1, int32_t *input2, int32_t* output);
extern void last_mod677_2048(int32_t *input, int16_t* output);

// c[INPUT_LEN] and f[INPUT_LEN] as the two inputs
// h[INPUT_LEN * 2] as the output: the product of two inputs
void product_scanning(int32_t *h, int32_t *c, int32_t *f) {
    int i, j;
    int64_t accum;

    for (i = 0; i < INPUT_LEN; ++i) {
        accum = 0;
        for (j = 0; j <= i; ++j) {
            accum += c[j] * f[i - j];
            accum = mod_q(accum);
        }
        h[i] = accum;
    }
    for (i = INPUT_LEN; i < INPUT_LEN + INPUT_LEN - 1; ++i) {
        accum = 0;
        for (j = i - INPUT_LEN + 1; j < INPUT_LEN; ++j) {
            accum += c[j] * f[i - j];
            accum = mod_q(accum);
        }
        h[i] = accum;
    }
    h[INPUT_LEN + INPUT_LEN - 1] = 0;
}

void product_scanning_180(int32_t *h, int32_t *c, int32_t *f) {
    int i, j;
    int64_t accum;
    int len = 180;
    for (i = 0; i < len; ++i) {
        accum = 0;
        for (j = 0; j <= i; ++j) {
            accum += c[j] * f[i - j];
            accum = mod_q(accum);
        }
        h[i] = accum;
    }
    for (i = len; i < len + len - 1; ++i) {
        accum = 0;
        for (j = i - len + 1; j < len; ++j) {
            accum += c[j] * f[i - j];
            accum = mod_q(accum);
        }
        h[i] = accum;
    }
    h[len + len - 1] = 0;
}

void poly_mult_1440(int32_t *h, int32_t k, int32_t *f){
    int i;
    int len = 1440;
    int64_t accum;
    for (i = 0; i < len; ++i) {
        accum = (int64_t)k*(int64_t)f[i];
        accum = mod_q(accum);
        h[i] = accum;
    }
}

void poly_add_180(int32_t *h, int32_t *c, int32_t *f){
    int i;
    int len = 180;
    int64_t accum;
    for (i = 0; i < len; ++i) {
        accum = c[i]+f[i];
        accum = mod_q(accum);
        h[i] = accum;
    }
}

void poly_sub_180(int32_t *h, int32_t *c, int32_t *f){
    int i;
    int len = 180;
    int64_t accum;
    for (i = 0; i < len; ++i) {
        accum = c[i]-f[i];
        accum = mod_q(accum);
        h[i] = accum;
    }
}

void poly_madd_180(int32_t *h, int32_t *c, int32_t k, int32_t *f){
    int i;
    int len = 180;
    int64_t accum;
    for (i = 0; i < len; ++i) {
        accum = (int64_t)k*(int64_t)f[i];
        accum = mod_q(accum);
        accum += c[i];
        accum = mod_q(accum);
        h[i] = accum;
    }
}

void poly_msub_180(int32_t *h, int32_t *c, int32_t k, int32_t *f){
    int i;
    int len = 180;
    int64_t accum;
    for (i = 0; i < len; ++i) {
        accum = (int64_t)k*(int64_t)f[i];
        accum = mod_q(accum);
        accum = c[i] - accum;
        accum = mod_q(accum);
        h[i] = accum;
    }
}

void poly_mult_180(int32_t *h, int32_t k, int32_t *f){
    int i;
    int len = 180;
    int64_t accum;
    for (i = 0; i < len; ++i) {
        accum = (int64_t)k*(int64_t)f[i];
        accum = mod_q(accum);
        h[i] = accum;
    }
}

void poly_mv_1440(int32_t *h, int32_t *c){
    int i;
    int len = 1440;
    for (i = 0; i < len; ++i) {
        h[i] = c[i];
    }
}

void poly_add_30(int32_t *h, int32_t *c, int32_t *f){
    int i;
    int len = 30;
    int64_t accum;
    for (i = 0; i < len; ++i) {
        accum = c[i]+f[i];
        accum = mod_q(accum);
        h[i] = accum;
    }
}

void poly_sub_30(int32_t *h, int32_t *c, int32_t *f){
    int i;
    int len = 30;
    int64_t accum;
    for (i = 0; i < len; ++i) {
        accum = c[i]-f[i];
        accum = mod_q(accum);
        h[i] = accum;
    }
}

void poly_mult_30(int32_t *h, int32_t k, int32_t *f){
    int i;
    int len = 30;
    int64_t accum;
    for (i = 0; i < len; ++i) {
        accum = (int64_t)k*(int64_t)f[i];
        accum = mod_q(accum);
        h[i] = accum;
    }
}

void poly_mv_180(int32_t *h, int32_t *c){
    int i;
    int len = 180;
    //int64_t accum;
    for (i = 0; i < len; ++i) {
        h[i] = c[i];
    }
}

void twist_mult_180(int32_t *h, int32_t *f, int32_t k){
    int i;
    int len = 180;
    int64_t tempt;
    int32_t constant = 1;
    for (i=0; i<len; ++i){
        tempt = (int64_t)f[i]*(int64_t)constant;
        h[i] = mod_q(tempt);
        tempt = (int64_t)constant*(int64_t)k;
        constant = mod_q(tempt);
    }
}


void poly_add_5(int32_t *h, int32_t *c, int32_t *f){
    int i;
    int len = 5;
    int64_t accum;
    for (i = 0; i < len; ++i) {
        accum = c[i]+f[i];
        accum = mod_q(accum);
        h[i] = accum;
    }
}

void poly_sub_5(int32_t *h, int32_t *c, int32_t *f){
    int i;
    int len = 5;
    int64_t accum;
    for (i = 0; i < len; ++i) {
        accum = c[i]-f[i];
        accum = mod_q(accum);
        h[i] = accum;
    }
}

void poly_mult_5(int32_t *h, int32_t k, int32_t *f){
    int i;
    int len = 5;
    int64_t accum;
    for (i = 0; i < len; ++i) {
        accum = (int64_t)k*(int64_t)f[i];
        accum = mod_q(accum);
        h[i] = accum;
    }
}

void poly_mv_30(int32_t *h, int32_t *c){
    int i;
    int len = 30;
    int64_t accum;
    for (i = 0; i < len; ++i) {
        h[i] = c[i];
    }
}

void twist_mult_30(int32_t *h, int32_t *f, int32_t k){
    int i;
    int len = 30;
    int64_t tempt;
    int32_t constant = 1;
    for (i=0; i<len; ++i){
        tempt = (int64_t)f[i]*(int64_t)constant;
        h[i] = mod_q(tempt);
        tempt = (int64_t)constant*(int64_t)k;
        constant = mod_q(tempt);
    }
}

//-----------------------------------------------------//

void NTT_1440_to_180(int32_t *h, int16_t *f) {
    int i;
    int32_t tp[1440];
    int32_t k1 = -57584;
    int32_t k2 = -57584;
    int32_t k3 = -1185270;
    int32_t k4 = -1113610;
    int32_t* A;
    int32_t* B;
    int32_t* C;
    int32_t* D;

    //-------------------------First Layer NTT-------------//
    //1 NTT
    for(i = 0; i<720; ++i){
        h[i] = (int32_t)f[i];
        h[i+720] = (int32_t)f[i];
    }
    //-------------------------Second Layer NTT-------------//
    //2.1 NTT
    A = (int32_t*)(h+0  ); 
    B = (int32_t*)(h+180); 
    C = (int32_t*)(h+360); 
    D = (int32_t*)(h+540);
    poly_add_180((int32_t*)(tp+0  ),A,C);
    poly_add_180((int32_t*)(tp+180),B,D);
    poly_sub_180((int32_t*)(tp+360),A,C);
    poly_sub_180((int32_t*)(tp+540),B,D);
    //2.2 NTT
    A = (int32_t*)(h+720);
    B = (int32_t*)(h+900);
    C = (int32_t*)(h+1080);
    D = (int32_t*)(h+1260);
    poly_madd_180((int32_t*)(tp+720 ),A,k1,C);
    poly_madd_180((int32_t*)(tp+900 ),B,k1,D);
    poly_msub_180((int32_t*)(tp+1080),A,k1,C);
    poly_msub_180((int32_t*)(tp+1260),B,k1,D);
    //mv
    poly_mv_1440(h,tp);
    //-------------------------Third Layer NTT-------------//
    //3.1 NTT
   A = h;
    B = (int32_t*)(h+180);
    poly_add_180((int32_t*)(tp+0  ),A,B);
    poly_sub_180((int32_t*)(tp+180),A,B);
    //3.2 NTT
    A = (int32_t*)(h+360);
    B = (int32_t*)(h+540);
    poly_madd_180((int32_t*)(tp+360),A,k2,B);
    poly_msub_180((int32_t*)(tp+540),A,k2,B);
    //3.3 NTT
    A = (int32_t*)(h+720);
    B = (int32_t*)(h+900);
    poly_madd_180((int32_t*)(tp+720),A,k3,B);
    poly_msub_180((int32_t*)(tp+900),A,k3,B);
    //3.4 NTT
    A = (int32_t*)(h+1080);
    B = (int32_t*)(h+1260);
    poly_madd_180((int32_t*)(tp+1080),A,k4,B);
    poly_msub_180((int32_t*)(tp+1260),A,k4,B);
    //mv
    poly_mv_1440(h,tp);
}

void NTT_180_to_1440(int32_t *h, int32_t *f) {
    int i;
    int32_t tp[1440];
    int32_t invk1   = 57584;
    int32_t invk2   = 57584;
    int32_t invk3   = 1113610;
    int32_t invk4   = 1185270;
    //int32_t inv8   = -1612800;
    int32_t* A;
    int32_t* B;
    int32_t* C;
    int32_t* D;
    int32_t* E;
    int32_t* F;
    int32_t* G;
    int32_t* H;

    //-------------------------First Layer inv_NTT-------------//
    //1.1 inv_NTT
    A = (int32_t*)(f+0  );
    B = (int32_t*)(f+180);
    poly_add_180((int32_t*)(tp+0  ),A,B);
    poly_sub_180((int32_t*)(tp+180),A,B);
    //1.2 inv_NTT
    A = (int32_t*)(f+360);
    B = (int32_t*)(f+540);
    poly_add_180((int32_t*)(tp+360),A,B);
    poly_sub_180((int32_t*)(tp+540),A,B);
    poly_mult_180((int32_t*)(tp+540),invk2,(int32_t*)(tp+540));
    //1.3 inv_NTT
    A = (int32_t*)(f+720);
    B = (int32_t*)(f+900);
    poly_add_180((int32_t*)(tp+720),A,B);
    poly_sub_180((int32_t*)(tp+900),A,B);
    poly_mult_180((int32_t*)(tp+900),invk3,(int32_t*)(tp+900));
    //1.4 inv_NTT
    A = (int32_t*)(f+1080);
    B = (int32_t*)(f+1260);
    poly_add_180((int32_t*)(tp+1080),A,B);
    poly_sub_180((int32_t*)(tp+1260),A,B);
    poly_mult_180((int32_t*)(tp+1260),invk4,(int32_t*)(tp+1260));
    //mv
    poly_mv_1440(h,tp);
    //-------------------------Second Layer inv_NTT-------------//
    //2.1 inv_NTT
    A = (int32_t*)(h+0  ); 
    B = (int32_t*)(h+180); 
    C = (int32_t*)(h+360); 
    D = (int32_t*)(h+540);
    poly_add_180((int32_t*)(tp+0  ),A,C);
    poly_add_180((int32_t*)(tp+180),B,D);
    poly_sub_180((int32_t*)(tp+360),A,C);
    poly_sub_180((int32_t*)(tp+540),B,D);
    //2.2 inv_NTT
    A = (int32_t*)(h+720);
    B = (int32_t*)(h+900);
    C = (int32_t*)(h+1080);
    D = (int32_t*)(h+1260);
    poly_add_180((int32_t*)(tp+720 ),A,C);
    poly_add_180((int32_t*)(tp+900 ),B,D);
    poly_sub_180((int32_t*)(tp+1080),A,C);
    poly_sub_180((int32_t*)(tp+1260),B,D);
    poly_mult_180((int32_t*)(tp+1080),invk1,(int32_t*)(tp+1080));
    poly_mult_180((int32_t*)(tp+1260),invk1,(int32_t*)(tp+1260));
    //mv
    poly_mv_1440(h,tp);
    //-------------------------Third Layer inv_NTT-------------//
    //3.1 inv_NTT
    A = (int32_t*)(h+0  ); 
    B = (int32_t*)(h+180); 
    C = (int32_t*)(h+360); 
    D = (int32_t*)(h+540);
    E = (int32_t*)(h+720);
    F = (int32_t*)(h+900);
    G = (int32_t*)(h+1080);
    H = (int32_t*)(h+1260);
    poly_add_180((int32_t*)(tp+0   ),A,E);
    poly_add_180((int32_t*)(tp+180 ),B,F);
    poly_add_180((int32_t*)(tp+360 ),C,G);
    poly_add_180((int32_t*)(tp+540 ),D,H);
    poly_sub_180((int32_t*)(tp+720 ),A,E);
    poly_sub_180((int32_t*)(tp+900 ),B,F);
    poly_sub_180((int32_t*)(tp+1080),C,G);
    poly_sub_180((int32_t*)(tp+1260),D,H);
    //divide 8
    /*poly_mult_180((int32_t*)(tp+0   ),inv8,(int32_t*)(tp+0   ));
    poly_mult_180((int32_t*)(tp+180 ),inv8,(int32_t*)(tp+180 ));
    poly_mult_180((int32_t*)(tp+360 ),inv8,(int32_t*)(tp+360 ));
    poly_mult_180((int32_t*)(tp+540 ),inv8,(int32_t*)(tp+540 ));
    poly_mult_180((int32_t*)(tp+720 ),inv8,(int32_t*)(tp+720 ));
    poly_mult_180((int32_t*)(tp+900 ),inv8,(int32_t*)(tp+900 ));
    poly_mult_180((int32_t*)(tp+1080),inv8,(int32_t*)(tp+1080));
    poly_mult_180((int32_t*)(tp+1260),inv8,(int32_t*)(tp+1260));*/
    //mv
    poly_mv_1440(h,tp);
}

void NTT_180_to_1440_v2(int32_t *h, int32_t *f) {
    int32_t tp[1440];
    int32_t tw_c_inv[8] = {1, -3686034, 3139634, -1997007, 1031391, 1770960, -2742482, 5541700};
    twist_mult_180((int32_t*)(tp     ),(int32_t*)(f     ),tw_c_inv[0]);
    twist_mult_180((int32_t*)(tp+180 ),(int32_t*)(f+180 ),tw_c_inv[1]);
    twist_mult_180((int32_t*)(tp+360 ),(int32_t*)(f+360 ),tw_c_inv[2]);
    twist_mult_180((int32_t*)(tp+540 ),(int32_t*)(f+540 ),tw_c_inv[3]);
    twist_mult_180((int32_t*)(tp+720 ),(int32_t*)(f+720 ),tw_c_inv[4]);
    twist_mult_180((int32_t*)(tp+900 ),(int32_t*)(f+900 ),tw_c_inv[5]);
    twist_mult_180((int32_t*)(tp+1080),(int32_t*)(f+1080),tw_c_inv[6]);
    twist_mult_180((int32_t*)(tp+1260),(int32_t*)(f+1260),tw_c_inv[7]);
    //poly_mv_1440(h,tp);
    NTT_180_to_1440(h,tp);
}

void NTT_180_to_30(int32_t *h, int32_t *f){
    int i;
    int32_t tp[180];
    int32_t w   = -402095;
    int32_t w2   = 402094;
    int32_t* r0;
    int32_t* r1;
    int32_t* r2;
    int32_t* r3;
    int32_t* r4;
    int32_t* r5;
    r0 = (int32_t*)(f+0); 
    r1 = (int32_t*)(f+30); 
    r2 = (int32_t*)(f+60); 
    r3 = (int32_t*)(f+90);
    r4 = (int32_t*)(f+120);
    r5 = (int32_t*)(f+150);

    poly_add_30((int32_t*)(tp+0)  ,r4,r1);//4+1
    poly_add_30((int32_t*)(tp+30) ,r4,r1);//4+1
    poly_add_30((int32_t*)(tp+60) ,r4,r1);//4+1
    poly_add_30((int32_t*)(tp+90)  ,r2,r5);//2+5
    poly_add_30((int32_t*)(tp+120) ,r2,r5);//2+5
    poly_add_30((int32_t*)(tp+150) ,r2,r5);//2+5

    poly_mult_30((int32_t*)(tp+30) ,w ,(int32_t*)(tp+30));//(4+1)w
    poly_mult_30((int32_t*)(tp+60) ,w2,(int32_t*)(tp+60));//(4+1)w^2
    poly_mult_30((int32_t*)(tp+120),w ,(int32_t*)(tp+120));//(2+5)w
    poly_mult_30((int32_t*)(tp+150),w2,(int32_t*)(tp+150));//(2+5)w^2

    poly_add_30((int32_t*)(h+0)  ,r0,r3);//0+3
    poly_add_30((int32_t*)(h+60)  ,r0,r3);//0+3
    poly_add_30((int32_t*)(h+120)  ,r0,r3);//0+3

    poly_add_30((int32_t*)(h+0)  ,(int32_t*)(h+0),(int32_t*)(tp+0));//(0+3)+(4+1)+(2+5)
    poly_add_30((int32_t*)(h+0)  ,(int32_t*)(h+0),(int32_t*)(tp+90));
    poly_add_30((int32_t*)(h+60)  ,(int32_t*)(h+60),(int32_t*)(tp+30));//(0+3)+(4+1)w+(2+5)w^2
    poly_add_30((int32_t*)(h+60)  ,(int32_t*)(h+60),(int32_t*)(tp+150));
    poly_add_30((int32_t*)(h+120)  ,(int32_t*)(h+120),(int32_t*)(tp+60));//(0+3)+(4+1)w^2+(2+5)w
    poly_add_30((int32_t*)(h+120)  ,(int32_t*)(h+120),(int32_t*)(tp+120));


    poly_sub_30((int32_t*)(tp+0)  ,r4,r1);//4-1
    poly_sub_30((int32_t*)(tp+30) ,r4,r1);//4-1
    poly_sub_30((int32_t*)(tp+60) ,r4,r1);//4-1
    poly_sub_30((int32_t*)(tp+90)  ,r2,r5);//2-5
    poly_sub_30((int32_t*)(tp+120) ,r2,r5);//2-5
    poly_sub_30((int32_t*)(tp+150) ,r2,r5);//2-5

    poly_mult_30((int32_t*)(tp+30) ,w ,(int32_t*)(tp+30));//(4-1)w
    poly_mult_30((int32_t*)(tp+60) ,w2,(int32_t*)(tp+60));//(4-1)w^2
    poly_mult_30((int32_t*)(tp+120),w ,(int32_t*)(tp+120));//(2-5)w
    poly_mult_30((int32_t*)(tp+150),w2,(int32_t*)(tp+150));//(2-5)w^2

    poly_sub_30((int32_t*)(h+30) ,r0,r3);//0-3
    poly_sub_30((int32_t*)(h+90),r0,r3);//0-3
    poly_sub_30((int32_t*)(h+150),r0,r3);//0-3

    poly_add_30((int32_t*)(h+30)  ,(int32_t*)(h+30) ,(int32_t*)(tp+0));//(0-3)+(4-1)+(2-5)
    poly_add_30((int32_t*)(h+30)  ,(int32_t*)(h+30) ,(int32_t*)(tp+90));
    poly_add_30((int32_t*)(h+90) ,(int32_t*)(h+90),(int32_t*)(tp+30));//(0-3)+(4-1)w+(2-5)w^2
    poly_add_30((int32_t*)(h+90) ,(int32_t*)(h+90),(int32_t*)(tp+150));
    poly_add_30((int32_t*)(h+150) ,(int32_t*)(h+150),(int32_t*)(tp+60));//(0-3)+(4-1)w^2+(2-5)w
    poly_add_30((int32_t*)(h+150) ,(int32_t*)(h+150),(int32_t*)(tp+120));

}

void NTT_180_to_30_v2(int32_t *h, int32_t *f, int part){
    int32_t tp[180];
    int32_t tw_c[8] = {1, -4020678, -6261472, 4350801, 2577, -659203, 5090307, -172292};
    twist_mult_180(tp,f,tw_c[part]);
    NTT_180_to_30(h,tp);

}

void NTT_30_to_180(int32_t *h, int32_t *f){
    int i;
    int32_t tp[180];
    int32_t w   = -402095;
    int32_t w2   = 402094;
    int32_t* r0;
    int32_t* r1;
    int32_t* r2;
    int32_t* r3;
    int32_t* r4;
    int32_t* r5;
    r0 = (int32_t*)(f+0); 
    r1 = (int32_t*)(f+30); 
    r2 = (int32_t*)(f+60); 
    r3 = (int32_t*)(f+90);
    r4 = (int32_t*)(f+120);
    r5 = (int32_t*)(f+150);

    poly_add_30((int32_t*)(tp+0)  ,r2,r3);//2+3
    poly_add_30((int32_t*)(tp+30) ,r2,r3);//2+3
    poly_add_30((int32_t*)(tp+60) ,r2,r3);//2+3
    poly_add_30((int32_t*)(tp+90)  ,r4,r5);//4+5
    poly_add_30((int32_t*)(tp+120) ,r4,r5);//4+5
    poly_add_30((int32_t*)(tp+150) ,r4,r5);//4+5

    poly_mult_30((int32_t*)(tp+30) ,w ,(int32_t*)(tp+30));//(2+3)w
    poly_mult_30((int32_t*)(tp+60) ,w2,(int32_t*)(tp+60));//(2+3)w^2
    poly_mult_30((int32_t*)(tp+120),w ,(int32_t*)(tp+120));//(4+5)w
    poly_mult_30((int32_t*)(tp+150),w2,(int32_t*)(tp+150));//(4+5)w^2

    poly_add_30((int32_t*)(h+0)  ,r0,r1);//0+1
    poly_add_30((int32_t*)(h+60)  ,r0,r1);//0+1
    poly_add_30((int32_t*)(h+120)  ,r0,r1);//0+1

    poly_add_30((int32_t*)(h+0)  ,(int32_t*)(h+0),(int32_t*)(tp+0));//(0+1)+(2+3)+(4+5)
    poly_add_30((int32_t*)(h+0)  ,(int32_t*)(h+0),(int32_t*)(tp+90));
    poly_add_30((int32_t*)(h+60)  ,(int32_t*)(h+60),(int32_t*)(tp+30));//(0+1)+(2+3)w+(4+5)w^2
    poly_add_30((int32_t*)(h+60)  ,(int32_t*)(h+60),(int32_t*)(tp+150));
    poly_add_30((int32_t*)(h+120)  ,(int32_t*)(h+120),(int32_t*)(tp+60));//(0+1)+(2+3)w^2+(4+5)w
    poly_add_30((int32_t*)(h+120)  ,(int32_t*)(h+120),(int32_t*)(tp+120));


    poly_sub_30((int32_t*)(tp+0)  ,r2,r3);//2-3
    poly_sub_30((int32_t*)(tp+30) ,r2,r3);//2-3
    poly_sub_30((int32_t*)(tp+60) ,r2,r3);//2-3
    poly_sub_30((int32_t*)(tp+90)  ,r4,r5);//4-5
    poly_sub_30((int32_t*)(tp+120) ,r4,r5);//4-5
    poly_sub_30((int32_t*)(tp+150) ,r4,r5);//4-5

    poly_mult_30((int32_t*)(tp+30) ,w ,(int32_t*)(tp+30));//(2-3)w
    poly_mult_30((int32_t*)(tp+60) ,w2,(int32_t*)(tp+60));//(2-3)w^2
    poly_mult_30((int32_t*)(tp+120),w ,(int32_t*)(tp+120));//(4-5)w
    poly_mult_30((int32_t*)(tp+150),w2,(int32_t*)(tp+150));//(4-5)w^2

    poly_sub_30((int32_t*)(h+90) ,r0,r1);//0-1
    poly_sub_30((int32_t*)(h+150),r0,r1);//0-1
    poly_sub_30((int32_t*)(h+30),r0,r1);//0-1

    poly_add_30((int32_t*)(h+90)  ,(int32_t*)(h+90) ,(int32_t*)(tp+0));//(0-1)+(2-3)+(4-5)
    poly_add_30((int32_t*)(h+90)  ,(int32_t*)(h+90) ,(int32_t*)(tp+90));
    poly_add_30((int32_t*)(h+150) ,(int32_t*)(h+150),(int32_t*)(tp+30));//(0-1)+(2-3)w+(4-5)w^2
    poly_add_30((int32_t*)(h+150) ,(int32_t*)(h+150),(int32_t*)(tp+150));
    poly_add_30((int32_t*)(h+30)  ,(int32_t*)(h+30) ,(int32_t*)(tp+60));//(0-1)+(2-3)w^2+(4-5)w
    poly_add_30((int32_t*)(h+30)  ,(int32_t*)(h+30) ,(int32_t*)(tp+120));

}

void NTT_30_to_180_v2(int32_t *h, int32_t *f){
    int32_t tp[180];
    int32_t tw_c_inv[6] = {1, 5613354, -2991407, 3332372, 4016495, -919092};
    twist_mult_30((int32_t*)(tp    ),(int32_t*)(f    ),tw_c_inv[0]);
    twist_mult_30((int32_t*)(tp+30 ),(int32_t*)(f+30 ),tw_c_inv[1]);
    twist_mult_30((int32_t*)(tp+60 ),(int32_t*)(f+60 ),tw_c_inv[2]);
    twist_mult_30((int32_t*)(tp+90 ),(int32_t*)(f+90 ),tw_c_inv[3]);
    twist_mult_30((int32_t*)(tp+120),(int32_t*)(f+120),tw_c_inv[4]);
    twist_mult_30((int32_t*)(tp+150),(int32_t*)(f+150),tw_c_inv[5]);
    NTT_30_to_180(h,tp);

}


void NTT_30_to_5(int32_t *h, int32_t *f){
    int i;
    int32_t tp[30];
    int32_t w   = -402095;
    int32_t w2   = 402094;
    int32_t* r0;
    int32_t* r1;
    int32_t* r2;
    int32_t* r3;
    int32_t* r4;
    int32_t* r5;
    r0 = (int32_t*)(f+0); 
    r1 = (int32_t*)(f+5); 
    r2 = (int32_t*)(f+10); 
    r3 = (int32_t*)(f+15);
    r4 = (int32_t*)(f+20);
    r5 = (int32_t*)(f+25);

    poly_add_5((int32_t*)(tp+0)  ,r4,r1);//4+1
    poly_add_5((int32_t*)(tp+5) ,r4,r1);//4+1
    poly_add_5((int32_t*)(tp+10) ,r4,r1);//4+1
    poly_add_5((int32_t*)(tp+15)  ,r2,r5);//2+5
    poly_add_5((int32_t*)(tp+20) ,r2,r5);//2+5
    poly_add_5((int32_t*)(tp+25) ,r2,r5);//2+5

    poly_mult_5((int32_t*)(tp+5) ,w ,(int32_t*)(tp+5));//(4+1)w
    poly_mult_5((int32_t*)(tp+10) ,w2,(int32_t*)(tp+10));//(4+1)w^2
    poly_mult_5((int32_t*)(tp+20),w ,(int32_t*)(tp+20));//(2+5)w
    poly_mult_5((int32_t*)(tp+25),w2,(int32_t*)(tp+25));//(2+5)w^2

    poly_add_5((int32_t*)(h+0)  ,r0,r3);//0+3
    poly_add_5((int32_t*)(h+10)  ,r0,r3);//0+3
    poly_add_5((int32_t*)(h+20)  ,r0,r3);//0+3

    poly_add_5((int32_t*)(h+0)  ,(int32_t*)(h+0),(int32_t*)(tp+0));//(0+3)+(4+1)+(2+5)
    poly_add_5((int32_t*)(h+0)  ,(int32_t*)(h+0),(int32_t*)(tp+15));
    poly_add_5((int32_t*)(h+10)  ,(int32_t*)(h+10),(int32_t*)(tp+5));//(0+3)+(4+1)w+(2+5)w^2
    poly_add_5((int32_t*)(h+10)  ,(int32_t*)(h+10),(int32_t*)(tp+25));
    poly_add_5((int32_t*)(h+20)  ,(int32_t*)(h+20),(int32_t*)(tp+10));//(0+3)+(4+1)w^2+(2+5)w
    poly_add_5((int32_t*)(h+20)  ,(int32_t*)(h+20),(int32_t*)(tp+20));


    poly_sub_5((int32_t*)(tp+0)  ,r4,r1);//4-1
    poly_sub_5((int32_t*)(tp+5) ,r4,r1);//4-1
    poly_sub_5((int32_t*)(tp+10) ,r4,r1);//4-1
    poly_sub_5((int32_t*)(tp+15)  ,r2,r5);//2-5
    poly_sub_5((int32_t*)(tp+20) ,r2,r5);//2-5
    poly_sub_5((int32_t*)(tp+25) ,r2,r5);//2-5

    poly_mult_5((int32_t*)(tp+5) ,w ,(int32_t*)(tp+5));//(4-1)w
    poly_mult_5((int32_t*)(tp+10) ,w2,(int32_t*)(tp+10));//(4-1)w^2
    poly_mult_5((int32_t*)(tp+20),w ,(int32_t*)(tp+20));//(2-5)w
    poly_mult_5((int32_t*)(tp+25),w2,(int32_t*)(tp+25));//(2-5)w^2

    poly_sub_5((int32_t*)(h+5) ,r0,r3);//0-3
    poly_sub_5((int32_t*)(h+15),r0,r3);//0-3
    poly_sub_5((int32_t*)(h+25),r0,r3);//0-3

    poly_add_5((int32_t*)(h+5)  ,(int32_t*)(h+5) ,(int32_t*)(tp+0));//(0-3)+(4-1)+(2-5)
    poly_add_5((int32_t*)(h+5)  ,(int32_t*)(h+5) ,(int32_t*)(tp+15));
    poly_add_5((int32_t*)(h+15) ,(int32_t*)(h+15),(int32_t*)(tp+5));//(0-3)+(4-1)w+(2-5)w^2
    poly_add_5((int32_t*)(h+15) ,(int32_t*)(h+15),(int32_t*)(tp+25));
    poly_add_5((int32_t*)(h+25) ,(int32_t*)(h+25),(int32_t*)(tp+10));//(0-3)+(4-1)w^2+(2-5)w
    poly_add_5((int32_t*)(h+25) ,(int32_t*)(h+25),(int32_t*)(tp+20));

}

void NTT_30_to_5_v2(int32_t *h, int32_t *f, int part){
    int32_t tp[30];
    int32_t tw_c[6] = {1, 2173629, 4038769, 4684702, 1009527, -5314850};
    twist_mult_30(tp,f,tw_c[part]);
    NTT_30_to_5(h,tp);

}

void NTT_5_to_30(int32_t *h, int32_t *f){
    int i;
    int32_t tp[30];
    int32_t w   = -402095;
    int32_t w2   = 402094;
    int32_t* r0;
    int32_t* r1;
    int32_t* r2;
    int32_t* r3;
    int32_t* r4;
    int32_t* r5;
    r0 = (int32_t*)(f+0); 
    r1 = (int32_t*)(f+5); 
    r2 = (int32_t*)(f+10); 
    r3 = (int32_t*)(f+15);
    r4 = (int32_t*)(f+20);
    r5 = (int32_t*)(f+25);

    poly_add_5((int32_t*)(tp+0)  ,r2,r3);//2+3
    poly_add_5((int32_t*)(tp+5) ,r2,r3);//2+3
    poly_add_5((int32_t*)(tp+10) ,r2,r3);//2+3
    poly_add_5((int32_t*)(tp+15)  ,r4,r5);//4+5
    poly_add_5((int32_t*)(tp+20) ,r4,r5);//4+5
    poly_add_5((int32_t*)(tp+25) ,r4,r5);//4+5

    poly_mult_5((int32_t*)(tp+5) ,w ,(int32_t*)(tp+5));//(2+3)w
    poly_mult_5((int32_t*)(tp+10) ,w2,(int32_t*)(tp+10));//(2+3)w^2
    poly_mult_5((int32_t*)(tp+20),w ,(int32_t*)(tp+20));//(4+5)w
    poly_mult_5((int32_t*)(tp+25),w2,(int32_t*)(tp+25));//(4+5)w^2

    poly_add_5((int32_t*)(h+0)  ,r0,r1);//0+1
    poly_add_5((int32_t*)(h+10)  ,r0,r1);//0+1
    poly_add_5((int32_t*)(h+20)  ,r0,r1);//0+1

    poly_add_5((int32_t*)(h+0)  ,(int32_t*)(h+0),(int32_t*)(tp+0));//(0+1)+(2+3)+(4+5)
    poly_add_5((int32_t*)(h+0)  ,(int32_t*)(h+0),(int32_t*)(tp+15));
    poly_add_5((int32_t*)(h+10)  ,(int32_t*)(h+10),(int32_t*)(tp+5));//(0+1)+(2+3)w+(4+5)w^2
    poly_add_5((int32_t*)(h+10)  ,(int32_t*)(h+10),(int32_t*)(tp+25));
    poly_add_5((int32_t*)(h+20)  ,(int32_t*)(h+20),(int32_t*)(tp+10));//(0+1)+(2+3)w^2+(4+5)w
    poly_add_5((int32_t*)(h+20)  ,(int32_t*)(h+20),(int32_t*)(tp+20));


    poly_sub_5((int32_t*)(tp+0)  ,r2,r3);//2-3
    poly_sub_5((int32_t*)(tp+5) ,r2,r3);//2-3
    poly_sub_5((int32_t*)(tp+10) ,r2,r3);//2-3
    poly_sub_5((int32_t*)(tp+15)  ,r4,r5);//4-5
    poly_sub_5((int32_t*)(tp+20) ,r4,r5);//4-5
    poly_sub_5((int32_t*)(tp+25) ,r4,r5);//4-5

    poly_mult_5((int32_t*)(tp+5) ,w ,(int32_t*)(tp+5));//(2-3)w
    poly_mult_5((int32_t*)(tp+10) ,w2,(int32_t*)(tp+10));//(2-3)w^2
    poly_mult_5((int32_t*)(tp+20),w ,(int32_t*)(tp+20));//(4-5)w
    poly_mult_5((int32_t*)(tp+25),w2,(int32_t*)(tp+25));//(4-5)w^2

    poly_sub_5((int32_t*)(h+15) ,r0,r1);//0-1
    poly_sub_5((int32_t*)(h+25),r0,r1);//0-1
    poly_sub_5((int32_t*)(h+5),r0,r1);//0-1

    poly_add_5((int32_t*)(h+15)  ,(int32_t*)(h+15) ,(int32_t*)(tp+0));//(0-1)+(2-3)+(4-5)
    poly_add_5((int32_t*)(h+15)  ,(int32_t*)(h+15) ,(int32_t*)(tp+15));
    poly_add_5((int32_t*)(h+25) ,(int32_t*)(h+25),(int32_t*)(tp+5));//(0-1)+(2-3)w+(4-5)w^2
    poly_add_5((int32_t*)(h+25) ,(int32_t*)(h+25),(int32_t*)(tp+25));
    poly_add_5((int32_t*)(h+5)  ,(int32_t*)(h+5) ,(int32_t*)(tp+10));//(0-1)+(2-3)w^2+(4-5)w
    poly_add_5((int32_t*)(h+5)  ,(int32_t*)(h+5) ,(int32_t*)(tp+20));

}

void ref_Schoolbook_5_5(int32_t *h, int32_t *f, int32_t *c, int part){
    int i;
    int32_t tempt[5];
    int64_t accum;
    int32_t mod_c[288] ={
           1,       -1,  -402095,   402095,   402094,  -402094,  5571315, -5571315, -5628899,  5628899, 
       57584,   -57584,  3531047, -3531047,  2569778, -2569778, -6100825,  6100825,   459283,  -459283, 
    -3332372,  3332372,  2873089, -2873089,  6100255, -6100255,  6322286, -6322286,   479860,  -479860, 
     4684702, -4684702,  3685706, -3685706,  4531993, -4531993, -1936411,  1936411,   -12102,    12102, 
     1948513, -1948513,  -151914,   151914,  3893496, -3893496, -3741582,  3741582,  4645628, -4645628, 
       21318,   -21318, -4666946,  4666946,  1847617, -1847617,  2691965, -2691965, -4539582,  4539582, 
    -1185270,  1185270,  2252512, -2252512, -1067242,  1067242,  1927365, -1927365, -1113610,  1113610, 
     -813755,   813755, -4270471,  4270471,  6097259, -6097259, -1826788,  1826788,  4426244, -4426244, 
     -484839,   484839, -3941405,  3941405, -4228422,  4228422,   549914,  -549914,  3678508, -3678508, 
     3755722, -3755722,  4487455, -4487455,  4659224, -4659224,  4838574, -4838574,  -463339,   463339, 
    -4375235,  4375235, -1652087,  1652087,  2904379, -2904379, -1252292,  1252292,  5975463, -5975463, 
    -5778364,  5778364,  -197099,   197099, -1293187,  1293187,  4364064, -4364064, -3070877,  3070877, 
    -4020366,  4020366,  1440678, -1440678,  2579688, -2579688, -2436478,  2436478,  3411079, -3411079, 
     -974601,   974601, -2359734,  2359734, -5326810,  5326810, -5215857,  5215857, -5083391,  5083391, 
    -5164676,  5164676, -2654334,  2654334,  -659203,   659203, -4695859,  4695859,  5355062, -5355062, 
     2175502, -2175502, -1493692,  1493692,  -681810,   681810, -6220735,  6220735,  2469960, -2469960, 
     3750775, -3750775, -5891984,  5891984, -1565140,  1565140, -5445277,  5445277, -2174694,  2174694, 
     -839043,   839043,  3013737, -3013737, -5737958,  5737958, -3124810,  3124810, -4039633,  4039633, 
     1799899, -1799899,  3990888, -3990888, -5790787,  5790787, -6272020,  6272020,  5875237, -5875237, 
      396783,  -396783, -1232332,  1232332, -2174865,  2174865,  3407197, -3407197,  6180347, -6180347, 
     6122442, -6122442,   599612,  -599612,  2842453, -2842453, -2751252,  2751252,   -91201,    91201, 
      441177,  -441177,    45534,   -45534,  -486711,   486711, -3067572,  3067572, -1269859,  1269859, 
     4337431, -4337431, -5654189,  5654189,  1948146, -1948146,  3706043, -3706043,  5365230, -5365230, 
      899954,  -899954, -6265184,  6265184, -5993681,  5993681,  2581306, -2581306,  3412375, -3412375, 
       54688,   -54688, -4080056,  4080056,  4025368, -4025368, -5156947,  5156947,  -967948,   967948, 
     6124895, -6124895, -4622694,  4622694,  3548667, -3548667,  1074027, -1074027, -1786510,  1786510, 
     5562775, -5562775, -3776265,  3776265, -6153909,  6153909, -5131628,  5131628, -1616864,  1616864, 
     4023351, -4023351, -1770960,  1770960, -2252391,  2252391,  4462640, -4462640, -3811725,  3811725, 
     -650915,   650915,   814455,  -814455,   458957,  -458957, -1273412,  1273412
    };
    //{1, -1, -402095, 402095, 402094, -402094}
    //x^0
    tempt[0] = mod_q((int64_t)f[0]*(int64_t)c[0]);
    tempt[1] = mod_q((int64_t)f[1]*(int64_t)c[4]);
    tempt[2] = mod_q((int64_t)f[2]*(int64_t)c[3]);
    tempt[3] = mod_q((int64_t)f[3]*(int64_t)c[2]);
    tempt[4] = mod_q((int64_t)f[4]*(int64_t)c[1]);

    tempt[1] = mod_q((int64_t)tempt[1]*(int64_t)mod_c[part]);
    tempt[2] = mod_q((int64_t)tempt[2]*(int64_t)mod_c[part]);
    tempt[3] = mod_q((int64_t)tempt[3]*(int64_t)mod_c[part]);
    tempt[4] = mod_q((int64_t)tempt[4]*(int64_t)mod_c[part]);

    accum = 0;
    for(i=0; i<5; i++){
        accum += (int64_t)tempt[i];
    }
    h[0] = mod_q(accum);

    //x^1
    tempt[0] = mod_q((int64_t)f[0]*(int64_t)c[1]);
    tempt[1] = mod_q((int64_t)f[1]*(int64_t)c[0]);
    tempt[2] = mod_q((int64_t)f[2]*(int64_t)c[4]);
    tempt[3] = mod_q((int64_t)f[3]*(int64_t)c[3]);
    tempt[4] = mod_q((int64_t)f[4]*(int64_t)c[2]);

    tempt[2] = mod_q((int64_t)tempt[2]*(int64_t)mod_c[part]);
    tempt[3] = mod_q((int64_t)tempt[3]*(int64_t)mod_c[part]);
    tempt[4] = mod_q((int64_t)tempt[4]*(int64_t)mod_c[part]);
    accum = 0;
    for(i=0; i<5; i++){
        accum += (int64_t)tempt[i];
    }
    h[1] = mod_q(accum);

    //x^2
    tempt[0] = mod_q((int64_t)f[0]*(int64_t)c[2]);
    tempt[1] = mod_q((int64_t)f[1]*(int64_t)c[1]);
    tempt[2] = mod_q((int64_t)f[2]*(int64_t)c[0]);
    tempt[3] = mod_q((int64_t)f[3]*(int64_t)c[4]);
    tempt[4] = mod_q((int64_t)f[4]*(int64_t)c[3]);

    tempt[3] = mod_q((int64_t)tempt[3]*(int64_t)mod_c[part]);
    tempt[4] = mod_q((int64_t)tempt[4]*(int64_t)mod_c[part]);
    accum = 0;
    for(i=0; i<5; i++){
        accum += (int64_t)tempt[i];
    }
    h[2] = mod_q(accum);

    //x^3
    tempt[0] = mod_q((int64_t)f[0]*(int64_t)c[3]);
    tempt[1] = mod_q((int64_t)f[1]*(int64_t)c[2]);
    tempt[2] = mod_q((int64_t)f[2]*(int64_t)c[1]);
    tempt[3] = mod_q((int64_t)f[3]*(int64_t)c[0]);
    tempt[4] = mod_q((int64_t)f[4]*(int64_t)c[4]);

    tempt[4] = mod_q((int64_t)tempt[4]*(int64_t)mod_c[part]);
    accum = 0;
    for(i=0; i<5; i++){
        accum += (int64_t)tempt[i];
    }
    h[3] = mod_q(accum);

    //x^4
    tempt[0] = mod_q((int64_t)f[0]*(int64_t)c[4]);
    tempt[1] = mod_q((int64_t)f[1]*(int64_t)c[3]);
    tempt[2] = mod_q((int64_t)f[2]*(int64_t)c[2]);
    tempt[3] = mod_q((int64_t)f[3]*(int64_t)c[1]);
    tempt[4] = mod_q((int64_t)f[4]*(int64_t)c[0]);
    accum = 0;
    for(i=0; i<5; i++){
        accum += (int64_t)tempt[i];
    }
    h[4] = mod_q(accum);

    //h[0] = mod_q(1024*1024*5);

}

void last_refinement(int16_t *h, int32_t *f){
    int i;
    int32_t tp[1440];
    //int32_t c = -1612800; //(1/8)
    //int32_t c = -268800; //1/(8*6)
    //int32_t c = -44800;//1/(6*6*8)
    //int32_t c = 3444280;//2^32/(6*6*8) (2^32 is from school mul 5*5)
    //poly_mult_1440(tp,c,f);
    for(i=0; i<677; ++i){
        //tp[i]+=tp[i+677];
        //if(i<676) tp[i] += tp[i+677];
        if(i==676) tp[i] = f[i];
        else tp[i] = f[i] + f[i+677];
        tp[i] = mod_q((int64_t)tp[i]);
        h[i] = mod_2048(tp[i]);
    }
}

void ref_poly_Rq_mul(int16_t*h , int16_t* f, int16_t* c){
    int i,j;
    int16_t P1[1440];
    int16_t P2[1440];
    int32_t tp1_a[1440],tp1_b[1440],tp2_a[1440],tp2_b[1440];
    for(i=0; i<677; ++i){
        P1[i] = f[i];
        P2[i] = c[i];
    }
    for(i=677; i<1440; ++i){
        P1[i] = 0;
        P2[i] = 0;
    }
    NTT_1440_to_180(tp1_a,P1);
    NTT_1440_to_180(tp2_a,P2);
    for(i=0; i<8; ++i){
        NTT_180_to_30_v2((int32_t*)(tp1_b+i*180),(int32_t*)(tp1_a+i*180),i);
        NTT_180_to_30_v2((int32_t*)(tp2_b+i*180),(int32_t*)(tp2_a+i*180),i);
    }
    for(i=0; i<8; ++i){
        for(j=0; j<6; ++j){
            NTT_30_to_5_v2((int32_t*)(tp1_a+i*180+j*30),(int32_t*)(tp1_b+i*180+j*30),j);
            NTT_30_to_5_v2((int32_t*)(tp2_a+i*180+j*30),(int32_t*)(tp2_b+i*180+j*30),j);
        }
    }
    for(i=0; i<8*6*6; ++i){
        ref_Schoolbook_5_5((int32_t*)(tp1_b+i*5),(int32_t*)(tp1_a+i*5),(int32_t*)(tp2_a+i*5),i%6);
    }

    for(i=0; i<8*6; ++i){
        NTT_5_to_30((int32_t*)(tp1_a+i*30),(int32_t*)(tp1_b+i*30));
    }
    for(i=0; i<8; ++i){
        NTT_30_to_180_v2((int32_t*)(tp1_b+i*180),(int32_t*)(tp1_a+i*180));
    }
    NTT_180_to_1440_v2(tp1_a,tp1_b);
    last_refinement(h,tp1_a);
    /*for(i=0;i<677;++i){
        //h[i] = (int16_t)tp1_b[i];
        h[i] = tp1_b[i];
    }*/
}

void ans_poly_Rq_mul(int16_t *r, int16_t *a, int16_t *b)
{
  int k,i;

  for(k=0; k<677; k++)
  {
    r[k] = 0;
    for(i=1; i<677-k; i++)
      r[k] += a[k+i] * b[677-i];
    for(i=0; i<k+1; i++)
      r[k] += a[k-i] * b[i];
  }
}

void your_poly_Rq_mul(int16_t*h , int16_t* f, int16_t* c){
    int i,j;
    //int16_t P1[1440];
    //int16_t P2[1440];
    int32_t tp1_a[1440],tp1_b[1440],tp2_a[1440],tp2_b[1440];
    /*for(i=0; i<677; ++i){
        P1[i] = f[i];
        P2[i] = c[i];
    }
    for(i=677; i<720; ++i){
        P1[i] = 0;
        P2[i] = 0;
    }*/
    

    /*NTT_forward_180to30_part_0((int32_t*)(tp1_a+0*180),(int32_t*)(tp1_b+0*180));
    NTT_forward_180to30_part_1((int32_t*)(tp1_a+1*180),(int32_t*)(tp1_b+1*180));
    NTT_forward_180to30_part_2((int32_t*)(tp1_a+2*180),(int32_t*)(tp1_b+2*180));
    NTT_forward_180to30_part_3((int32_t*)(tp1_a+3*180),(int32_t*)(tp1_b+3*180));
    NTT_forward_180to30_part_4((int32_t*)(tp1_a+4*180),(int32_t*)(tp1_b+4*180));
    NTT_forward_180to30_part_5((int32_t*)(tp1_a+5*180),(int32_t*)(tp1_b+5*180));
    NTT_forward_180to30_part_6((int32_t*)(tp1_a+6*180),(int32_t*)(tp1_b+6*180));
    NTT_forward_180to30_part_7((int32_t*)(tp1_a+7*180),(int32_t*)(tp1_b+7*180));*/
    

    /*NTT_forward_180to30_part_0((int32_t*)(tp2_a+0*180),(int32_t*)(tp2_b+0*180));
    NTT_forward_180to30_part_1((int32_t*)(tp2_a+1*180),(int32_t*)(tp2_b+1*180));
    NTT_forward_180to30_part_2((int32_t*)(tp2_a+2*180),(int32_t*)(tp2_b+2*180));
    NTT_forward_180to30_part_3((int32_t*)(tp2_a+3*180),(int32_t*)(tp2_b+3*180));
    NTT_forward_180to30_part_4((int32_t*)(tp2_a+4*180),(int32_t*)(tp2_b+4*180));
    NTT_forward_180to30_part_5((int32_t*)(tp2_a+5*180),(int32_t*)(tp2_b+5*180));
    NTT_forward_180to30_part_6((int32_t*)(tp2_a+6*180),(int32_t*)(tp2_b+6*180));
    NTT_forward_180to30_part_7((int32_t*)(tp2_a+7*180),(int32_t*)(tp2_b+7*180));*/


    

    /*for(i=0; i<8; ++i){
        NTT_forward_30to5_part_0((int32_t*)(tp1_b+i*180+0*30),(int32_t*)(tp1_a+i*180+0*30));
        NTT_forward_30to5_part_1((int32_t*)(tp1_b+i*180+1*30),(int32_t*)(tp1_a+i*180+1*30));
        NTT_forward_30to5_part_2((int32_t*)(tp1_b+i*180+2*30),(int32_t*)(tp1_a+i*180+2*30));
        NTT_forward_30to5_part_3((int32_t*)(tp1_b+i*180+3*30),(int32_t*)(tp1_a+i*180+3*30));
        NTT_forward_30to5_part_4((int32_t*)(tp1_b+i*180+4*30),(int32_t*)(tp1_a+i*180+4*30));
        NTT_forward_30to5_part_5((int32_t*)(tp1_b+i*180+5*30),(int32_t*)(tp1_a+i*180+5*30));

        NTT_forward_30to5_part_0((int32_t*)(tp2_b+i*180+0*30),(int32_t*)(tp2_a+i*180+0*30));
        NTT_forward_30to5_part_1((int32_t*)(tp2_b+i*180+1*30),(int32_t*)(tp2_a+i*180+1*30));
        NTT_forward_30to5_part_2((int32_t*)(tp2_b+i*180+2*30),(int32_t*)(tp2_a+i*180+2*30));
        NTT_forward_30to5_part_3((int32_t*)(tp2_b+i*180+3*30),(int32_t*)(tp2_a+i*180+3*30));
        NTT_forward_30to5_part_4((int32_t*)(tp2_b+i*180+4*30),(int32_t*)(tp2_a+i*180+4*30));
        NTT_forward_30to5_part_5((int32_t*)(tp2_b+i*180+5*30),(int32_t*)(tp2_a+i*180+5*30));
    }*/

    /*for(i=0; i<8*6; ++i){
        NTT_backward_30to5((int32_t*)(tp1_b+i*30),(int32_t*)(tp1_a+i*30));
    }*/

    /*for(i=0; i<8; ++i){
        NTT_backward_180to30_part_all((int32_t*)(tp1_a+i*180),(int32_t*)(tp1_b+i*180));
    }*/
    /*for(i=0; i<1440; ++i){
        tp1_b[i] = (i+1)%360;
        //tp1_b[i] = ;
    }*/

    /*for(i=0; i<1440; ++i){
        tp1_a[i] = mod_q(tp1_a[i]);
        //tp1_b[i] = ;
    }*/
    /*for(i=0; i<8*6*6; ++i){
        ref_Schoolbook_5_5((int32_t*)(tp1_b+i*5),(int32_t*)(tp1_a+i*5),(int32_t*)(tp2_a+i*5),i);
    }*/
    NTT_forward_1440to180(f,tp1_a);
    NTT_forward_1440to180(c,tp2_a);
    NTT_forward_180to30(tp1_a,tp1_b);
    NTT_forward_180to30(tp2_a,tp2_b);
    NTT_forward_30to5(tp1_b,tp1_a);
    NTT_forward_30to5(tp2_b,tp2_a);
    school_mul(tp1_a,tp2_a,tp1_b);
    NTT_backward_30to5(tp1_b,tp1_a);
    NTT_backward_180to30(tp1_a,tp1_b);
    NTT_backward_1440to180(tp1_b,tp1_a);
    last_mod677_2048(tp1_a,h);
    //last_refinement(h,tp1_a);
    /*for(i=0; i<677; ++i){
        h[i] = (int16_t)(tp2_a[i]);
    }*/
}

