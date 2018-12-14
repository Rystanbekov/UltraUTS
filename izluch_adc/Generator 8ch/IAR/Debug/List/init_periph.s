///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     31/May/2017  14:31:51 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  Z:\Generator 8ch\IAR\init_periph.c                      /
//    Command line =  "Z:\Generator 8ch\IAR\init_periph.c" -D STM32F10X_MD    /
//                    -D USE_FULL_ASSERT -lB "Z:\Generator                    /
//                    8ch\IAR\Debug\List\" -o "Z:\Generator                   /
//                    8ch\IAR\Debug\Obj\" --no_cse --no_unroll --no_inline    /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "D:\Program Files\IAR Systems\Embedded Workbench        /
//                    7.2_3\arm\INC\c\DLib_Config_Normal.h" -On --vla         /
//                    --use_c++_inline -I "D:\Program Files\IAR               /
//                    Systems\Embedded Workbench 7.2_3\arm\CMSIS\Include\"    /
//    List file    =  Z:\Generator 8ch\IAR\Debug\List\init_periph.s           /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME init_periph

        #define SHT_PROGBITS 0x1

        EXTERN GPIO_Init
        EXTERN GPIO_PinRemapConfig
        EXTERN RCC_APB1PeriphClockCmd
        EXTERN RCC_APB2PeriphClockCmd
        EXTERN TIM_Cmd
        EXTERN TIM_ITConfig
        EXTERN TIM_TimeBaseInit
        EXTERN TIM_TimeBaseStructInit

        PUBLIC init_gpio
        PUBLIC init_nvic
        PUBLIC init_tim4

