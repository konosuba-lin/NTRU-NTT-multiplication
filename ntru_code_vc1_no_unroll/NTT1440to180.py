#r2,r3,r4,r5 A,B,C,D 

#r8 = k1*2^32 = k2*2^32 mod q = (2577^360)*(2^32) mod q 
#r9,r10: for montgomery multiplication/barette reduction
#r11 = q
#r12 tempt
#lr = #lr=(-q^-1 mod+-R)
def loop1():
    ld_w = 2
    sd_w = 4
    f.write("      ldrsh.w r"+str(2)+", [r0, #"+str(0  *ld_w)+"]\n") #A
    f.write("      ldrsh.w r"+str(3)+", [r0, #"+str(180*ld_w)+"]\n") #B
    f.write("      ldrsh.w r"+str(4)+", [r0, #"+str(360*ld_w)+"]\n") #C
    f.write("      ldrsh.w r"+str(5)+", [r0, #"+str(540*ld_w)+"]\n") #D
    f.write("      add.w r"+str(0)+", r"+str(0)+", #"+str(ld_w)+" \n") #increase r0 for next loop
    
    f.write("      add.w r"+str(6)+", r"+str(2)+", r"+str(4)+"\n") #(A+C)          #x^360-1
    f.write("      add.w r"+str(7)+", r"+str(3)+", r"+str(5)+"\n") #(B+D)
    
    f.write("      add.w r"+str(9)+", r"+str(6)+", r"+str(7)+"\n")#(A+C)+(B+D)    #x^180-1
    f.write("      subs.w r"+str(10)+", r"+str(6)+", r"+str(7)+"\n")#(A+C)-(B+D)   #x^180+1
    f.write("      str.w r"+str(9)+", [r1, #"+str(0  *sd_w)+"]\n")
    f.write("      str.w r"+str(10)+", [r1, #"+str(180*sd_w)+"]\n")
    
    f.write("      subs.w r"+str(6)+", r"+str(2)+", r"+str(4)+"\n")#(A-C)          #x^360+1
    f.write("      subs.w r"+str(7)+", r"+str(3)+", r"+str(5)+"\n")#(B-D)
    
    #montgomery_multiplication(7,8)                                  #(B-D)k2
    f.write("      mul.w r"+str(7)+", r"+str(7)+", r"+str(8)+"\n")   #(B-D)k2
    f.write("      add.w r"+str(9)+", r"+str(6)+", r"+str(7)+"\n")   #(A-C)+(B-D)k2       #x^180-2577^360
    f.write("      subs.w r"+str(10)+", r"+str(6)+", r"+str(7)+"\n") #(A-C)-(B-D)k2       #x^180+2577^360
    f.write("      str.w r"+str(9)+", [r1, #"+str(360*sd_w)+"]\n")
    f.write("      str.w r"+str(10)+", [r1, #"+str(540*sd_w)+"]\n")

    f.write("      add.w r"+str(1)+", r"+str(1)+", #"+str(720*sd_w)+" \n") #increase r1 by 720*sd_w
    
    #montgomery_multiplication(4,8)#k1*C                                                          #x^360-2577^360
    #montgomery_multiplication(5,8)#k1*D
    f.write("      mul.w r"+str(4)+", r"+str(4)+", r"+str(8)+"\n")#k1*C
    f.write("      mul.w r"+str(5)+", r"+str(5)+", r"+str(8)+"\n")#k1*D
    
    f.write("      add.w r"+str(2)+", r"+str(2)+", r"+str(4)+"\n")#(A+k1*C)
    f.write("      subs.w r"+str(4)+", r"+str(2)+", r"+str(4)+", lsl #1\n")#(A-k1*C)
    f.write("      add.w r"+str(3)+", r"+str(3)+", r"+str(5)+"\n")#(B+k1*D)
    f.write("      subs.w r"+str(5)+", r"+str(3)+", r"+str(5)+", lsl #1\n")#(B-k1*D) 
    
    #f.write("      movw.w r8, #0x4b29\n") #r8 = k3*2^32 = 2577**180*2**32 mod q
    #f.write("      movt.w r8, #0x00ac\n")         
    f.write("      vmov.w r9, s1\n")
    montgomery_multiplication(3,9)#k3*(B+k1*D)
    
    f.write("      add.w r"+str(2)+", r"+str(2)+", r"+str(3)+"\n")#(A+k1*C)+k3*(B+k1*D) #x^180-2577^180              
    f.write("      subs.w r"+str(3)+", r"+str(2)+", r"+str(3)+", lsl #1\n")#(A+k1*C)-k3*(B+k1*D) #x^180+2577^180              
                          

    #f.write("      movw.w r8, #0x0e6b\n") #r8 = k4*2^32 = (2577^540)*(2^32) mod q
    #f.write("      movt.w r8, #0x00a2\n")
    f.write("      vmov.w r9, s2\n")
    montgomery_multiplication(5,9) #k4*(B-k1*D)

    f.write("      add.w r"+str(4)+", r"+str(4)+", r"+str(5)+"\n")           #x^180-2577^540             
    f.write("      subs.w r"+str(5)+", r"+str(4)+", r"+str(5)+", lsl #1\n")          #x^180+2577^540
    
    f.write("      str.w r"+str(2)+", [r1, #"+str(  0*sd_w)+"]\n")
    f.write("      str.w r"+str(3)+", [r1, #"+str(180*sd_w)+"]\n")                
    f.write("      str.w r"+str(4)+", [r1, #"+str(360*sd_w)+"]\n")
    f.write("      str.w r"+str(5)+", [r1, #"+str(540*sd_w)+"]\n")

    f.write("      sub.w r"+str(1)+", r"+str(1)+", #"+str(719*sd_w)+" \n") #let r1 back to 0

    #f.write("      add.w r"+str(1)+", r"+str(1)+", #"+str(sd_w)+" \n") # increase r1 by sd_w for next loop

