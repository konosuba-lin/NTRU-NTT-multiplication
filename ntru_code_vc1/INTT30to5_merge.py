#r7 = omega(w) = 2577**480*2**32 mod q
#r8 = omgga(w^2) = 2577**960*2**32 mod q
#r11 = q
#lr = #lr=(-q^-1 mod+-R)
def INTT30to5():
    ld_w = 4
    sd_w = 4
    f.write("      movw.w r11, #0xe001\n")
    f.write("      movt.w r11, #0x00c4\n")
    f.write("      movw.w lr, #0xdfff\n")
    f.write("      movt.w lr, #0x3cc4\n")
    f.write("      movw.w r7, #0xe31c\n")
    f.write("      movt.w r7, #0x0022\n")
    f.write("      movw.w r8, #0x5e32\n")
    f.write("      movt.w r8, #0x00b9\n")
    n = [  0, 120,  80, 200, 160,  40,  20, 140, 100, 220, 
         180,  60,  10, 130,  90, 210, 170,  50,  30, 150,
         110, 230, 190,  70,   5, 125,  85, 205, 165,  45,
          25, 145, 105, 225, 185,  65,  15, 135,  95, 215,
         175, 55, 35, 155, 115, 235, 195, 75]
    for i in range(8*6):
        c = pow(2577,1440-n[i],12902401)
        if(c!=1):
            for k in range(1,6):
                p=hex(pow(c,k,12902401)*pow(2,32,12902401)%12902401)[2:].zfill(8)
                a=p[0:4]
                b=p[4:8]
                f.write("      movw.w r9, #0x"+str(b)+"\n")
                f.write("      movt.w r9, #0x"+str(a)+"\n")            
                f.write("      vmov.w s"+str(k+3)+", r"+str(9)+"\n")
        '''for k in range(6):
            p=hex(pow(c,k,12902401)*pow(2,32,12902401)*3444280%12902401)[2:].zfill(8) #3444280 = 2^32/(8*6*6), the extra 2^32 is for 5*5 mul
            a=p[0:4]
            b=p[4:8]
            f.write("      movw.w r9, #0x"+str(b)+"\n")
            f.write("      movt.w r9, #0x"+str(a)+"\n")            
            f.write("      vmov.w s"+str(k+4)+", r"+str(9)+"\n")'''
        INTT30to5_part_v2(c)
        f.write("      add.w r"+str(0)+", r"+str(0)+", #"+str(25*ld_w)+" \n") #increase r0 for next part
        f.write("      add.w r"+str(1)+", r"+str(1)+", #"+str(25*sd_w)+" \n") #increase r1 for next part



