.syntax unified
.text

.macro montgomery_mul a, b, lower, upper, tmp, Mprime, M
      smull.w \lower, \upper, \a, \b
      mul.w \tmp, \lower, \Mprime
      smlal.w \lower, \upper, \tmp, \M
.endm

.global NTT_forward_1440to180
.type NTT_forward_1440to180, %function
@ void NTT_forward_1440to180(int16_t *input, int32_t* output)
NTT_forward_1440to180:
      push.w {r1-r12, lr}
      movw.w r11, #0xe001
      movt.w r11, #0x00c4
      movw.w lr, #0xdfff
      movt.w lr, #0x3cc4
      movw.w r8, #0x1f10
      movt.w r8, #0xffff
      movw.w r9, #0x4b29
      movt.w r9, #0x00ac
      vmov.w s1, r9
      movw.w r9, #0x0e6b
      movt.w r9, #0x00a2
      vmov.w s2, r9
      add.w  r9, r0 ,274
      vmov.w s3, r9
      add.w  r9, r0 ,360
      vmov.w s4, r9
L1:
      ldrsh.w r2, [r0, #0]
      ldrsh.w r3, [r0, #360]
      ldrsh.w r4, [r0, #720]
      ldrsh.w r5, [r0, #1080]
      add.w r0, r0, #2 
      add.w r6, r2, r4
      add.w r7, r3, r5
      add.w r9, r6, r7
      subs.w r10, r6, r7
      str.w r9, [r1, #0]
      str.w r10, [r1, #720]
      subs.w r6, r2, r4
      subs.w r7, r3, r5
      mul.w r7, r7, r8
      add.w r9, r6, r7
      subs.w r10, r6, r7
      str.w r9, [r1, #1440]
      str.w r10, [r1, #2160]
      add.w r1, r1, #2880 
      mul.w r4, r4, r8
      mul.w r5, r5, r8
      add.w r2, r2, r4
      subs.w r4, r2, r4, lsl #1
      add.w r3, r3, r5
      subs.w r5, r3, r5, lsl #1
      vmov.w r9, s1
      montgomery_mul r3, r9, r9, r3, r10, lr, r11
      add.w r2, r2, r3
      subs.w r3, r2, r3, lsl #1
      vmov.w r9, s2
      montgomery_mul r5, r9, r9, r5, r10, lr, r11
      add.w r4, r4, r5
      subs.w r5, r4, r5, lsl #1
      str.w r2, [r1, #0]
      str.w r3, [r1, #720]
      str.w r4, [r1, #1440]
      str.w r5, [r1, #2160]
      sub.w r1, r1, #2876 
      vmov.w r9, s3
      cmp.w  r0, r9
      blt L1

L2:
      ldrsh.w r2, [r0, #0]
      ldrsh.w r3, [r0, #360]
      ldrsh.w r4, [r0, #720]
      add.w r0, r0, #2 
      add.w r6, r2, r4
      add.w r9, r6, r3
      subs.w r10, r6, r3
      str.w r9, [r1, #0]
      str.w r10, [r1, #720]
      subs.w r6, r2, r4
      mul.w r7, r3, r8
      add.w r9, r6, r7
      subs.w r10, r6, r7
      str.w r9, [r1, #1440]
      str.w r10, [r1, #2160]
      add.w r1, r1, #2880 
      mul.w r4, r4, r8
      add.w r2, r2, r4
      subs.w r4, r2, r4, lsl #1
      mov.w r5, r3
      vmov.w r9, s1
      montgomery_mul r3, r9, r9, r3, r10, lr, r11
      vmov.w r9, s2
      montgomery_mul r5, r9, r9, r5, r10, lr, r11
      add.w r2, r2, r3
      subs.w r3, r2, r3, lsl #1
      add.w r4, r4, r5
      subs.w r5, r4, r5, lsl #1
      str.w r2, [r1, #0]
      str.w r3, [r1, #720]
      str.w r4, [r1, #1440]
      str.w r5, [r1, #2160]
      sub.w r1, r1, #2876 
      vmov.w r9, s4
      cmp.w  r0, r9
      blt L2
      pop.w {r1-r12, pc}