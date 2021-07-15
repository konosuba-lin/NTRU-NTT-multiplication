#r12,r2,r3,r4 E,F,G,H
#r9,r10,r5,r6: A,B,C,D
#r7 = 1/k3
#r8 = 1/k1=1/k2 (1/k4=1/k3*1/k1)
#r11 = q
#lr = #lr=(-q^-1 mod+-R)
import math as math
def loop1():
    ld_w = 4
    sd_w = 4
    f.write("      add.w r"+str(0)+", r"+str(0)+", #"+str(720*ld_w)+" \n")#increase r0 by 720*ld_w
    f.write("      ldr.w r"+str(12)+", [r0, #"+str(0*ld_w)+"]\n")         #E
    f.write("      ldr.w r"+str(2)+", [r0, #"+str(180*ld_w)+"]\n")        #F
    f.write("      ldr.w r"+str(3)+", [r0, #"+str(360*ld_w)+"]\n")        #G
    f.write("      ldr.w r"+str(4)+", [r0, #"+str(540*ld_w)+"]\n")        #H
    f.write("      subs.w r"+str(0)+", r"+str(0)+", #"+str(720*ld_w)+" \n")#decrease r0 back to 0
    
    f.write("      add.w r"+str(12)+", r"+str(12)+", r"+str(2)+"\n")        #(E+F)
    f.write("      subs.w r"+str(2)+", r"+str(12)+", r"+str(2)+", lsl #1\n")#(E-F)
    montgomery_multiplication(2,7)                                          #(E-F)/k3

    f.write("      add.w r"+str(3)+", r"+str(3)+", r"+str(4)+"\n")#(G+H)
    f.write("      subs.w r"+str(4)+", r"+str(3)+", r"+str(4)+", lsl #1\n") #(G-H)
    f.write("      vmov.w r9, s1\n")
    montgomery_multiplication(4,9)                                          #(G-H)/k4 (-180-360=-540)

    f.write("      add.w r"+str(12)+", r"+str(12)+", r"+str(3)+"\n")        #(E+F)+(G+H)
    f.write("      subs.w r"+str(3)+", r"+str(12)+", r"+str(3)+", lsl #1\n")#(E+F)-(G+H)
    montgomery_multiplication(3,8)                                          #((E+F)-(G+H))/k1


    f.write("      add.w r"+str(2)+", r"+str(2)+", r"+str(4)+"\n")         #(E-F)/k3+(G-H)/k4
    #if (1260+j)<1353:
    f.write("      subs.w r"+str(4)+", r"+str(2)+", r"+str(4)+", lsl #1\n")#(E-F)/k3-(G-H)/k4
    montgomery_multiplication(4,8)                                         #(E-F)/k3k1-(G-H)/k4k1
    
    f.write("      ldr.w r"+str(5)+", [r0, #"+str(360*ld_w)+"]\n")        #C
    f.write("      ldr.w r"+str(6)+", [r0, #"+str(540*ld_w)+"]\n")        #D
    f.write("      add.w r"+str(5)+", r"+str(5)+", r"+str(6)+"\n")         #(C+D)
    f.write("      subs.w r"+str(6)+", r"+str(5)+", r"+str(6)+", lsl #1\n")#(C-D)
    montgomery_multiplication(6,8)                                         #(C-D)/k2
        

    f.write("      ldr.w r"+str(9)+", [r0, #"+str(0*ld_w)+"]\n")             #A                
    f.write("      ldr.w r"+str(10)+", [r0, #"+str(180*ld_w)+"]\n")          #B        use r8 
    f.write("      add.w r"+str(0)+", r"+str(0)+", #"+str(ld_w)+" \n")       #increase r0 for next loop
    
    f.write("      add.w r"+str(9)+", r"+str(9)+", r"+str(10)+"\n")          #(A+B)
    f.write("      subs.w r"+str(10)+", r"+str(9)+", r"+str(10)+", lsl #1\n")#(A-B)
    
    f.write("      add.w r"+str(9)+", r"+str(9)+", r"+str(5)+"\n")          #(A+B)+(C+D)
    f.write("      subs.w r"+str(5)+", r"+str(9)+", r"+str(5)+", lsl #1\n") #(A+B)-(C+D)
    f.write("      add.w r"+str(10)+", r"+str(10)+", r"+str(6)+"\n")        #(A-B)+(C-D)/k2
    f.write("      subs.w r"+str(6)+", r"+str(10)+", r"+str(6)+", lsl #1\n")#(A-B)-(C-D)/k2
    
    f.write("      add.w r"+str(9)+", r"+str(9)+", r"+str(12)+"\n")        #((A+B)+(C+D))+((E+F)+(G+H))
    f.write("      add.w r"+str(10)+", r"+str(10)+", r"+str(2)+"\n")       #((A-B)+(C-D)/k2)+((E-F)/k3+(G-H)/k4)
    f.write("      add.w r"+str(5)+", r"+str(5)+", r"+str(3)+"\n")         #((A+B)-(C+D))+((E+F)-(G+H))/k1
    #if (1260+j)<1353:
    f.write("      add.w r"+str(6)+", r"+str(6)+", r"+str(4)+"\n")         #(A-B)-(C-D)/k2+(E-F)/k3k1-(G-H)/k4k1
    #else:
    #    f.write("      add.w r"+str(6)+", r"+str(6)+", r"+str(6)+"\n") 
    
    f.write("      str.w r"+str(9)+", [r1, #"+str(0*sd_w)+"]\n") 
    f.write("      str.w r"+str(10)+", [r1, #"+str(180*sd_w)+"]\n")
    f.write("      str.w r"+str(5)+", [r1, #"+str(360*sd_w)+"]\n")
    f.write("      str.w r"+str(6)+", [r1, #"+str(540*sd_w)+"]\n")

    f.write("      add.w r"+str(1)+", r"+str(1)+", #"+str(720*sd_w)+" \n") #increase r1 by 720*sd_w
    
    f.write("      subs.w r"+str(9)+", r"+str(9)+", r"+str(12)+", lsl #1\n")
    f.write("      subs.w r"+str(10)+", r"+str(10)+", r"+str(2)+", lsl #1\n")
    f.write("      subs.w r"+str(5)+", r"+str(5)+", r"+str(3)+", lsl #1\n")
    #if (1260+j)<1353:
    f.write("      subs.w r"+str(6)+", r"+str(6)+", r"+str(4)+", lsl #1\n")
        
    f.write("      str.w r"+str(9)+", [r1, #"+str(0*sd_w)+"]\n") 
    f.write("      str.w r"+str(10)+", [r1, #"+str(180*sd_w)+"]\n")
    f.write("      str.w r"+str(5)+", [r1, #"+str(360*sd_w)+"]\n")
    #if (1260+j)<1353:
    f.write("      str.w r"+str(6)+", [r1, #"+str(540*sd_w)+"]\n")

    f.write("      sub.w r"+str(1)+", r"+str(1)+", #"+str(719*sd_w)+" \n") #let r1 back to 0
    #f.write("      add.w r"+str(1)+", r"+str(1)+", #"+str(sd_w)+" \n") # increase r1 by sd_w for next loop