def INTT30to5_part_v2(c):
    ld_w = 4
    sd_w = 4
    for j in range(5):
        f.write("      ldr.w r"+str(12)+", [r0, #"+str(0*ld_w)+"]\n")#0
        f.write("      ldr.w r"+str(2)+", [r0, #"+str(5*ld_w)+"]\n") #1
        f.write("      ldr.w r"+str(3)+", [r0, #"+str(10*ld_w)+"]\n")#2
        f.write("      ldr.w r"+str(4)+", [r0, #"+str(15*ld_w)+"]\n")#3
        f.write("      ldr.w r"+str(5)+", [r0, #"+str(20*ld_w)+"]\n")#4
        f.write("      ldr.w r"+str(6)+", [r0, #"+str(25*ld_w)+"]\n")#5
        f.write("      add.w r"+str(0)+", r"+str(0)+", #"+str(ld_w)+" \n") #increase r0 for next loop
        
        f.write("      add.w r"+str(12)+", r"+str(12)+", r"+str(2)+"\n")        #(0+1)
        f.write("      add.w r"+str(3)+", r"+str(3)+", r"+str(4)+"\n")          #(2+3)
        f.write("      add.w r"+str(5)+", r"+str(5)+", r"+str(6)+"\n")          #(4+5)
        f.write("      subs.w r"+str(2)+", r"+str(12)+", r"+str(2)+", lsl #1\n")#(0-1)
        f.write("      subs.w r"+str(4)+", r"+str(3)+", r"+str(4)+", lsl #1\n") #(2-3)
        f.write("      subs.w r"+str(6)+", r"+str(5)+", r"+str(6)+", lsl #1\n") #(4-5)

        f.write("      vmov.w s"+str(2)+", r"+str(2)+"\n")

        
        f.write("      add.w r"+str(2)+", r"+str(12)+", r"+str(3)+"\n")         #(0+1)+(2+3)
        f.write("      add.w r"+str(2)+", r"+str(2)+", r"+str(5)+"\n")          #(0+1)+(2+3)+(4+5)=6*a0
        #f.write("      str.w r"+str(2)+", [r1, #"+str(0*sd_w)+"]\n")
        
        
        f.write("      smull.w r"+str(9)+", r"+str(3)+", r"+str(3)+", r"+str(7)+"\n")   #(2+3)w
        f.write("      smlal.w r"+str(9)+", r"+str(3)+", r"+str(5)+", r"+str(8)+"\n")   #(2+3)w+(4+5)w^2
        f.write("      mul.w r"+str(10)+", r"+str(9)+", lr"+"\n")                       #r10=r9*lr              #lr=(-q^-1 mod+-R)
        f.write("      smlal.w r"+str(9)+", r"+str(3)+", r"+str(10)+", r"+str(11)+"\n") #ra+r9=r10*r11  (Accum) #r11=q
        f.write("      add.w r"+str(3)+", r"+str(12)+", r"+str(3)+"\n")         #(0+1)+(2+3)w+(4+5)w^2
        #f.write("      str.w r"+str(3)+", [r1, #"+str(60*sd_w)+"]\n")

        f.write("      add.w r"+str(10)+", r"+str(2)+", r"+str(3)+"\n")          #(0+1)+(2+3)+(4+5)+(0+1)+(2+3)w+(4+5)w^2
        f.write("      add.w r"+str(9)+", r"+str(12)+", r"+str(12)+", lsl #1\n")#3*(0+1)
        f.write("      subs.w r"+str(5)+", r"+str(9)+", r"+str(10)+"\n")         #=(0+1)+(2+3)w^2+(4+5)w=6*a4
        #f.write("      str.w r"+str(5)+", [r1, #"+str(120*sd_w)+"]\n")

        f.write("      vmov.w s"+str(3)+", r"+str(2)+"\n")
        f.write("      vmov.w r"+str(2)+", s"+str(2)+"\n")

        f.write("      add.w r"+str(12)+", r"+str(2)+", r"+str(4)+"\n")          #(0-1)+(2-3)
        f.write("      add.w r"+str(12)+", r"+str(12)+", r"+str(6)+"\n")          #(0-1)+(2-3)+(4-5)=6*a3
        #f.write("      str.w r"+str(12)+", [r1, #"+str(90*sd_w)+"]\n")

        
        f.write("      smull.w r"+str(9)+", r"+str(4)+", r"+str(4)+", r"+str(7)+"\n")   #(2-3)w
        f.write("      smlal.w r"+str(9)+", r"+str(4)+", r"+str(6)+", r"+str(8)+"\n")   #(2-3)w+(4-5)w^2
        f.write("      mul.w r"+str(10)+", r"+str(9)+", lr"+"\n")                       #r10=r9*lr              #lr=(-q^-1 mod+-R)
        f.write("      smlal.w r"+str(9)+", r"+str(4)+", r"+str(10)+", r"+str(11)+"\n") #ra+r9=r10*r11  (Accum) #r11=q
        f.write("      add.w r"+str(4)+", r"+str(2)+", r"+str(4)+"\n")         #(0-1)+(2-3)w+(4-5)w^2
        #f.write("      str.w r"+str(4)+", [r1, #"+str(150*sd_w)+"]\n")


        f.write("      add.w r"+str(10)+", r"+str(12)+", r"+str(4)+"\n")          #(0-1)+(2-3)+(4-5)+(0-1)+(2-3)w+(4-5)w^2
        f.write("      add.w r"+str(9)+", r"+str(2)+", r"+str(2)+", lsl #1\n")  #3*(0-1)
        f.write("      subs.w r"+str(6)+", r"+str(9)+", r"+str(10)+"\n")         #=(0-1)+(2-3)w^2+(4-5)w = 6*a1
        #f.write("      str.w r"+str(6)+", [r1, #"+str(30*sd_w)+"]\n")

        #f.write("      mov.w r"+str(2)+", r"+str(12)+"\n")
        #f.write("      vmov.w r"+str(12)+", s"+str(3)+"\n")
        f.write("      vmov.w r"+str(2)+", s"+str(3)+"\n")

        if(c!=1):
            #r = [12,6,3,2,5,4]
            r = [2,6,3,12,5,4]
            for k in range(1,6):
                f.write("      vmov.w r9, s"+str(k+3)+"\n")
                montgomery_multiplication(r[k],9)
        '''for k in range(6):
            f.write("      vmov.w r9, s"+str(k+4)+"\n")
            montgomery_multiplication(r[k],9)'''

        #f.write("      str.w r"+str(12)+", [r1, #"+str(0*sd_w)+"]\n")
        f.write("      str.w r"+str(2)+", [r1, #"+str(0*sd_w)+"]\n")
        f.write("      str.w r"+str(6)+", [r1, #"+str(5*sd_w)+"]\n")
        f.write("      str.w r"+str(3)+", [r1, #"+str(10*sd_w)+"]\n")
        #f.write("      str.w r"+str(2)+", [r1, #"+str(15*sd_w)+"]\n")
        f.write("      str.w r"+str(12)+", [r1, #"+str(15*sd_w)+"]\n")
        f.write("      str.w r"+str(5)+", [r1, #"+str(20*sd_w)+"]\n")
        f.write("      str.w r"+str(4)+", [r1, #"+str(25*sd_w)+"]\n")

        f.write("      add.w r"+str(1)+", r"+str(1)+", #"+str(sd_w)+" \n") #increase r1 for next loop



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

def write_macro_no_w():
    f.write(".macro montgomery_mul a, b, lower, upper, tmp, Mprime, M\n")
    f.write("      smull \\lower, \\upper, \\a, \\b\n")
    f.write("      mul \\tmp, \\lower, \\Mprime\n")
    f.write("      smlal \\lower, \\upper, \\tmp, \\M\n")
    f.write(".endm\n\n")


if __name__ == "__main__":
    f = open("../mult_test/test_INTT_30to5_v4.S", 'w')
    f.write(".p2align 2,,3\n")
    f.write(".syntax unified\n")
    f.write(".text\n\n")
    write_macro()
    f.write(".global NTT_backward_30to5\n")
    f.write(".type NTT_backward_30to5, %function\n")
    f.write("@ void NTT_backward_30to5(int32_t *input, int32_t* output)\n")
    f.write("NTT_backward_30to5:\n")
    f.write("      push.w {r1-r12, lr}\n")
    INTT30to5()   
    f.write("      pop.w {r1-r12, pc}")
    f.close()

