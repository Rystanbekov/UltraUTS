///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     01/Jun/2017  16:02:07 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  Z:\Generator 8ch\IAR\main.c                             /
//    Command line =  "Z:\Generator 8ch\IAR\main.c" -D STM32F10X_MD -D        /
//                    USE_FULL_ASSERT -lB "Z:\Generator 8ch\IAR\Debug\List\"  /
//                    -o "Z:\Generator 8ch\IAR\Debug\Obj\" --no_cse           /
//                    --no_unroll --no_inline --no_code_motion --no_tbaa      /
//                    --no_clustering --no_scheduling --debug                 /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "D:\Program Files\IAR Systems\Embedded    /
//                    Workbench 7.2_3\arm\INC\c\DLib_Config_Normal.h" -On     /
//                    --vla --use_c++_inline -I "D:\Program Files\IAR         /
//                    Systems\Embedded Workbench 7.2_3\arm\CMSIS\Include\"    /
//    List file    =  Z:\Generator 8ch\IAR\Debug\List\main.s                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME main

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_d2f
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_ui2f
        EXTERN init_gpio
        EXTERN sinf

        PUBLIC `DATA`
        PUBLIC asdf
        PUBLIC cycle
        PUBLIC main

// Z:\Generator 8ch\IAR\main.c
//    1 #include "init_periph.h"
//    2 #include "stm32f10x_gpio.h"
//    3 #include "stm32f10x_rcc.h"
//    4 #include "math.h"
//    5 
//    6 #define TIM_FREQ 128000000/17
//    7 #define SIN_SIZE 2048
//    8 #define SIN_SIZE_M1 SIN_SIZE-1
//    9 
//   10 #define F1 70
//   11 #define F2 35
//   12 #define F3 36
//   13 #define F4 37
//   14 #define F5 38
//   15 #define F6 39
//   16 #define F7 40
//   17 #define F8 70
//   18 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 uint16_t DATA[SIN_SIZE*4];
`DATA`:
        DS8 16384

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   20 uint8_t asdf[SIN_SIZE];
asdf:
        DS8 2048
//   21 
//   22 void cycle(uint32_t* porta,uint32_t* portb,uint32_t* portc,uint32_t* portd);
//   23 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   24 int main()
//   25 {
main:
        PUSH     {R4-R10,LR}
//   26   __disable_irq();
        CPSID    I
//   27   init_gpio();
        BL       init_gpio
//   28   
//   29   for(uint16_t i=0;i<SIN_SIZE;i++)
        MOVS     R8,#+0
??main_0:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+2048
        BGE.W    ??main_1
//   30   {
//   31     uint8_t temp;
//   32     uint16_t tempa=0,tempb=0,tempc=0,tempd=0;
        MOVS     R5,#+0
        MOVS     R6,#+0
        MOVS     R7,#+0
        MOVS     R9,#+0
//   33     
//   34     float angle = (float)6.283185307179586476925286766559*(float)i*(float)F1/(float)SIN_SIZE;
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOV      R0,R8
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable0  ;; 0x40c90fdb
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable0_1  ;; 0x428c0000
        BL       __aeabi_fmul
        MOVS     R1,#+1157627904
        BL       __aeabi_fdiv
        MOV      R10,R0
//   35     temp=(uint8_t)(sinf(angle)*15.9)+16;
        MOV      R0,R10
        BL       sinf
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable0_2  ;; 0xcccccccd
        LDR.W    R3,??DataTable0_3  ;; 0x402fcccc
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        ADDS     R0,R0,#+16
        MOVS     R4,R0
//   36     asdf[i]=temp;
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        LDR.W    R0,??DataTable0_4
        STRB     R4,[R8, R0]
//   37     
//   38     if(temp&(1<<4)) tempb|=A4_PIN;
        LSLS     R0,R4,#+27
        BPL.N    ??main_2
        ORRS     R6,R6,#0x20
//   39     if(temp&(1<<3)) tempb|=A3_PIN;
??main_2:
        LSLS     R0,R4,#+28
        BPL.N    ??main_3
        ORRS     R6,R6,#0x10
//   40     if(temp&(1<<2)) tempb|=A2_PIN;
??main_3:
        LSLS     R0,R4,#+29
        BPL.N    ??main_4
        ORRS     R6,R6,#0x8
