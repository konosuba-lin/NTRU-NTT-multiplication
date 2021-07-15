
# coding: utf-8

# In[7]:


def school_mul():
    ld_w = 4
    sd_w = 4
    f.write("      movw.w r11, #0xe001\n")
    f.write("      movt.w r11, #0x00c4\n")
    f.write("      movw.w lr, #0xdfff\n")
    f.write("      movt.w lr, #0x3cc4\n")
    #f.write("      movw.w r10, #0xea5f\n") #2^64
    #f.write("      movt.w r10, #0x0035\n")
    #f.write("      vmov.w s10, r10\n")
    n = [
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
     -650915,   650915,   814455,  -814455,   458957,  -458957, -1273412,  1273412]

    f.write("      vmov.w s0, r0\n")
    f.write("      vmov.w s1, r1\n")
    f.write("      vmov.w s2, r2\n")
    for i in range(288):
        school_mul_part_v3(n[i],i)
        #f.write("      add.w r"+str(0)+", r"+str(0)+", #"+str(5*ld_w)+" \n") #increase r0 for next part
        #f.write("      add.w r"+str(1)+", r"+str(1)+", #"+str(5*ld_w)+" \n") #increase r1 for next part
        #f.write("      add.w r"+str(2)+", r"+str(2)+", #"+str(5*sd_w)+" \n") #increase r2 for next part