// Z:\Generator 8ch\IAR\init_periph.c
//    1 #include "init_periph.h"
//    2 #include "stm32f10x.h"

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_EnableIRQ(IRQn_Type)
NVIC_EnableIRQ:
        PUSH     {R4}
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R1,R0,#+5
        LDR.N    R2,??DataTable4  ;; 0xe000e100
        MOVS     R3,#+1
        ANDS     R4,R0,#0x1F
        LSLS     R3,R3,R4
        STR      R3,[R2, R1, LSL #+2]
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_SetPriority(IRQn_Type, uint32_t)
NVIC_SetPriority:
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BPL.N    ??NVIC_SetPriority_0
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        ANDS     R2,R0,#0xF
        LDR.N    R3,??DataTable4_1  ;; 0xe000ed18
        ADDS     R2,R2,R3
        LSLS     R3,R1,#+4
        STRB     R3,[R2, #-4]
        B.N      ??NVIC_SetPriority_1
??NVIC_SetPriority_0:
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable4_2  ;; 0xe000e400
        LSLS     R3,R1,#+4
        STRB     R3,[R0, R2]
??NVIC_SetPriority_1:
        BX       LR               ;; return
//    3 #include "stm32f10x_rcc.h"
//    4 #include "stm32f10x_adc.h"
//    5 #include "stm32f10x_tim.h"
//    6 #include "stm32f10x_gpio.h"
//    7 #include "stm32f10x_dma.h"
//    8 #include "misc.h"
//    9 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   10 void init_tim4(void)
//   11 {
init_tim4:
        PUSH     {R5-R7,LR}
//   12   RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM4, ENABLE);
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       RCC_APB1PeriphClockCmd
//   13   TIM_TimeBaseInitTypeDef timer;
//   14   TIM_TimeBaseStructInit(&timer);
        ADD      R0,SP,#+0
        BL       TIM_TimeBaseStructInit
//   15   timer.TIM_Prescaler = 72/4-1;
        MOVS     R0,#+17
        STRH     R0,[SP, #+0]
//   16   timer.TIM_Period = 1;
        MOVS     R0,#+1
        STRH     R0,[SP, #+4]
//   17   TIM_TimeBaseInit(TIM4, &timer);
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable4_3  ;; 0x40000800
        BL       TIM_TimeBaseInit
//   18   TIM_Cmd(TIM4, ENABLE);
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_3  ;; 0x40000800
        BL       TIM_Cmd
//   19 }
        POP      {R0-R2,PC}       ;; return
//   20 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   21 void init_gpio()
//   22 {
init_gpio:
        PUSH     {R7,LR}
//   23   GPIO_InitTypeDef GPIO_InitStructure;
//   24 
//   25   RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA | RCC_APB2Periph_GPIOB | RCC_APB2Periph_GPIOC | RCC_APB2Periph_GPIOD | RCC_APB2Periph_GPIOE | RCC_APB2Periph_AFIO, ENABLE);
        MOVS     R1,#+1
        MOVS     R0,#+125
        BL       RCC_APB2PeriphClockCmd
//   26   
//   27   GPIO_PinRemapConfig(GPIO_Remap_SWJ_NoJTRST,ENABLE);
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_4  ;; 0x300100
        BL       GPIO_PinRemapConfig
//   28   GPIO_PinRemapConfig(GPIO_Remap_SWJ_JTAGDisable,ENABLE);
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_5  ;; 0x300200
        BL       GPIO_PinRemapConfig
//   29   
//   30   GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
        MOVS     R0,#+16
        STRB     R0,[SP, #+3]
//   31   GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
//   32   
//   33   GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_2|GPIO_Pin_3|GPIO_Pin_4|GPIO_Pin_5|GPIO_Pin_6|GPIO_Pin_7|GPIO_Pin_8|GPIO_Pin_9|GPIO_Pin_10|GPIO_Pin_11|GPIO_Pin_12|GPIO_Pin_15;
        MOVW     R0,#+40959
        STRH     R0,[SP, #+0]
//   34   GPIO_Init(GPIOA, &GPIO_InitStructure);
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable4_6  ;; 0x40010800
        BL       GPIO_Init
//   35   
//   36   GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_2|GPIO_Pin_3|GPIO_Pin_4|GPIO_Pin_5|GPIO_Pin_10|GPIO_Pin_11|GPIO_Pin_12|GPIO_Pin_13|GPIO_Pin_14|GPIO_Pin_15;
        MOVW     R0,#+64575
        STRH     R0,[SP, #+0]
//   37   GPIO_Init(GPIOB, &GPIO_InitStructure);
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable4_7  ;; 0x40010c00
        BL       GPIO_Init
//   38   
//   39   GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_2|GPIO_Pin_3|GPIO_Pin_4|GPIO_Pin_5|GPIO_Pin_6|GPIO_Pin_7|GPIO_Pin_8|GPIO_Pin_9|GPIO_Pin_10|GPIO_Pin_11|GPIO_Pin_12;
        MOVW     R0,#+8191
        STRH     R0,[SP, #+0]
//   40   GPIO_Init(GPIOC, &GPIO_InitStructure);
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable4_8  ;; 0x40011000
        BL       GPIO_Init
//   41   
//   42   GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_2;
        MOVS     R0,#+4
        STRH     R0,[SP, #+0]
//   43   GPIO_Init(GPIOD, &GPIO_InitStructure); 
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable4_9  ;; 0x40011400
        BL       GPIO_Init
//   44   
//   45 }
        POP      {R0,PC}          ;; return
//   46 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   47 void init_nvic()
//   48 {
init_nvic:
        PUSH     {R7,LR}
//   49   TIM_ITConfig(TIM4, TIM_IT_Update, ENABLE);
        MOVS     R2,#+1
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_3  ;; 0x40000800
        BL       TIM_ITConfig
//   50   NVIC_EnableIRQ(TIM4_IRQn);
        MOVS     R0,#+30
        BL       NVIC_EnableIRQ
//   51   NVIC_SetPriority (TIM4_IRQn, 2);
        MOVS     R1,#+2
        MOVS     R0,#+30
        BL       NVIC_SetPriority
//   52 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0xe000ed18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0xe000e400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x40000800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x300100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0x300200

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0x40010800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     0x40010c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     0x40011000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     0x40011400

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
// 274 bytes in section .text
// 
// 274 bytes of CODE memory
//
//Errors: none
//Warnings: none