//   41     if(temp&(1<<1)) tempd|=A1_PIN;
??main_4:
        LSLS     R0,R4,#+30
        BPL.N    ??main_5
        ORRS     R9,R9,#0x4
//   42     if(temp&(1<<0)) tempc|=A0_PIN;
??main_5:
        LSLS     R0,R4,#+31
        BPL.N    ??main_6
        ORRS     R7,R7,#0x1000
//   43     
//   44     temp=(uint8_t)(sinf(6.283185307179586476925286766559*(float)i*(float)F2/(float)SIN_SIZE)*15.9)+16;
??main_6:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOV      R0,R8
        BL       __aeabi_ui2f
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable0_5  ;; 0x54442d18
        LDR.W    R3,??DataTable0_6  ;; 0x401921fb
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??DataTable0_7  ;; 0x40418000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??DataTable0_8  ;; 0x40a00000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        BL       sinf
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable0_2  ;; 0xcccccccd
        LDR.W    R3,??DataTable0_3  ;; 0x402fcccc
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        ADDS     R0,R0,#+16
        MOVS     R4,R0
//   45     if(temp&(1<<4)) tempc|=B4_PIN;
        LSLS     R0,R4,#+27
        BPL.N    ??main_7
        ORRS     R7,R7,#0x800
//   46     if(temp&(1<<3)) tempc|=B3_PIN;
??main_7:
        LSLS     R0,R4,#+28
        BPL.N    ??main_8
        ORRS     R7,R7,#0x400
//   47     if(temp&(1<<2)) tempa|=B2_PIN;
??main_8:
        LSLS     R0,R4,#+29
        BPL.N    ??main_9
        ORRS     R5,R5,#0x8000
//   48     if(temp&(1<<1)) tempa|=B1_PIN;
??main_9:
        LSLS     R0,R4,#+30
        BPL.N    ??main_10
        ORRS     R5,R5,#0x1000
//   49     if(temp&(1<<0)) tempa|=B0_PIN;
??main_10:
        LSLS     R0,R4,#+31
        BPL.N    ??main_11
        ORRS     R5,R5,#0x800
//   50     
//   51     temp=(uint8_t)(sinf(6.283185307179586476925286766559*(float)i*(float)F3/(float)SIN_SIZE)*15.9)+16;
??main_11:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOV      R0,R8
        BL       __aeabi_ui2f
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable0_5  ;; 0x54442d18
        LDR.N    R3,??DataTable0_6  ;; 0x401921fb
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable0_9  ;; 0x40420000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable0_8  ;; 0x40a00000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        BL       sinf
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable0_2  ;; 0xcccccccd
        LDR.N    R3,??DataTable0_3  ;; 0x402fcccc
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        ADDS     R0,R0,#+16
        MOVS     R4,R0
//   52     if(temp&(1<<4)) tempa|=C4_PIN;
        LSLS     R0,R4,#+27
        BPL.N    ??main_12
        ORRS     R5,R5,#0x400
//   53     if(temp&(1<<3)) tempa|=C3_PIN;
??main_12:
        LSLS     R0,R4,#+28
        BPL.N    ??main_13
        ORRS     R5,R5,#0x200
//   54     if(temp&(1<<2)) tempa|=C2_PIN;
??main_13:
        LSLS     R0,R4,#+29
        BPL.N    ??main_14
        ORRS     R5,R5,#0x100
//   55     if(temp&(1<<1)) tempc|=C1_PIN;
??main_14:
        LSLS     R0,R4,#+30
        BPL.N    ??main_15
        ORRS     R7,R7,#0x200
//   56     if(temp&(1<<0)) tempc|=C0_PIN;
??main_15:
        LSLS     R0,R4,#+31
        BPL.N    ??main_16
        ORRS     R7,R7,#0x100
//   57     
//   58     temp=(uint8_t)(sinf(6.283185307179586476925286766559*(float)i*(float)F4/(float)SIN_SIZE)*15.9)+16;
??main_16:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOV      R0,R8
        BL       __aeabi_ui2f
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable0_5  ;; 0x54442d18
        LDR.N    R3,??DataTable0_6  ;; 0x401921fb
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable0_10  ;; 0x40428000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable0_8  ;; 0x40a00000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        BL       sinf
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable0_2  ;; 0xcccccccd
        LDR.N    R3,??DataTable0_3  ;; 0x402fcccc
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        ADDS     R0,R0,#+16
        MOVS     R4,R0
