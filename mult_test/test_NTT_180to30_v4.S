.p2align 2,,3
.syntax unified
.text

.macro montgomery_mul a, b, lower, upper, tmp, Mprime, M
      smull.w \lower, \upper, \a, \b
      mul.w \tmp, \lower, \Mprime
      smlal.w \lower, \upper, \tmp, \M
.endm

.global NTT_forward_180to30
.type NTT_forward_180to30, %function
@ void NTT_forward_180to30(int32_t *input, int32_t* output, int32_t *delta)
NTT_forward_180to30:
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
      vmov.w s10, r9
      add.w  r9, r0 ,120
      vmov.w s9, r9
L0:
      ldr.w r12, [r0, #0]
      ldr.w r2, [r0, #120]
      ldr.w r3, [r0, #240]
      ldr.w r4, [r0, #360]
      ldr.w r5, [r0, #480]
      ldr.w r6, [r0, #600]
      add.w r0, r0, #4 
      add.w r12, r12, r4
      subs.w r4, r12, r4, lsl #1
      add.w r5, r5, r2
      subs.w r2, r5, r2, lsl #1
      add.w r3, r3, r6
      subs.w r6, r3, r6, lsl #1
      add.w r10, r12, r5
      add.w r10, r10, r3
      str.w r10, [r1, #0]
      smull.w r9, r5, r5, r7
      smlal.w r9, r5, r3, r8
      mul.w r3, r9, lr
      smlal.w r9, r5, r3, r11
      add.w r9, r12, r5
      str.w r9, [r1, #240]
      add.w r10, r10, r9
      add.w r9, r12, r12, lsl #1
      subs.w r9, r9, r10
      str.w r9, [r1, #480]
      add.w r12, r2, r4
      add.w r12, r12, r6
      str.w r12, [r1, #120]
      smull.w r9, r2, r2, r7
      smlal.w r9, r2, r6, r8
      mul.w r10, r9, lr
      smlal.w r9, r2, r10, r11
      add.w r9, r4, r2
      str.w r9, [r1, #360]
      add.w r12, r12, r9
      add.w r9, r4, r4, lsl #1
      subs.w r9, r9, r12
      str.w r9, [r1, #600]
      add.w r1, r1, #4 
      vmov.w r9, s9
      cmp.w  r0, r9
      blt L0

      add.w r0, r0, #600 
      add.w r1, r1, #600 
      movw.w r2, #0xb17d
      movt.w r2, #0x007c
      movw.w r3, #0x96b4
      movt.w r3, #0x0080
      movw.w r4, #0xf3d3
      movt.w r4, #0x004d
      movw.w r5, #0x1d9d
      movt.w r5, #0x00a8
      movw.w r6, #0x6431
      movt.w r6, #0x0032
      push.w {r2-r6}
      movw.w r2, #0xb288
      movt.w r2, #0x003c
      movw.w r3, #0x4b29
      movt.w r3, #0x00ac
      movw.w r4, #0xdcc0
      movt.w r4, #0x003e
      movw.w r5, #0x3d7a
      movt.w r5, #0x0057
      movw.w r6, #0xa5da
      movt.w r6, #0x0078
      push.w {r2-r6}
      movw.w r2, #0x5182
      movt.w r2, #0x0082
      movw.w r3, #0xa440
      movt.w r3, #0x0092
      movw.w r4, #0xa5da
      movt.w r4, #0x0078
      movw.w r5, #0x7b16
      movt.w r5, #0x003a
      movw.w r6, #0xce46
      movt.w r6, #0x00a4
      push.w {r2-r6}
      movw.w r2, #0x11bb
      movt.w r2, #0x0020
      movw.w r3, #0x75d6
      movt.w r3, #0x00b5
      movw.w r4, #0xb288
      movt.w r4, #0x003c
      movw.w r5, #0xc264
      movt.w r5, #0x001c
      movw.w r6, #0x5182
      movt.w r6, #0x0082
      push.w {r2-r6}
      movw.w r2, #0x4b29
      movt.w r2, #0x00ac
      movw.w r3, #0x3d7a
      movt.w r3, #0x0057
      movw.w r4, #0x0e6b
      movt.w r4, #0x00a2
      movw.w r5, #0x614d
      movt.w r5, #0x0017
      movw.w r6, #0x94d8
      movt.w r6, #0x0018
      push.w {r2-r6}
      movw.w r2, #0x75d6
      movt.w r2, #0x00b5
      movw.w r3, #0xc264
      movt.w r3, #0x001c
      movw.w r4, #0x4b29
      movt.w r4, #0x00ac
      movw.w r5, #0x81cf
      movt.w r5, #0x000b
      movw.w r6, #0xa440
      movt.w r6, #0x0092
      push.w {r2-r6}
      movw.w r2, #0xc264
      movt.w r2, #0x001c
      movw.w r3, #0x81cf
      movt.w r3, #0x000b
      movw.w r4, #0x3d7a
      movt.w r4, #0x0057
      movw.w r5, #0xe31c
      movt.w r5, #0x0022
      movw.w r6, #0x7b16
      movt.w r6, #0x003a
      push.w {r2-r6}
L1:
      pop.w {r2-r6}
      vmov.w s4, r2
      vmov.w s5, r3
      vmov.w s6, r4
      vmov.w s7, r5
      vmov.w s8, r6
      add.w  r9, r0 ,120
      vmov.w s9, r9
L2:
      ldr.w r12, [r0, #0]
      ldr.w r2, [r0, #120]
      ldr.w r3, [r0, #240]
      ldr.w r4, [r0, #360]
      ldr.w r5, [r0, #480]
      ldr.w r6, [r0, #600]
      add.w r0, r0, #4 
      vmov.w r9, s4
      montgomery_mul r2, r9, r9, r2, r10, lr, r11
      vmov.w r9, s5
      montgomery_mul r3, r9, r9, r3, r10, lr, r11
      vmov.w r9, s6
      montgomery_mul r4, r9, r9, r4, r10, lr, r11
      vmov.w r9, s7
      montgomery_mul r5, r9, r9, r5, r10, lr, r11
      vmov.w r9, s8
      montgomery_mul r6, r9, r9, r6, r10, lr, r11
      add.w r12, r12, r4
      subs.w r4, r12, r4, lsl #1
      add.w r5, r5, r2
      subs.w r2, r5, r2, lsl #1
      add.w r3, r3, r6
      subs.w r6, r3, r6, lsl #1
      add.w r10, r12, r5
      add.w r10, r10, r3
      str.w r10, [r1, #0]
      smull.w r9, r5, r5, r7
      smlal.w r9, r5, r3, r8
      mul.w r3, r9, lr
      smlal.w r9, r5, r3, r11
      add.w r9, r12, r5
      str.w r9, [r1, #240]
      add.w r10, r10, r9
      add.w r9, r12, r12, lsl #1
      subs.w r9, r9, r10
      str.w r9, [r1, #480]
      add.w r12, r2, r4
      add.w r12, r12, r6
      str.w r12, [r1, #120]
      smull.w r9, r2, r2, r7
      smlal.w r9, r2, r6, r8
      mul.w r10, r9, lr
      smlal.w r9, r2, r10, r11
      add.w r9, r4, r2
      str.w r9, [r1, #360]
      add.w r12, r12, r9
      add.w r9, r4, r4, lsl #1
      subs.w r9, r9, r12
      str.w r9, [r1, #600]
      add.w r1, r1, #4 
      vmov.w r9, s9
      cmp.w  r0, r9
      blt L2
      add.w r0, r0, #600 
      add.w r1, r1, #600 
      vmov.w r9, s10
      cmp.w  r0, r9
      blt L1
      pop.w {r1-r12, pc}

