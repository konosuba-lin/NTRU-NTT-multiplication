def mod2048():
    ld_w = 4
    #sd_w = 2
    sd_w = 4
    #f.write("      movw.w r12, #0x07ff\n")
    f.write("      movw.w r12, #0x07ff\n")
    f.write("      movt.w r12, #0x07ff\n")
    f.write("      movw.w r10, #0x014d\n")
    f.write("      movw.w r11, #0xe001\n")     #r11=q=12902401
    f.write("      movt.w r11, #0x00c4\n")    
    for i in range(170):
        if i==0:
            f.write("      ldr.w r"+str(2)+", [r0, #"+str(0*ld_w)+"]\n")       #r0
        else:
            f.write("      ldr.w r"+str(2)+", [r0, #"+str(1*ld_w)+"]!\n")      #r0+4
        if i<169:    
            f.write("      ldr.w r"+str(3)+", [r0, #"+str(677*ld_w)+"]\n")     #r0+677
            f.write("      ldr.w r"+str(4)+", [r0, #"+str(1*ld_w)+"]!\n")      #r0=r0+4
            f.write("      ldr.w r"+str(5)+", [r0, #"+str(677*ld_w)+"]\n")     #r0+677
            f.write("      ldr.w r"+str(6)+", [r0, #"+str(1*ld_w)+"]!\n")      #r0=r0+4
            f.write("      ldr.w r"+str(7)+", [r0, #"+str(677*ld_w)+"]\n")     #r0+677
            f.write("      ldr.w r"+str(8)+", [r0, #"+str(1*ld_w)+"]!\n")      #r0=r0+4
            f.write("      ldr.w r"+str(9)+", [r0, #"+str(677*ld_w)+"]\n")     #r0+677
        
        if i<169:    
            f.write("      add.w r"+str(2)+", r"+str(2)+", r"+str(3)+"\n")
            f.write("      add.w r"+str(4)+", r"+str(4)+", r"+str(5)+"\n")
            f.write("      add.w r"+str(6)+", r"+str(6)+", r"+str(7)+"\n")
            f.write("      add.w r"+str(8)+", r"+str(8)+", r"+str(9)+"\n")
        
        barrett_reduction(2,10)
        if i<169:
            barrett_reduction(4,10)          
            barrett_reduction(6,10)          
            barrett_reduction(8,10)          


        if(i<169):
            f.write("      pkhbt.w r2, r2, r4, lsl #16\n")
            f.write("      pkhbt.w r6, r6, r8, lsl #16\n")
            f.write("      and.w   r2, r12\n")
            f.write("      and.w   r6, r12\n")
            #f.write("      and.w r2, r12\n")                               #and 2077
            #f.write("      and.w r4, r12\n")                               #and 2077
            #f.write("      and.w r6, r12\n")                               #and 2077
            #f.write("      and.w r8, r12\n")                               #and 2077
            if i==0:
                f.write("      str.w r"+str(2)+", [r1, #"+str(0  *sd_w)+"]\n")    #r1
            else:
                f.write("      str.w r"+str(2)+", [r1, #"+str(1  *sd_w)+"]!\n")   #r1+2
            f.write("      str.w r"+str(6)+", [r1, #"+str(1  *sd_w)+"]!\n")
            #f.write("      strh.w r"+str(4)+", [r1, #"+str(1  *sd_w)+"]!\n")    #r1+2
            #f.write("      strh.w r"+str(6)+", [r1, #"+str(1  *sd_w)+"]!\n")    #r1+2
            #f.write("      strh.w r"+str(8)+", [r1, #"+str(1  *sd_w)+"]!\n")    #r1+2
        else:
            f.write("      and.w r2, r12\n")                               #and 2077
            f.write("      strh.w r"+str(2)+", [r1, #"+str(1  *sd_w)+"]!\n")   #r1+2
            

def barrett_reduction(a,b):              #ra mod+-q                                #ra 32bits 
    f.write("      smmulr.w r"+str(9)+", r"+str(a)+", r"+str(b)+"\n")              #r9=(ra*rb+2^31)>>32     #rb=round(R/q)=333
    f.write("      mls.w r"+str(a)+", r"+str(9)+", r"+str(11)+", r"+str(a)+"\n")   #ra=ra-r9*q              #r11=q

# In[5]:


if __name__ == "__main__":
    f = open("../mult_test/test_1440to677_mod2048.S", 'w')
    f.write(".p2align 1,,3\n")
    f.write(".syntax unified\n")
    f.write(".text\n\n")
    f.write(".global last_mod677_2048\n")
    f.write(".type last_mod677_2048, %function\n")
    f.write("@ void last_mod677_2048(int32_t *input, int16_t* output)\n")
    f.write("last_mod677_2048:\n")
    f.write("      push.w {r1-r12, lr}\n")        #tmp0=r8    #tmp1=r9
    mod2048()   
    f.write("      pop.w {r1-r12, pc}")
    f.close()