//   59     if(temp&(1<<4)) tempc|=D4_PIN;
        LSLS     R0,R4,#+27
        BPL.N    ??main_17
        ORRS     R7,R7,#0x80
//   60     if(temp&(1<<3)) tempc|=D3_PIN;
??main_17:
        LSLS     R0,R4,#+28
        BPL.N    ??main_18
        ORRS     R7,R7,#0x40
//   61     if(temp&(1<<2)) tempb|=D2_PIN;
??main_18:
        LSLS     R0,R4,#+29
        BPL.N    ??main_19
        ORRS     R6,R6,#0x8000
//   62     if(temp&(1<<1)) tempb|=D1_PIN;
??main_19:
        LSLS     R0,R4,#+30
        BPL.N    ??main_20
        ORRS     R6,R6,#0x4000
//   63     if(temp&(1<<0)) tempb|=D0_PIN;
??main_20:
        LSLS     R0,R4,#+31
        BPL.N    ??main_21
        ORRS     R6,R6,#0x2000
//   64     
//   65     temp=(uint8_t)(sinf(6.283185307179586476925286766559*(float)i*(float)F5/(float)SIN_SIZE)*15.9)+16;
??main_21:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOV      R0,R8
        BL       __aeabi_ui2f
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable0_5  ;; 0x54442d18
        LDR.N    R3,??DataTable0_6  ;; 0x401921fb
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable0_11  ;; 0x40430000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable0_8  ;; 0x40a00000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        BL       sinf
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable0_2  ;; 0xcccccccd
        LDR.N    R3,??DataTable0_3  ;; 0x402fcccc
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        ADDS     R0,R0,#+16
        MOVS     R4,R0
//   66     if(temp&(1<<4)) tempb|=E4_PIN;
        LSLS     R0,R4,#+27
        BPL.N    ??main_22
        ORRS     R6,R6,#0x1000
//   67     if(temp&(1<<3)) tempb|=E3_PIN;
??main_22:
        LSLS     R0,R4,#+28
        BPL.N    ??main_23
        ORRS     R6,R6,#0x800
//   68     if(temp&(1<<2)) tempb|=E2_PIN;
??main_23:
        LSLS     R0,R4,#+29
        BPL.N    ??main_24
        ORRS     R6,R6,#0x400
//   69     if(temp&(1<<1)) tempb|=E1_PIN;
??main_24:
        LSLS     R0,R4,#+30
        BPL.N    ??main_25
        ORRS     R6,R6,#0x4
//   70     if(temp&(1<<0)) tempb|=E0_PIN;
??main_25:
        LSLS     R0,R4,#+31
        BPL.N    ??main_26
        ORRS     R6,R6,#0x2
//   71     
//   72     temp=(uint8_t)(sinf(6.283185307179586476925286766559*(float)i*(float)F6/(float)SIN_SIZE)*15.9)+16;
??main_26:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOV      R0,R8
        BL       __aeabi_ui2f
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable0_5  ;; 0x54442d18
        LDR.N    R3,??DataTable0_6  ;; 0x401921fb
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable0_12  ;; 0x40438000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable0_8  ;; 0x40a00000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        BL       sinf
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable0_2  ;; 0xcccccccd
        LDR.N    R3,??DataTable0_3  ;; 0x402fcccc
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        ADDS     R0,R0,#+16
        MOVS     R4,R0
//   73     if(temp&(1<<4)) tempb|=F4_PIN;
        LSLS     R0,R4,#+27
        BPL.N    ??main_27
        ORRS     R6,R6,#0x1
//   74     if(temp&(1<<3)) tempc|=F3_PIN;
??main_27:
        LSLS     R0,R4,#+28
        BPL.N    ??main_28
        ORRS     R7,R7,#0x20
//   75     if(temp&(1<<2)) tempc|=F2_PIN; 
??main_28:
        LSLS     R0,R4,#+29
        BPL.N    ??main_29
        ORRS     R7,R7,#0x10