def loop2():
    ld_w = 2
    sd_w = 4
    f.write("      ldrsh.w r"+str(2)+", [r0, #"+str(0  *ld_w)+"]\n") #A
    f.write("      ldrsh.w r"+str(3)+", [r0, #"+str(180*ld_w)+"]\n") #B
    f.write("      ldrsh.w r"+str(4)+", [r0, #"+str(360*ld_w)+"]\n") #C
    f.write("      add.w r"+str(0)+", r"+str(0)+", #"+str(ld_w)+" \n") #increase r0 for next loop
    
    f.write("      add.w r"+str(6)+", r"+str(2)+", r"+str(4)+"\n")  #(A+C)    
    f.write("      add.w r"+str(9)+", r"+str(6)+", r"+str(3)+"\n")  #(A+C)+(B)
    f.write("      subs.w r"+str(10)+", r"+str(6)+", r"+str(3)+"\n")#(A+C)-(B)
    f.write("      str.w r"+str(9)+", [r1, #"+str(0  *sd_w)+"]\n")
    f.write("      str.w r"+str(10)+", [r1, #"+str(180*sd_w)+"]\n")
    
    f.write("      subs.w r"+str(6)+", r"+str(2)+", r"+str(4)+"\n")#(A-C)       
    f.write("      mul.w r"+str(7)+", r"+str(3)+", r"+str(8)+"\n") #(B)k2
    f.write("      add.w r"+str(9)+", r"+str(6)+", r"+str(7)+"\n")   #(A-C)+(B)k2
    f.write("      subs.w r"+str(10)+", r"+str(6)+", r"+str(7)+"\n") #(A-C)-(B)k2
    f.write("      str.w r"+str(9)+", [r1, #"+str(360*sd_w)+"]\n")
    f.write("      str.w r"+str(10)+", [r1, #"+str(540*sd_w)+"]\n")

    f.write("      add.w r"+str(1)+", r"+str(1)+", #"+str(720*sd_w)+" \n") #increase r1 by 720*sd_w
    
    f.write("      mul.w r"+str(4)+", r"+str(4)+", r"+str(8)+"\n")#k1*C
    f.write("      add.w r"+str(2)+", r"+str(2)+", r"+str(4)+"\n")#(A+k1*C)
    f.write("      subs.w r"+str(4)+", r"+str(2)+", r"+str(4)+", lsl #1\n")#(A-k1*C)
    
    f.write("      mov.w r5, r3\n")
    f.write("      vmov.w r9, s1\n")
    montgomery_multiplication(3,9)  #k3(B)
    f.write("      vmov.w r9, s2\n")
    montgomery_multiplication(5,9)  #k4(B)
    
    
    f.write("      add.w r"+str(2)+", r"+str(2)+", r"+str(3)+"\n")         #(A+k1*C)+k3*(B) #x^180-2577^180              
    f.write("      subs.w r"+str(3)+", r"+str(2)+", r"+str(3)+", lsl #1\n")#(A+k1*C)-k3*(B) #x^180+2577^180              
    f.write("      add.w r"+str(4)+", r"+str(4)+", r"+str(5)+"\n")         #(A-k1*C)+k4*(B) #x^180-2577^540             
    f.write("      subs.w r"+str(5)+", r"+str(4)+", r"+str(5)+", lsl #1\n")#(A-k1*C)-k4*(B) #x^180-2577^540             
    
    f.write("      str.w r"+str(2)+", [r1, #"+str(  0*sd_w)+"]\n")
    f.write("      str.w r"+str(3)+", [r1, #"+str(180*sd_w)+"]\n")                
    f.write("      str.w r"+str(4)+", [r1, #"+str(360*sd_w)+"]\n")
    f.write("      str.w r"+str(5)+", [r1, #"+str(540*sd_w)+"]\n")

    f.write("      sub.w r"+str(1)+", r"+str(1)+", #"+str(719*sd_w)+" \n") #let r1 back to 0

    #f.write("      add.w r"+str(1)+", r"+str(1)+", #"+str(sd_w)+" \n") # increase r1 by sd_w for next loop
        