def loop2():
    ld_w = 4
    sd_w = 4
    f.write("      add.w r"+str(0)+", r"+str(0)+", #"+str(720*ld_w)+" \n")#increase r0 by 720*ld_w
    f.write("      ldr.w r"+str(12)+", [r0, #"+str(0*ld_w)+"]\n")         #E
    f.write("      ldr.w r"+str(2)+", [r0, #"+str(180*ld_w)+"]\n")        #F
    f.write("      ldr.w r"+str(3)+", [r0, #"+str(360*ld_w)+"]\n")        #G
    f.write("      ldr.w r"+str(4)+", [r0, #"+str(540*ld_w)+"]\n")        #H
    f.write("      subs.w r"+str(0)+", r"+str(0)+", #"+str(720*ld_w)+" \n")#decrease r0 back to 0
    
    f.write("      add.w r"+str(12)+", r"+str(12)+", r"+str(2)+"\n")        #(E+F)
    f.write("      subs.w r"+str(2)+", r"+str(12)+", r"+str(2)+", lsl #1\n")#(E-F)
    montgomery_multiplication(2,7)                                          #(E-F)/k3

    f.write("      add.w r"+str(3)+", r"+str(3)+", r"+str(4)+"\n")#(G+H)
    f.write("      subs.w r"+str(4)+", r"+str(3)+", r"+str(4)+", lsl #1\n") #(G-H)
    f.write("      vmov.w r9, s1\n")
    montgomery_multiplication(4,9)                                          #(G-H)/k4 (-180-360=-540)

    f.write("      add.w r"+str(12)+", r"+str(12)+", r"+str(3)+"\n")        #(E+F)+(G+H)
    f.write("      subs.w r"+str(3)+", r"+str(12)+", r"+str(3)+", lsl #1\n")#(E+F)-(G+H)
    montgomery_multiplication(3,8)                                          #((E+F)-(G+H))/k1


    f.write("      add.w r"+str(2)+", r"+str(2)+", r"+str(4)+"\n")         #(E-F)/k3+(G-H)/k4
    #if (1260+j)<1353:
    #    f.write("      subs.w r"+str(4)+", r"+str(2)+", r"+str(4)+", lsl #1\n")#(E-F)/k3-(G-H)/k4
    #    montgomery_multiplication(4,8)                                         #(E-F)/k3k1-(G-H)/k4k1
    
    f.write("      ldr.w r"+str(5)+", [r0, #"+str(360*ld_w)+"]\n")        #C
    f.write("      ldr.w r"+str(6)+", [r0, #"+str(540*ld_w)+"]\n")        #D
    f.write("      add.w r"+str(5)+", r"+str(5)+", r"+str(6)+"\n")         #(C+D)
    f.write("      subs.w r"+str(6)+", r"+str(5)+", r"+str(6)+", lsl #1\n")#(C-D)
    montgomery_multiplication(6,8)                                         #(C-D)/k2
        

    f.write("      ldr.w r"+str(9)+", [r0, #"+str(0*ld_w)+"]\n")             #A                
    f.write("      ldr.w r"+str(10)+", [r0, #"+str(180*ld_w)+"]\n")          #B        use r8 
    f.write("      add.w r"+str(0)+", r"+str(0)+", #"+str(ld_w)+" \n")       #increase r0 for next loop
    
    f.write("      add.w r"+str(9)+", r"+str(9)+", r"+str(10)+"\n")          #(A+B)
    f.write("      subs.w r"+str(10)+", r"+str(9)+", r"+str(10)+", lsl #1\n")#(A-B)
    
    f.write("      add.w r"+str(9)+", r"+str(9)+", r"+str(5)+"\n")          #(A+B)+(C+D)
    f.write("      subs.w r"+str(5)+", r"+str(9)+", r"+str(5)+", lsl #1\n") #(A+B)-(C+D)
    f.write("      add.w r"+str(10)+", r"+str(10)+", r"+str(6)+"\n")        #(A-B)+(C-D)/k2
    f.write("      subs.w r"+str(6)+", r"+str(10)+", r"+str(6)+", lsl #1\n")#(A-B)-(C-D)/k2
    
    f.write("      add.w r"+str(9)+", r"+str(9)+", r"+str(12)+"\n")        #((A+B)+(C+D))+((E+F)+(G+H))
    f.write("      add.w r"+str(10)+", r"+str(10)+", r"+str(2)+"\n")       #((A-B)+(C-D)/k2)+((E-F)/k3+(G-H)/k4)
    f.write("      add.w r"+str(5)+", r"+str(5)+", r"+str(3)+"\n")         #((A+B)-(C+D))+((E+F)-(G+H))/k1
    #if (1260+j)<1353:
    #    f.write("      add.w r"+str(6)+", r"+str(6)+", r"+str(4)+"\n")         #(A-B)-(C-D)/k2+(E-F)/k3k1-(G-H)/k4k1
    #else:
    f.write("      add.w r"+str(6)+", r"+str(6)+", r"+str(6)+"\n") 
    
    f.write("      str.w r"+str(9)+", [r1, #"+str(0*sd_w)+"]\n") 
    f.write("      str.w r"+str(10)+", [r1, #"+str(180*sd_w)+"]\n")
    f.write("      str.w r"+str(5)+", [r1, #"+str(360*sd_w)+"]\n")
    f.write("      str.w r"+str(6)+", [r1, #"+str(540*sd_w)+"]\n")

    f.write("      add.w r"+str(1)+", r"+str(1)+", #"+str(720*sd_w)+" \n") #increase r1 by 720*sd_w
    
    f.write("      subs.w r"+str(9)+", r"+str(9)+", r"+str(12)+", lsl #1\n")
    f.write("      subs.w r"+str(10)+", r"+str(10)+", r"+str(2)+", lsl #1\n")
    f.write("      subs.w r"+str(5)+", r"+str(5)+", r"+str(3)+", lsl #1\n")
    #if (1260+j)<1353:
    #    f.write("      subs.w r"+str(6)+", r"+str(6)+", r"+str(4)+", lsl #1\n")
        
    f.write("      str.w r"+str(9)+", [r1, #"+str(0*sd_w)+"]\n") 
    f.write("      str.w r"+str(10)+", [r1, #"+str(180*sd_w)+"]\n")
    f.write("      str.w r"+str(5)+", [r1, #"+str(360*sd_w)+"]\n")
    #if (1260+j)<1353:
    #    f.write("      str.w r"+str(6)+", [r1, #"+str(540*sd_w)+"]\n")

    f.write("      sub.w r"+str(1)+", r"+str(1)+", #"+str(719*sd_w)+" \n") #let r1 back to 0
    #f.write("      add.w r"+str(1)+", r"+str(1)+", #"+str(sd_w)+" \n") # increase r1 by sd_w for next loop

