.p2align 1,,3
.syntax unified
.text

.global last_mod677_2048
.type last_mod677_2048, %function
@ void last_mod677_2048(int32_t *input, int16_t* output)
last_mod677_2048:
      push.w {r1-r12, lr}
      movw.w r12, #0x07ff
      movt.w r12, #0x07ff
      movw.w r10, #0x014d
      movw.w r11, #0xe001
      movt.w r11, #0x00c4
      ldr.w r2, [r0, #0]
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #0]
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      ldr.w r3, [r0, #2708]
      ldr.w r4, [r0, #4]!
      ldr.w r5, [r0, #2708]
      ldr.w r6, [r0, #4]!
      ldr.w r7, [r0, #2708]
      ldr.w r8, [r0, #4]!
      ldr.w r9, [r0, #2708]
      add.w r2, r2, r3
      add.w r4, r4, r5
      add.w r6, r6, r7
      add.w r8, r8, r9
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      smmulr.w r9, r4, r10
      mls.w r4, r9, r11, r4
      smmulr.w r9, r6, r10
      mls.w r6, r9, r11, r6
      smmulr.w r9, r8, r10
      mls.w r8, r9, r11, r8
      pkhbt.w r2, r2, r4, lsl #16
      pkhbt.w r6, r6, r8, lsl #16
      and.w   r2, r12
      and.w   r6, r12
      str.w r2, [r1, #4]!
      str.w r6, [r1, #4]!
      ldr.w r2, [r0, #4]!
      smmulr.w r9, r2, r10
      mls.w r2, r9, r11, r2
      and.w r2, r12
      strh.w r2, [r1, #4]!
      pop.w {r1-r12, pc}