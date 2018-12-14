///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     14/Apr/2017  15:35:52 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  Z:\_PROJECTS\__MICRAN\KOMMUTATOR_DIODOV\IAR\pid.c       /
//    Command line =  Z:\_PROJECTS\__MICRAN\KOMMUTATOR_DIODOV\IAR\pid.c -D    /
//                    STM32F10X_HD -D USE_FULL_ASSERT -lB                     /
//                    Z:\_PROJECTS\__MICRAN\KOMMUTATOR_DIODOV\IAR\Debug\List\ /
//                     -o Z:\_PROJECTS\__MICRAN\KOMMUTATOR_DIODOV\IAR\Debug\O /
//                    bj\ --no_cse --no_unroll --no_inline --no_code_motion   /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M3 -e --fpu=None           /
//                    --dlib_config "D:\Program Files\IAR Systems\Embedded    /
//                    Workbench 7.2_3\arm\INC\c\DLib_Config_Normal.h" -On     /
//                    --vla --use_c++_inline -I "D:\Program Files\IAR         /
//                    Systems\Embedded Workbench 7.2_3\arm\CMSIS\Include\"    /
//    List file    =  Z:\_PROJECTS\__MICRAN\KOMMUTATOR_DIODOV\IAR\Debug\List\ /
//                    pid.s                                                   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME pid

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub

        PUBLIC pid_float_process

// Z:\_PROJECTS\__MICRAN\KOMMUTATOR_DIODOV\IAR\pid.c
//    1 #include "pid.h"
//    2 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    3 float pid_float_process(pidFloatStruct* pid)
//    4 {
pid_float_process:
        PUSH     {R4,R5,LR}
        MOVS     R4,R0
//    5   pid->error=*(pid->setpoint)-*(pid->actual_point);
        LDR      R0,[R4, #+20]
        LDR      R0,[R0, #+0]
        LDR      R1,[R4, #+24]
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        STR      R0,[R4, #+44]
//    6   
//    7   pid->p_member=(pid->p_gain)*pid->error;
        LDR      R1,[R4, #+0]
        LDR      R0,[R4, #+44]
        BL       __aeabi_fmul
        STR      R0,[R4, #+8]
//    8   pid->i_member=(pid->i_state);
        LDR      R0,[R4, #+16]
        STR      R0,[R4, #+12]
//    9   float output = pid->p_member+pid->i_member;
        LDR      R1,[R4, #+8]
        LDR      R0,[R4, #+12]
        BL       __aeabi_fadd
        MOVS     R5,R0
//   10   if(output<(pid->min_output))
        MOVS     R0,R5
        LDR      R1,[R4, #+36]
        BL       __aeabi_cfcmple
        BCS.N    ??pid_float_process_0
//   11   {
//   12     output=(pid->min_output);
        LDR      R0,[R4, #+36]
        MOVS     R5,R0
//   13     if(pid->error>0)
        LDR      R0,[R4, #+44]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??pid_float_process_1
//   14       (pid->i_state)+=(pid->i_gain)*pid->error;
        LDR      R1,[R4, #+4]
        LDR      R0,[R4, #+44]
        BL       __aeabi_fmul
        LDR      R1,[R4, #+16]
        BL       __aeabi_fadd
        STR      R0,[R4, #+16]
        B.N      ??pid_float_process_1
//   15   }
//   16   else if(output>(pid->max_output))
??pid_float_process_0:
        LDR      R0,[R4, #+32]
        MOVS     R1,R5
        BL       __aeabi_cfcmple
        BCS.N    ??pid_float_process_2
//   17   {
//   18     output=(pid->max_output);
        LDR      R0,[R4, #+32]
        MOVS     R5,R0
//   19     if(pid->error<0)
        LDR      R0,[R4, #+44]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS.N    ??pid_float_process_1
//   20     {
//   21       (pid->i_state)+=(pid->i_gain)*pid->error;
        LDR      R1,[R4, #+4]
        LDR      R0,[R4, #+44]
        BL       __aeabi_fmul
        LDR      R1,[R4, #+16]
        BL       __aeabi_fadd
        STR      R0,[R4, #+16]
        B.N      ??pid_float_process_1
//   22     }
//   23   }
//   24   else
//   25   {
//   26     (pid->i_state)+=(pid->i_gain)*pid->error;
??pid_float_process_2:
        LDR      R1,[R4, #+4]
        LDR      R0,[R4, #+44]
        BL       __aeabi_fmul
        LDR      R1,[R4, #+16]
        BL       __aeabi_fadd
        STR      R0,[R4, #+16]
//   27   }
//   28   
//   29   (pid->old_point)=*(pid->actual_point);
??pid_float_process_1:
        LDR      R0,[R4, #+24]
        LDR      R0,[R0, #+0]
        STR      R0,[R4, #+28]
//   30   pid->output=output;
        STR      R5,[R4, #+40]
//   31   return output;
        MOVS     R0,R5
        POP      {R4,R5,PC}       ;; return
//   32 }

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
// 154 bytes in section .text
// 
// 154 bytes of CODE memory
//
//Errors: none
//Warnings: none