//   76     if(temp&(1<<1)) tempa|=F1_PIN;
??main_29:
        LSLS     R0,R4,#+30
        BPL.N    ??main_30
        ORRS     R5,R5,#0x80
//   77     if(temp&(1<<0)) tempa|=F0_PIN;
??main_30:
        LSLS     R0,R4,#+31
        BPL.N    ??main_31
        ORRS     R5,R5,#0x40
//   78     
//   79     temp=(uint8_t)(sinf(6.283185307179586476925286766559*(float)i*(float)F7/(float)SIN_SIZE)*15.9)+16;
??main_31:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOV      R0,R8
        BL       __aeabi_ui2f
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable0_5  ;; 0x54442d18
        LDR.N    R3,??DataTable0_6  ;; 0x401921fb
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable0_13  ;; 0x40440000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable0_8  ;; 0x40a00000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        BL       sinf
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable0_2  ;; 0xcccccccd
        LDR.N    R3,??DataTable0_3  ;; 0x402fcccc
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        ADDS     R0,R0,#+16
        MOVS     R4,R0
//   80     if(temp&(1<<4)) tempa|=G4_PIN;
        LSLS     R0,R4,#+27
        BPL.N    ??main_32
        ORRS     R5,R5,#0x20
//   81     if(temp&(1<<3)) tempa|=G3_PIN;
??main_32:
        LSLS     R0,R4,#+28
        BPL.N    ??main_33
        ORRS     R5,R5,#0x10
//   82     if(temp&(1<<2)) tempa|=G2_PIN;
??main_33:
        LSLS     R0,R4,#+29
        BPL.N    ??main_34
        ORRS     R5,R5,#0x8
//   83     if(temp&(1<<1)) tempa|=G1_PIN;
??main_34:
        LSLS     R0,R4,#+30
        BPL.N    ??main_35
        ORRS     R5,R5,#0x4
//   84     if(temp&(1<<0)) tempa|=G0_PIN;
??main_35:
        LSLS     R0,R4,#+31
        BPL.N    ??main_36
        ORRS     R5,R5,#0x2
//   85     
//   86     temp=(uint8_t)(sinf(6.283185307179586476925286766559*(float)i*(float)F8/(float)SIN_SIZE)*15.9)+16;
??main_36:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOV      R0,R8
        BL       __aeabi_ui2f
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable0_5  ;; 0x54442d18
        LDR.N    R3,??DataTable0_6  ;; 0x401921fb
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable0_14  ;; 0x40518000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable0_8  ;; 0x40a00000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        BL       sinf
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable0_2  ;; 0xcccccccd
        LDR.N    R3,??DataTable0_3  ;; 0x402fcccc
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        ADDS     R0,R0,#+16
        MOVS     R4,R0
//   87     if(temp&(1<<4)) tempa|=H4_PIN;
        LSLS     R0,R4,#+27
        BPL.N    ??main_37
        ORRS     R5,R5,#0x1
//   88     if(temp&(1<<3)) tempc|=H3_PIN;
??main_37:
        LSLS     R0,R4,#+28
        BPL.N    ??main_38
        ORRS     R7,R7,#0x8
//   89     if(temp&(1<<2)) tempc|=H2_PIN;
??main_38:
        LSLS     R0,R4,#+29
        BPL.N    ??main_39
        ORRS     R7,R7,#0x4
//   90     if(temp&(1<<1)) tempc|=H1_PIN;
??main_39:
        LSLS     R0,R4,#+30
        BPL.N    ??main_40
        ORRS     R7,R7,#0x2
//   91     if(temp&(1<<0)) tempc|=H0_PIN;
??main_40:
        LSLS     R0,R4,#+31
        BPL.N    ??main_41
        ORRS     R7,R7,#0x1