def school_mul_part_v3(c,loop):
    ld_w = 4
    sd_w = 4
    dic = {"a0":"r2", "a1":"r3", "a2":"r4", "a3":"r5", "a4":"r6", "b0":"r7", "b1":"r8", "b2":"r9", "b3":"r10","b4":"r12"} 

    if(c!=1):
        a=hex(c*pow(2,32)%12902401)[2:].zfill(8)[0:4]
        b=hex(c*pow(2,32)%12902401)[2:].zfill(8)[4:8]
        f.write("      movw.w r10, #0x"+str(b)+"\n")
        f.write("      movt.w r10, #0x"+str(a)+"\n") 
        f.write("      vmov.w s4, r10\n")


    if(loop>0):
        f.write("      vmov.w r0, s0\n")
        f.write("      vmov.w r1, s1\n")
        if(loop<=144):
            f.write("      add.w r"+str(0)+", r"+str(0)+", #"+str(5*ld_w*loop)+" \n")
            f.write("      add.w r"+str(1)+", r"+str(1)+", #"+str(5*ld_w*loop)+" \n")
            if(loop==144):
                f.write("      vmov.w s0, r0\n")
                f.write("      vmov.w s1, r1\n")
        else:
            f.write("      add.w r"+str(0)+", r"+str(0)+", #"+str(5*ld_w*(loop-144))+" \n")
            f.write("      add.w r"+str(1)+", r"+str(1)+", #"+str(5*ld_w*(loop-144))+" \n")

    f.write("      ldr.w "+dic["a0"]+", [r0, #"+str(0*ld_w)+"]\n")#a0
    f.write("      ldr.w "+dic["a1"]+", [r0, #"+str(1*ld_w)+"]\n")#a1
    f.write("      ldr.w "+dic["a2"]+", [r0, #"+str(2*ld_w)+"]\n")#a2
    f.write("      ldr.w "+dic["a3"]+", [r0, #"+str(3*ld_w)+"]\n")#a3
    f.write("      ldr.w "+dic["a4"]+", [r0, #"+str(4*ld_w)+"]\n")#a4
    f.write("      ldr.w "+dic["b0"]+", [r1, #"+str(0*ld_w)+"]\n")#b0
    f.write("      ldr.w "+dic["b1"]+", [r1, #"+str(1*ld_w)+"]\n")#b1
    f.write("      ldr.w "+dic["b2"]+", [r1, #"+str(2*ld_w)+"]\n")#b2
    f.write("      ldr.w "+dic["b3"]+", [r1, #"+str(3*ld_w)+"]\n")#b3
    f.write("      ldr.w "+dic["b4"]+", [r1, #"+str(4*ld_w)+"]\n")#b4

    f.write("      vmov.w s3, r10\n")#s3=b3


    f.write("      smull.w r0, r1, "+dic["a1"]+", "+dic["b4"]+"\n")
    f.write("      smlal.w r0, r1, "+dic["a2"]+", "+dic["b3"]+"\n")
    f.write("      smlal.w r0, r1, "+dic["a3"]+", "+dic["b2"]+"\n")
    f.write("      smlal.w r0, r1, "+dic["a4"]+", "+dic["b1"]+"\n")
    if(c!=1):
        montgomery_reduction(0,1)
        f.write("      vmov.w  r10, s4\n")
        f.write("      smull.w r0, r1, r1, r10\n")
    f.write("      smlal.w r0, r1, "+dic["a0"]+", "+dic["b0"]+"\n")
    montgomery_reduction(0,1)
    f.write("      vmov.w s"+str(5)+", r1\n")



    f.write("      vmov.w r10, s3\n")#for b3
    f.write("      smull.w r0, r1, "+dic["a2"]+", "+dic["b4"]+"\n")
    f.write("      smlal.w r0, r1, "+dic["a3"]+", "+dic["b3"]+"\n")
    f.write("      smlal.w r0, r1, "+dic["a4"]+", "+dic["b2"]+"\n")
    if(c!=1):
        montgomery_reduction(0,1)
        f.write("      vmov.w  r10, s4\n")
        f.write("      smull.w r0, r1, r1, r10\n")
    f.write("      smlal.w r0, r1,"+dic["a0"]+", "+dic["b1"]+"\n")
    f.write("      smlal.w r0, r1,"+dic["a1"]+", "+dic["b0"]+"\n")
    montgomery_reduction(0,1)
    f.write("      vmov.w s"+str(6)+", r1\n")


    f.write("      vmov.w r10, s3\n")#for b3
    f.write("      smull.w r0, r1, "+dic["a3"]+", "+dic["b4"]+"\n")
    f.write("      smlal.w r0, r1, "+dic["a4"]+", "+dic["b3"]+"\n")
    if(c!=1):
        montgomery_reduction(0,1)
        f.write("      vmov.w  r10, s4\n")
        f.write("      smull.w r0, r1, r1, r10\n")
    f.write("      smlal.w r0, r1,"+dic["a0"]+", "+dic["b2"]+"\n")
    f.write("      smlal.w r0, r1,"+dic["a1"]+", "+dic["b1"]+"\n")
    f.write("      smlal.w r0, r1,"+dic["a2"]+", "+dic["b0"]+"\n")
    montgomery_reduction(0,1)
    f.write("      vmov.w s"+str(7)+", r1\n")





    if(c==1):
        f.write("      smull.w r0, r1, "+dic["a4"]+", "+dic["b4"]+"\n")
        f.write("      vmov.w r10, s3\n")#for b3
        f.write("      smlal.w r0, r1,"+dic["a0"]+", "+dic["b3"]+"\n")
        f.write("      smlal.w r0, r1,"+dic["a1"]+", "+dic["b2"]+"\n")
        f.write("      smlal.w r0, r1,"+dic["a2"]+", "+dic["b1"]+"\n")
        f.write("      smlal.w r0, r1,"+dic["a3"]+", "+dic["b0"]+"\n")
        montgomery_reduction(0,1)
        f.write("      vmov.w s"+str(8)+", r1\n")


        f.write("      vmov.w r10, s3\n")#for b3
        f.write("      smull.w r0, r1,"+dic["a0"]+", "+dic["b4"]+"\n")
        f.write("      smlal.w r0, r1,"+dic["a1"]+", "+dic["b3"]+"\n")
        f.write("      smlal.w r0, r1,"+dic["a2"]+", "+dic["b2"]+"\n")
        f.write("      smlal.w r0, r1,"+dic["a3"]+", "+dic["b1"]+"\n")
        f.write("      smlal.w r0, r1,"+dic["a4"]+", "+dic["b0"]+"\n")
        montgomery_reduction(0,1)
        f.write("      vmov.w r5, s5\n")
        f.write("      vmov.w r6, s6\n")
        f.write("      vmov.w r7, s7\n")
        f.write("      vmov.w r8, s8\n")        



    else:   
        f.write("      smull.w r0, r1, "+dic["a4"]+", "+dic["b4"]+"\n")    
        montgomery_reduction(0,1)

        f.write("      vmov.w r10, s3\n")#for b3
        f.write("      smull.w r0, r12,"+dic["a0"]+", "+dic["b4"]+"\n")   #b4 no use     
        f.write("      smlal.w r0, r12,"+dic["a1"]+", "+dic["b3"]+"\n")
        f.write("      smlal.w r0, r12,"+dic["a2"]+", "+dic["b2"]+"\n")
        f.write("      smlal.w r0, r12,"+dic["a3"]+", "+dic["b1"]+"\n")
        f.write("      smlal.w r0, r12,"+dic["a4"]+", "+dic["b0"]+"\n")   #a4 no use

        f.write("      vmov.w r6, s4\n")
        f.write("      smull.w r6, r1, r1, r6\n")

        f.write("      smlal.w r6, r1,"+dic["a0"]+", "+dic["b3"]+"\n")
        f.write("      smlal.w r6, r1,"+dic["a1"]+", "+dic["b2"]+"\n")
        f.write("      smlal.w r6, r1,"+dic["a2"]+", "+dic["b1"]+"\n")
        f.write("      smlal.w r6, r1,"+dic["a3"]+", "+dic["b0"]+"\n")        


        montgomery_reduction(0,12) 
        montgomery_reduction(6,1)

        f.write("      vmov.w r5, s5\n")
        f.write("      vmov.w r6, s6\n")
        f.write("      vmov.w r7, s7\n")




    f.write("      vmov.w r2, s2\n")

    if(loop==0):
        f.write("      str.w r"+str(5)+", [r2, #"+str(5*sd_w*loop+0*sd_w)+"]\n")
        f.write("      str.w r"+str(6)+", [r2, #"+str(5*sd_w*loop+1*sd_w)+"]\n")
        f.write("      str.w r"+str(7)+", [r2, #"+str(5*sd_w*loop+2*sd_w)+"]\n")
        f.write("      str.w r"+str(8)+", [r2, #"+str(5*sd_w*loop+3*sd_w)+"]\n")
        f.write("      str.w r"+str(1)+", [r2, #"+str(5*sd_w*loop+4*sd_w)+"]\n")
    elif(loop<=144):
        f.write("      str.w r"+str(5)+", [r2, #"+str(5*sd_w*loop+0*sd_w)+"]\n")
        f.write("      str.w r"+str(6)+", [r2, #"+str(5*sd_w*loop+1*sd_w)+"]\n")
        f.write("      str.w r"+str(7)+", [r2, #"+str(5*sd_w*loop+2*sd_w)+"]\n")
        f.write("      str.w r"+str(1)+", [r2, #"+str(5*sd_w*loop+3*sd_w)+"]\n")
        f.write("      str.w r"+str(12)+", [r2, #"+str(5*sd_w*loop+4*sd_w)+"]\n")
        if(loop==144):
            f.write("      add.w r"+str(2)+", r"+str(2)+", #"+str(5*sd_w*loop)+" \n")
            f.write("      vmov.w s2, r2\n")
    else:
        f.write("      str.w r"+str(5)+", [r2, #"+str(5*sd_w*(loop-144)+0*sd_w)+"]\n")
        f.write("      str.w r"+str(6)+", [r2, #"+str(5*sd_w*(loop-144)+1*sd_w)+"]\n")
        f.write("      str.w r"+str(7)+", [r2, #"+str(5*sd_w*(loop-144)+2*sd_w)+"]\n")
        f.write("      str.w r"+str(1)+", [r2, #"+str(5*sd_w*(loop-144)+3*sd_w)+"]\n")
        f.write("      str.w r"+str(12)+", [r2, #"+str(5*sd_w*(loop-144)+4*sd_w)+"]\n")        





