.p2align 2,,3
.syntax unified
.text

.macro montgomery_mul a, b, lower, upper, tmp, Mprime, M
      smull.w \lower, \upper, \a, \b
      mul.w \tmp, \lower, \Mprime
      smlal.w \lower, \upper, \tmp, \M
.endm

.global NTT_backward_180to30
.type NTT_backward_180to30, %function
@ void NTT_backward_180to30(int32_t *input, int32_t* output)
NTT_backward_180to30:
      push.w {r1-r12, lr}
      movw.w r11, #0xe001
      movt.w r11, #0x00c4
      movw.w lr, #0xdfff
      movt.w lr, #0x3cc4
      movw.w r7, #0xe31c
      movt.w r7, #0x0022
      movw.w r8, #0x5e32
      movt.w r8, #0x00b9
      add.w  r9, r0 ,2880
      add.w  r9, r9 ,2880
      vmov.w s11, r9
      movw.w r2, #0x9eed
      movt.w r2, #0x002c
      movw.w r3, #0x6945
      movt.w r3, #0x0030
      movw.w r4, #0x5753
      movt.w r4, #0x002c
      movw.w r5, #0xf63e
      movt.w r5, #0x0017
      movw.w r6, #0xe44d
      movt.w r6, #0x003a
      movw.w r9, #0x779a
      movt.w r9, #0x00ba
      push.w {r2-r6,r9}
      movw.w r2, #0x9eed
      movt.w r2, #0x002c
      movw.w r3, #0x8f07
      movt.w r3, #0x0031
      movw.w r4, #0xc158
      movt.w r4, #0x0064
      movw.w r5, #0xe141
      movt.w r5, #0x004b
      movw.w r6, #0x8b35
      movt.w r6, #0x001c
      movw.w r9, #0xddf1
      movt.w r9, #0x0054
      push.w {r2-r6,r9}
      movw.w r2, #0x9eed
      movt.w r2, #0x002c
      movw.w r3, #0xaeca
      movt.w r3, #0x006d
      movw.w r4, #0x043c
      movt.w r4, #0x0072
      movw.w r5, #0xddf1
      movt.w r5, #0x0054
      movw.w r6, #0x6f82
      movt.w r6, #0x0057
      movw.w r9, #0x3ecf
      movt.w r9, #0x0092
      push.w {r2-r6,r9}
      movw.w r2, #0x9eed
      movt.w r2, #0x002c
      movw.w r3, #0xa132
      movt.w r3, #0x0032
      movw.w r4, #0x74da
      movt.w r4, #0x0082
      movw.w r5, #0x8f07
      movt.w r5, #0x0031
      movw.w r6, #0xfbb4
      movt.w r6, #0x0089
      movw.w r9, #0xaeca
      movt.w r9, #0x006d
      push.w {r2-r6,r9}
      movw.w r2, #0x9eed
      movt.w r2, #0x002c
      movw.w r3, #0xc158
      movt.w r3, #0x0064
      movw.w r4, #0x8b35
      movt.w r4, #0x001c
      movw.w r5, #0x6f63
      movt.w r5, #0x00b4
      movw.w r6, #0x4114
      movt.w r6, #0x0098
      movw.w r9, #0x1ea9
      movt.w r9, #0x0060
      push.w {r2-r6,r9}
      movw.w r2, #0x9eed
      movt.w r2, #0x002c
      movw.w r3, #0x74da
      movt.w r3, #0x0082
      movw.w r4, #0xfbb4
      movt.w r4, #0x0089
      movw.w r5, #0xc158
      movt.w r5, #0x0064
      movw.w r6, #0x3a07
      movt.w r6, #0x00bc
      movw.w r9, #0x043c
      movt.w r9, #0x0072
      push.w {r2-r6,r9}
      movw.w r2, #0x9eed
      movt.w r2, #0x002c
      movw.w r3, #0xfbb4
      movt.w r3, #0x0089
      movw.w r4, #0x3a07
      movt.w r4, #0x00bc
      movw.w r5, #0x8b35
      movt.w r5, #0x001c
      movw.w r6, #0x9b1a
      movt.w r6, #0x008f
      movw.w r9, #0x6f82
      movt.w r9, #0x0057
      push.w {r2-r6,r9}
      movw.w r2, #0x9eed
      movt.w r2, #0x002c
      movw.w r3, #0x9eed
      movt.w r3, #0x002c
      movw.w r4, #0x9eed
      movt.w r4, #0x002c
      movw.w r5, #0x9eed
      movt.w r5, #0x002c
      movw.w r6, #0x9eed
      movt.w r6, #0x002c
      movw.w r9, #0x9eed
      movt.w r9, #0x002c
      push.w {r2-r6,r9}
L1:
      pop.w {r2-r6,r9}
      vmov.w s4, r2
      vmov.w s5, r3
      vmov.w s6, r4
      vmov.w s7, r5
      vmov.w s8, r6
      vmov.w s9, r9
      add.w  r9, r0 ,120
      vmov.w s10, r9
L2:
      ldr.w r12, [r0, #0]
      ldr.w r2, [r0, #120]
      ldr.w r3, [r0, #240]
      ldr.w r4, [r0, #360]
      ldr.w r5, [r0, #480]
      ldr.w r6, [r0, #600]
      add.w r0, r0, #4 
      add.w r12, r12, r2
      add.w r3, r3, r4
      add.w r5, r5, r6
      subs.w r2, r12, r2, lsl #1
      subs.w r4, r3, r4, lsl #1
      subs.w r6, r5, r6, lsl #1
      vmov.w s2, r2
      add.w r2, r12, r3
      add.w r2, r2, r5
      smull.w r9, r3, r3, r7
      smlal.w r9, r3, r5, r8
      mul.w r10, r9, lr
      smlal.w r9, r3, r10, r11
      add.w r3, r12, r3
      add.w r10, r2, r3
      add.w r9, r12, r12, lsl #1
      subs.w r5, r9, r10
      vmov.w s3, r2
      vmov.w r2, s2
      add.w r12, r2, r4
      add.w r12, r12, r6
      smull.w r9, r4, r4, r7
      smlal.w r9, r4, r6, r8
      mul.w r10, r9, lr
      smlal.w r9, r4, r10, r11
      add.w r4, r2, r4
      add.w r10, r12, r4
      add.w r9, r2, r2, lsl #1
      subs.w r6, r9, r10
      vmov.w r2, s3
      vmov.w r9, s4
      montgomery_mul r2, r9, r9, r2, r10, lr, r11
      vmov.w r9, s5
      montgomery_mul r6, r9, r9, r6, r10, lr, r11
      vmov.w r9, s6
      montgomery_mul r3, r9, r9, r3, r10, lr, r11
      vmov.w r9, s7
      montgomery_mul r12, r9, r9, r12, r10, lr, r11
      vmov.w r9, s8
      montgomery_mul r5, r9, r9, r5, r10, lr, r11
      vmov.w r9, s9
      montgomery_mul r4, r9, r9, r4, r10, lr, r11
      str.w r2, [r1, #0]
      str.w r6, [r1, #120]
      str.w r3, [r1, #240]
      str.w r12, [r1, #360]
      str.w r5, [r1, #480]
      str.w r4, [r1, #600]
      add.w r1, r1, #4 
      vmov.w r9, s10
      cmp.w  r0, r9
      blt L2
      add.w r0, r0, #600 
      add.w r1, r1, #600 
      vmov.w r9, s11
      cmp.w  r0, r9
      blt L1
      pop.w {r1-r12, pc}