//   92 
//   93     DATA[i*4+0]=tempa;
??main_41:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        LDR.N    R0,??DataTable0_15
        STRH     R5,[R0, R8, LSL #+3]
//   94     DATA[i*4+2]=tempb;
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        LSLS     R0,R8,#+2
        LDR.N    R1,??DataTable0_15
        ADDS     R0,R1,R0, LSL #+1
        STRH     R6,[R0, #+4]
//   95     uint16_t temp2=tempc;
        MOVS     R0,R7
//   96     DATA[i*4+1]=(tempc>>8)+(temp2<<8);
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        LSLS     R1,R8,#+2
        LDR.N    R2,??DataTable0_15
        ADDS     R1,R2,R1, LSL #+1
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LSRS     R2,R7,#+8
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ADDS     R2,R2,R0, LSL #+8
        STRH     R2,[R1, #+2]
//   97     temp2=tempd;
        MOV      R0,R9
//   98     DATA[i*4+3]=(tempd>>8)+(temp2<<8);
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        LSLS     R1,R8,#+2
        LDR.N    R2,??DataTable0_15
        ADDS     R1,R2,R1, LSL #+1
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        LSRS     R2,R9,#+8
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ADDS     R0,R2,R0, LSL #+8
        STRH     R0,[R1, #+6]
//   99 
//  100   }
        ADDS     R8,R8,#+1
        B.N      ??main_0
//  101   
//  102   
//  103   cycle((uint32_t*)&(GPIOA->ODR),(uint32_t*)&(GPIOB->ODR),(uint32_t*)&(GPIOC->ODR),(uint32_t*)&(GPIOD->ODR));
??main_1:
        LDR.N    R3,??DataTable0_16  ;; 0x4001140c
        LDR.N    R2,??DataTable0_17  ;; 0x4001100c
        LDR.N    R1,??DataTable0_18  ;; 0x40010c0c
        LDR.N    R0,??DataTable0_19  ;; 0x4001080c
        BL       cycle
//  104 
//  105   asm("mov r4, #0x20000000");
        mov r4, #0x20000000
//  106   asm("mov r5, #4096*4");
        mov r5, #4096*4
//  107   asm("sub r5, r5, #1");
        sub r5, r5, #1
//  108   asm("add r5, r5, r4");
        add r5, r5, r4
//  109   asm("add r4, r4, #4");
        add r4, r4, #4
//  110   asm("mov r6, r4");
        mov r6, r4
//  111 
//  112   while(1)
//  113   {
//  114     /*
//  115     asm("ldrh r7, [r4,r6]");
//  116     asm("add r6,r6,#2");
//  117     asm("ldrh r8, [r4,r6]");
//  118     asm("add r6,r6,#2");
//  119     asm("ldrh r9, [r4,r6]");
//  120     asm("add r6,r6,#2");
//  121     asm("ldrh r10, [r4,r6]");
//  122     asm("add r6,r6,#2");
//  123     */
//  124     asm("ldmfd r6!,{r7-r8}");  
??main_42:
        ldmfd r6!,{r7-r8}
//  125     
//  126     asm("strh r7, [r0]");
        strh r7, [r0]
//  127     asm("strh r8, [r1]");
        strh r8, [r1]
//  128     asm("rev.w r7, r7");
        rev.w r7, r7
//  129     asm("rev.w r8, r8");
        rev.w r8, r8
//  130     asm("strh r7, [r2]");
        strh r7, [r2]
//  131     asm("strh r8, [r3]");
        strh r8, [r3]
//  132     
//  133     //asm("sub r6, r6,r4");
//  134     asm("and r6, r6,r5");
        and r6, r6,r5
        B.N      ??main_42
//  135     //asm("add r6, r6,r4");
//  136   }
//  137 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x40c90fdb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     0x428c0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     0xcccccccd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     0x402fcccc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     asdf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     0x54442d18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_6:
        DC32     0x401921fb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_7:
        DC32     0x40418000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_8:
        DC32     0x40a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_9:
        DC32     0x40420000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_10:
        DC32     0x40428000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_11:
        DC32     0x40430000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_12:
        DC32     0x40438000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_13:
        DC32     0x40440000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_14:
        DC32     0x40518000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_15:
        DC32     `DATA`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_16:
        DC32     0x4001140c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_17:
        DC32     0x4001100c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_18:
        DC32     0x40010c0c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_19:
        DC32     0x4001080c
//  138 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  139 void cycle(uint32_t* porta,uint32_t* portb,uint32_t* portc,uint32_t* portd)
//  140 {}
cycle:
        BX       LR               ;; return

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
// 18 432 bytes in section .bss
//  1 148 bytes in section .text
// 
//  1 148 bytes of CODE memory
// 18 432 bytes of DATA memory
//
//Errors: none
//Warnings: none
