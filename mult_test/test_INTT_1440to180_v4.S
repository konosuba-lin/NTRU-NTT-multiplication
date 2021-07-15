.p2align 2,,3
.syntax unified
.text

.macro montgomery_mul a, b, lower, upper, tmp, Mprime, M
      smull.w \lower, \upper, \a, \b
      mul.w \tmp, \lower, \Mprime
      smlal.w \lower, \upper, \tmp, \M
.endm

.global NTT_backward_1440to180
.type NTT_backward_1440to180, %function
@ void NTT_backward_1440to180(int32_t *input, int32_t* output)
NTT_backward_1440to180:
      push.w {r1-r12, lr}
      movw.w r11, #0xe001
      movt.w r11, #0x00c4
      movw.w lr, #0xdfff
      movt.w lr, #0x3cc4
      movw.w r8, #0x94d8
      movt.w r8, #0x0018
      vmov.w s1, r8
      movw.w r8, #0xa287
      movt.w r8, #0x006d
      movw.w r7, #0xd196
      movt.w r7, #0x0022
      add.w  r9, r0 ,548
      vmov.w s3, r9
      add.w  r9, r0 ,720
      vmov.w s4, r9
L1:
      add.w r0, r0, #2880 
      ldr.w r12, [r0, #0]
      ldr.w r2, [r0, #720]
      ldr.w r3, [r0, #1440]
      ldr.w r4, [r0, #2160]
      subs.w r0, r0, #2880 
      add.w r12, r12, r2
      subs.w r2, r12, r2, lsl #1
      montgomery_mul r2, r7, r9, r2, r10, lr, r11
      add.w r3, r3, r4
      subs.w r4, r3, r4, lsl #1
      vmov.w r9, s1
      montgomery_mul r4, r9, r9, r4, r10, lr, r11
      add.w r12, r12, r3
      subs.w r3, r12, r3, lsl #1
      montgomery_mul r3, r8, r9, r3, r10, lr, r11
      add.w r2, r2, r4
      subs.w r4, r2, r4, lsl #1
      montgomery_mul r4, r8, r9, r4, r10, lr, r11
      ldr.w r5, [r0, #1440]
      ldr.w r6, [r0, #2160]
      add.w r5, r5, r6
      subs.w r6, r5, r6, lsl #1
      montgomery_mul r6, r8, r9, r6, r10, lr, r11
      ldr.w r9, [r0, #0]
      ldr.w r10, [r0, #720]
      add.w r0, r0, #4 
      add.w r9, r9, r10
      subs.w r10, r9, r10, lsl #1
      add.w r9, r9, r5
      subs.w r5, r9, r5, lsl #1
      add.w r10, r10, r6
      subs.w r6, r10, r6, lsl #1
      add.w r9, r9, r12
      add.w r10, r10, r2
      add.w r5, r5, r3
      add.w r6, r6, r4
      str.w r9, [r1, #0]
      str.w r10, [r1, #720]
      str.w r5, [r1, #1440]
      str.w r6, [r1, #2160]
      add.w r1, r1, #2880 
      subs.w r9, r9, r12, lsl #1
      subs.w r10, r10, r2, lsl #1
      subs.w r5, r5, r3, lsl #1
      subs.w r6, r6, r4, lsl #1
      str.w r9, [r1, #0]
      str.w r10, [r1, #720]
      str.w r5, [r1, #1440]
      str.w r6, [r1, #2160]
      sub.w r1, r1, #2876 
      vmov.w r9, s3
      cmp.w  r0, r9
      blt L1

L2:
      add.w r0, r0, #2880 
      ldr.w r12, [r0, #0]
      ldr.w r2, [r0, #720]
      ldr.w r3, [r0, #1440]
      ldr.w r4, [r0, #2160]
      subs.w r0, r0, #2880 
      add.w r12, r12, r2
      subs.w r2, r12, r2, lsl #1
      montgomery_mul r2, r7, r9, r2, r10, lr, r11
      add.w r3, r3, r4
      subs.w r4, r3, r4, lsl #1
      vmov.w r9, s1
      montgomery_mul r4, r9, r9, r4, r10, lr, r11
      add.w r12, r12, r3
      subs.w r3, r12, r3, lsl #1
      montgomery_mul r3, r8, r9, r3, r10, lr, r11
      add.w r2, r2, r4
      ldr.w r5, [r0, #1440]
      ldr.w r6, [r0, #2160]
      add.w r5, r5, r6
      subs.w r6, r5, r6, lsl #1
      montgomery_mul r6, r8, r9, r6, r10, lr, r11
      ldr.w r9, [r0, #0]
      ldr.w r10, [r0, #720]
      add.w r0, r0, #4 
      add.w r9, r9, r10
      subs.w r10, r9, r10, lsl #1
      add.w r9, r9, r5
      subs.w r5, r9, r5, lsl #1
      add.w r10, r10, r6
      subs.w r6, r10, r6, lsl #1
      add.w r9, r9, r12
      add.w r10, r10, r2
      add.w r5, r5, r3
      add.w r6, r6, r6
      str.w r9, [r1, #0]
      str.w r10, [r1, #720]
      str.w r5, [r1, #1440]
      str.w r6, [r1, #2160]
      add.w r1, r1, #2880 
      subs.w r9, r9, r12, lsl #1
      subs.w r10, r10, r2, lsl #1
      subs.w r5, r5, r3, lsl #1
      str.w r9, [r1, #0]
      str.w r10, [r1, #720]
      str.w r5, [r1, #1440]
      sub.w r1, r1, #2876 
      vmov.w r9, s4
      cmp.w  r0, r9
      blt L2
      pop.w {r1-r12, pc}