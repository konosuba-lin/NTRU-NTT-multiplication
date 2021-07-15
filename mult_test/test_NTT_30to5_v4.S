.p2align 2,,3
.syntax unified
.text

.macro montgomery_mul a, b, lower, upper, tmp, Mprime, M
      smull.w \lower, \upper, \a, \b
      mul.w \tmp, \lower, \Mprime
      smlal.w \lower, \upper, \tmp, \M
.endm

.global NTT_forward_30to5
.type NTT_forward_30to5, %function
@ void NTT_forward_30to5(int32_t *input, int32_t* output)
NTT_forward_30to5:
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
      add.w  r9, r0 ,20
      vmov.w s9, r9
L0:
      ldr.w r12, [r0, #0]
      ldr.w r2, [r0, #20]
      ldr.w r3, [r0, #40]
      ldr.w r4, [r0, #60]
      ldr.w r5, [r0, #80]
      ldr.w r6, [r0, #100]
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
      str.w r9, [r1, #40]
      add.w r10, r10, r9
      add.w r9, r12, r12, lsl #1
      subs.w r9, r9, r10
      str.w r9, [r1, #80]
      add.w r12, r2, r4
      add.w r12, r12, r6
      str.w r12, [r1, #20]
      smull.w r9, r2, r2, r7
      smlal.w r9, r2, r6, r8
      mul.w r10, r9, lr
      smlal.w r9, r2, r10, r11
      add.w r9, r4, r2
      str.w r9, [r1, #60]
      add.w r12, r12, r9
      add.w r9, r4, r4, lsl #1
      subs.w r9, r9, r12
      str.w r9, [r1, #100]
      add.w r1, r1, #4 
      vmov.w r9, s9
      cmp.w  r0, r9
      blt L0

      add.w r0, r0, #100 
      add.w r1, r1, #100 
      movw.w r2, #0x3607
      movt.w r2, #0x0079
      movw.w r3, #0x5182
      movt.w r3, #0x0082
      movw.w r4, #0x6383
      movt.w r4, #0x00be
      movw.w r5, #0xa440
      movt.w r5, #0x0092
      movw.w r6, #0xb80d
      movt.w r6, #0x0087
      push.w {r2-r6}
      movw.w r2, #0xdfbe
      movt.w r2, #0x00b2
      movw.w r3, #0x6554
      movt.w r3, #0x000b
      movw.w r4, #0x0eb7
      movt.w r4, #0x0023
      movw.w r5, #0x6a2b
      movt.w r5, #0x000f
      movw.w r6, #0xfb2d
      movt.w r6, #0x002b
      push.w {r2-r6}
      movw.w r2, #0xaeda
      movt.w r2, #0x0012
      movw.w r3, #0xc567
      movt.w r3, #0x003f
      movw.w r4, #0x8263
      movt.w r4, #0x0068
      movw.w r5, #0xf876
      movt.w r5, #0x0067
      movw.w r6, #0xad8d
      movt.w r6, #0x001a
      push.w {r2-r6}
      movw.w r2, #0x72b4
      movt.w r2, #0x0047
      movw.w r3, #0x42a4
      movt.w r3, #0x0037
      movw.w r4, #0x4569
      movt.w r4, #0x00ba
      movw.w r5, #0xaeb9
      movt.w r5, #0x0073
      movw.w r6, #0xae31
      movt.w r6, #0x0013
      push.w {r2-r6}
      movw.w r2, #0x55f8
      movt.w r2, #0x008b
      movw.w r3, #0x2b6c
      movt.w r3, #0x0004
      movw.w r4, #0x05e5
      movt.w r4, #0x0062
      movw.w r5, #0x8390
      movt.w r5, #0x001d
      movw.w r6, #0x7c4c
      movt.w r6, #0x00a0
      push.w {r2-r6}
      movw.w r2, #0x1942
      movt.w r2, #0x005a
      movw.w r3, #0x4591
      movt.w r3, #0x00bf
      movw.w r4, #0x36b2
      movt.w r4, #0x0097
      movw.w r5, #0x606a
      movt.w r5, #0x0088
      movw.w r6, #0x583f
      movt.w r6, #0x005d
      push.w {r2-r6}
      movw.w r2, #0x63b5
      movt.w r2, #0x0024
      movw.w r3, #0x67b4
      movt.w r3, #0x0052
      movw.w r4, #0x705d
      movt.w r4, #0x00ab
      movw.w r5, #0xe78b
      movt.w r5, #0x005c
      movw.w r6, #0xdff4
      movt.w r6, #0x0014
      push.w {r2-r6}
      movw.w r2, #0x583f
      movt.w r2, #0x005d
      movw.w r3, #0x4d17
      movt.w r3, #0x003f
      movw.w r4, #0xecb1
      movt.w r4, #0x009e
      movw.w r5, #0xc72e
      movt.w r5, #0x0016
      movw.w r6, #0x8a09
      movt.w r6, #0x0039
      push.w {r2-r6}
      movw.w r2, #0x9774
      movt.w r2, #0x0041
      movw.w r3, #0x829a
      movt.w r3, #0x00b1
      movw.w r4, #0x0e2e
      movt.w r4, #0x0046
      movw.w r5, #0x7f97
      movt.w r5, #0x003c
      movw.w r6, #0x2454
      movt.w r6, #0x002e
      push.w {r2-r6}
      movw.w r2, #0x8a4c
      movt.w r2, #0x00be
      movw.w r3, #0x3316
      movt.w r3, #0x005d
      movw.w r4, #0x7b16
      movt.w r4, #0x0064
      movw.w r5, #0xe3fa
      movt.w r5, #0x00a5
      movw.w r6, #0x08e2
      movt.w r6, #0x001d
      push.w {r2-r6}
      movw.w r2, #0x101d
      movt.w r2, #0x007d
      movw.w r3, #0xdcc0
      movt.w r3, #0x003e
      movw.w r4, #0x9e8a
      movt.w r4, #0x002c
      movw.w r5, #0x0e6b
      movt.w r5, #0x00a2
      movw.w r6, #0x2430
      movt.w r6, #0x000b
      push.w {r2-r6}
      movw.w r2, #0x5120
      movt.w r2, #0x0059
      movw.w r3, #0x11bb
      movt.w r3, #0x0020
      movw.w r4, #0x6e66
      movt.w r4, #0x008a
      movw.w r5, #0x75d6
      movt.w r5, #0x00b5
      movw.w r6, #0x3607
      movt.w r6, #0x0079
      push.w {r2-r6}
      movw.w r2, #0x99e4
      movt.w r2, #0x0076
      movw.w r3, #0x9e17
      movt.w r3, #0x001d
      movw.w r4, #0xdfbe
      movt.w r4, #0x00b2
      movw.w r5, #0x3548
      movt.w r5, #0x0068
      movw.w r6, #0x6dd9
      movt.w r6, #0x00ad
      push.w {r2-r6}
      movw.w r2, #0x6506
      movt.w r2, #0x0097
      movw.w r3, #0x0aa9
      movt.w r3, #0x0084
      movw.w r4, #0xea3f
      movt.w r4, #0x0017
      movw.w r5, #0x032a
      movt.w r5, #0x0081
      movw.w r6, #0xd6ed
      movt.w r6, #0x009b
      push.w {r2-r6}
      movw.w r2, #0x6383
      movt.w r2, #0x00be
      movw.w r3, #0xa5da
      movt.w r3, #0x0078
      movw.w r4, #0x2430
      movt.w r4, #0x000b
      movw.w r5, #0x94d8
      movt.w r5, #0x0018
      movw.w r6, #0x4177
      movt.w r6, #0x0098
      push.w {r2-r6}
      movw.w r2, #0x36b2
      movt.w r2, #0x0097
      movw.w r3, #0xb17d
      movt.w r3, #0x007c
      movw.w r4, #0x2046
      movt.w r4, #0x0091
      movw.w r5, #0x96b4
      movt.w r5, #0x0080
      movw.w r6, #0xecb1
      movt.w r6, #0x009e
      push.w {r2-r6}
      movw.w r2, #0x407d
      movt.w r2, #0x0093
      movw.w r3, #0xe6fa
      movt.w r3, #0x00a9
      movw.w r4, #0x03ee
      movt.w r4, #0x00be
      movw.w r5, #0xf7d6
      movt.w r5, #0x0046
      movw.w r6, #0xeae6
      movt.w r6, #0x008c
      push.w {r2-r6}
      movw.w r2, #0xe816
      movt.w r2, #0x0034
      movw.w r3, #0x8d68
      movt.w r3, #0x0022
      movw.w r4, #0x3607
      movt.w r4, #0x0079
      movw.w r5, #0x8945
      movt.w r5, #0x00c3
      movw.w r6, #0x54fc
      movt.w r6, #0x0022
      push.w {r2-r6}
      movw.w r2, #0x6e66
      movt.w r2, #0x008a
      movw.w r3, #0xb288
      movt.w r3, #0x003c
      movw.w r4, #0x101d
      movt.w r4, #0x007d
      movw.w r5, #0x4b29
      movt.w r5, #0x00ac
      movw.w r6, #0x6383
      movt.w r6, #0x00be
      push.w {r2-r6}
      movw.w r2, #0x705d
      movt.w r2, #0x00ab
      movw.w r3, #0x7bd0
      movt.w r3, #0x0092
      movw.w r4, #0x93b4
      movt.w r4, #0x003f
      movw.w r5, #0x2b8c
      movt.w r5, #0x0099
      movw.w r6, #0xa94f
      movt.w r6, #0x002d
      push.w {r2-r6}
      movw.w r2, #0x0914
      movt.w r2, #0x0029
      movw.w r3, #0x35fb
      movt.w r3, #0x0098
      movw.w r4, #0xa7f0
      movt.w r4, #0x000a
      movw.w r5, #0x56bc
      movt.w r5, #0x0001
      movw.w r6, #0xaec4
      movt.w r6, #0x00a3
      push.w {r2-r6}
      movw.w r2, #0xa1b6
      movt.w r2, #0x0044
      movw.w r3, #0x9e3c
      movt.w r3, #0x0063
      movw.w r4, #0xe4d4
      movt.w r4, #0x0098
      movw.w r5, #0xa11a
      movt.w r5, #0x0045
      movw.w r6, #0x81c2
      movt.w r6, #0x0042
      push.w {r2-r6}
      movw.w r2, #0x54fc
      movt.w r2, #0x0022
      movw.w r3, #0xd3da
      movt.w r3, #0x0007
      movw.w r4, #0xb80d
      movt.w r4, #0x0087
      movw.w r5, #0x5871
      movt.w r5, #0x0024
      movw.w r6, #0xa757
      movt.w r6, #0x0075
      push.w {r2-r6}
      movw.w r2, #0xf51b
      movt.w r2, #0x0037
      movw.w r3, #0xc794
      movt.w r3, #0x00ac
      movw.w r4, #0x5120
      movt.w r4, #0x0059
      movw.w r5, #0xdcd7
      movt.w r5, #0x0043
      movw.w r6, #0xe816
      movt.w r6, #0x0034
      push.w {r2-r6}
      movw.w r2, #0x4591
      movt.w r2, #0x00bf
      movw.w r3, #0x606a
      movt.w r3, #0x0088
      movw.w r4, #0xb17d
      movt.w r4, #0x007c
      movw.w r5, #0x252c
      movt.w r5, #0x0022
      movw.w r6, #0x4d17
      movt.w r6, #0x003f
      push.w {r2-r6}
      movw.w r2, #0x3316
      movt.w r2, #0x005d
      movw.w r3, #0xe3fa
      movt.w r3, #0x00a5
      movw.w r4, #0xc948
      movt.w r4, #0x0055
      movw.w r5, #0x8f56
      movt.w r5, #0x0036
      movw.w r6, #0x9d5d
      movt.w r6, #0x008d
      push.w {r2-r6}
      movw.w r2, #0x42a4
      movt.w r2, #0x0037
      movw.w r3, #0xaeb9
      movt.w r3, #0x0073
      movw.w r4, #0xd45e
      movt.w r4, #0x00c0
      movw.w r5, #0xbda9
      movt.w r5, #0x0074
      movw.w r6, #0x5d67
      movt.w r6, #0x0013
      push.w {r2-r6}
      movw.w r2, #0x67b4
      movt.w r2, #0x0052
      movw.w r3, #0xe78b
      movt.w r3, #0x005c
      movw.w r4, #0x7bd0
      movt.w r4, #0x0092
      movw.w r5, #0x5781
      movt.w r5, #0x0056
      movw.w r6, #0xc5dc
      movt.w r6, #0x0009
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
      movw.w r2, #0x8d68
      movt.w r2, #0x0022
      movw.w r3, #0x8945
      movt.w r3, #0x00c3
      movw.w r4, #0x5182
      movt.w r4, #0x0082
      movw.w r5, #0x2258
      movt.w r5, #0x0050
      movw.w r6, #0xd3da
      movt.w r6, #0x0007
      push.w {r2-r6}
      movw.w r2, #0x9e3c
      movt.w r2, #0x0063
      movw.w r3, #0xa11a
      movt.w r3, #0x0045
      movw.w r4, #0xcb05
      movt.w r4, #0x001e
      movw.w r5, #0x3529
      movt.w r5, #0x0006
      movw.w r6, #0x41ea
      movt.w r6, #0x00a7
      push.w {r2-r6}
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
      movw.w r2, #0x9e17
      movt.w r2, #0x001d
      movw.w r3, #0x3548
      movt.w r3, #0x0068
      movw.w r4, #0x6554
      movt.w r4, #0x000b
      movw.w r5, #0xb482
      movt.w r5, #0x0058
      movw.w r6, #0x97bf
      movt.w r6, #0x0034
      push.w {r2-r6}
      movw.w r2, #0xc794
      movt.w r2, #0x00ac
      movw.w r3, #0xdcd7
      movt.w r3, #0x0043
      movw.w r4, #0x11bb
      movt.w r4, #0x0020
      movw.w r5, #0x50ab
      movt.w r5, #0x008e
      movw.w r6, #0x8d68
      movt.w r6, #0x0022
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
      movw.w r2, #0xe78b
      movt.w r2, #0x005c
      movw.w r3, #0x5781
      movt.w r3, #0x0056
      movw.w r4, #0x2b8c
      movt.w r4, #0x0099
      movw.w r5, #0x2b7a
      movt.w r5, #0x007c
      movw.w r6, #0xfc07
      movt.w r6, #0x001e
      push.w {r2-r6}
      movw.w r2, #0x8945
      movt.w r2, #0x00c3
      movw.w r3, #0x2258
      movt.w r3, #0x0050
      movw.w r4, #0xa440
      movt.w r4, #0x0092
      movw.w r5, #0x224a
      movt.w r5, #0x002e
      movw.w r6, #0x5871
      movt.w r6, #0x0024
      push.w {r2-r6}
      movw.w r2, #0x606a
      movt.w r2, #0x0088
      movw.w r3, #0x252c
      movt.w r3, #0x0022
      movw.w r4, #0x96b4
      movt.w r4, #0x0080
      movw.w r5, #0x490f
      movt.w r5, #0x006c
      movw.w r6, #0xc72e
      movt.w r6, #0x0016
      push.w {r2-r6}
      movw.w r2, #0xdcd7
      movt.w r2, #0x0043
      movw.w r3, #0x50ab
      movt.w r3, #0x008e
      movw.w r4, #0x75d6
      movt.w r4, #0x00b5
      movw.w r5, #0x464a
      movt.w r5, #0x0019
      movw.w r6, #0x8945
      movt.w r6, #0x00c3
      push.w {r2-r6}
      movw.w r2, #0x50ab
      movt.w r2, #0x008e
      movw.w r3, #0x464a
      movt.w r3, #0x0019
      movw.w r4, #0xc264
      movt.w r4, #0x001c
      movw.w r5, #0xb487
      movt.w r5, #0x0048
      movw.w r6, #0x2258
      movt.w r6, #0x0050
      push.w {r2-r6}
      movw.w r2, #0xb487
      movt.w r2, #0x0048
      movw.w r3, #0x8f59
      movt.w r3, #0x0085
      movw.w r4, #0xe31c
      movt.w r4, #0x0022
      movw.w r5, #0x4dc4
      movt.w r5, #0x00aa
      movw.w r6, #0x99b7
      movt.w r6, #0x00ab
      push.w {r2-r6}
      movw.w r2, #0x2258
      movt.w r2, #0x0050
      movw.w r3, #0x224a
      movt.w r3, #0x002e
      movw.w r4, #0x7b16
      movt.w r4, #0x003a
      movw.w r5, #0x99b7
      movt.w r5, #0x00ab
      movw.w r6, #0xbad5
      movt.w r6, #0x00a2
      push.w {r2-r6}
      movw.w r2, #0x464a
      movt.w r2, #0x0019
      movw.w r3, #0xb487
      movt.w r3, #0x0048
      movw.w r4, #0x81cf
      movt.w r4, #0x000b
      movw.w r5, #0x8f59
      movt.w r5, #0x0085
      movw.w r6, #0x224a
      movt.w r6, #0x002e
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
      add.w  r9, r0 ,20
      vmov.w s9, r9
L2:
      ldr.w r12, [r0, #0]
      ldr.w r2, [r0, #20]
      ldr.w r3, [r0, #40]
      ldr.w r4, [r0, #60]
      ldr.w r5, [r0, #80]
      ldr.w r6, [r0, #100]
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
      str.w r9, [r1, #40]
      add.w r10, r10, r9
      add.w r9, r12, r12, lsl #1
      subs.w r9, r9, r10
      str.w r9, [r1, #80]
      add.w r12, r2, r4
      add.w r12, r12, r6
      str.w r12, [r1, #20]
      smull.w r9, r2, r2, r7
      smlal.w r9, r2, r6, r8
      mul.w r10, r9, lr
      smlal.w r9, r2, r10, r11
      add.w r9, r4, r2
      str.w r9, [r1, #60]
      add.w r12, r12, r9
      add.w r9, r4, r4, lsl #1
      subs.w r9, r9, r12
      str.w r9, [r1, #100]
      add.w r1, r1, #4 
      vmov.w r9, s9
      cmp.w  r0, r9
      blt L2
      add.w r0, r0, #100 
      add.w r1, r1, #100 
      vmov.w r9, s10
      cmp.w  r0, r9
      blt L1
      pop.w {r1-r12, pc}

