.p2align 2,,3
.syntax unified
.text

.macro montgomery_mul a, b, lower, upper, tmp, Mprime, M
      smull.w \lower, \upper, \a, \b
      mul.w \tmp, \lower, \Mprime
      smlal.w \lower, \upper, \tmp, \M
.endm

.global NTT_backward_30to5
.type NTT_backward_30to5, %function
@ void NTT_backward_30to5(int32_t *input, int32_t* output)
NTT_backward_30to5:
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
      str.w r2, [r1, #0]
      str.w r6, [r1, #20]
      str.w r3, [r1, #40]
      str.w r12, [r1, #60]
      str.w r5, [r1, #80]
      str.w r4, [r1, #100]
      add.w r1, r1, #4 
      vmov.w r9, s9
      cmp.w  r0, r9
      blt L0

      add.w r0, r0, #100 
      add.w r1, r1, #100 
      movw.w r2, #0xd1d3
      movt.w r2, #0x007e
      movw.w r3, #0x16b9
      movt.w r3, #0x006f
      movw.w r4, #0x4c4d
      movt.w r4, #0x0085
      movw.w r5, #0x494d
      movt.w r5, #0x0044
      movw.w r6, #0x9a98
      movt.w r6, #0x000a
      push.w {r2-r6}
      movw.w r2, #0xf350
      movt.w r2, #0x0025
      movw.w r3, #0x6431
      movt.w r3, #0x0032
      movw.w r4, #0xcfe4
      movt.w r4, #0x0047
      movw.w r5, #0x2b8c
      movt.w r5, #0x0099
      movw.w r6, #0x05e5
      movt.w r6, #0x0062
      push.w {r2-r6}
      movw.w r2, #0x2507
      movt.w r2, #0x0096
      movw.w r3, #0x0c27
      movt.w r3, #0x00bd
      movw.w r4, #0x8ee1
      movt.w r4, #0x006b
      movw.w r5, #0x5871
      movt.w r5, #0x0024
      movw.w r6, #0xfb24
      movt.w r6, #0x0069
      push.w {r2-r6}
      movw.w r2, #0x5e5d
      movt.w r2, #0x0022
      movw.w r3, #0xf3ba
      movt.w r3, #0x00a4
      movw.w r4, #0x27f4
      movt.w r4, #0x003d
      movw.w r5, #0xaab9
      movt.w r5, #0x005c
      movw.w r6, #0x9f84
      movt.w r6, #0x0031
      push.w {r2-r6}
      movw.w r2, #0x13de
      movt.w r2, #0x005c
      movw.w r3, #0xaa06
      movt.w r3, #0x002c
      movw.w r4, #0xfb2d
      movt.w r4, #0x002b
      movw.w r5, #0x56bc
      movt.w r5, #0x0001
      movw.w r6, #0xfcbd
      movt.w r6, #0x006f
      push.w {r2-r6}
      movw.w r2, #0xd54a
      movt.w r2, #0x003a
      movw.w r3, #0x4842
      movt.w r3, #0x0090
      movw.w r4, #0x3811
      movt.w r4, #0x00ba
      movw.w r5, #0xe82b
      movt.w r5, #0x007d
      movw.w r6, #0x68a7
      movt.w r6, #0x0055
      push.w {r2-r6}
      movw.w r2, #0xe344
      movt.w r2, #0x0054
      movw.w r3, #0x736f
      movt.w r3, #0x005e
      movw.w r4, #0xf5c2
      movt.w r4, #0x00ac
      movw.w r5, #0x8790
      movt.w r5, #0x00a0
      movw.w r6, #0xcc36
      movt.w r6, #0x0011
      push.w {r2-r6}
      movw.w r2, #0x68a7
      movt.w r2, #0x0055
      movw.w r3, #0xd558
      movt.w r3, #0x0040
      movw.w r4, #0x0043
      movt.w r4, #0x0012
      movw.w r5, #0x032a
      movt.w r5, #0x0081
      movw.w r6, #0xcc23
      movt.w r6, #0x0068
      push.w {r2-r6}
      movw.w r2, #0xccf3
      movt.w r2, #0x008f
      movw.w r3, #0xf907
      movt.w r3, #0x001a
      movw.w r4, #0xa9fa
      movt.w r4, #0x004b
      movw.w r5, #0xf7d6
      movt.w r5, #0x0046
      movw.w r6, #0xd6a0
      movt.w r6, #0x00c4
      push.w {r2-r6}
      movw.w r2, #0x38aa
      movt.w r2, #0x004f
      movw.w r3, #0x866f
      movt.w r3, #0x003d
      movw.w r4, #0xdc13
      movt.w r4, #0x0006
      movw.w r5, #0x3ee7
      movt.w r5, #0x007f
      movw.w r6, #0x2fec
      movt.w r6, #0x005e
      push.w {r2-r6}
      movw.w r2, #0xd14a
      movt.w r2, #0x00a1
      movw.w r3, #0x3a27
      movt.w r3, #0x004c
      movw.w r4, #0xbfbb
      movt.w r4, #0x0033
      movw.w r5, #0x94d8
      movt.w r5, #0x0018
      movw.w r6, #0x719b
      movt.w r6, #0x003a
      push.w {r2-r6}
      movw.w r2, #0x5d9e
      movt.w r2, #0x005c
      movw.w r3, #0x0ba3
      movt.w r3, #0x0004
      movw.w r4, #0xbbd1
      movt.w r4, #0x00b9
      movw.w r5, #0xb475
      movt.w r5, #0x002b
      movw.w r6, #0xd1d3
      movt.w r6, #0x007e
      push.w {r2-r6}
      movw.w r2, #0x885b
      movt.w r2, #0x0007
      movw.w r3, #0x1a9d
      movt.w r3, #0x0013
      movw.w r4, #0xf350
      movt.w r4, #0x0025
      movw.w r5, #0x3148
      movt.w r5, #0x0051
      movw.w r6, #0x06f0
      movt.w r6, #0x00bf
      push.w {r2-r6}
      movw.w r2, #0x306a
      movt.w r2, #0x0050
      movw.w r3, #0x92ea
      movt.w r3, #0x0085
      movw.w r4, #0x6fa4
      movt.w r4, #0x0019
      movw.w r5, #0xc72e
      movt.w r5, #0x0016
      movw.w r6, #0xa6b3
      movt.w r6, #0x007f
      push.w {r2-r6}
      movw.w r2, #0x4c4d
      movt.w r2, #0x0085
      movw.w r3, #0x0341
      movt.w r3, #0x0086
      movw.w r4, #0x719b
      movt.w r4, #0x003a
      movw.w r5, #0x0e6b
      movt.w r5, #0x00a2
      movw.w r6, #0x2046
      movt.w r6, #0x0091
      push.w {r2-r6}
      movw.w r2, #0x3811
      movt.w r2, #0x00ba
      movw.w r3, #0x14fc
      movt.w r3, #0x00a6
      movw.w r4, #0x4177
      movt.w r4, #0x0098
      movw.w r5, #0x3bc1
      movt.w r5, #0x0032
      movw.w r6, #0x0043
      movt.w r6, #0x0012
      push.w {r2-r6}
      movw.w r2, #0x31d0
      movt.w r2, #0x00b1
      movw.w r3, #0x5d67
      movt.w r3, #0x0013
      movw.w r4, #0x64eb
      movt.w r4, #0x0060
      movw.w r5, #0x7f97
      movt.w r5, #0x003c
      movw.w r6, #0x5a08
      movt.w r6, #0x000a
      push.w {r2-r6}
      movw.w r2, #0x4501
      movt.w r2, #0x005c
      movw.w r3, #0x907d
      movt.w r3, #0x0070
      movw.w r4, #0xd1d3
      movt.w r4, #0x007e
      movw.w r5, #0x5c71
      movt.w r5, #0x00a7
      movw.w r6, #0x9708
      movt.w r6, #0x0075
      push.w {r2-r6}
      movw.w r2, #0xbbd1
      movt.w r2, #0x00b9
      movw.w r3, #0xec2e
      movt.w r3, #0x0076
      movw.w r4, #0xd14a
      movt.w r4, #0x00a1
      movw.w r5, #0xd196
      movt.w r5, #0x0022
      movw.w r6, #0x4c4d
      movt.w r6, #0x0085
      push.w {r2-r6}
      movw.w r2, #0xf5c2
      movt.w r2, #0x00ac
      movw.w r3, #0x7aad
      movt.w r3, #0x00b9
      movw.w r4, #0x7c7e
      movt.w r4, #0x0006
      movw.w r5, #0x6a2b
      movt.w r5, #0x000f
      movw.w r6, #0xa7f0
      movt.w r6, #0x000a
      push.w {r2-r6}
      movw.w r2, #0x394e
      movt.w r2, #0x0045
      movw.w r3, #0xb495
      movt.w r3, #0x00c0
      movw.w r4, #0xa94f
      movt.w r4, #0x002d
      movw.w r5, #0x8390
      movt.w r5, #0x001d
      movw.w r6, #0xcfe4
      movt.w r6, #0x0055
      push.w {r2-r6}
      movw.w r2, #0x7ce7
      movt.w r2, #0x0085
      movw.w r3, #0x1a25
      movt.w r3, #0x00bb
      movw.w r4, #0xda1c
      movt.w r4, #0x0062
      movw.w r5, #0xfc07
      movt.w r5, #0x001e
      movw.w r6, #0xccb5
      movt.w r6, #0x002b
      push.w {r2-r6}
      movw.w r2, #0x9708
      movt.w r2, #0x0075
      movw.w r3, #0x1a9a
      movt.w r3, #0x0085
      movw.w r4, #0x9a98
      movt.w r4, #0x000a
      movw.w r5, #0xf876
      movt.w r5, #0x0067
      movw.w r6, #0x55b5
      movt.w r6, #0x0006
      push.w {r2-r6}
      movw.w r2, #0x85f9
      movt.w r2, #0x00ba
      movw.w r3, #0x5d3e
      movt.w r3, #0x00bc
      movw.w r4, #0x5d9e
      movt.w r4, #0x005c
      movw.w r5, #0x18d3
      movt.w r5, #0x00ae
      movw.w r6, #0x4501
      movt.w r6, #0x005c
      push.w {r2-r6}
      movw.w r2, #0x4842
      movt.w r2, #0x0090
      movw.w r3, #0xe82b
      movt.w r3, #0x007d
      movw.w r4, #0x14fc
      movt.w r4, #0x00a6
      movw.w r5, #0x8880
      movt.w r5, #0x006e
      movw.w r6, #0xd558
      movt.w r6, #0x0040
      push.w {r2-r6}
      movw.w r2, #0x866f
      movt.w r2, #0x003d
      movw.w r3, #0x3ee7
      movt.w r3, #0x007f
      movw.w r4, #0x8e7f
      movt.w r4, #0x0042
      movw.w r5, #0x3529
      movt.w r5, #0x0006
      movw.w r6, #0xec47
      movt.w r6, #0x001f
      push.w {r2-r6}
      movw.w r2, #0xf3ba
      movt.w r2, #0x00a4
      movw.w r3, #0xaab9
      movt.w r3, #0x005c
      movw.w r4, #0xce46
      movt.w r4, #0x00a4
      movw.w r5, #0xb482
      movt.w r5, #0x0058
      movw.w r6, #0xe6fa
      movt.w r6, #0x00a9
      push.w {r2-r6}
      movw.w r2, #0x736f
      movt.w r2, #0x005e
      movw.w r3, #0x8790
      movt.w r3, #0x00a0
      movw.w r4, #0x7aad
      movt.w r4, #0x00b9
      movw.w r5, #0xbad5
      movt.w r5, #0x00a2
      movw.w r6, #0x41c5
      movt.w r6, #0x0061
      push.w {r2-r6}
      movw.w r2, #0x16b9
      movt.w r2, #0x006f
      movw.w r3, #0x494d
      movt.w r3, #0x0044
      movw.w r4, #0x0341
      movt.w r4, #0x0086
      movw.w r5, #0x1d9d
      movt.w r5, #0x00a8
      movw.w r6, #0xd45e
      movt.w r6, #0x00c0
      push.w {r2-r6}
      movw.w r2, #0x0ba3
      movt.w r2, #0x0004
      movw.w r3, #0xb475
      movt.w r3, #0x002b
      movw.w r4, #0xec2e
      movt.w r4, #0x0076
      movw.w r5, #0x64eb
      movt.w r5, #0x008a
      movw.w r6, #0x16b9
      movt.w r6, #0x006f
      push.w {r2-r6}
      movw.w r2, #0x907d
      movt.w r2, #0x0070
      movw.w r3, #0x5c71
      movt.w r3, #0x00a7
      movw.w r4, #0x16b9
      movt.w r4, #0x006f
      movw.w r5, #0x2b7f
      movt.w r5, #0x006c
      movw.w r6, #0x1a9a
      movt.w r6, #0x0085
      push.w {r2-r6}
      movw.w r2, #0x1a25
      movt.w r2, #0x00bb
      movw.w r3, #0xfc07
      movt.w r3, #0x001e
      movw.w r4, #0x2e84
      movt.w r4, #0x0048
      movw.w r5, #0x8f56
      movt.w r5, #0x0036
      movw.w r6, #0xc564
      movt.w r6, #0x00b1
      push.w {r2-r6}
      movw.w r2, #0x14fc
      movt.w r2, #0x00a6
      movw.w r3, #0x3bc1
      movt.w r3, #0x0032
      movw.w r4, #0x2d79
      movt.w r4, #0x0088
      movw.w r5, #0x7b16
      movt.w r5, #0x003a
      movw.w r6, #0x6554
      movt.w r6, #0x000b
      push.w {r2-r6}
      movw.w r2, #0xec2e
      movt.w r2, #0x0076
      movw.w r3, #0xd196
      movt.w r3, #0x0022
      movw.w r4, #0x3a27
      movt.w r4, #0x004c
      movw.w r5, #0xa287
      movt.w r5, #0x006d
      movw.w r6, #0x0341
      movt.w r6, #0x0086
      push.w {r2-r6}
      movw.w r2, #0x1a9d
      movt.w r2, #0x0013
      movw.w r3, #0x3148
      movt.w r3, #0x0051
      movw.w r4, #0x6431
      movt.w r4, #0x0032
      movw.w r5, #0xbda9
      movt.w r5, #0x0074
      movw.w r6, #0x9a70
      movt.w r6, #0x0005
      push.w {r2-r6}
      movw.w r2, #0x5d3e
      movt.w r2, #0x00bc
      movw.w r3, #0x18d3
      movt.w r3, #0x00ae
      movw.w r4, #0x0ba3
      movt.w r4, #0x0004
      movw.w r5, #0xaad8
      movt.w r5, #0x00be
      movw.w r6, #0x907d
      movt.w r6, #0x0070
      push.w {r2-r6}
      movw.w r2, #0xb475
      movt.w r2, #0x002b
      movw.w r3, #0x64eb
      movt.w r3, #0x008a
      movw.w r4, #0xd196
      movt.w r4, #0x0022
      movw.w r5, #0xfce5
      movt.w r5, #0x00a1
      movw.w r6, #0x494d
      movt.w r6, #0x0044
      push.w {r2-r6}
      movw.w r2, #0xd196
      movt.w r2, #0x0022
      movw.w r3, #0xa287
      movt.w r3, #0x006d
      movw.w r4, #0x94d8
      movt.w r4, #0x0018
      movw.w r5, #0x614d
      movt.w r5, #0x0017
      movw.w r6, #0x0e6b
      movt.w r6, #0x00a2
      push.w {r2-r6}
      movw.w r2, #0x8790
      movt.w r2, #0x00a0
      movw.w r3, #0xbad5
      movt.w r3, #0x00a2
      movw.w r4, #0x6a2b
      movt.w r4, #0x000f
      movw.w r5, #0x490f
      movt.w r5, #0x006c
      movw.w r6, #0xa11a
      movt.w r6, #0x0045
      push.w {r2-r6}
      movw.w r2, #0x5c71
      movt.w r2, #0x00a7
      movw.w r3, #0x2b7f
      movt.w r3, #0x006c
      movw.w r4, #0x494d
      movt.w r4, #0x0044
      movw.w r5, #0x50a8
      movt.w r5, #0x003f
      movw.w r6, #0xf876
      movt.w r6, #0x0067
      push.w {r2-r6}
      movw.w r2, #0xe82b
      movt.w r2, #0x007d
      movw.w r3, #0x8880
      movt.w r3, #0x006e
      movw.w r4, #0x3bc1
      movt.w r4, #0x0032
      movw.w r5, #0x2b7a
      movt.w r5, #0x007c
      movw.w r6, #0x032a
      movt.w r6, #0x0081
      push.w {r2-r6}
      movw.w r2, #0x18d3
      movt.w r2, #0x00ae
      movw.w r3, #0xaad8
      movt.w r3, #0x00be
      movw.w r4, #0xb475
      movt.w r4, #0x002b
      movw.w r5, #0x923d
      movt.w r5, #0x001a
      movw.w r6, #0x5c71
      movt.w r6, #0x00a7
      push.w {r2-r6}
      movw.w r2, #0xaad8
      movt.w r2, #0x00be
      movw.w r3, #0x923d
      movt.w r3, #0x001a
      movw.w r4, #0x64eb
      movt.w r4, #0x008a
      movw.w r5, #0x96f2
      movt.w r5, #0x0058
      movw.w r6, #0x2b7f
      movt.w r6, #0x006c
      push.w {r2-r6}
      movw.w r2, #0x96f2
      movt.w r2, #0x0058
      movw.w r3, #0xbdb7
      movt.w r3, #0x0096
      movw.w r4, #0x5e32
      movt.w r4, #0x00b9
      movw.w r5, #0x99b7
      movt.w r5, #0x00ab
      movw.w r6, #0x4dc4
      movt.w r6, #0x00aa
      push.w {r2-r6}
      movw.w r2, #0x2b7f
      movt.w r2, #0x006c
      movw.w r3, #0x50a8
      movt.w r3, #0x003f
      movw.w r4, #0x1d9d
      movt.w r4, #0x00a8
      movw.w r5, #0x4dc4
      movt.w r5, #0x00aa
      movw.w r6, #0x5781
      movt.w r6, #0x0056
      push.w {r2-r6}
      movw.w r2, #0x923d
      movt.w r2, #0x001a
      movw.w r3, #0x96f2
      movt.w r3, #0x0058
      movw.w r4, #0xfce5
      movt.w r4, #0x00a1
      movw.w r5, #0xbdb7
      movt.w r5, #0x0096
      movw.w r6, #0x50a8
      movt.w r6, #0x003f
      push.w {r2-r6}
      movw.w r2, #0x64eb
      movt.w r2, #0x008a
      movw.w r3, #0xfce5
      movt.w r3, #0x00a1
      movw.w r4, #0xa287
      movt.w r4, #0x006d
      movw.w r5, #0x5e32
      movt.w r5, #0x00b9
      movw.w r6, #0x1d9d
      movt.w r6, #0x00a8
      push.w {r2-r6}
L1:
      pop.w {r2-r6}
      vmov.w s4, r2
      vmov.w s5, r3
      vmov.w s6, r4
      vmov.w s7, r5
      vmov.w s8, r6
      add.w  r9, r0 ,20
      vmov.w s10, r9
L2:
      ldr.w r12, [r0, #0]
      ldr.w r2, [r0, #20]
      ldr.w r3, [r0, #40]
      ldr.w r4, [r0, #60]
      ldr.w r5, [r0, #80]
      ldr.w r6, [r0, #100]
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
      montgomery_mul r6, r9, r9, r6, r10, lr, r11
      vmov.w r9, s5
      montgomery_mul r3, r9, r9, r3, r10, lr, r11
      vmov.w r9, s6
      montgomery_mul r12, r9, r9, r12, r10, lr, r11
      vmov.w r9, s7
      montgomery_mul r5, r9, r9, r5, r10, lr, r11
      vmov.w r9, s8
      montgomery_mul r4, r9, r9, r4, r10, lr, r11
      str.w r2, [r1, #0]
      str.w r6, [r1, #20]
      str.w r3, [r1, #40]
      str.w r12, [r1, #60]
      str.w r5, [r1, #80]
      str.w r4, [r1, #100]
      add.w r1, r1, #4 
      vmov.w r9, s10
      cmp.w  r0, r9
      blt L2
      add.w r0, r0, #100 
      add.w r1, r1, #100 
      vmov.w r9, s11
      cmp.w  r0, r9
      blt L1
      pop.w {r1-r12, pc}