def INTT1440to180():
    ld_w = 4
    sd_w = 4
    f.write("      movw.w r11, #0xe001\n")     #r11=q=12902401
    f.write("      movt.w r11, #0x00c4\n")
    f.write("      movw.w lr, #0xdfff\n")      #lr=(-q^-1 mod+-R)=1019535359
    f.write("      movt.w lr, #0x3cc4\n")
    f.write("      movw.w r8, #0x94d8\n")      #r8=1/k4=2577**-540*2**32 mod q
    f.write("      movt.w r8, #0x0018\n")
    f.write("      vmov.w s1, r8\n")
    f.write("      movw.w r8, #0xa287\n")      #r8=1/k1=1/k2=2577**-360*2**32 mod q
    f.write("      movt.w r8, #0x006d\n")
    f.write("      movw.w r7, #0xd196\n")      #r7=1/k3=2577**-180*2**32 mod q
    f.write("      movt.w r7, #0x0022\n")
    f.write("      add.w  r9, r0 ,"+str(ld_w*137)+"\n")
    f.write("      vmov.w s3, r9\n")
    f.write("      add.w  r9, r0 ,"+str(ld_w*180)+"\n")
    f.write("      vmov.w s4, r9\n")

    '''for j in range(93):
        loop1()
    for j in range(93,180):
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
        


# In[3]:


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

def montgomery_reduction(a,b):#smull.w r"+str(a)+", r"+str(b)+", r"+str(x)+", r"+str(y)+"\n")
    f.write("      mul.w r"+str(9)+", r"+str(a)+", lr"+"\n")                       #r10=r9*lr              #lr=(-q^-1 mod+-R)
    f.write("      smlal.w r"+str(a)+", r"+str(b)+", r"+str(9)+", r"+str(11)+"\n") #ra+r9=r10*r11  (Accum) #r11=q

if __name__ == "__main__":
    f = open("../mult_test/test_INTT_1440to180_v4.S", 'w')
    f.write(".p2align 2,,3\n")
    f.write(".syntax unified\n")
    f.write(".text\n\n")
    write_macro()
    f.write(".global NTT_backward_1440to180\n")
    f.write(".type NTT_backward_1440to180, %function\n")
    f.write("@ void NTT_backward_1440to180(int32_t *input, int32_t* output)\n")
    f.write("NTT_backward_1440to180:\n")
    f.write("      push.w {r1-r12, lr}\n")        #tmp0=r8    #tmp1=r9
    INTT1440to180()   
#    f.write("      mov.w r0, r12\n") 
    f.write("      pop.w {r1-r12, pc}")
    f.close()