def montgomery_reduction(a,b):#smull.w r"+str(a)+", r"+str(b)+", r"+str(x)+", r"+str(y)+"\n")
    f.write("      mul.w r"+str(10)+", r"+str(a)+", lr"+"\n")                       #r10=r9*lr              #lr=(-q^-1 mod+-R)
    f.write("      smlal.w r"+str(a)+", r"+str(b)+", r"+str(10)+", r"+str(11)+"\n") #ra+r9=r10*r11  (Accum) #r11=q


def montgomery_multiplication(a,b):
    f.write("      montgomery_mul r"+str(a)+", r"+str(b)+", r"+str(0)+", r"+str(a)+", r"+str(10)+", lr"+", r"+str(11)+"\n")

def write_macro():
    f.write(".macro montgomery_mul a, b, lower, upper, tmp, Mprime, M\n")
    f.write("      smull.w \\lower, \\upper, \\a, \\b\n")
    f.write("      mul.w \\tmp, \\lower, \\Mprime\n")
    f.write("      smlal.w \\lower, \\upper, \\tmp, \\M\n")
    f.write(".endm\n\n")



if __name__ == "__main__":
    f = open("../mult_test/School_5.S", 'w')
    f.write(".p2align 2,,3\n")
    f.write(".syntax unified\n")
    f.write(".text\n\n")
    write_macro()
    f.write(".global school_mul\n")
    f.write(".type school_mul, %function\n")
    f.write("@ void school_mul(int32_t *input1, int32_t *input2, int32_t* output)\n")
    f.write("school_mul:\n")
    f.write("      push.w {r1-r12, lr}\n")        #tmp0=r8    #tmp1=r9
    school_mul()   
    f.write("      pop.w {r1-r12, pc}\n\n")
    f.close()

