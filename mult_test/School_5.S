.p2align 2,,3
.syntax unified
.text

.macro montgomery_mul a, b, lower, upper, tmp, Mprime, M
      smull.w \lower, \upper, \a, \b
      mul.w \tmp, \lower, \Mprime
      smlal.w \lower, \upper, \tmp, \M
.endm

.global school_mul
.type school_mul, %function
@ void school_mul(int32_t *input1, int32_t *input2, int32_t* output)
school_mul:
      push.w {r1-r12, lr}
      movw.w r11, #0xe001
      movt.w r11, #0x00c4
      movw.w lr, #0xdfff
      movt.w lr, #0x3cc4
      vmov.w s0, r0
      vmov.w s1, r1
      vmov.w s2, r2
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      vmov.w r10, s3
      smlal.w r0, r1,r2, r10
      smlal.w r0, r1,r3, r9
      smlal.w r0, r1,r4, r8
      smlal.w r0, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s8, r1
      vmov.w r10, s3
      smull.w r0, r1,r2, r12
      smlal.w r0, r1,r3, r10
      smlal.w r0, r1,r4, r9
      smlal.w r0, r1,r5, r8
      smlal.w r0, r1,r6, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r8, s8
      vmov.w r2, s2
      str.w r5, [r2, #0]
      str.w r6, [r2, #4]
      str.w r7, [r2, #8]
      str.w r8, [r2, #12]
      str.w r1, [r2, #16]
      movw.w r10, #0x614d
      movt.w r10, #0x0017
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #20 
      add.w r1, r1, #20 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #20]
      str.w r6, [r2, #24]
      str.w r7, [r2, #28]
      str.w r1, [r2, #32]
      str.w r12, [r2, #36]
      movw.w r10, #0xe31c
      movt.w r10, #0x0022
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #40 
      add.w r1, r1, #40 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #40]
      str.w r6, [r2, #44]
      str.w r7, [r2, #48]
      str.w r1, [r2, #52]
      str.w r12, [r2, #56]
      movw.w r10, #0xfce5
      movt.w r10, #0x00a1
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #60 
      add.w r1, r1, #60 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #60]
      str.w r6, [r2, #64]
      str.w r7, [r2, #68]
      str.w r1, [r2, #72]
      str.w r12, [r2, #76]
      movw.w r10, #0x5e32
      movt.w r10, #0x00b9
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #80 
      add.w r1, r1, #80 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #80]
      str.w r6, [r2, #84]
      str.w r7, [r2, #88]
      str.w r1, [r2, #92]
      str.w r12, [r2, #96]
      movw.w r10, #0x81cf
      movt.w r10, #0x000b
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #100 
      add.w r1, r1, #100 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #100]
      str.w r6, [r2, #104]
      str.w r7, [r2, #108]
      str.w r1, [r2, #112]
      str.w r12, [r2, #116]
      movw.w r10, #0xc264
      movt.w r10, #0x001c
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #120 
      add.w r1, r1, #120 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #120]
      str.w r6, [r2, #124]
      str.w r7, [r2, #128]
      str.w r1, [r2, #132]
      str.w r12, [r2, #136]
      movw.w r10, #0x1d9d
      movt.w r10, #0x00a8
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #140 
      add.w r1, r1, #140 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #140]
      str.w r6, [r2, #144]
      str.w r7, [r2, #148]
      str.w r1, [r2, #152]
      str.w r12, [r2, #156]
      movw.w r10, #0x7b16
      movt.w r10, #0x003a
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #160 
      add.w r1, r1, #160 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #160]
      str.w r6, [r2, #164]
      str.w r7, [r2, #168]
      str.w r1, [r2, #172]
      str.w r12, [r2, #176]
      movw.w r10, #0x64eb
      movt.w r10, #0x008a
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #180 
      add.w r1, r1, #180 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #180]
      str.w r6, [r2, #184]
      str.w r7, [r2, #188]
      str.w r1, [r2, #192]
      str.w r12, [r2, #196]
      movw.w r10, #0xa287
      movt.w r10, #0x006d
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #200 
      add.w r1, r1, #200 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #200]
      str.w r6, [r2, #204]
      str.w r7, [r2, #208]
      str.w r1, [r2, #212]
      str.w r12, [r2, #216]
      movw.w r10, #0x3d7a
      movt.w r10, #0x0057
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #220 
      add.w r1, r1, #220 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #220]
      str.w r6, [r2, #224]
      str.w r7, [r2, #228]
      str.w r1, [r2, #232]
      str.w r12, [r2, #236]
      movw.w r10, #0x464a
      movt.w r10, #0x0019
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #240 
      add.w r1, r1, #240 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #240]
      str.w r6, [r2, #244]
      str.w r7, [r2, #248]
      str.w r1, [r2, #252]
      str.w r12, [r2, #256]
      movw.w r10, #0x99b7
      movt.w r10, #0x00ab
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #260 
      add.w r1, r1, #260 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #260]
      str.w r6, [r2, #264]
      str.w r7, [r2, #268]
      str.w r1, [r2, #272]
      str.w r12, [r2, #276]
      movw.w r10, #0x490f
      movt.w r10, #0x006c
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #280 
      add.w r1, r1, #280 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #280]
      str.w r6, [r2, #284]
      str.w r7, [r2, #288]
      str.w r1, [r2, #292]
      str.w r12, [r2, #296]
      movw.w r10, #0x96f2
      movt.w r10, #0x0058
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #300 
      add.w r1, r1, #300 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #300]
      str.w r6, [r2, #304]
      str.w r7, [r2, #308]
      str.w r1, [r2, #312]
      str.w r12, [r2, #316]
      movw.w r10, #0x50a8
      movt.w r10, #0x003f
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #320 
      add.w r1, r1, #320 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #320]
      str.w r6, [r2, #324]
      str.w r7, [r2, #328]
      str.w r1, [r2, #332]
      str.w r12, [r2, #336]
      movw.w r10, #0x8f59
      movt.w r10, #0x0085
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #340 
      add.w r1, r1, #340 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #340]
      str.w r6, [r2, #344]
      str.w r7, [r2, #348]
      str.w r1, [r2, #352]
      str.w r12, [r2, #356]
      movw.w r10, #0x2258
      movt.w r10, #0x0050
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #360 
      add.w r1, r1, #360 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #360]
      str.w r6, [r2, #364]
      str.w r7, [r2, #368]
      str.w r1, [r2, #372]
      str.w r12, [r2, #376]
      movw.w r10, #0xbda9
      movt.w r10, #0x0074
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #380 
      add.w r1, r1, #380 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #380]
      str.w r6, [r2, #384]
      str.w r7, [r2, #388]
      str.w r1, [r2, #392]
      str.w r12, [r2, #396]
      movw.w r10, #0x3529
      movt.w r10, #0x0006
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #400 
      add.w r1, r1, #400 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #400]
      str.w r6, [r2, #404]
      str.w r7, [r2, #408]
      str.w r1, [r2, #412]
      str.w r12, [r2, #416]
      movw.w r10, #0xaad8
      movt.w r10, #0x00be
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #420 
      add.w r1, r1, #420 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #420]
      str.w r6, [r2, #424]
      str.w r7, [r2, #428]
      str.w r1, [r2, #432]
      str.w r12, [r2, #436]
      movw.w r10, #0x8880
      movt.w r10, #0x006e
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #440 
      add.w r1, r1, #440 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #440]
      str.w r6, [r2, #444]
      str.w r7, [r2, #448]
      str.w r1, [r2, #452]
      str.w r12, [r2, #456]
      movw.w r10, #0x5781
      movt.w r10, #0x0056
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #460 
      add.w r1, r1, #460 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #460]
      str.w r6, [r2, #464]
      str.w r7, [r2, #468]
      str.w r1, [r2, #472]
      str.w r12, [r2, #476]
      movw.w r10, #0xb487
      movt.w r10, #0x0048
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #480 
      add.w r1, r1, #480 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #480]
      str.w r6, [r2, #484]
      str.w r7, [r2, #488]
      str.w r1, [r2, #492]
      str.w r12, [r2, #496]
      movw.w r10, #0x2b7a
      movt.w r10, #0x007c
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #500 
      add.w r1, r1, #500 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #500]
      str.w r6, [r2, #504]
      str.w r7, [r2, #508]
      str.w r1, [r2, #512]
      str.w r12, [r2, #516]
      movw.w r10, #0x4dc4
      movt.w r10, #0x00aa
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #520 
      add.w r1, r1, #520 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #520]
      str.w r6, [r2, #524]
      str.w r7, [r2, #528]
      str.w r1, [r2, #532]
      str.w r12, [r2, #536]
      movw.w r10, #0x923d
      movt.w r10, #0x001a
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #540 
      add.w r1, r1, #540 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #540]
      str.w r6, [r2, #544]
      str.w r7, [r2, #548]
      str.w r1, [r2, #552]
      str.w r12, [r2, #556]
      movw.w r10, #0xbdb7
      movt.w r10, #0x0096
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #560 
      add.w r1, r1, #560 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #560]
      str.w r6, [r2, #564]
      str.w r7, [r2, #568]
      str.w r1, [r2, #572]
      str.w r12, [r2, #576]
      movw.w r10, #0x224a
      movt.w r10, #0x002e
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #580 
      add.w r1, r1, #580 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #580]
      str.w r6, [r2, #584]
      str.w r7, [r2, #588]
      str.w r1, [r2, #592]
      str.w r12, [r2, #596]
      movw.w r10, #0x50ab
      movt.w r10, #0x008e
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #600 
      add.w r1, r1, #600 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #600]
      str.w r6, [r2, #604]
      str.w r7, [r2, #608]
      str.w r1, [r2, #612]
      str.w r12, [r2, #616]
      movw.w r10, #0x8f56
      movt.w r10, #0x0036
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #620 
      add.w r1, r1, #620 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #620]
      str.w r6, [r2, #624]
      str.w r7, [r2, #628]
      str.w r1, [r2, #632]
      str.w r12, [r2, #636]
      movw.w r10, #0xb482
      movt.w r10, #0x0058
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #640 
      add.w r1, r1, #640 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #640]
      str.w r6, [r2, #644]
      str.w r7, [r2, #648]
      str.w r1, [r2, #652]
      str.w r12, [r2, #656]
      movw.w r10, #0x2b7f
      movt.w r10, #0x006c
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #660 
      add.w r1, r1, #660 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #660]
      str.w r6, [r2, #664]
      str.w r7, [r2, #668]
      str.w r1, [r2, #672]
      str.w r12, [r2, #676]
      movw.w r10, #0xbad5
      movt.w r10, #0x00a2
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #680 
      add.w r1, r1, #680 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #680]
      str.w r6, [r2, #684]
      str.w r7, [r2, #688]
      str.w r1, [r2, #692]
      str.w r12, [r2, #696]
      movw.w r10, #0x252c
      movt.w r10, #0x0022
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #700 
      add.w r1, r1, #700 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #700]
      str.w r6, [r2, #704]
      str.w r7, [r2, #708]
      str.w r1, [r2, #712]
      str.w r12, [r2, #716]
      movw.w r10, #0xdcd7
      movt.w r10, #0x0043
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #720 
      add.w r1, r1, #720 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #720]
      str.w r6, [r2, #724]
      str.w r7, [r2, #728]
      str.w r1, [r2, #732]
      str.w r12, [r2, #736]
      movw.w r10, #0x032a
      movt.w r10, #0x0081
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #740 
      add.w r1, r1, #740 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #740]
      str.w r6, [r2, #744]
      str.w r7, [r2, #748]
      str.w r1, [r2, #752]
      str.w r12, [r2, #756]
      movw.w r10, #0x5871
      movt.w r10, #0x0024
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #760 
      add.w r1, r1, #760 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #760]
      str.w r6, [r2, #764]
      str.w r7, [r2, #768]
      str.w r1, [r2, #772]
      str.w r12, [r2, #776]
      movw.w r10, #0x8790
      movt.w r10, #0x00a0
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #780 
      add.w r1, r1, #780 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #780]
      str.w r6, [r2, #784]
      str.w r7, [r2, #788]
      str.w r1, [r2, #792]
      str.w r12, [r2, #796]
      movw.w r10, #0xaab9
      movt.w r10, #0x005c
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #800 
      add.w r1, r1, #800 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #800]
      str.w r6, [r2, #804]
      str.w r7, [r2, #808]
      str.w r1, [r2, #812]
      str.w r12, [r2, #816]
      movw.w r10, #0x3548
      movt.w r10, #0x0068
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #820 
      add.w r1, r1, #820 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #820]
      str.w r6, [r2, #824]
      str.w r7, [r2, #828]
      str.w r1, [r2, #832]
      str.w r12, [r2, #836]
      movw.w r10, #0x606a
      movt.w r10, #0x0088
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #840 
      add.w r1, r1, #840 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #840]
      str.w r6, [r2, #844]
      str.w r7, [r2, #848]
      str.w r1, [r2, #852]
      str.w r12, [r2, #856]
      movw.w r10, #0x7f97
      movt.w r10, #0x003c
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #860 
      add.w r1, r1, #860 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #860]
      str.w r6, [r2, #864]
      str.w r7, [r2, #868]
      str.w r1, [r2, #872]
      str.w r12, [r2, #876]
      movw.w r10, #0x8390
      movt.w r10, #0x001d
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #880 
      add.w r1, r1, #880 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #880]
      str.w r6, [r2, #884]
      str.w r7, [r2, #888]
      str.w r1, [r2, #892]
      str.w r12, [r2, #896]
      movw.w r10, #0x5c71
      movt.w r10, #0x00a7
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #900 
      add.w r1, r1, #900 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #900]
      str.w r6, [r2, #904]
      str.w r7, [r2, #908]
      str.w r1, [r2, #912]
      str.w r12, [r2, #916]
      movw.w r10, #0xfc07
      movt.w r10, #0x001e
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #920 
      add.w r1, r1, #920 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #920]
      str.w r6, [r2, #924]
      str.w r7, [r2, #928]
      str.w r1, [r2, #932]
      str.w r12, [r2, #936]
      movw.w r10, #0xe3fa
      movt.w r10, #0x00a5
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #940 
      add.w r1, r1, #940 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #940]
      str.w r6, [r2, #944]
      str.w r7, [r2, #948]
      str.w r1, [r2, #952]
      str.w r12, [r2, #956]
      movw.w r10, #0x8945
      movt.w r10, #0x00c3
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #960 
      add.w r1, r1, #960 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #960]
      str.w r6, [r2, #964]
      str.w r7, [r2, #968]
      str.w r1, [r2, #972]
      str.w r12, [r2, #976]
      movw.w r10, #0x56bc
      movt.w r10, #0x0001
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #980 
      add.w r1, r1, #980 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #980]
      str.w r6, [r2, #984]
      str.w r7, [r2, #988]
      str.w r1, [r2, #992]
      str.w r12, [r2, #996]
      movw.w r10, #0xf7d6
      movt.w r10, #0x0046
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1000 
      add.w r1, r1, #1000 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1000]
      str.w r6, [r2, #1004]
      str.w r7, [r2, #1008]
      str.w r1, [r2, #1012]
      str.w r12, [r2, #1016]
      movw.w r10, #0xe82b
      movt.w r10, #0x007d
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1020 
      add.w r1, r1, #1020 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1020]
      str.w r6, [r2, #1024]
      str.w r7, [r2, #1028]
      str.w r1, [r2, #1032]
      str.w r12, [r2, #1036]
      movw.w r10, #0x3ee7
      movt.w r10, #0x007f
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1040 
      add.w r1, r1, #1040 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1040]
      str.w r6, [r2, #1044]
      str.w r7, [r2, #1048]
      str.w r1, [r2, #1052]
      str.w r12, [r2, #1056]
      movw.w r10, #0xa11a
      movt.w r10, #0x0045
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1060 
      add.w r1, r1, #1060 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1060]
      str.w r6, [r2, #1064]
      str.w r7, [r2, #1068]
      str.w r1, [r2, #1072]
      str.w r12, [r2, #1076]
      movw.w r10, #0xe78b
      movt.w r10, #0x005c
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1080 
      add.w r1, r1, #1080 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1080]
      str.w r6, [r2, #1084]
      str.w r7, [r2, #1088]
      str.w r1, [r2, #1092]
      str.w r12, [r2, #1096]
      movw.w r10, #0xf876
      movt.w r10, #0x0067
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1100 
      add.w r1, r1, #1100 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1100]
      str.w r6, [r2, #1104]
      str.w r7, [r2, #1108]
      str.w r1, [r2, #1112]
      str.w r12, [r2, #1116]
      movw.w r10, #0xc72e
      movt.w r10, #0x0016
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1120 
      add.w r1, r1, #1120 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1120]
      str.w r6, [r2, #1124]
      str.w r7, [r2, #1128]
      str.w r1, [r2, #1132]
      str.w r12, [r2, #1136]
      movw.w r10, #0x18d3
      movt.w r10, #0x00ae
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1140 
      add.w r1, r1, #1140 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1140]
      str.w r6, [r2, #1144]
      str.w r7, [r2, #1148]
      str.w r1, [r2, #1152]
      str.w r12, [r2, #1156]
      movw.w r10, #0x3148
      movt.w r10, #0x0051
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1160 
      add.w r1, r1, #1160 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1160]
      str.w r6, [r2, #1164]
      str.w r7, [r2, #1168]
      str.w r1, [r2, #1172]
      str.w r12, [r2, #1176]
      movw.w r10, #0xaeb9
      movt.w r10, #0x0073
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1180 
      add.w r1, r1, #1180 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1180]
      str.w r6, [r2, #1184]
      str.w r7, [r2, #1188]
      str.w r1, [r2, #1192]
      str.w r12, [r2, #1196]
      movw.w r10, #0x4b29
      movt.w r10, #0x00ac
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1200 
      add.w r1, r1, #1200 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1200]
      str.w r6, [r2, #1204]
      str.w r7, [r2, #1208]
      str.w r1, [r2, #1212]
      str.w r12, [r2, #1216]
      movw.w r10, #0x94d8
      movt.w r10, #0x0018
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1220 
      add.w r1, r1, #1220 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1220]
      str.w r6, [r2, #1224]
      str.w r7, [r2, #1228]
      str.w r1, [r2, #1232]
      str.w r12, [r2, #1236]
      movw.w r10, #0x2b8c
      movt.w r10, #0x0099
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1240 
      add.w r1, r1, #1240 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1240]
      str.w r6, [r2, #1244]
      str.w r7, [r2, #1248]
      str.w r1, [r2, #1252]
      str.w r12, [r2, #1256]
      movw.w r10, #0xb475
      movt.w r10, #0x002b
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1260 
      add.w r1, r1, #1260 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1260]
      str.w r6, [r2, #1264]
      str.w r7, [r2, #1268]
      str.w r1, [r2, #1272]
      str.w r12, [r2, #1276]
      movw.w r10, #0x494d
      movt.w r10, #0x0044
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1280 
      add.w r1, r1, #1280 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1280]
      str.w r6, [r2, #1284]
      str.w r7, [r2, #1288]
      str.w r1, [r2, #1292]
      str.w r12, [r2, #1296]
      movw.w r10, #0x96b4
      movt.w r10, #0x0080
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1300 
      add.w r1, r1, #1300 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1300]
      str.w r6, [r2, #1304]
      str.w r7, [r2, #1308]
      str.w r1, [r2, #1312]
      str.w r12, [r2, #1316]
      movw.w r10, #0x75d6
      movt.w r10, #0x00b5
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1320 
      add.w r1, r1, #1320 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1320]
      str.w r6, [r2, #1324]
      str.w r7, [r2, #1328]
      str.w r1, [r2, #1332]
      str.w r12, [r2, #1336]
      movw.w r10, #0x6a2b
      movt.w r10, #0x000f
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1340 
      add.w r1, r1, #1340 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1340]
      str.w r6, [r2, #1344]
      str.w r7, [r2, #1348]
      str.w r1, [r2, #1352]
      str.w r12, [r2, #1356]
      movw.w r10, #0x0e6b
      movt.w r10, #0x00a2
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1360 
      add.w r1, r1, #1360 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1360]
      str.w r6, [r2, #1364]
      str.w r7, [r2, #1368]
      str.w r1, [r2, #1372]
      str.w r12, [r2, #1376]
      movw.w r10, #0xd196
      movt.w r10, #0x0022
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1380 
      add.w r1, r1, #1380 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1380]
      str.w r6, [r2, #1384]
      str.w r7, [r2, #1388]
      str.w r1, [r2, #1392]
      str.w r12, [r2, #1396]
      movw.w r10, #0x3bc1
      movt.w r10, #0x0032
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1400 
      add.w r1, r1, #1400 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1400]
      str.w r6, [r2, #1404]
      str.w r7, [r2, #1408]
      str.w r1, [r2, #1412]
      str.w r12, [r2, #1416]
      movw.w r10, #0xa440
      movt.w r10, #0x0092
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1420 
      add.w r1, r1, #1420 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1420]
      str.w r6, [r2, #1424]
      str.w r7, [r2, #1428]
      str.w r1, [r2, #1432]
      str.w r12, [r2, #1436]
      movw.w r10, #0xc794
      movt.w r10, #0x00ac
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1440 
      add.w r1, r1, #1440 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1440]
      str.w r6, [r2, #1444]
      str.w r7, [r2, #1448]
      str.w r1, [r2, #1452]
      str.w r12, [r2, #1456]
      movw.w r10, #0x186d
      movt.w r10, #0x0018
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1460 
      add.w r1, r1, #1460 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1460]
      str.w r6, [r2, #1464]
      str.w r7, [r2, #1468]
      str.w r1, [r2, #1472]
      str.w r12, [r2, #1476]
      movw.w r10, #0xec47
      movt.w r10, #0x001f
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1480 
      add.w r1, r1, #1480 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1480]
      str.w r6, [r2, #1484]
      str.w r7, [r2, #1488]
      str.w r1, [r2, #1492]
      str.w r12, [r2, #1496]
      movw.w r10, #0xf3ba
      movt.w r10, #0x00a4
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1500 
      add.w r1, r1, #1500 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1500]
      str.w r6, [r2, #1504]
      str.w r7, [r2, #1508]
      str.w r1, [r2, #1512]
      str.w r12, [r2, #1516]
      movw.w r10, #0x0c27
      movt.w r10, #0x00bd
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1520 
      add.w r1, r1, #1520 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1520]
      str.w r6, [r2, #1524]
      str.w r7, [r2, #1528]
      str.w r1, [r2, #1532]
      str.w r12, [r2, #1536]
      movw.w r10, #0xd3da
      movt.w r10, #0x0007
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1540 
      add.w r1, r1, #1540 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1540]
      str.w r6, [r2, #1544]
      str.w r7, [r2, #1548]
      str.w r1, [r2, #1552]
      str.w r12, [r2, #1556]
      movw.w r10, #0x9e17
      movt.w r10, #0x001d
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1560 
      add.w r1, r1, #1560 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1560]
      str.w r6, [r2, #1564]
      str.w r7, [r2, #1568]
      str.w r1, [r2, #1572]
      str.w r12, [r2, #1576]
      movw.w r10, #0x41ea
      movt.w r10, #0x00a7
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1580 
      add.w r1, r1, #1580 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1580]
      str.w r6, [r2, #1584]
      str.w r7, [r2, #1588]
      str.w r1, [r2, #1592]
      str.w r12, [r2, #1596]
      movw.w r10, #0x6c92
      movt.w r10, #0x0066
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1600 
      add.w r1, r1, #1600 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1600]
      str.w r6, [r2, #1604]
      str.w r7, [r2, #1608]
      str.w r1, [r2, #1612]
      str.w r12, [r2, #1616]
      movw.w r10, #0x736f
      movt.w r10, #0x005e
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1620 
      add.w r1, r1, #1620 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1620]
      str.w r6, [r2, #1624]
      str.w r7, [r2, #1628]
      str.w r1, [r2, #1632]
      str.w r12, [r2, #1636]
      movw.w r10, #0xd558
      movt.w r10, #0x0040
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1640 
      add.w r1, r1, #1640 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1640]
      str.w r6, [r2, #1644]
      str.w r7, [r2, #1648]
      str.w r1, [r2, #1652]
      str.w r12, [r2, #1656]
      movw.w r10, #0x0aa9
      movt.w r10, #0x0084
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1660 
      add.w r1, r1, #1660 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1660]
      str.w r6, [r2, #1664]
      str.w r7, [r2, #1668]
      str.w r1, [r2, #1672]
      str.w r12, [r2, #1676]
      movw.w r10, #0xb288
      movt.w r10, #0x003c
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1680 
      add.w r1, r1, #1680 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1680]
      str.w r6, [r2, #1684]
      str.w r7, [r2, #1688]
      str.w r1, [r2, #1692]
      str.w r12, [r2, #1696]
      movw.w r10, #0x2d79
      movt.w r10, #0x0088
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1700 
      add.w r1, r1, #1700 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1700]
      str.w r6, [r2, #1704]
      str.w r7, [r2, #1708]
      str.w r1, [r2, #1712]
      str.w r12, [r2, #1716]
      movw.w r10, #0xc948
      movt.w r10, #0x0055
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1720 
      add.w r1, r1, #1720 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1720]
      str.w r6, [r2, #1724]
      str.w r7, [r2, #1728]
      str.w r1, [r2, #1732]
      str.w r12, [r2, #1736]
      movw.w r10, #0x16b9
      movt.w r10, #0x006f
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1740 
      add.w r1, r1, #1740 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1740]
      str.w r6, [r2, #1744]
      str.w r7, [r2, #1748]
      str.w r1, [r2, #1752]
      str.w r12, [r2, #1756]
      movw.w r10, #0x6431
      movt.w r10, #0x0032
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1760 
      add.w r1, r1, #1760 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1760]
      str.w r6, [r2, #1764]
      str.w r7, [r2, #1768]
      str.w r1, [r2, #1772]
      str.w r12, [r2, #1776]
      movw.w r10, #0x7bd0
      movt.w r10, #0x0092
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1780 
      add.w r1, r1, #1780 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1780]
      str.w r6, [r2, #1784]
      str.w r7, [r2, #1788]
      str.w r1, [r2, #1792]
      str.w r12, [r2, #1796]
      movw.w r10, #0xb17d
      movt.w r10, #0x007c
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1800 
      add.w r1, r1, #1800 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1800]
      str.w r6, [r2, #1804]
      str.w r7, [r2, #1808]
      str.w r1, [r2, #1812]
      str.w r12, [r2, #1816]
      movw.w r10, #0x2e84
      movt.w r10, #0x0048
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1820 
      add.w r1, r1, #1820 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1820]
      str.w r6, [r2, #1824]
      str.w r7, [r2, #1828]
      str.w r1, [r2, #1832]
      str.w r12, [r2, #1836]
      movw.w r10, #0xd45e
      movt.w r10, #0x00c0
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1840 
      add.w r1, r1, #1840 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1840]
      str.w r6, [r2, #1844]
      str.w r7, [r2, #1848]
      str.w r1, [r2, #1852]
      str.w r12, [r2, #1856]
      movw.w r10, #0x0ba3
      movt.w r10, #0x0004
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1860 
      add.w r1, r1, #1860 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1860]
      str.w r6, [r2, #1864]
      str.w r7, [r2, #1868]
      str.w r1, [r2, #1872]
      str.w r12, [r2, #1876]
      movw.w r10, #0x3a27
      movt.w r10, #0x004c
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1880 
      add.w r1, r1, #1880 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1880]
      str.w r6, [r2, #1884]
      str.w r7, [r2, #1888]
      str.w r1, [r2, #1892]
      str.w r12, [r2, #1896]
      movw.w r10, #0xa5da
      movt.w r10, #0x0078
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1900 
      add.w r1, r1, #1900 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1900]
      str.w r6, [r2, #1904]
      str.w r7, [r2, #1908]
      str.w r1, [r2, #1912]
      str.w r12, [r2, #1916]
      movw.w r10, #0x9e3c
      movt.w r10, #0x0063
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1920 
      add.w r1, r1, #1920 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1920]
      str.w r6, [r2, #1924]
      str.w r7, [r2, #1928]
      str.w r1, [r2, #1932]
      str.w r12, [r2, #1936]
      movw.w r10, #0x41c5
      movt.w r10, #0x0061
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1940 
      add.w r1, r1, #1940 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1940]
      str.w r6, [r2, #1944]
      str.w r7, [r2, #1948]
      str.w r1, [r2, #1952]
      str.w r12, [r2, #1956]
      movw.w r10, #0x97bf
      movt.w r10, #0x0034
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1960 
      add.w r1, r1, #1960 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1960]
      str.w r6, [r2, #1964]
      str.w r7, [r2, #1968]
      str.w r1, [r2, #1972]
      str.w r12, [r2, #1976]
      movw.w r10, #0x4842
      movt.w r10, #0x0090
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1980 
      add.w r1, r1, #1980 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1980]
      str.w r6, [r2, #1984]
      str.w r7, [r2, #1988]
      str.w r1, [r2, #1992]
      str.w r12, [r2, #1996]
      movw.w r10, #0xaa06
      movt.w r10, #0x002c
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2000 
      add.w r1, r1, #2000 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2000]
      str.w r6, [r2, #2004]
      str.w r7, [r2, #2008]
      str.w r1, [r2, #2012]
      str.w r12, [r2, #2016]
      movw.w r10, #0x35fb
      movt.w r10, #0x0098
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2020 
      add.w r1, r1, #2020 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2020]
      str.w r6, [r2, #2024]
      str.w r7, [r2, #2028]
      str.w r1, [r2, #2032]
      str.w r12, [r2, #2036]
      movw.w r10, #0x8d68
      movt.w r10, #0x0022
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2040 
      add.w r1, r1, #2040 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2040]
      str.w r6, [r2, #2044]
      str.w r7, [r2, #2048]
      str.w r1, [r2, #2052]
      str.w r12, [r2, #2056]
      movw.w r10, #0x5299
      movt.w r10, #0x00a2
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2060 
      add.w r1, r1, #2060 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2060]
      str.w r6, [r2, #2064]
      str.w r7, [r2, #2068]
      str.w r1, [r2, #2072]
      str.w r12, [r2, #2076]
      movw.w r10, #0x5992
      movt.w r10, #0x0087
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2080 
      add.w r1, r1, #2080 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2080]
      str.w r6, [r2, #2084]
      str.w r7, [r2, #2088]
      str.w r1, [r2, #2092]
      str.w r12, [r2, #2096]
      movw.w r10, #0x866f
      movt.w r10, #0x003d
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2100 
      add.w r1, r1, #2100 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2100]
      str.w r6, [r2, #2104]
      str.w r7, [r2, #2108]
      str.w r1, [r2, #2112]
      str.w r12, [r2, #2116]
      movw.w r10, #0xf907
      movt.w r10, #0x001a
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2120 
      add.w r1, r1, #2120 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2120]
      str.w r6, [r2, #2124]
      str.w r7, [r2, #2128]
      str.w r1, [r2, #2132]
      str.w r12, [r2, #2136]
      movw.w r10, #0xe6fa
      movt.w r10, #0x00a9
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2140 
      add.w r1, r1, #2140 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2140]
      str.w r6, [r2, #2144]
      str.w r7, [r2, #2148]
      str.w r1, [r2, #2152]
      str.w r12, [r2, #2156]
      movw.w r10, #0x11bb
      movt.w r10, #0x0020
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2160 
      add.w r1, r1, #2160 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2160]
      str.w r6, [r2, #2164]
      str.w r7, [r2, #2168]
      str.w r1, [r2, #2172]
      str.w r12, [r2, #2176]
      movw.w r10, #0xce46
      movt.w r10, #0x00a4
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2180 
      add.w r1, r1, #2180 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2180]
      str.w r6, [r2, #2184]
      str.w r7, [r2, #2188]
      str.w r1, [r2, #2192]
      str.w r12, [r2, #2196]
      movw.w r10, #0xcb05
      movt.w r10, #0x001e
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2200 
      add.w r1, r1, #2200 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2200]
      str.w r6, [r2, #2204]
      str.w r7, [r2, #2208]
      str.w r1, [r2, #2212]
      str.w r12, [r2, #2216]
      movw.w r10, #0x14fc
      movt.w r10, #0x00a6
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2220 
      add.w r1, r1, #2220 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2220]
      str.w r6, [r2, #2224]
      str.w r7, [r2, #2228]
      str.w r1, [r2, #2232]
      str.w r12, [r2, #2236]
      movw.w r10, #0x0341
      movt.w r10, #0x0086
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2240 
      add.w r1, r1, #2240 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2240]
      str.w r6, [r2, #2244]
      str.w r7, [r2, #2248]
      str.w r1, [r2, #2252]
      str.w r12, [r2, #2256]
      movw.w r10, #0xdcc0
      movt.w r10, #0x003e
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2260 
      add.w r1, r1, #2260 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2260]
      str.w r6, [r2, #2264]
      str.w r7, [r2, #2268]
      str.w r1, [r2, #2272]
      str.w r12, [r2, #2276]
      movw.w r10, #0x5182
      movt.w r10, #0x0082
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2280 
      add.w r1, r1, #2280 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2280]
      str.w r6, [r2, #2284]
      str.w r7, [r2, #2288]
      str.w r1, [r2, #2292]
      str.w r12, [r2, #2296]
      movw.w r10, #0x8e7f
      movt.w r10, #0x0042
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2300 
      add.w r1, r1, #2300 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2300]
      str.w r6, [r2, #2304]
      str.w r7, [r2, #2308]
      str.w r1, [r2, #2312]
      str.w r12, [r2, #2316]
      movw.w r10, #0xf3d3
      movt.w r10, #0x004d
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2320 
      add.w r1, r1, #2320 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2320]
      str.w r6, [r2, #2324]
      str.w r7, [r2, #2328]
      str.w r1, [r2, #2332]
      str.w r12, [r2, #2336]
      movw.w r10, #0xec2e
      movt.w r10, #0x0076
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2340 
      add.w r1, r1, #2340 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2340]
      str.w r6, [r2, #2344]
      str.w r7, [r2, #2348]
      str.w r1, [r2, #2352]
      str.w r12, [r2, #2356]
      movw.w r10, #0x7aad
      movt.w r10, #0x00b9
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2360 
      add.w r1, r1, #2360 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2360]
      str.w r6, [r2, #2364]
      str.w r7, [r2, #2368]
      str.w r1, [r2, #2372]
      str.w r12, [r2, #2376]
      movw.w r10, #0x6554
      movt.w r10, #0x000b
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2380 
      add.w r1, r1, #2380 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2380]
      str.w r6, [r2, #2384]
      str.w r7, [r2, #2388]
      str.w r1, [r2, #2392]
      str.w r12, [r2, #2396]
      movw.w r10, #0x67b4
      movt.w r10, #0x0052
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2400 
      add.w r1, r1, #2400 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2400]
      str.w r6, [r2, #2404]
      str.w r7, [r2, #2408]
      str.w r1, [r2, #2412]
      str.w r12, [r2, #2416]
      movw.w r10, #0x784d
      movt.w r10, #0x0072
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2420 
      add.w r1, r1, #2420 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2420]
      str.w r6, [r2, #2424]
      str.w r7, [r2, #2428]
      str.w r1, [r2, #2432]
      str.w r12, [r2, #2436]
      movw.w r10, #0xc564
      movt.w r10, #0x00b1
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2440 
      add.w r1, r1, #2440 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2440]
      str.w r6, [r2, #2444]
      str.w r7, [r2, #2448]
      str.w r1, [r2, #2452]
      str.w r12, [r2, #2456]
      movw.w r10, #0x1a9d
      movt.w r10, #0x0013
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2460 
      add.w r1, r1, #2460 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2460]
      str.w r6, [r2, #2464]
      str.w r7, [r2, #2468]
      str.w r1, [r2, #2472]
      str.w r12, [r2, #2476]
      movw.w r10, #0x92ea
      movt.w r10, #0x0085
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2480 
      add.w r1, r1, #2480 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2480]
      str.w r6, [r2, #2484]
      str.w r7, [r2, #2488]
      str.w r1, [r2, #2492]
      str.w r12, [r2, #2496]
      movw.w r10, #0x4d17
      movt.w r10, #0x003f
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2500 
      add.w r1, r1, #2500 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2500]
      str.w r6, [r2, #2504]
      str.w r7, [r2, #2508]
      str.w r1, [r2, #2512]
      str.w r12, [r2, #2516]
      movw.w r10, #0x42a4
      movt.w r10, #0x0037
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2520 
      add.w r1, r1, #2520 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2520]
      str.w r6, [r2, #2524]
      str.w r7, [r2, #2528]
      str.w r1, [r2, #2532]
      str.w r12, [r2, #2536]
      movw.w r10, #0x9d5d
      movt.w r10, #0x008d
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2540 
      add.w r1, r1, #2540 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2540]
      str.w r6, [r2, #2544]
      str.w r7, [r2, #2548]
      str.w r1, [r2, #2552]
      str.w r12, [r2, #2556]
      movw.w r10, #0x82c3
      movt.w r10, #0x0008
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2560 
      add.w r1, r1, #2560 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2560]
      str.w r6, [r2, #2564]
      str.w r7, [r2, #2568]
      str.w r1, [r2, #2572]
      str.w r12, [r2, #2576]
      movw.w r10, #0x5d3e
      movt.w r10, #0x00bc
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2580 
      add.w r1, r1, #2580 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2580]
      str.w r6, [r2, #2584]
      str.w r7, [r2, #2588]
      str.w r1, [r2, #2592]
      str.w r12, [r2, #2596]
      movw.w r10, #0x1a9a
      movt.w r10, #0x0085
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2600 
      add.w r1, r1, #2600 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2600]
      str.w r6, [r2, #2604]
      str.w r7, [r2, #2608]
      str.w r1, [r2, #2612]
      str.w r12, [r2, #2616]
      movw.w r10, #0xc567
      movt.w r10, #0x003f
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2620 
      add.w r1, r1, #2620 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2620]
      str.w r6, [r2, #2624]
      str.w r7, [r2, #2628]
      str.w r1, [r2, #2632]
      str.w r12, [r2, #2636]
      movw.w r10, #0x3316
      movt.w r10, #0x005d
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2640 
      add.w r1, r1, #2640 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2640]
      str.w r6, [r2, #2644]
      str.w r7, [r2, #2648]
      str.w r1, [r2, #2652]
      str.w r12, [r2, #2656]
      movw.w r10, #0xaceb
      movt.w r10, #0x0067
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2660 
      add.w r1, r1, #2660 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2660]
      str.w r6, [r2, #2664]
      str.w r7, [r2, #2668]
      str.w r1, [r2, #2672]
      str.w r12, [r2, #2676]
      movw.w r10, #0x4f84
      movt.w r10, #0x0054
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2680 
      add.w r1, r1, #2680 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2680]
      str.w r6, [r2, #2684]
      str.w r7, [r2, #2688]
      str.w r1, [r2, #2692]
      str.w r12, [r2, #2696]
      movw.w r10, #0x907d
      movt.w r10, #0x0070
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2700 
      add.w r1, r1, #2700 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2700]
      str.w r6, [r2, #2704]
      str.w r7, [r2, #2708]
      str.w r1, [r2, #2712]
      str.w r12, [r2, #2716]
      movw.w r10, #0x5d67
      movt.w r10, #0x0013
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2720 
      add.w r1, r1, #2720 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2720]
      str.w r6, [r2, #2724]
      str.w r7, [r2, #2728]
      str.w r1, [r2, #2732]
      str.w r12, [r2, #2736]
      movw.w r10, #0x829a
      movt.w r10, #0x00b1
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2740 
      add.w r1, r1, #2740 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2740]
      str.w r6, [r2, #2744]
      str.w r7, [r2, #2748]
      str.w r1, [r2, #2752]
      str.w r12, [r2, #2756]
      movw.w r10, #0x4591
      movt.w r10, #0x00bf
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2760 
      add.w r1, r1, #2760 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2760]
      str.w r6, [r2, #2764]
      str.w r7, [r2, #2768]
      str.w r1, [r2, #2772]
      str.w r12, [r2, #2776]
      movw.w r10, #0x9a70
      movt.w r10, #0x0005
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2780 
      add.w r1, r1, #2780 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2780]
      str.w r6, [r2, #2784]
      str.w r7, [r2, #2788]
      str.w r1, [r2, #2792]
      str.w r12, [r2, #2796]
      movw.w r10, #0xc5dc
      movt.w r10, #0x0009
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2800 
      add.w r1, r1, #2800 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2800]
      str.w r6, [r2, #2804]
      str.w r7, [r2, #2808]
      str.w r1, [r2, #2812]
      str.w r12, [r2, #2816]
      movw.w r10, #0x1a25
      movt.w r10, #0x00bb
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2820 
      add.w r1, r1, #2820 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2820]
      str.w r6, [r2, #2824]
      str.w r7, [r2, #2828]
      str.w r1, [r2, #2832]
      str.w r12, [r2, #2836]
      movw.w r10, #0xb495
      movt.w r10, #0x00c0
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2840 
      add.w r1, r1, #2840 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2840]
      str.w r6, [r2, #2844]
      str.w r7, [r2, #2848]
      str.w r1, [r2, #2852]
      str.w r12, [r2, #2856]
      movw.w r10, #0x2b6c
      movt.w r10, #0x0004
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2860 
      add.w r1, r1, #2860 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2860]
      str.w r6, [r2, #2864]
      str.w r7, [r2, #2868]
      str.w r1, [r2, #2872]
      str.w r12, [r2, #2876]
      movw.w r10, #0xf51b
      movt.w r10, #0x0037
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2880 
      add.w r1, r1, #2880 
      vmov.w s0, r0
      vmov.w s1, r1
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2880]
      str.w r6, [r2, #2884]
      str.w r7, [r2, #2888]
      str.w r1, [r2, #2892]
      str.w r12, [r2, #2896]
      add.w r2, r2, #2880 
      vmov.w s2, r2
      movw.w r10, #0xeae6
      movt.w r10, #0x008c
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #20 
      add.w r1, r1, #20 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #20]
      str.w r6, [r2, #24]
      str.w r7, [r2, #28]
      str.w r1, [r2, #32]
      str.w r12, [r2, #36]
      movw.w r10, #0xbafa
      movt.w r10, #0x002e
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #40 
      add.w r1, r1, #40 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #40]
      str.w r6, [r2, #44]
      str.w r7, [r2, #48]
      str.w r1, [r2, #52]
      str.w r12, [r2, #56]
      movw.w r10, #0x2507
      movt.w r10, #0x0096
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #60 
      add.w r1, r1, #60 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #60]
      str.w r6, [r2, #64]
      str.w r7, [r2, #68]
      str.w r1, [r2, #72]
      str.w r12, [r2, #76]
      movw.w r10, #0x2fec
      movt.w r10, #0x005e
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #80 
      add.w r1, r1, #80 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #80]
      str.w r6, [r2, #84]
      str.w r7, [r2, #88]
      str.w r1, [r2, #92]
      str.w r12, [r2, #96]
      movw.w r10, #0xb015
      movt.w r10, #0x0066
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #100 
      add.w r1, r1, #100 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #100]
      str.w r6, [r2, #104]
      str.w r7, [r2, #108]
      str.w r1, [r2, #112]
      str.w r12, [r2, #116]
      movw.w r10, #0x54fc
      movt.w r10, #0x0022
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #120 
      add.w r1, r1, #120 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #120]
      str.w r6, [r2, #124]
      str.w r7, [r2, #128]
      str.w r1, [r2, #132]
      str.w r12, [r2, #136]
      movw.w r10, #0x8b05
      movt.w r10, #0x00a2
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #140 
      add.w r1, r1, #140 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #140]
      str.w r6, [r2, #144]
      str.w r7, [r2, #148]
      str.w r1, [r2, #152]
      str.w r12, [r2, #156]
      movw.w r10, #0x81a4
      movt.w r10, #0x00a2
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #160 
      add.w r1, r1, #160 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #160]
      str.w r6, [r2, #164]
      str.w r7, [r2, #168]
      str.w r1, [r2, #172]
      str.w r12, [r2, #176]
      movw.w r10, #0x5e5d
      movt.w r10, #0x0022
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #180 
      add.w r1, r1, #180 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #180]
      str.w r6, [r2, #184]
      str.w r7, [r2, #188]
      str.w r1, [r2, #192]
      str.w r12, [r2, #196]
      movw.w r10, #0x0961
      movt.w r10, #0x0000
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #200 
      add.w r1, r1, #200 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #200]
      str.w r6, [r2, #204]
      str.w r7, [r2, #208]
      str.w r1, [r2, #212]
      str.w r12, [r2, #216]
      movw.w r10, #0xd6a0
      movt.w r10, #0x00c4
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #220 
      add.w r1, r1, #220 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #220]
      str.w r6, [r2, #224]
      str.w r7, [r2, #228]
      str.w r1, [r2, #232]
      str.w r12, [r2, #236]
      movw.w r10, #0xa1b6
      movt.w r10, #0x0044
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #240 
      add.w r1, r1, #240 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #240]
      str.w r6, [r2, #244]
      str.w r7, [r2, #248]
      str.w r1, [r2, #252]
      str.w r12, [r2, #256]
      movw.w r10, #0x3e4b
      movt.w r10, #0x0080
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #260 
      add.w r1, r1, #260 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #260]
      str.w r6, [r2, #264]
      str.w r7, [r2, #268]
      str.w r1, [r2, #272]
      str.w r12, [r2, #276]
      movw.w r10, #0xcc23
      movt.w r10, #0x0068
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #280 
      add.w r1, r1, #280 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #280]
      str.w r6, [r2, #284]
      str.w r7, [r2, #288]
      str.w r1, [r2, #292]
      str.w r12, [r2, #296]
      movw.w r10, #0x13de
      movt.w r10, #0x005c
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #300 
      add.w r1, r1, #300 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #300]
      str.w r6, [r2, #304]
      str.w r7, [r2, #308]
      str.w r1, [r2, #312]
      str.w r12, [r2, #316]
      movw.w r10, #0x7228
      movt.w r10, #0x0017
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #320 
      add.w r1, r1, #320 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #320]
      str.w r6, [r2, #324]
      str.w r7, [r2, #328]
      str.w r1, [r2, #332]
      str.w r12, [r2, #336]
      movw.w r10, #0x6dd9
      movt.w r10, #0x00ad
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #340 
      add.w r1, r1, #340 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #340]
      str.w r6, [r2, #344]
      str.w r7, [r2, #348]
      str.w r1, [r2, #352]
      str.w r12, [r2, #356]
      movw.w r10, #0x0914
      movt.w r10, #0x0029
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #360 
      add.w r1, r1, #360 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #360]
      str.w r6, [r2, #364]
      str.w r7, [r2, #368]
      str.w r1, [r2, #372]
      str.w r12, [r2, #376]
      movw.w r10, #0xd6ed
      movt.w r10, #0x009b
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #380 
      add.w r1, r1, #380 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #380]
      str.w r6, [r2, #384]
      str.w r7, [r2, #388]
      str.w r1, [r2, #392]
      str.w r12, [r2, #396]
      movw.w r10, #0x0ab7
      movt.w r10, #0x008a
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #400 
      add.w r1, r1, #400 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #400]
      str.w r6, [r2, #404]
      str.w r7, [r2, #408]
      str.w r1, [r2, #412]
      str.w r12, [r2, #416]
      movw.w r10, #0xd54a
      movt.w r10, #0x003a
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #420 
      add.w r1, r1, #420 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #420]
      str.w r6, [r2, #424]
      str.w r7, [r2, #428]
      str.w r1, [r2, #432]
      str.w r12, [r2, #436]
      movw.w r10, #0xcc36
      movt.w r10, #0x0011
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #440 
      add.w r1, r1, #440 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #440]
      str.w r6, [r2, #444]
      str.w r7, [r2, #448]
      str.w r1, [r2, #452]
      str.w r12, [r2, #456]
      movw.w r10, #0x13cb
      movt.w r10, #0x00b3
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #460 
      add.w r1, r1, #460 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #460]
      str.w r6, [r2, #464]
      str.w r7, [r2, #468]
      str.w r1, [r2, #472]
      str.w r12, [r2, #476]
      movw.w r10, #0x705d
      movt.w r10, #0x00ab
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #480 
      add.w r1, r1, #480 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #480]
      str.w r6, [r2, #484]
      str.w r7, [r2, #488]
      str.w r1, [r2, #492]
      str.w r12, [r2, #496]
      movw.w r10, #0x6fa4
      movt.w r10, #0x0019
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #500 
      add.w r1, r1, #500 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #500]
      str.w r6, [r2, #504]
      str.w r7, [r2, #508]
      str.w r1, [r2, #512]
      str.w r12, [r2, #516]
      movw.w r10, #0x0e2e
      movt.w r10, #0x0046
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #520 
      add.w r1, r1, #520 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #520]
      str.w r6, [r2, #524]
      str.w r7, [r2, #528]
      str.w r1, [r2, #532]
      str.w r12, [r2, #536]
      movw.w r10, #0xd1d3
      movt.w r10, #0x007e
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #540 
      add.w r1, r1, #540 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #540]
      str.w r6, [r2, #544]
      str.w r7, [r2, #548]
      str.w r1, [r2, #552]
      str.w r12, [r2, #556]
      movw.w r10, #0x4177
      movt.w r10, #0x0098
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #560 
      add.w r1, r1, #560 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #560]
      str.w r6, [r2, #564]
      str.w r7, [r2, #568]
      str.w r1, [r2, #572]
      str.w r12, [r2, #576]
      movw.w r10, #0x9e8a
      movt.w r10, #0x002c
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #580 
      add.w r1, r1, #580 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #580]
      str.w r6, [r2, #584]
      str.w r7, [r2, #588]
      str.w r1, [r2, #592]
      str.w r12, [r2, #596]
      movw.w r10, #0x6e66
      movt.w r10, #0x008a
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #600 
      add.w r1, r1, #600 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #600]
      str.w r6, [r2, #604]
      str.w r7, [r2, #608]
      str.w r1, [r2, #612]
      str.w r12, [r2, #616]
      movw.w r10, #0x719b
      movt.w r10, #0x003a
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #620 
      add.w r1, r1, #620 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #620]
      str.w r6, [r2, #624]
      str.w r7, [r2, #628]
      str.w r1, [r2, #632]
      str.w r12, [r2, #636]
      movw.w r10, #0xecb1
      movt.w r10, #0x009e
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #640 
      add.w r1, r1, #640 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #640]
      str.w r6, [r2, #644]
      str.w r7, [r2, #648]
      str.w r1, [r2, #652]
      str.w r12, [r2, #656]
      movw.w r10, #0xf350
      movt.w r10, #0x0025
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #660 
      add.w r1, r1, #660 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #660]
      str.w r6, [r2, #664]
      str.w r7, [r2, #668]
      str.w r1, [r2, #672]
      str.w r12, [r2, #676]
      movw.w r10, #0x64eb
      movt.w r10, #0x0060
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #680 
      add.w r1, r1, #680 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #680]
      str.w r6, [r2, #684]
      str.w r7, [r2, #688]
      str.w r1, [r2, #692]
      str.w r12, [r2, #696]
      movw.w r10, #0x7b16
      movt.w r10, #0x0064
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #700 
      add.w r1, r1, #700 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #700]
      str.w r6, [r2, #704]
      str.w r7, [r2, #708]
      str.w r1, [r2, #712]
      str.w r12, [r2, #716]
      movw.w r10, #0xe816
      movt.w r10, #0x0034
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #720 
      add.w r1, r1, #720 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #720]
      str.w r6, [r2, #724]
      str.w r7, [r2, #728]
      str.w r1, [r2, #732]
      str.w r12, [r2, #736]
      movw.w r10, #0xf7eb
      movt.w r10, #0x008f
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #740 
      add.w r1, r1, #740 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #740]
      str.w r6, [r2, #744]
      str.w r7, [r2, #748]
      str.w r1, [r2, #752]
      str.w r12, [r2, #756]
      movw.w r10, #0x130e
      movt.w r10, #0x0035
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #760 
      add.w r1, r1, #760 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #760]
      str.w r6, [r2, #764]
      str.w r7, [r2, #768]
      str.w r1, [r2, #772]
      str.w r12, [r2, #776]
      movw.w r10, #0xccf3
      movt.w r10, #0x008f
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #780 
      add.w r1, r1, #780 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #780]
      str.w r6, [r2, #784]
      str.w r7, [r2, #788]
      str.w r1, [r2, #792]
      str.w r12, [r2, #796]
      movw.w r10, #0xe4dd
      movt.w r10, #0x005a
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #800 
      add.w r1, r1, #800 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #800]
      str.w r6, [r2, #804]
      str.w r7, [r2, #808]
      str.w r1, [r2, #812]
      str.w r12, [r2, #816]
      movw.w r10, #0xfb24
      movt.w r10, #0x0069
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #820 
      add.w r1, r1, #820 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #820]
      str.w r6, [r2, #824]
      str.w r7, [r2, #828]
      str.w r1, [r2, #832]
      str.w r12, [r2, #836]
      movw.w r10, #0x407d
      movt.w r10, #0x0093
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #840 
      add.w r1, r1, #840 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #840]
      str.w r6, [r2, #844]
      str.w r7, [r2, #848]
      str.w r1, [r2, #852]
      str.w r12, [r2, #856]
      movw.w r10, #0x9f84
      movt.w r10, #0x0031
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #860 
      add.w r1, r1, #860 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #860]
      str.w r6, [r2, #864]
      str.w r7, [r2, #868]
      str.w r1, [r2, #872]
      str.w r12, [r2, #876]
      movw.w r10, #0xa757
      movt.w r10, #0x0075
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #880 
      add.w r1, r1, #880 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #880]
      str.w r6, [r2, #884]
      str.w r7, [r2, #888]
      str.w r1, [r2, #892]
      str.w r12, [r2, #896]
      movw.w r10, #0x38aa
      movt.w r10, #0x004f
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #900 
      add.w r1, r1, #900 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #900]
      str.w r6, [r2, #904]
      str.w r7, [r2, #908]
      str.w r1, [r2, #912]
      str.w r12, [r2, #916]
      movw.w r10, #0xd82e
      movt.w r10, #0x0080
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #920 
      add.w r1, r1, #920 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #920]
      str.w r6, [r2, #924]
      str.w r7, [r2, #928]
      str.w r1, [r2, #932]
      str.w r12, [r2, #936]
      movw.w r10, #0x07d3
      movt.w r10, #0x0044
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #940 
      add.w r1, r1, #940 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #940]
      str.w r6, [r2, #944]
      str.w r7, [r2, #948]
      str.w r1, [r2, #952]
      str.w r12, [r2, #956]
      movw.w r10, #0x36b2
      movt.w r10, #0x0097
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #960 
      add.w r1, r1, #960 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #960]
      str.w r6, [r2, #964]
      str.w r7, [r2, #968]
      str.w r1, [r2, #972]
      str.w r12, [r2, #976]
      movw.w r10, #0xa94f
      movt.w r10, #0x002d
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #980 
      add.w r1, r1, #980 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #980]
      str.w r6, [r2, #984]
      str.w r7, [r2, #988]
      str.w r1, [r2, #992]
      str.w r12, [r2, #996]
      movw.w r10, #0x0eb7
      movt.w r10, #0x0023
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1000 
      add.w r1, r1, #1000 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1000]
      str.w r6, [r2, #1004]
      str.w r7, [r2, #1008]
      str.w r1, [r2, #1012]
      str.w r12, [r2, #1016]
      movw.w r10, #0xd14a
      movt.w r10, #0x00a1
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1020 
      add.w r1, r1, #1020 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1020]
      str.w r6, [r2, #1024]
      str.w r7, [r2, #1028]
      str.w r1, [r2, #1032]
      str.w r12, [r2, #1036]
      movw.w r10, #0x9a98
      movt.w r10, #0x000a
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1040 
      add.w r1, r1, #1040 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1040]
      str.w r6, [r2, #1044]
      str.w r7, [r2, #1048]
      str.w r1, [r2, #1052]
      str.w r12, [r2, #1056]
      movw.w r10, #0x4569
      movt.w r10, #0x00ba
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1060 
      add.w r1, r1, #1060 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1060]
      str.w r6, [r2, #1064]
      str.w r7, [r2, #1068]
      str.w r1, [r2, #1072]
      str.w r12, [r2, #1076]
      movw.w r10, #0x6383
      movt.w r10, #0x00be
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1080 
      add.w r1, r1, #1080 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1080]
      str.w r6, [r2, #1084]
      str.w r7, [r2, #1088]
      str.w r1, [r2, #1092]
      str.w r12, [r2, #1096]
      movw.w r10, #0x7c7e
      movt.w r10, #0x0006
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1100 
      add.w r1, r1, #1100 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1100]
      str.w r6, [r2, #1104]
      str.w r7, [r2, #1108]
      str.w r1, [r2, #1112]
      str.w r12, [r2, #1116]
      movw.w r10, #0x8263
      movt.w r10, #0x0068
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1120 
      add.w r1, r1, #1120 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1120]
      str.w r6, [r2, #1124]
      str.w r7, [r2, #1128]
      str.w r1, [r2, #1132]
      str.w r12, [r2, #1136]
      movw.w r10, #0x5d9e
      movt.w r10, #0x005c
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1140 
      add.w r1, r1, #1140 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1140]
      str.w r6, [r2, #1144]
      str.w r7, [r2, #1148]
      str.w r1, [r2, #1152]
      str.w r12, [r2, #1156]
      movw.w r10, #0xda1c
      movt.w r10, #0x0062
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1160 
      add.w r1, r1, #1160 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1160]
      str.w r6, [r2, #1164]
      str.w r7, [r2, #1168]
      str.w r1, [r2, #1172]
      str.w r12, [r2, #1176]
      movw.w r10, #0x05e5
      movt.w r10, #0x0062
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1180 
      add.w r1, r1, #1180 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1180]
      str.w r6, [r2, #1184]
      str.w r7, [r2, #1188]
      str.w r1, [r2, #1192]
      str.w r12, [r2, #1196]
      movw.w r10, #0x6506
      movt.w r10, #0x0097
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1200 
      add.w r1, r1, #1200 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1200]
      str.w r6, [r2, #1204]
      str.w r7, [r2, #1208]
      str.w r1, [r2, #1212]
      str.w r12, [r2, #1216]
      movw.w r10, #0x7afb
      movt.w r10, #0x002d
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1220 
      add.w r1, r1, #1220 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1220]
      str.w r6, [r2, #1224]
      str.w r7, [r2, #1228]
      str.w r1, [r2, #1232]
      str.w r12, [r2, #1236]
      movw.w r10, #0xfcbd
      movt.w r10, #0x006f
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1240 
      add.w r1, r1, #1240 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1240]
      str.w r6, [r2, #1244]
      str.w r7, [r2, #1248]
      str.w r1, [r2, #1252]
      str.w r12, [r2, #1256]
      movw.w r10, #0xe344
      movt.w r10, #0x0054
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1260 
      add.w r1, r1, #1260 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1260]
      str.w r6, [r2, #1264]
      str.w r7, [r2, #1268]
      str.w r1, [r2, #1272]
      str.w r12, [r2, #1276]
      movw.w r10, #0x5e3f
      movt.w r10, #0x0082
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1280 
      add.w r1, r1, #1280 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1280]
      str.w r6, [r2, #1284]
      str.w r7, [r2, #1288]
      str.w r1, [r2, #1292]
      str.w r12, [r2, #1296]
      movw.w r10, #0x81c2
      movt.w r10, #0x0042
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1300 
      add.w r1, r1, #1300 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1300]
      str.w r6, [r2, #1304]
      str.w r7, [r2, #1308]
      str.w r1, [r2, #1312]
      str.w r12, [r2, #1316]
      movw.w r10, #0x99e4
      movt.w r10, #0x0076
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1320 
      add.w r1, r1, #1320 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1320]
      str.w r6, [r2, #1324]
      str.w r7, [r2, #1328]
      str.w r1, [r2, #1332]
      str.w r12, [r2, #1336]
      movw.w r10, #0x461d
      movt.w r10, #0x004e
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1340 
      add.w r1, r1, #1340 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1340]
      str.w r6, [r2, #1344]
      str.w r7, [r2, #1348]
      str.w r1, [r2, #1352]
      str.w r12, [r2, #1356]
      movw.w r10, #0x775a
      movt.w r10, #0x006f
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1360 
      add.w r1, r1, #1360 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1360]
      str.w r6, [r2, #1364]
      str.w r7, [r2, #1368]
      str.w r1, [r2, #1372]
      str.w r12, [r2, #1376]
      movw.w r10, #0x68a7
      movt.w r10, #0x0055
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1380 
      add.w r1, r1, #1380 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1380]
      str.w r6, [r2, #1384]
      str.w r7, [r2, #1388]
      str.w r1, [r2, #1392]
      str.w r12, [r2, #1396]
      movw.w r10, #0xaec4
      movt.w r10, #0x00a3
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1400 
      add.w r1, r1, #1400 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1400]
      str.w r6, [r2, #1404]
      str.w r7, [r2, #1408]
      str.w r1, [r2, #1412]
      str.w r12, [r2, #1416]
      movw.w r10, #0x313d
      movt.w r10, #0x0021
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1420 
      add.w r1, r1, #1420 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1420]
      str.w r6, [r2, #1424]
      str.w r7, [r2, #1428]
      str.w r1, [r2, #1432]
      str.w r12, [r2, #1436]
      movw.w r10, #0x5120
      movt.w r10, #0x0059
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1440 
      add.w r1, r1, #1440 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1440]
      str.w r6, [r2, #1444]
      str.w r7, [r2, #1448]
      str.w r1, [r2, #1452]
      str.w r12, [r2, #1456]
      movw.w r10, #0x8ee1
      movt.w r10, #0x006b
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1460 
      add.w r1, r1, #1460 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1460]
      str.w r6, [r2, #1464]
      str.w r7, [r2, #1468]
      str.w r1, [r2, #1472]
      str.w r12, [r2, #1476]
      movw.w r10, #0x93b4
      movt.w r10, #0x003f
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1480 
      add.w r1, r1, #1480 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1480]
      str.w r6, [r2, #1484]
      str.w r7, [r2, #1488]
      str.w r1, [r2, #1492]
      str.w r12, [r2, #1496]
      movw.w r10, #0x4c4d
      movt.w r10, #0x0085
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1500 
      add.w r1, r1, #1500 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1500]
      str.w r6, [r2, #1504]
      str.w r7, [r2, #1508]
      str.w r1, [r2, #1512]
      str.w r12, [r2, #1516]
      movw.w r10, #0xfb2d
      movt.w r10, #0x002b
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1520 
      add.w r1, r1, #1520 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1520]
      str.w r6, [r2, #1524]
      str.w r7, [r2, #1528]
      str.w r1, [r2, #1532]
      str.w r12, [r2, #1536]
      movw.w r10, #0xe4d4
      movt.w r10, #0x0098
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1540 
      add.w r1, r1, #1540 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1540]
      str.w r6, [r2, #1544]
      str.w r7, [r2, #1548]
      str.w r1, [r2, #1552]
      str.w r12, [r2, #1556]
      movw.w r10, #0x101d
      movt.w r10, #0x007d
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1560 
      add.w r1, r1, #1560 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1560]
      str.w r6, [r2, #1564]
      str.w r7, [r2, #1568]
      str.w r1, [r2, #1572]
      str.w r12, [r2, #1576]
      movw.w r10, #0xcfe4
      movt.w r10, #0x0047
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1580 
      add.w r1, r1, #1580 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1580]
      str.w r6, [r2, #1584]
      str.w r7, [r2, #1588]
      str.w r1, [r2, #1592]
      str.w r12, [r2, #1596]
      movw.w r10, #0xa7f0
      movt.w r10, #0x000a
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1600 
      add.w r1, r1, #1600 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1600]
      str.w r6, [r2, #1604]
      str.w r7, [r2, #1608]
      str.w r1, [r2, #1612]
      str.w r12, [r2, #1616]
      movw.w r10, #0x3811
      movt.w r10, #0x00ba
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1620 
      add.w r1, r1, #1620 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1620]
      str.w r6, [r2, #1624]
      str.w r7, [r2, #1628]
      str.w r1, [r2, #1632]
      str.w r12, [r2, #1636]
      movw.w r10, #0x27f4
      movt.w r10, #0x003d
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1640 
      add.w r1, r1, #1640 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1640]
      str.w r6, [r2, #1644]
      str.w r7, [r2, #1648]
      str.w r1, [r2, #1652]
      str.w r12, [r2, #1656]
      movw.w r10, #0xb80d
      movt.w r10, #0x0087
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1660 
      add.w r1, r1, #1660 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1660]
      str.w r6, [r2, #1664]
      str.w r7, [r2, #1668]
      str.w r1, [r2, #1672]
      str.w r12, [r2, #1676]
      movw.w r10, #0x8a4c
      movt.w r10, #0x00be
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1680 
      add.w r1, r1, #1680 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1680]
      str.w r6, [r2, #1684]
      str.w r7, [r2, #1688]
      str.w r1, [r2, #1692]
      str.w r12, [r2, #1696]
      movw.w r10, #0x55b5
      movt.w r10, #0x0006
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1700 
      add.w r1, r1, #1700 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1700]
      str.w r6, [r2, #1704]
      str.w r7, [r2, #1708]
      str.w r1, [r2, #1712]
      str.w r12, [r2, #1716]
      movw.w r10, #0xae31
      movt.w r10, #0x0013
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1720 
      add.w r1, r1, #1720 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1720]
      str.w r6, [r2, #1724]
      str.w r7, [r2, #1728]
      str.w r1, [r2, #1732]
      str.w r12, [r2, #1736]
      movw.w r10, #0x31d0
      movt.w r10, #0x00b1
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1740 
      add.w r1, r1, #1740 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1740]
      str.w r6, [r2, #1744]
      str.w r7, [r2, #1748]
      str.w r1, [r2, #1752]
      str.w r12, [r2, #1756]
      movw.w r10, #0x8785
      movt.w r10, #0x00b7
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1760 
      add.w r1, r1, #1760 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1760]
      str.w r6, [r2, #1764]
      str.w r7, [r2, #1768]
      str.w r1, [r2, #1772]
      str.w r12, [r2, #1776]
      movw.w r10, #0x587c
      movt.w r10, #0x000d
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1780 
      add.w r1, r1, #1780 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1780]
      str.w r6, [r2, #1784]
      str.w r7, [r2, #1788]
      str.w r1, [r2, #1792]
      str.w r12, [r2, #1796]
      movw.w r10, #0x9774
      movt.w r10, #0x0041
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1800 
      add.w r1, r1, #1800 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1800]
      str.w r6, [r2, #1804]
      str.w r7, [r2, #1808]
      str.w r1, [r2, #1812]
      str.w r12, [r2, #1816]
      movw.w r10, #0x488d
      movt.w r10, #0x0083
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1820 
      add.w r1, r1, #1820 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1820]
      str.w r6, [r2, #1824]
      str.w r7, [r2, #1828]
      str.w r1, [r2, #1832]
      str.w r12, [r2, #1836]
      movw.w r10, #0x9b00
      movt.w r10, #0x0068
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1840 
      add.w r1, r1, #1840 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1840]
      str.w r6, [r2, #1844]
      str.w r7, [r2, #1848]
      str.w r1, [r2, #1852]
      str.w r12, [r2, #1856]
      movw.w r10, #0x4501
      movt.w r10, #0x005c
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1860 
      add.w r1, r1, #1860 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1860]
      str.w r6, [r2, #1864]
      str.w r7, [r2, #1868]
      str.w r1, [r2, #1872]
      str.w r12, [r2, #1876]
      movw.w r10, #0xad8d
      movt.w r10, #0x001a
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1880 
      add.w r1, r1, #1880 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1880]
      str.w r6, [r2, #1884]
      str.w r7, [r2, #1888]
      str.w r1, [r2, #1892]
      str.w r12, [r2, #1896]
      movw.w r10, #0x3274
      movt.w r10, #0x00aa
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1900 
      add.w r1, r1, #1900 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1900]
      str.w r6, [r2, #1904]
      str.w r7, [r2, #1908]
      str.w r1, [r2, #1912]
      str.w r12, [r2, #1916]
      movw.w r10, #0x583f
      movt.w r10, #0x005d
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1920 
      add.w r1, r1, #1920 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1920]
      str.w r6, [r2, #1924]
      str.w r7, [r2, #1928]
      str.w r1, [r2, #1932]
      str.w r12, [r2, #1936]
      movw.w r10, #0x87c2
      movt.w r10, #0x0067
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1940 
      add.w r1, r1, #1940 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1940]
      str.w r6, [r2, #1944]
      str.w r7, [r2, #1948]
      str.w r1, [r2, #1952]
      str.w r12, [r2, #1956]
      movw.w r10, #0x57a6
      movt.w r10, #0x00bd
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1960 
      add.w r1, r1, #1960 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1960]
      str.w r6, [r2, #1964]
      str.w r7, [r2, #1968]
      str.w r1, [r2, #1972]
      str.w r12, [r2, #1976]
      movw.w r10, #0x885b
      movt.w r10, #0x0007
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #1980 
      add.w r1, r1, #1980 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #1980]
      str.w r6, [r2, #1984]
      str.w r7, [r2, #1988]
      str.w r1, [r2, #1992]
      str.w r12, [r2, #1996]
      movw.w r10, #0x101d
      movt.w r10, #0x006f
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2000 
      add.w r1, r1, #2000 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2000]
      str.w r6, [r2, #2004]
      str.w r7, [r2, #2008]
      str.w r1, [r2, #2012]
      str.w r12, [r2, #2016]
      movw.w r10, #0xcfe4
      movt.w r10, #0x0055
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2020 
      add.w r1, r1, #2020 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2020]
      str.w r6, [r2, #2024]
      str.w r7, [r2, #2028]
      str.w r1, [r2, #2032]
      str.w r12, [r2, #2036]
      movw.w r10, #0x63b5
      movt.w r10, #0x0024
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2040 
      add.w r1, r1, #2040 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2040]
      str.w r6, [r2, #2044]
      str.w r7, [r2, #2048]
      str.w r1, [r2, #2052]
      str.w r12, [r2, #2056]
      movw.w r10, #0x7c4c
      movt.w r10, #0x00a0
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2060 
      add.w r1, r1, #2060 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2060]
      str.w r6, [r2, #2064]
      str.w r7, [r2, #2068]
      str.w r1, [r2, #2072]
      str.w r12, [r2, #2076]
      movw.w r10, #0xaf97
      movt.w r10, #0x0074
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2080 
      add.w r1, r1, #2080 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2080]
      str.w r6, [r2, #2084]
      str.w r7, [r2, #2088]
      str.w r1, [r2, #2092]
      str.w r12, [r2, #2096]
      movw.w r10, #0x306a
      movt.w r10, #0x0050
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2100 
      add.w r1, r1, #2100 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2100]
      str.w r6, [r2, #2104]
      str.w r7, [r2, #2108]
      str.w r1, [r2, #2112]
      str.w r12, [r2, #2116]
      movw.w r10, #0xccb5
      movt.w r10, #0x002b
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2120 
      add.w r1, r1, #2120 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2120]
      str.w r6, [r2, #2124]
      str.w r7, [r2, #2128]
      str.w r1, [r2, #2132]
      str.w r12, [r2, #2136]
      movw.w r10, #0x134c
      movt.w r10, #0x0099
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2140 
      add.w r1, r1, #2140 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2140]
      str.w r6, [r2, #2144]
      str.w r7, [r2, #2148]
      str.w r1, [r2, #2152]
      str.w r12, [r2, #2156]
      movw.w r10, #0x1942
      movt.w r10, #0x005a
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2160 
      add.w r1, r1, #2160 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2160]
      str.w r6, [r2, #2164]
      str.w r7, [r2, #2168]
      str.w r1, [r2, #2172]
      str.w r12, [r2, #2176]
      movw.w r10, #0xc6bf
      movt.w r10, #0x006a
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2180 
      add.w r1, r1, #2180 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2180]
      str.w r6, [r2, #2184]
      str.w r7, [r2, #2188]
      str.w r1, [r2, #2192]
      str.w r12, [r2, #2196]
      movw.w r10, #0xa6b3
      movt.w r10, #0x007f
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2200 
      add.w r1, r1, #2200 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2200]
      str.w r6, [r2, #2204]
      str.w r7, [r2, #2208]
      str.w r1, [r2, #2212]
      str.w r12, [r2, #2216]
      movw.w r10, #0x394e
      movt.w r10, #0x0045
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2220 
      add.w r1, r1, #2220 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2220]
      str.w r6, [r2, #2224]
      str.w r7, [r2, #2228]
      str.w r1, [r2, #2232]
      str.w r12, [r2, #2236]
      movw.w r10, #0x000d
      movt.w r10, #0x00b0
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2240 
      add.w r1, r1, #2240 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2240]
      str.w r6, [r2, #2244]
      str.w r7, [r2, #2248]
      str.w r1, [r2, #2252]
      str.w r12, [r2, #2256]
      movw.w r10, #0xdff4
      movt.w r10, #0x0014
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2260 
      add.w r1, r1, #2260 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2260]
      str.w r6, [r2, #2264]
      str.w r7, [r2, #2268]
      str.w r1, [r2, #2272]
      str.w r12, [r2, #2276]
      movw.w r10, #0x55f8
      movt.w r10, #0x008b
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2280 
      add.w r1, r1, #2280 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2280]
      str.w r6, [r2, #2284]
      str.w r7, [r2, #2288]
      str.w r1, [r2, #2292]
      str.w r12, [r2, #2296]
      movw.w r10, #0x8a09
      movt.w r10, #0x0039
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2300 
      add.w r1, r1, #2300 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2300]
      str.w r6, [r2, #2304]
      str.w r7, [r2, #2308]
      str.w r1, [r2, #2312]
      str.w r12, [r2, #2316]
      movw.w r10, #0x631a
      movt.w r10, #0x003f
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2320 
      add.w r1, r1, #2320 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2320]
      str.w r6, [r2, #2324]
      str.w r7, [r2, #2328]
      str.w r1, [r2, #2332]
      str.w r12, [r2, #2336]
      movw.w r10, #0x7ce7
      movt.w r10, #0x0085
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2340 
      add.w r1, r1, #2340 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2340]
      str.w r6, [r2, #2344]
      str.w r7, [r2, #2348]
      str.w r1, [r2, #2352]
      str.w r12, [r2, #2356]
      movw.w r10, #0x06f0
      movt.w r10, #0x00bf
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2360 
      add.w r1, r1, #2360 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2360]
      str.w r6, [r2, #2364]
      str.w r7, [r2, #2368]
      str.w r1, [r2, #2372]
      str.w r12, [r2, #2376]
      movw.w r10, #0xd911
      movt.w r10, #0x0005
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2380 
      add.w r1, r1, #2380 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2380]
      str.w r6, [r2, #2384]
      str.w r7, [r2, #2388]
      str.w r1, [r2, #2392]
      str.w r12, [r2, #2396]
      movw.w r10, #0x72b4
      movt.w r10, #0x0047
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2400 
      add.w r1, r1, #2400 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2400]
      str.w r6, [r2, #2404]
      str.w r7, [r2, #2408]
      str.w r1, [r2, #2412]
      str.w r12, [r2, #2416]
      movw.w r10, #0x6d4d
      movt.w r10, #0x007d
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2420 
      add.w r1, r1, #2420 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2420]
      str.w r6, [r2, #2424]
      str.w r7, [r2, #2428]
      str.w r1, [r2, #2432]
      str.w r12, [r2, #2436]
      movw.w r10, #0x48f9
      movt.w r10, #0x004f
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2440 
      add.w r1, r1, #2440 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2440]
      str.w r6, [r2, #2444]
      str.w r7, [r2, #2448]
      str.w r1, [r2, #2452]
      str.w r12, [r2, #2456]
      movw.w r10, #0x9708
      movt.w r10, #0x0075
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2460 
      add.w r1, r1, #2460 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2460]
      str.w r6, [r2, #2464]
      str.w r7, [r2, #2468]
      str.w r1, [r2, #2472]
      str.w r12, [r2, #2476]
      movw.w r10, #0x2454
      movt.w r10, #0x002e
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2480 
      add.w r1, r1, #2480 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2480]
      str.w r6, [r2, #2484]
      str.w r7, [r2, #2488]
      str.w r1, [r2, #2492]
      str.w r12, [r2, #2496]
      movw.w r10, #0xbbad
      movt.w r10, #0x0096
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2500 
      add.w r1, r1, #2500 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2500]
      str.w r6, [r2, #2504]
      str.w r7, [r2, #2508]
      str.w r1, [r2, #2512]
      str.w r12, [r2, #2516]
      movw.w r10, #0xaeda
      movt.w r10, #0x0012
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2520 
      add.w r1, r1, #2520 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2520]
      str.w r6, [r2, #2524]
      str.w r7, [r2, #2528]
      str.w r1, [r2, #2532]
      str.w r12, [r2, #2536]
      movw.w r10, #0x3127
      movt.w r10, #0x00b2
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2540 
      add.w r1, r1, #2540 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2540]
      str.w r6, [r2, #2544]
      str.w r7, [r2, #2548]
      str.w r1, [r2, #2552]
      str.w r12, [r2, #2556]
      movw.w r10, #0x5a08
      movt.w r10, #0x000a
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2560 
      add.w r1, r1, #2560 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2560]
      str.w r6, [r2, #2564]
      str.w r7, [r2, #2568]
      str.w r1, [r2, #2572]
      str.w r12, [r2, #2576]
      movw.w r10, #0x85f9
      movt.w r10, #0x00ba
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2580 
      add.w r1, r1, #2580 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2580]
      str.w r6, [r2, #2584]
      str.w r7, [r2, #2588]
      str.w r1, [r2, #2592]
      str.w r12, [r2, #2596]
      movw.w r10, #0xd71f
      movt.w r10, #0x00a7
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2600 
      add.w r1, r1, #2600 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2600]
      str.w r6, [r2, #2604]
      str.w r7, [r2, #2608]
      str.w r1, [r2, #2612]
      str.w r12, [r2, #2616]
      movw.w r10, #0x08e2
      movt.w r10, #0x001d
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2620 
      add.w r1, r1, #2620 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2620]
      str.w r6, [r2, #2624]
      str.w r7, [r2, #2628]
      str.w r1, [r2, #2632]
      str.w r12, [r2, #2636]
      movw.w r10, #0xdfbe
      movt.w r10, #0x00b2
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2640 
      add.w r1, r1, #2640 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2640]
      str.w r6, [r2, #2644]
      str.w r7, [r2, #2648]
      str.w r1, [r2, #2652]
      str.w r12, [r2, #2656]
      movw.w r10, #0x0043
      movt.w r10, #0x0012
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2660 
      add.w r1, r1, #2660 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2660]
      str.w r6, [r2, #2664]
      str.w r7, [r2, #2668]
      str.w r1, [r2, #2672]
      str.w r12, [r2, #2676]
      movw.w r10, #0x2430
      movt.w r10, #0x000b
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2680 
      add.w r1, r1, #2680 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2680]
      str.w r6, [r2, #2684]
      str.w r7, [r2, #2688]
      str.w r1, [r2, #2692]
      str.w r12, [r2, #2696]
      movw.w r10, #0xbbd1
      movt.w r10, #0x00b9
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2700 
      add.w r1, r1, #2700 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2700]
      str.w r6, [r2, #2704]
      str.w r7, [r2, #2708]
      str.w r1, [r2, #2712]
      str.w r12, [r2, #2716]
      movw.w r10, #0xdc13
      movt.w r10, #0x0006
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2720 
      add.w r1, r1, #2720 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2720]
      str.w r6, [r2, #2724]
      str.w r7, [r2, #2728]
      str.w r1, [r2, #2732]
      str.w r12, [r2, #2736]
      movw.w r10, #0x03ee
      movt.w r10, #0x00be
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2740 
      add.w r1, r1, #2740 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2740]
      str.w r6, [r2, #2744]
      str.w r7, [r2, #2748]
      str.w r1, [r2, #2752]
      str.w r12, [r2, #2756]
      movw.w r10, #0x3607
      movt.w r10, #0x0079
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2760 
      add.w r1, r1, #2760 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2760]
      str.w r6, [r2, #2764]
      str.w r7, [r2, #2768]
      str.w r1, [r2, #2772]
      str.w r12, [r2, #2776]
      movw.w r10, #0xa9fa
      movt.w r10, #0x004b
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2780 
      add.w r1, r1, #2780 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2780]
      str.w r6, [r2, #2784]
      str.w r7, [r2, #2788]
      str.w r1, [r2, #2792]
      str.w r12, [r2, #2796]
      movw.w r10, #0xea3f
      movt.w r10, #0x0017
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2800 
      add.w r1, r1, #2800 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2800]
      str.w r6, [r2, #2804]
      str.w r7, [r2, #2808]
      str.w r1, [r2, #2812]
      str.w r12, [r2, #2816]
      movw.w r10, #0xf5c2
      movt.w r10, #0x00ac
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2820 
      add.w r1, r1, #2820 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2820]
      str.w r6, [r2, #2824]
      str.w r7, [r2, #2828]
      str.w r1, [r2, #2832]
      str.w r12, [r2, #2836]
      movw.w r10, #0xbfbb
      movt.w r10, #0x0033
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2840 
      add.w r1, r1, #2840 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2840]
      str.w r6, [r2, #2844]
      str.w r7, [r2, #2848]
      str.w r1, [r2, #2852]
      str.w r12, [r2, #2856]
      movw.w r10, #0x2046
      movt.w r10, #0x0091
      vmov.w s4, r10
      vmov.w r0, s0
      vmov.w r1, s1
      add.w r0, r0, #2860 
      add.w r1, r1, #2860 
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #4]
      ldr.w r4, [r0, #8]
      ldr.w r5, [r0, #12]
      ldr.w r6, [r0, #16]
      ldr.w r7, [r1, #0]
      ldr.w r8, [r1, #4]
      ldr.w r9, [r1, #8]
      ldr.w r10, [r1, #12]
      ldr.w r12, [r1, #16]
      vmov.w s3, r10
      smull.w r0, r1, r3, r12
      smlal.w r0, r1, r4, r10
      smlal.w r0, r1, r5, r9
      smlal.w r0, r1, r6, r8
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1, r2, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s5, r1
      vmov.w r10, s3
      smull.w r0, r1, r4, r12
      smlal.w r0, r1, r5, r10
      smlal.w r0, r1, r6, r9
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r8
      smlal.w r0, r1,r3, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s6, r1
      vmov.w r10, s3
      smull.w r0, r1, r5, r12
      smlal.w r0, r1, r6, r10
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w  r10, s4
      smull.w r0, r1, r1, r10
      smlal.w r0, r1,r2, r9
      smlal.w r0, r1,r3, r8
      smlal.w r0, r1,r4, r7
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w s7, r1
      smull.w r0, r1, r6, r12
      mul.w r10, r0, lr
      smlal.w r0, r1, r10, r11
      vmov.w r10, s3
      smull.w r0, r12,r2, r12
      smlal.w r0, r12,r3, r10
      smlal.w r0, r12,r4, r9
      smlal.w r0, r12,r5, r8
      smlal.w r0, r12,r6, r7
      vmov.w r6, s4
      smull.w r6, r1, r1, r6
      smlal.w r6, r1,r2, r10
      smlal.w r6, r1,r3, r9
      smlal.w r6, r1,r4, r8
      smlal.w r6, r1,r5, r7
      mul.w r10, r0, lr
      smlal.w r0, r12, r10, r11
      mul.w r10, r6, lr
      smlal.w r6, r1, r10, r11
      vmov.w r5, s5
      vmov.w r6, s6
      vmov.w r7, s7
      vmov.w r2, s2
      str.w r5, [r2, #2860]
      str.w r6, [r2, #2864]
      str.w r7, [r2, #2868]
      str.w r1, [r2, #2872]
      str.w r12, [r2, #2876]
      pop.w {r1-r12, pc}