def NTT1440to180():
    ld_w = 2
    sd_w = 4
    f.write("      movw.w r11, #0xe001\n")
    f.write("      movt.w r11, #0x00c4\n")
    f.write("      movw.w lr, #0xdfff\n")
    f.write("      movt.w lr, #0x3cc4\n")
    f.write("      movw.w r8, #0x1f10\n")  #r8 = k1 = k2 = (2577^360) mod q 
    f.write("      movt.w r8, #0xffff\n")
    #    f.write("      vmov.w s0, r8\n")                                             
    f.write("      movw.w r9, #0x4b29\n")  #r9 = k3*2^32 = 2577**180*2**32 mod q          #把r8換成r9
    f.write("      movt.w r9, #0x00ac\n")
    f.write("      vmov.w s1, r9\n")
    f.write("      movw.w r9, #0x0e6b\n") #r9 = k4*2^32 = (2577^540)*(2^32) mod q
    f.write("      movt.w r9, #0x00a2\n")
    f.write("      vmov.w s2, r9\n")
    f.write("      add.w  r9, r0 ,"+str(ld_w*137)+"\n")
    f.write("      vmov.w s3, r9\n")
    f.write("      add.w  r9, r0 ,"+str(ld_w*180)+"\n")
    f.write("      vmov.w s4, r9\n")



    '''for j in range(137):
        loop1()

    for j in range(137,180):
        loop2()'''

    f.write("L1:\n")
    loop1()
    f.write("      vmov.w r9, s3\n")
    f.write("      cmp.w  r0, r9\n")
    f.write("      blt L1\n\n")
    f.write("L2:\n")
    loop2()
    f.write("      vmov.w r9, s4\n")
    f.write("      cmp.w  r0, r9\n")
    f.write("      blt L2\n")




def montgomery_multiplication(a,b):      #ra*rb*R^-1 mod+-q                         #ra 32bits #rb 32 bits                                                             
    #f.write("      smull.w r"+str(9)+", r"+str(a)+", r"+str(a)+", r"+str(b)+"\n")   #ra+r9=ra*rb
    #f.write("      mul.w r"+str(10)+", r"+str(9)+", lr"+"\n")                       #r10=r9*lr              #lr=(-q^-1 mod+-R)
    #f.write("      smlal.w r"+str(9)+", r"+str(a)+", r"+str(10)+", r"+str(11)+"\n") #ra+r9=r10*r11  (Accum) #r11=q
    f.write("      montgomery_mul r"+str(a)+", r"+str(b)+", r"+str(9)+", r"+str(a)+", r"+str(10)+", lr"+", r"+str(11)+"\n")

def write_macro():
    f.write(".macro montgomery_mul a, b, lower, upper, tmp, Mprime, M\n")
    f.write("      smull.w \\lower, \\upper, \\a, \\b\n")
    f.write("      mul.w \\tmp, \\lower, \\Mprime\n")
    f.write("      smlal.w \\lower, \\upper, \\tmp, \\M\n")
    f.write(".endm\n\n")


# In[10]:


if __name__ == "__main__":
    f = open("../mult_test/test_NTT_1440to180_v4.S", 'w')
    #f.write(".p2align 1,,3\n")
    f.write(".syntax unified\n")
    f.write(".text\n\n")
    write_macro()
    f.write(".global NTT_forward_1440to180\n")
    f.write(".type NTT_forward_1440to180, %function\n")
    f.write("@ void NTT_forward_1440to180(int16_t *input, int32_t* output)\n")
    f.write("NTT_forward_1440to180:\n")
    f.write("      push.w {r1-r12, lr}\n")        #tmp0=r8    #tmp1=r9
    NTT1440to180()   
#    f.write("      mov.w r0, r12\n") 
    f.write("      pop.w {r1-r12, pc}")
    f.close()

