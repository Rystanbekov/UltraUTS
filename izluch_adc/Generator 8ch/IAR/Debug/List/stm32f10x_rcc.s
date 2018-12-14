///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     31/May/2017  14:31:56 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  Z:\Generator 8ch\IAR\stm32f10x_rcc.c                    /
//    Command line =  "Z:\Generator 8ch\IAR\stm32f10x_rcc.c" -D STM32F10X_MD  /
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
//    List file    =  Z:\Generator 8ch\IAR\Debug\List\stm32f10x_rcc.s         /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm32f10x_rcc

        #define SHT_PROGBITS 0x1

        PUBLIC RCC_ADCCLKConfig
        PUBLIC RCC_AHBPeriphClockCmd
        PUBLIC RCC_APB1PeriphClockCmd
        PUBLIC RCC_APB1PeriphResetCmd
        PUBLIC RCC_APB2PeriphClockCmd
        PUBLIC RCC_APB2PeriphResetCmd
        PUBLIC RCC_AdjustHSICalibrationValue
        PUBLIC RCC_BackupResetCmd
        PUBLIC RCC_ClearFlag
        PUBLIC RCC_ClearITPendingBit
        PUBLIC RCC_ClockSecuritySystemCmd
        PUBLIC RCC_DeInit
        PUBLIC RCC_GetClocksFreq
        PUBLIC RCC_GetFlagStatus
        PUBLIC RCC_GetITStatus
        PUBLIC RCC_GetSYSCLKSource
        PUBLIC RCC_HCLKConfig
        PUBLIC RCC_HSEConfig
        PUBLIC RCC_HSICmd
        PUBLIC RCC_ITConfig
        PUBLIC RCC_LSEConfig
        PUBLIC RCC_LSICmd
        PUBLIC RCC_MCOConfig
        PUBLIC RCC_PCLK1Config
        PUBLIC RCC_PCLK2Config
        PUBLIC RCC_PLLCmd
        PUBLIC RCC_PLLConfig
        PUBLIC RCC_RTCCLKCmd
        PUBLIC RCC_RTCCLKConfig
        PUBLIC RCC_SYSCLKConfig
        PUBLIC RCC_USBCLKConfig
        PUBLIC RCC_WaitForHSEStartUp

// Z:\Generator 8ch\IAR\stm32f10x_rcc.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm32f10x_rcc.c
//    4   * @author  MCD Application Team
//    5   * @version V3.1.0
//    6   * @date    06/19/2009
//    7   * @brief   This file provides all the RCC firmware functions.
//    8   ******************************************************************************
//    9   * @copy
//   10   *
//   11   * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
//   12   * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
//   13   * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
//   14   * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
//   15   * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
//   16   * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
//   17   *
//   18   * <h2><center>&copy; COPYRIGHT 2009 STMicroelectronics</center></h2>
//   19   */ 
//   20 
//   21 /* Includes ------------------------------------------------------------------*/
//   22 #include "stm32f10x_rcc.h"
//   23 
//   24 /** @addtogroup STM32F10x_StdPeriph_Driver
//   25   * @{
//   26   */
//   27 
//   28 /** @defgroup RCC 
//   29   * @brief RCC driver modules
//   30   * @{
//   31   */ 
//   32 
//   33 /** @defgroup RCC_Private_TypesDefinitions
//   34   * @{
//   35   */
//   36 
//   37 /**
//   38   * @}
//   39   */
//   40 
//   41 /** @defgroup RCC_Private_Defines
//   42   * @{
//   43   */
//   44 
//   45 /* ------------ RCC registers bit address in the alias region ----------- */
//   46 #define RCC_OFFSET                (RCC_BASE - PERIPH_BASE)
//   47 
//   48 /* --- CR Register ---*/
//   49 
//   50 /* Alias word address of HSION bit */
//   51 #define CR_OFFSET                 (RCC_OFFSET + 0x00)
//   52 #define HSION_BitNumber           0x00
//   53 #define CR_HSION_BB               (PERIPH_BB_BASE + (CR_OFFSET * 32) + (HSION_BitNumber * 4))
//   54 
//   55 /* Alias word address of PLLON bit */
//   56 #define PLLON_BitNumber           0x18
//   57 #define CR_PLLON_BB               (PERIPH_BB_BASE + (CR_OFFSET * 32) + (PLLON_BitNumber * 4))
//   58 
//   59 #ifdef STM32F10X_CL
//   60  /* Alias word address of PLL2ON bit */
//   61  #define PLL2ON_BitNumber          0x1A
//   62  #define CR_PLL2ON_BB              (PERIPH_BB_BASE + (CR_OFFSET * 32) + (PLL2ON_BitNumber * 4))
//   63 
//   64  /* Alias word address of PLL3ON bit */
//   65  #define PLL3ON_BitNumber          0x1C
//   66  #define CR_PLL3ON_BB              (PERIPH_BB_BASE + (CR_OFFSET * 32) + (PLL3ON_BitNumber * 4))
//   67 #endif /* STM32F10X_CL */ 
//   68 
//   69 /* Alias word address of CSSON bit */
//   70 #define CSSON_BitNumber           0x13
//   71 #define CR_CSSON_BB               (PERIPH_BB_BASE + (CR_OFFSET * 32) + (CSSON_BitNumber * 4))
//   72 
//   73 /* --- CFGR Register ---*/
//   74 
//   75 /* Alias word address of USBPRE bit */
//   76 #define CFGR_OFFSET               (RCC_OFFSET + 0x04)
//   77 
//   78 #ifndef STM32F10X_CL
//   79  #define USBPRE_BitNumber          0x16
//   80  #define CFGR_USBPRE_BB            (PERIPH_BB_BASE + (CFGR_OFFSET * 32) + (USBPRE_BitNumber * 4))
//   81 #else
//   82  #define OTGFSPRE_BitNumber        0x16
//   83  #define CFGR_OTGFSPRE_BB          (PERIPH_BB_BASE + (CFGR_OFFSET * 32) + (OTGFSPRE_BitNumber * 4))
//   84 #endif /* STM32F10X_CL */ 
//   85 
//   86 /* --- BDCR Register ---*/
//   87 
//   88 /* Alias word address of RTCEN bit */
//   89 #define BDCR_OFFSET               (RCC_OFFSET + 0x20)
//   90 #define RTCEN_BitNumber           0x0F
//   91 #define BDCR_RTCEN_BB             (PERIPH_BB_BASE + (BDCR_OFFSET * 32) + (RTCEN_BitNumber * 4))
//   92 
//   93 /* Alias word address of BDRST bit */
//   94 #define BDRST_BitNumber           0x10
//   95 #define BDCR_BDRST_BB             (PERIPH_BB_BASE + (BDCR_OFFSET * 32) + (BDRST_BitNumber * 4))
//   96 
//   97 /* --- CSR Register ---*/
//   98 
//   99 /* Alias word address of LSION bit */
//  100 #define CSR_OFFSET                (RCC_OFFSET + 0x24)
//  101 #define LSION_BitNumber           0x00
//  102 #define CSR_LSION_BB              (PERIPH_BB_BASE + (CSR_OFFSET * 32) + (LSION_BitNumber * 4))
//  103 
//  104 #ifdef STM32F10X_CL
//  105 /* --- CFGR2 Register ---*/
//  106 
//  107  /* Alias word address of I2S2SRC bit */
//  108  #define CFGR2_OFFSET              (RCC_OFFSET + 0x2C)
//  109  #define I2S2SRC_BitNumber         0x11
//  110  #define CFGR2_I2S2SRC_BB          (PERIPH_BB_BASE + (CFGR2_OFFSET * 32) + (I2S2SRC_BitNumber * 4))
//  111 
//  112  /* Alias word address of I2S3SRC bit */
//  113  #define I2S3SRC_BitNumber         0x12
//  114  #define CFGR2_I2S3SRC_BB          (PERIPH_BB_BASE + (CFGR2_OFFSET * 32) + (I2S3SRC_BitNumber * 4))
//  115 #endif /* STM32F10X_CL */
//  116 
//  117 /* ---------------------- RCC registers bit mask ------------------------ */
//  118 
//  119 /* CR register bit mask */
//  120 #define CR_HSEBYP_Reset           ((uint32_t)0xFFFBFFFF)
//  121 #define CR_HSEBYP_Set             ((uint32_t)0x00040000)
//  122 #define CR_HSEON_Reset            ((uint32_t)0xFFFEFFFF)
//  123 #define CR_HSEON_Set              ((uint32_t)0x00010000)
//  124 #define CR_HSITRIM_Mask           ((uint32_t)0xFFFFFF07)
//  125 
//  126 /* CFGR register bit mask */
//  127 #ifndef STM32F10X_CL
//  128  #define CFGR_PLL_Mask            ((uint32_t)0xFFC0FFFF)
//  129 #else
//  130  #define CFGR_PLL_Mask           ((uint32_t)0xFFC2FFFF)
//  131 #endif /* STM32F10X_CL */ 
//  132 
//  133 #define CFGR_PLLMull_Mask         ((uint32_t)0x003C0000)
//  134 #define CFGR_PLLSRC_Mask          ((uint32_t)0x00010000)
//  135 #define CFGR_PLLXTPRE_Mask        ((uint32_t)0x00020000)
//  136 #define CFGR_SWS_Mask             ((uint32_t)0x0000000C)
//  137 #define CFGR_SW_Mask              ((uint32_t)0xFFFFFFFC)
//  138 #define CFGR_HPRE_Reset_Mask      ((uint32_t)0xFFFFFF0F)
//  139 #define CFGR_HPRE_Set_Mask        ((uint32_t)0x000000F0)
//  140 #define CFGR_PPRE1_Reset_Mask     ((uint32_t)0xFFFFF8FF)
//  141 #define CFGR_PPRE1_Set_Mask       ((uint32_t)0x00000700)
//  142 #define CFGR_PPRE2_Reset_Mask     ((uint32_t)0xFFFFC7FF)
//  143 #define CFGR_PPRE2_Set_Mask       ((uint32_t)0x00003800)
//  144 #define CFGR_ADCPRE_Reset_Mask    ((uint32_t)0xFFFF3FFF)
//  145 #define CFGR_ADCPRE_Set_Mask      ((uint32_t)0x0000C000)
//  146 
//  147 /* CSR register bit mask */
//  148 #define CSR_RMVF_Set              ((uint32_t)0x01000000)
//  149 
//  150 #ifdef STM32F10X_CL
//  151 /* CFGR2 register bit mask */
//  152  #define CFGR2_PREDIV1SRC         ((uint32_t)0x00010000)
//  153  #define CFGR2_PREDIV1            ((uint32_t)0x0000000F)
//  154  #define CFGR2_PREDIV2            ((uint32_t)0x000000F0)
//  155  #define CFGR2_PLL2MUL            ((uint32_t)0x00000F00)
//  156  #define CFGR2_PLL3MUL            ((uint32_t)0x0000F000)
//  157 #endif /* STM32F10X_CL */ 
//  158 
//  159 /* RCC Flag Mask */
//  160 #define FLAG_Mask                 ((uint8_t)0x1F)
//  161 
//  162 #ifndef HSI_Value
//  163 /* Typical Value of the HSI in Hz */
//  164  #define HSI_Value                 ((uint32_t)8000000)
//  165 #endif /* HSI_Value */
//  166 
//  167 /* CIR register byte 2 (Bits[15:8]) base address */
//  168 #define CIR_BYTE2_ADDRESS         ((uint32_t)0x40021009)
//  169 
//  170 /* CIR register byte 3 (Bits[23:16]) base address */
//  171 #define CIR_BYTE3_ADDRESS         ((uint32_t)0x4002100A)
//  172 
//  173 /* CFGR register byte 4 (Bits[31:24]) base address */
//  174 #define CFGR_BYTE4_ADDRESS        ((uint32_t)0x40021007)
//  175 
//  176 /* BDCR register base address */
//  177 #define BDCR_ADDRESS              (PERIPH_BASE + BDCR_OFFSET)
//  178 
//  179 #ifndef HSEStartUp_TimeOut
//  180 /* Time out for HSE start up */
//  181  #define HSEStartUp_TimeOut        ((uint16_t)0x0500)
//  182 #endif /* HSEStartUp_TimeOut */
//  183 
//  184 /**
//  185   * @}
//  186   */ 
//  187 
//  188 /** @defgroup RCC_Private_Macros
//  189   * @{
//  190   */ 
//  191 
//  192 /**
//  193   * @}
//  194   */ 
//  195 
//  196 /** @defgroup RCC_Private_Variables
//  197   * @{
//  198   */ 
//  199 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  200 static __I uint8_t APBAHBPrescTable[16] = {0, 0, 0, 0, 1, 2, 3, 4, 1, 2, 3, 4, 6, 7, 8, 9};
APBAHBPrescTable:
        DATA
        DC8 0, 0, 0, 0, 1, 2, 3, 4, 1, 2, 3, 4, 6, 7, 8, 9

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  201 static __I uint8_t ADCPrescTable[4] = {2, 4, 6, 8};
ADCPrescTable:
        DATA
        DC8 2, 4, 6, 8
//  202 
//  203 /**
//  204   * @}
//  205   */
//  206 
//  207 /** @defgroup RCC_Private_FunctionPrototypes
//  208   * @{
//  209   */
//  210 
//  211 /**
//  212   * @}
//  213   */
//  214 
//  215 /** @defgroup RCC_Private_Functions
//  216   * @{
//  217   */
//  218 
//  219 /**
//  220   * @brief  Resets the RCC clock configuration to the default reset state.
//  221   * @param  None
//  222   * @retval None
//  223   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  224 void RCC_DeInit(void)
//  225 {
//  226   /* Set HSION bit */
//  227   RCC->CR |= (uint32_t)0x00000001;
RCC_DeInit:
        LDR.W    R0,??DataTable30  ;; 0x40021000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable30  ;; 0x40021000
        STR      R0,[R1, #+0]
//  228 
//  229   /* Reset SW, HPRE, PPRE1, PPRE2, ADCPRE and MCO bits */
//  230 #ifndef STM32F10X_CL
//  231   RCC->CFGR &= (uint32_t)0xF8FF0000;
        LDR.W    R0,??DataTable30_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable30_2  ;; 0xf8ff0000
        ANDS     R0,R1,R0
        LDR.W    R1,??DataTable30_1  ;; 0x40021004
        STR      R0,[R1, #+0]
//  232 #else
//  233   RCC->CFGR &= (uint32_t)0xF0FF0000;
//  234 #endif /* STM32F10X_CL */   
//  235   
//  236   /* Reset HSEON, CSSON and PLLON bits */
//  237   RCC->CR &= (uint32_t)0xFEF6FFFF;
        LDR.W    R0,??DataTable30  ;; 0x40021000
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable30_3  ;; 0xfef6ffff
        ANDS     R0,R1,R0
        LDR.W    R1,??DataTable30  ;; 0x40021000
        STR      R0,[R1, #+0]
//  238 
//  239   /* Reset HSEBYP bit */
//  240   RCC->CR &= (uint32_t)0xFFFBFFFF;
        LDR.W    R0,??DataTable30  ;; 0x40021000
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x40000
        LDR.W    R1,??DataTable30  ;; 0x40021000
        STR      R0,[R1, #+0]
//  241 
//  242   /* Reset PLLSRC, PLLXTPRE, PLLMUL and USBPRE/OTGFSPRE bits */
//  243   RCC->CFGR &= (uint32_t)0xFF80FFFF;
        LDR.W    R0,??DataTable30_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x7F0000
        LDR.W    R1,??DataTable30_1  ;; 0x40021004
        STR      R0,[R1, #+0]
//  244 
//  245 #ifndef STM32F10X_CL
//  246   /* Disable all interrupts and clear pending bits  */
//  247   RCC->CIR = 0x009F0000;
        LDR.W    R0,??DataTable30_4  ;; 0x40021008
        MOVS     R1,#+10420224
        STR      R1,[R0, #+0]
//  248 #else
//  249   /* Reset PLL2ON and PLL3ON bits */
//  250   RCC->CR &= (uint32_t)0xEBFFFFFF;
//  251 
//  252   /* Disable all interrupts and clear pending bits  */
//  253   RCC->CIR = 0x00FF0000;
//  254 
//  255   /* Reset CFGR2 register */
//  256   RCC->CFGR2 = 0x00000000;
//  257 #endif /* STM32F10X_CL */
//  258 }
        BX       LR               ;; return
//  259 
//  260 /**
//  261   * @brief  Configures the External High Speed oscillator (HSE).
//  262   * @note   HSE can not be stopped if it is used directly or through the PLL as system clock.
//  263   * @param  RCC_HSE: specifies the new state of the HSE.
//  264   *   This parameter can be one of the following values:
//  265   *     @arg RCC_HSE_OFF: HSE oscillator OFF
//  266   *     @arg RCC_HSE_ON: HSE oscillator ON
//  267   *     @arg RCC_HSE_Bypass: HSE oscillator bypassed with external clock
//  268   * @retval None
//  269   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  270 void RCC_HSEConfig(uint32_t RCC_HSE)
//  271 {
//  272   /* Check the parameters */
//  273   assert_param(IS_RCC_HSE(RCC_HSE));
//  274   /* Reset HSEON and HSEBYP bits before configuring the HSE ------------------*/
//  275   /* Reset HSEON bit */
//  276   RCC->CR &= CR_HSEON_Reset;
RCC_HSEConfig:
        LDR.W    R1,??DataTable30  ;; 0x40021000
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x10000
        LDR.W    R2,??DataTable30  ;; 0x40021000
        STR      R1,[R2, #+0]
//  277   /* Reset HSEBYP bit */
//  278   RCC->CR &= CR_HSEBYP_Reset;
        LDR.W    R1,??DataTable30  ;; 0x40021000
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x40000
        LDR.W    R2,??DataTable30  ;; 0x40021000
        STR      R1,[R2, #+0]
//  279   /* Configure HSE (RCC_HSE_OFF is already covered by the code section above) */
//  280   switch(RCC_HSE)
        MOVS     R1,R0
        CMP      R1,#+65536
        BEQ.N    ??RCC_HSEConfig_0
        CMP      R1,#+262144
        BEQ.N    ??RCC_HSEConfig_1
        B.N      ??RCC_HSEConfig_2
//  281   {
//  282     case RCC_HSE_ON:
//  283       /* Set HSEON bit */
//  284       RCC->CR |= CR_HSEON_Set;
??RCC_HSEConfig_0:
        LDR.W    R1,??DataTable30  ;; 0x40021000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x10000
        LDR.W    R2,??DataTable30  ;; 0x40021000
        STR      R1,[R2, #+0]
//  285       break;
        B.N      ??RCC_HSEConfig_3
//  286       
//  287     case RCC_HSE_Bypass:
//  288       /* Set HSEBYP and HSEON bits */
//  289       RCC->CR |= CR_HSEBYP_Set | CR_HSEON_Set;
??RCC_HSEConfig_1:
        LDR.W    R1,??DataTable30  ;; 0x40021000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x50000
        LDR.W    R2,??DataTable30  ;; 0x40021000
        STR      R1,[R2, #+0]
//  290       break;
        B.N      ??RCC_HSEConfig_3
//  291       
//  292     default:
//  293       break;
//  294   }
//  295 }
??RCC_HSEConfig_2:
??RCC_HSEConfig_3:
        BX       LR               ;; return
//  296 
//  297 /**
//  298   * @brief  Waits for HSE start-up.
//  299   * @param  None
//  300   * @retval An ErrorStatus enumuration value:
//  301   * - SUCCESS: HSE oscillator is stable and ready to use
//  302   * - ERROR: HSE oscillator not yet ready
//  303   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  304 ErrorStatus RCC_WaitForHSEStartUp(void)
//  305 {
RCC_WaitForHSEStartUp:
        PUSH     {R3-R5,LR}
//  306   __IO uint32_t StartUpCounter = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  307   ErrorStatus status = ERROR;
        MOVS     R4,#+0
//  308   FlagStatus HSEStatus = RESET;
        MOVS     R5,#+0
//  309   
//  310   /* Wait till HSE is ready and if Time out is reached exit */
//  311   do
//  312   {
//  313     HSEStatus = RCC_GetFlagStatus(RCC_FLAG_HSERDY);
??RCC_WaitForHSEStartUp_0:
        MOVS     R0,#+49
        BL       RCC_GetFlagStatus
        MOVS     R5,R0
//  314     StartUpCounter++;  
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
//  315   } while((StartUpCounter != HSEStartUp_TimeOut) && (HSEStatus == RESET));
        LDR      R0,[SP, #+0]
        CMP      R0,#+1280
        BEQ.N    ??RCC_WaitForHSEStartUp_1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??RCC_WaitForHSEStartUp_0
//  316   
//  317   if (RCC_GetFlagStatus(RCC_FLAG_HSERDY) != RESET)
??RCC_WaitForHSEStartUp_1:
        MOVS     R0,#+49
        BL       RCC_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??RCC_WaitForHSEStartUp_2
//  318   {
//  319     status = SUCCESS;
        MOVS     R0,#+1
        MOVS     R4,R0
        B.N      ??RCC_WaitForHSEStartUp_3
//  320   }
//  321   else
//  322   {
//  323     status = ERROR;
??RCC_WaitForHSEStartUp_2:
        MOVS     R0,#+0
        MOVS     R4,R0
//  324   }  
//  325   return (status);
??RCC_WaitForHSEStartUp_3:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
//  326 }
//  327 
//  328 /**
//  329   * @brief  Adjusts the Internal High Speed oscillator (HSI) calibration value.
//  330   * @param  HSICalibrationValue: specifies the calibration trimming value.
//  331   *   This parameter must be a number between 0 and 0x1F.
//  332   * @retval None
//  333   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  334 void RCC_AdjustHSICalibrationValue(uint8_t HSICalibrationValue)
//  335 {
//  336   uint32_t tmpreg = 0;
RCC_AdjustHSICalibrationValue:
        MOVS     R1,#+0
//  337   /* Check the parameters */
//  338   assert_param(IS_RCC_CALIBRATION_VALUE(HSICalibrationValue));
//  339   tmpreg = RCC->CR;
        LDR.W    R2,??DataTable30  ;; 0x40021000
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
//  340   /* Clear HSITRIM[4:0] bits */
//  341   tmpreg &= CR_HSITRIM_Mask;
        BICS     R1,R1,#0xF8
//  342   /* Set the HSITRIM[4:0] bits according to HSICalibrationValue value */
//  343   tmpreg |= (uint32_t)HSICalibrationValue << 3;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R1,R1,R0, LSL #+3
//  344   /* Store the new value */
//  345   RCC->CR = tmpreg;
        LDR.W    R2,??DataTable30  ;; 0x40021000
        STR      R1,[R2, #+0]
//  346 }
        BX       LR               ;; return
//  347 
//  348 /**
//  349   * @brief  Enables or disables the Internal High Speed oscillator (HSI).
//  350   * @note   HSI can not be stopped if it is used directly or through the PLL as system clock.
//  351   * @param  NewState: new state of the HSI. This parameter can be: ENABLE or DISABLE.
//  352   * @retval None
//  353   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  354 void RCC_HSICmd(FunctionalState NewState)
//  355 {
//  356   /* Check the parameters */
//  357   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  358   *(__IO uint32_t *) CR_HSION_BB = (uint32_t)NewState;
RCC_HSICmd:
        LDR.W    R1,??DataTable30_5  ;; 0x42420000
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
//  359 }
        BX       LR               ;; return
//  360 
//  361 /**
//  362   * @brief  Configures the PLL clock source and multiplication factor.
//  363   * @note   This function must be used only when the PLL is disabled.
//  364   * @param  RCC_PLLSource: specifies the PLL entry clock source.
//  365   *   For @b STM32_Connectivity_line_devices, this parameter can be one of the
//  366   *   following values:
//  367   *     @arg RCC_PLLSource_HSI_Div2: HSI oscillator clock divided by 2 selected as PLL clock entry
//  368   *     @arg RCC_PLLSource_PREDIV1: PREDIV1 clock selected as PLL clock entry
//  369   *   For @b other_STM32_devices, this parameter can be one of the following values:
//  370   *     @arg RCC_PLLSource_HSI_Div2: HSI oscillator clock divided by 2 selected as PLL clock entry
//  371   *     @arg RCC_PLLSource_HSE_Div1: HSE oscillator clock selected as PLL clock entry
//  372   *     @arg RCC_PLLSource_HSE_Div2: HSE oscillator clock divided by 2 selected as PLL clock entry 
//  373   * @param  RCC_PLLMul: specifies the PLL multiplication factor.
//  374   *   For @b STM32_Connectivity_line_devices, this parameter can be RCC_PLLMul_x where x:{[4,9], 6_5}
//  375   *   For @b other_STM32_devices, this parameter can be RCC_PLLMul_x where x:[2,16]  
//  376   * @retval None
//  377   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  378 void RCC_PLLConfig(uint32_t RCC_PLLSource, uint32_t RCC_PLLMul)
//  379 {
//  380   uint32_t tmpreg = 0;
RCC_PLLConfig:
        MOVS     R2,#+0
//  381 
//  382   /* Check the parameters */
//  383   assert_param(IS_RCC_PLL_SOURCE(RCC_PLLSource));
//  384   assert_param(IS_RCC_PLL_MUL(RCC_PLLMul));
//  385 
//  386   tmpreg = RCC->CFGR;
        LDR.W    R3,??DataTable30_1  ;; 0x40021004
        LDR      R3,[R3, #+0]
        MOVS     R2,R3
//  387   /* Clear PLLSRC, PLLXTPRE and PLLMUL[3:0] bits */
//  388   tmpreg &= CFGR_PLL_Mask;
        BICS     R2,R2,#0x3F0000
//  389   /* Set the PLL configuration bits */
//  390   tmpreg |= RCC_PLLSource | RCC_PLLMul;
        ORRS     R3,R1,R0
        ORRS     R2,R3,R2
//  391   /* Store the new value */
//  392   RCC->CFGR = tmpreg;
        LDR.W    R3,??DataTable30_1  ;; 0x40021004
        STR      R2,[R3, #+0]
//  393 }
        BX       LR               ;; return
//  394 
//  395 /**
//  396   * @brief  Enables or disables the PLL.
//  397   * @note   The PLL can not be disabled if it is used as system clock.
//  398   * @param  NewState: new state of the PLL. This parameter can be: ENABLE or DISABLE.
//  399   * @retval None
//  400   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  401 void RCC_PLLCmd(FunctionalState NewState)
//  402 {
//  403   /* Check the parameters */
//  404   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  405 
//  406   *(__IO uint32_t *) CR_PLLON_BB = (uint32_t)NewState;
RCC_PLLCmd:
        LDR.W    R1,??DataTable30_6  ;; 0x42420060
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
//  407 }
        BX       LR               ;; return
//  408 
//  409 #ifdef STM32F10X_CL
//  410 /**
//  411   * @brief  Configures the PREDIV1 division factor.
//  412   * @note 
//  413   *   - This function must be used only when the PLL is disabled.
//  414   *   - This function applies only to STM32 Connectivity line devices.
//  415   * @param  RCC_PREDIV1_Source: specifies the PREDIV1 clock source.
//  416   *   This parameter can be one of the following values:
//  417   *     @arg RCC_PREDIV1_Source_HSE: HSE selected as PREDIV1 clock
//  418   *     @arg RCC_PREDIV1_Source_PLL2: PLL2 selected as PREDIV1 clock
//  419   * @param  RCC_PREDIV1_Div: specifies the PREDIV1 clock division factor.
//  420   *   This parameter can be RCC_PREDIV1_Divx where x:[1,16]
//  421   * @retval None
//  422   */
//  423 void RCC_PREDIV1Config(uint32_t RCC_PREDIV1_Source, uint32_t RCC_PREDIV1_Div)
//  424 {
//  425   uint32_t tmpreg = 0;
//  426   
//  427   /* Check the parameters */
//  428   assert_param(IS_RCC_PREDIV1_SOURCE(RCC_PREDIV1_Source));
//  429   assert_param(IS_RCC_PREDIV1(RCC_PREDIV1_Div));
//  430 
//  431   tmpreg = RCC->CFGR2;
//  432   /* Clear PREDIV1[3:0] and PREDIV1SRC bits */
//  433   tmpreg &= ~(CFGR2_PREDIV1 | CFGR2_PREDIV1SRC);
//  434   /* Set the PREDIV1 clock source and division factor */
//  435   tmpreg |= RCC_PREDIV1_Source | RCC_PREDIV1_Div ;
//  436   /* Store the new value */
//  437   RCC->CFGR2 = tmpreg;
//  438 }
//  439 
//  440 
//  441 /**
//  442   * @brief  Configures the PREDIV2 division factor.
//  443   * @note 
//  444   *   - This function must be used only when both PLL2 and PLL3 are disabled.
//  445   *   - This function applies only to STM32 Connectivity line devices.
//  446   * @param  RCC_PREDIV2_Div: specifies the PREDIV2 clock division factor.
//  447   *   This parameter can be RCC_PREDIV2_Divx where x:[1,16]
//  448   * @retval None
//  449   */
//  450 void RCC_PREDIV2Config(uint32_t RCC_PREDIV2_Div)
//  451 {
//  452   uint32_t tmpreg = 0;
//  453 
//  454   /* Check the parameters */
//  455   assert_param(IS_RCC_PREDIV2(RCC_PREDIV2_Div));
//  456 
//  457   tmpreg = RCC->CFGR2;
//  458   /* Clear PREDIV2[3:0] bits */
//  459   tmpreg &= ~CFGR2_PREDIV2;
//  460   /* Set the PREDIV2 division factor */
//  461   tmpreg |= RCC_PREDIV2_Div;
//  462   /* Store the new value */
//  463   RCC->CFGR2 = tmpreg;
//  464 }
//  465 
//  466 /**
//  467   * @brief  Configures the PLL2 multiplication factor.
//  468   * @note
//  469   *   - This function must be used only when the PLL2 is disabled.
//  470   *   - This function applies only to STM32 Connectivity line devices.
//  471   * @param  RCC_PLL2Mul: specifies the PLL2 multiplication factor.
//  472   *   This parameter can be RCC_PLL2Mul_x where x:{[8,14], 16, 20}
//  473   * @retval None
//  474   */
//  475 void RCC_PLL2Config(uint32_t RCC_PLL2Mul)
//  476 {
//  477   uint32_t tmpreg = 0;
//  478 
//  479   /* Check the parameters */
//  480   assert_param(IS_RCC_PLL2_MUL(RCC_PLL2Mul));
//  481 
//  482   tmpreg = RCC->CFGR2;
//  483   /* Clear PLL2Mul[3:0] bits */
//  484   tmpreg &= ~CFGR2_PLL2MUL;
//  485   /* Set the PLL2 configuration bits */
//  486   tmpreg |= RCC_PLL2Mul;
//  487   /* Store the new value */
//  488   RCC->CFGR2 = tmpreg;
//  489 }
//  490 
//  491 
//  492 /**
//  493   * @brief  Enables or disables the PLL2.
//  494   * @note 
//  495   *   - The PLL2 can not be disabled if it is used indirectly as system clock
//  496   *     (i.e. it is used as PLL clock entry that is used as System clock).
//  497   *   - This function applies only to STM32 Connectivity line devices.
//  498   * @param  NewState: new state of the PLL2. This parameter can be: ENABLE or DISABLE.
//  499   * @retval None
//  500   */
//  501 void RCC_PLL2Cmd(FunctionalState NewState)
//  502 {
//  503   /* Check the parameters */
//  504   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  505 
//  506   *(__IO uint32_t *) CR_PLL2ON_BB = (uint32_t)NewState;
//  507 }
//  508 
//  509 
//  510 /**
//  511   * @brief  Configures the PLL3 multiplication factor.
//  512   * @note 
//  513   *   - This function must be used only when the PLL3 is disabled.
//  514   *   - This function applies only to STM32 Connectivity line devices.
//  515   * @param  RCC_PLL3Mul: specifies the PLL3 multiplication factor.
//  516   *   This parameter can be RCC_PLL3Mul_x where x:{[8,14], 16, 20}
//  517   * @retval None
//  518   */
//  519 void RCC_PLL3Config(uint32_t RCC_PLL3Mul)
//  520 {
//  521   uint32_t tmpreg = 0;
//  522 
//  523   /* Check the parameters */
//  524   assert_param(IS_RCC_PLL3_MUL(RCC_PLL3Mul));
//  525 
//  526   tmpreg = RCC->CFGR2;
//  527   /* Clear PLL3Mul[3:0] bits */
//  528   tmpreg &= ~CFGR2_PLL3MUL;
//  529   /* Set the PLL3 configuration bits */
//  530   tmpreg |= RCC_PLL3Mul;
//  531   /* Store the new value */
//  532   RCC->CFGR2 = tmpreg;
//  533 }
//  534 
//  535 
//  536 /**
//  537   * @brief  Enables or disables the PLL3.
//  538   * @note   This function applies only to STM32 Connectivity line devices.
//  539   * @param  NewState: new state of the PLL3. This parameter can be: ENABLE or DISABLE.
//  540   * @retval None
//  541   */
//  542 void RCC_PLL3Cmd(FunctionalState NewState)
//  543 {
//  544   /* Check the parameters */
//  545 
//  546   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  547   *(__IO uint32_t *) CR_PLL3ON_BB = (uint32_t)NewState;
//  548 }
//  549 #endif /* STM32F10X_CL */
//  550 
//  551 /**
//  552   * @brief  Configures the system clock (SYSCLK).
//  553   * @param  RCC_SYSCLKSource: specifies the clock source used as system clock.
//  554   *   This parameter can be one of the following values:
//  555   *     @arg RCC_SYSCLKSource_HSI: HSI selected as system clock
//  556   *     @arg RCC_SYSCLKSource_HSE: HSE selected as system clock
//  557   *     @arg RCC_SYSCLKSource_PLLCLK: PLL selected as system clock
//  558   * @retval None
//  559   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  560 void RCC_SYSCLKConfig(uint32_t RCC_SYSCLKSource)
//  561 {
//  562   uint32_t tmpreg = 0;
RCC_SYSCLKConfig:
        MOVS     R1,#+0
//  563   /* Check the parameters */
//  564   assert_param(IS_RCC_SYSCLK_SOURCE(RCC_SYSCLKSource));
//  565   tmpreg = RCC->CFGR;
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
//  566   /* Clear SW[1:0] bits */
//  567   tmpreg &= CFGR_SW_Mask;
        LSRS     R1,R1,#+2
        LSLS     R1,R1,#+2
//  568   /* Set SW[1:0] bits according to RCC_SYSCLKSource value */
//  569   tmpreg |= RCC_SYSCLKSource;
        ORRS     R1,R0,R1
//  570   /* Store the new value */
//  571   RCC->CFGR = tmpreg;
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        STR      R1,[R2, #+0]
//  572 }
        BX       LR               ;; return
//  573 
//  574 /**
//  575   * @brief  Returns the clock source used as system clock.
//  576   * @param  None
//  577   * @retval The clock source used as system clock. The returned value can
//  578   *   be one of the following:
//  579   *     - 0x00: HSI used as system clock
//  580   *     - 0x04: HSE used as system clock
//  581   *     - 0x08: PLL used as system clock
//  582   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  583 uint8_t RCC_GetSYSCLKSource(void)
//  584 {
//  585   return ((uint8_t)(RCC->CFGR & CFGR_SWS_Mask));
RCC_GetSYSCLKSource:
        LDR.N    R0,??DataTable30_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0xC
        BX       LR               ;; return
//  586 }
//  587 
//  588 /**
//  589   * @brief  Configures the AHB clock (HCLK).
//  590   * @param  RCC_SYSCLK: defines the AHB clock divider. This clock is derived from 
//  591   *   the system clock (SYSCLK).
//  592   *   This parameter can be one of the following values:
//  593   *     @arg RCC_SYSCLK_Div1: AHB clock = SYSCLK
//  594   *     @arg RCC_SYSCLK_Div2: AHB clock = SYSCLK/2
//  595   *     @arg RCC_SYSCLK_Div4: AHB clock = SYSCLK/4
//  596   *     @arg RCC_SYSCLK_Div8: AHB clock = SYSCLK/8
//  597   *     @arg RCC_SYSCLK_Div16: AHB clock = SYSCLK/16
//  598   *     @arg RCC_SYSCLK_Div64: AHB clock = SYSCLK/64
//  599   *     @arg RCC_SYSCLK_Div128: AHB clock = SYSCLK/128
//  600   *     @arg RCC_SYSCLK_Div256: AHB clock = SYSCLK/256
//  601   *     @arg RCC_SYSCLK_Div512: AHB clock = SYSCLK/512
//  602   * @retval None
//  603   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  604 void RCC_HCLKConfig(uint32_t RCC_SYSCLK)
//  605 {
//  606   uint32_t tmpreg = 0;
RCC_HCLKConfig:
        MOVS     R1,#+0
//  607   /* Check the parameters */
//  608   assert_param(IS_RCC_HCLK(RCC_SYSCLK));
//  609   tmpreg = RCC->CFGR;
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
//  610   /* Clear HPRE[3:0] bits */
//  611   tmpreg &= CFGR_HPRE_Reset_Mask;
        BICS     R1,R1,#0xF0
//  612   /* Set HPRE[3:0] bits according to RCC_SYSCLK value */
//  613   tmpreg |= RCC_SYSCLK;
        ORRS     R1,R0,R1
//  614   /* Store the new value */
//  615   RCC->CFGR = tmpreg;
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        STR      R1,[R2, #+0]
//  616 }
        BX       LR               ;; return
//  617 
//  618 /**
//  619   * @brief  Configures the Low Speed APB clock (PCLK1).
//  620   * @param  RCC_HCLK: defines the APB1 clock divider. This clock is derived from 
//  621   *   the AHB clock (HCLK).
//  622   *   This parameter can be one of the following values:
//  623   *     @arg RCC_HCLK_Div1: APB1 clock = HCLK
//  624   *     @arg RCC_HCLK_Div2: APB1 clock = HCLK/2
//  625   *     @arg RCC_HCLK_Div4: APB1 clock = HCLK/4
//  626   *     @arg RCC_HCLK_Div8: APB1 clock = HCLK/8
//  627   *     @arg RCC_HCLK_Div16: APB1 clock = HCLK/16
//  628   * @retval None
//  629   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  630 void RCC_PCLK1Config(uint32_t RCC_HCLK)
//  631 {
//  632   uint32_t tmpreg = 0;
RCC_PCLK1Config:
        MOVS     R1,#+0
//  633   /* Check the parameters */
//  634   assert_param(IS_RCC_PCLK(RCC_HCLK));
//  635   tmpreg = RCC->CFGR;
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
//  636   /* Clear PPRE1[2:0] bits */
//  637   tmpreg &= CFGR_PPRE1_Reset_Mask;
        BICS     R1,R1,#0x700
//  638   /* Set PPRE1[2:0] bits according to RCC_HCLK value */
//  639   tmpreg |= RCC_HCLK;
        ORRS     R1,R0,R1
//  640   /* Store the new value */
//  641   RCC->CFGR = tmpreg;
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        STR      R1,[R2, #+0]
//  642 }
        BX       LR               ;; return
//  643 
//  644 /**
//  645   * @brief  Configures the High Speed APB clock (PCLK2).
//  646   * @param  RCC_HCLK: defines the APB2 clock divider. This clock is derived from 
//  647   *   the AHB clock (HCLK).
//  648   *   This parameter can be one of the following values:
//  649   *     @arg RCC_HCLK_Div1: APB2 clock = HCLK
//  650   *     @arg RCC_HCLK_Div2: APB2 clock = HCLK/2
//  651   *     @arg RCC_HCLK_Div4: APB2 clock = HCLK/4
//  652   *     @arg RCC_HCLK_Div8: APB2 clock = HCLK/8
//  653   *     @arg RCC_HCLK_Div16: APB2 clock = HCLK/16
//  654   * @retval None
//  655   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  656 void RCC_PCLK2Config(uint32_t RCC_HCLK)
//  657 {
//  658   uint32_t tmpreg = 0;
RCC_PCLK2Config:
        MOVS     R1,#+0
//  659   /* Check the parameters */
//  660   assert_param(IS_RCC_PCLK(RCC_HCLK));
//  661   tmpreg = RCC->CFGR;
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
//  662   /* Clear PPRE2[2:0] bits */
//  663   tmpreg &= CFGR_PPRE2_Reset_Mask;
        BICS     R1,R1,#0x3800
//  664   /* Set PPRE2[2:0] bits according to RCC_HCLK value */
//  665   tmpreg |= RCC_HCLK << 3;
        ORRS     R1,R1,R0, LSL #+3
//  666   /* Store the new value */
//  667   RCC->CFGR = tmpreg;
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        STR      R1,[R2, #+0]
//  668 }
        BX       LR               ;; return
//  669 
//  670 /**
//  671   * @brief  Enables or disables the specified RCC interrupts.
//  672   * @param  RCC_IT: specifies the RCC interrupt sources to be enabled or disabled.
//  673   * 
//  674   *   For @b STM32_Connectivity_line_devices, this parameter can be any combination
//  675   *   of the following values        
//  676   *     @arg RCC_IT_LSIRDY: LSI ready interrupt
//  677   *     @arg RCC_IT_LSERDY: LSE ready interrupt
//  678   *     @arg RCC_IT_HSIRDY: HSI ready interrupt
//  679   *     @arg RCC_IT_HSERDY: HSE ready interrupt
//  680   *     @arg RCC_IT_PLLRDY: PLL ready interrupt
//  681   *     @arg RCC_IT_PLL2RDY: PLL2 ready interrupt
//  682   *     @arg RCC_IT_PLL3RDY: PLL3 ready interrupt
//  683   * 
//  684   *   For @b other_STM32_devices, this parameter can be any combination of the 
//  685   *   following values        
//  686   *     @arg RCC_IT_LSIRDY: LSI ready interrupt
//  687   *     @arg RCC_IT_LSERDY: LSE ready interrupt
//  688   *     @arg RCC_IT_HSIRDY: HSI ready interrupt
//  689   *     @arg RCC_IT_HSERDY: HSE ready interrupt
//  690   *     @arg RCC_IT_PLLRDY: PLL ready interrupt
//  691   *       
//  692   * @param  NewState: new state of the specified RCC interrupts.
//  693   *   This parameter can be: ENABLE or DISABLE.
//  694   * @retval None
//  695   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  696 void RCC_ITConfig(uint8_t RCC_IT, FunctionalState NewState)
//  697 {
//  698   /* Check the parameters */
//  699   assert_param(IS_RCC_IT(RCC_IT));
//  700   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  701   if (NewState != DISABLE)
RCC_ITConfig:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_ITConfig_0
//  702   {
//  703     /* Perform Byte access to RCC_CIR bits to enable the selected interrupts */
//  704     *(__IO uint8_t *) CIR_BYTE2_ADDRESS |= RCC_IT;
        LDR.N    R2,??DataTable30_7  ;; 0x40021009
        LDRB     R2,[R2, #+0]
        ORRS     R2,R0,R2
        LDR.N    R3,??DataTable30_7  ;; 0x40021009
        STRB     R2,[R3, #+0]
        B.N      ??RCC_ITConfig_1
//  705   }
//  706   else
//  707   {
//  708     /* Perform Byte access to RCC_CIR bits to disable the selected interrupts */
//  709     *(__IO uint8_t *) CIR_BYTE2_ADDRESS &= (uint8_t)~RCC_IT;
??RCC_ITConfig_0:
        LDR.N    R2,??DataTable30_7  ;; 0x40021009
        LDRB     R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR.N    R3,??DataTable30_7  ;; 0x40021009
        STRB     R2,[R3, #+0]
//  710   }
//  711 }
??RCC_ITConfig_1:
        BX       LR               ;; return
//  712 
//  713 #ifndef STM32F10X_CL
//  714 /**
//  715   * @brief  Configures the USB clock (USBCLK).
//  716   * @param  RCC_USBCLKSource: specifies the USB clock source. This clock is 
//  717   *   derived from the PLL output.
//  718   *   This parameter can be one of the following values:
//  719   *     @arg RCC_USBCLKSource_PLLCLK_1Div5: PLL clock divided by 1,5 selected as USB 
//  720   *                                     clock source
//  721   *     @arg RCC_USBCLKSource_PLLCLK_Div1: PLL clock selected as USB clock source
//  722   * @retval None
//  723   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  724 void RCC_USBCLKConfig(uint32_t RCC_USBCLKSource)
//  725 {
//  726   /* Check the parameters */
//  727   assert_param(IS_RCC_USBCLK_SOURCE(RCC_USBCLKSource));
//  728 
//  729   *(__IO uint32_t *) CFGR_USBPRE_BB = RCC_USBCLKSource;
RCC_USBCLKConfig:
        LDR.N    R1,??DataTable30_8  ;; 0x424200d8
        STR      R0,[R1, #+0]
//  730 }
        BX       LR               ;; return
//  731 #else
//  732 /**
//  733   * @brief  Configures the USB OTG FS clock (OTGFSCLK).
//  734   *   This function applies only to STM32 Connectivity line devices.
//  735   * @param  RCC_OTGFSCLKSource: specifies the USB OTG FS clock source.
//  736   *   This clock is derived from the PLL output.
//  737   *   This parameter can be one of the following values:
//  738   *     @arg  RCC_OTGFSCLKSource_PLLVCO_Div3: PLL VCO clock divided by 2 selected as USB OTG FS clock source
//  739   *     @arg  RCC_OTGFSCLKSource_PLLVCO_Div2: PLL VCO clock divided by 2 selected as USB OTG FS clock source
//  740   * @retval None
//  741   */
//  742 void RCC_OTGFSCLKConfig(uint32_t RCC_OTGFSCLKSource)
//  743 {
//  744   /* Check the parameters */
//  745   assert_param(IS_RCC_OTGFSCLK_SOURCE(RCC_OTGFSCLKSource));
//  746 
//  747   *(__IO uint32_t *) CFGR_OTGFSPRE_BB = RCC_OTGFSCLKSource;
//  748 }
//  749 #endif /* STM32F10X_CL */ 
//  750 
//  751 /**
//  752   * @brief  Configures the ADC clock (ADCCLK).
//  753   * @param  RCC_PCLK2: defines the ADC clock divider. This clock is derived from 
//  754   *   the APB2 clock (PCLK2).
//  755   *   This parameter can be one of the following values:
//  756   *     @arg RCC_PCLK2_Div2: ADC clock = PCLK2/2
//  757   *     @arg RCC_PCLK2_Div4: ADC clock = PCLK2/4
//  758   *     @arg RCC_PCLK2_Div6: ADC clock = PCLK2/6
//  759   *     @arg RCC_PCLK2_Div8: ADC clock = PCLK2/8
//  760   * @retval None
//  761   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  762 void RCC_ADCCLKConfig(uint32_t RCC_PCLK2)
//  763 {
//  764   uint32_t tmpreg = 0;
RCC_ADCCLKConfig:
        MOVS     R1,#+0
//  765   /* Check the parameters */
//  766   assert_param(IS_RCC_ADCCLK(RCC_PCLK2));
//  767   tmpreg = RCC->CFGR;
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
//  768   /* Clear ADCPRE[1:0] bits */
//  769   tmpreg &= CFGR_ADCPRE_Reset_Mask;
        BICS     R1,R1,#0xC000
//  770   /* Set ADCPRE[1:0] bits according to RCC_PCLK2 value */
//  771   tmpreg |= RCC_PCLK2;
        ORRS     R1,R0,R1
//  772   /* Store the new value */
//  773   RCC->CFGR = tmpreg;
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        STR      R1,[R2, #+0]
//  774 }
        BX       LR               ;; return
//  775 
//  776 #ifdef STM32F10X_CL
//  777 /**
//  778   * @brief  Configures the I2S2 clock source(I2S2CLK).
//  779   * @note
//  780   *   - This function must be called before enabling I2S2 APB clock.
//  781   *   - This function applies only to STM32 Connectivity line devices.
//  782   * @param  RCC_I2S2CLKSource: specifies the I2S2 clock source.
//  783   *   This parameter can be one of the following values:
//  784   *     @arg RCC_I2S2CLKSource_SYSCLK: system clock selected as I2S2 clock entry
//  785   *     @arg RCC_I2S2CLKSource_PLL3_VCO: PLL3 VCO clock selected as I2S2 clock entry
//  786   * @retval None
//  787   */
//  788 void RCC_I2S2CLKConfig(uint32_t RCC_I2S2CLKSource)
//  789 {
//  790   /* Check the parameters */
//  791   assert_param(IS_RCC_I2S2CLK_SOURCE(RCC_I2S2CLKSource));
//  792 
//  793   *(__IO uint32_t *) CFGR2_I2S2SRC_BB = RCC_I2S2CLKSource;
//  794 }
//  795 
//  796 /**
//  797   * @brief  Configures the I2S3 clock source(I2S2CLK).
//  798   * @note
//  799   *   - This function must be called before enabling I2S3 APB clock.
//  800   *   - This function applies only to STM32 Connectivity line devices.
//  801   * @param  RCC_I2S3CLKSource: specifies the I2S3 clock source.
//  802   *   This parameter can be one of the following values:
//  803   *     @arg RCC_I2S3CLKSource_SYSCLK: system clock selected as I2S3 clock entry
//  804   *     @arg RCC_I2S3CLKSource_PLL3_VCO: PLL3 VCO clock selected as I2S3 clock entry
//  805   * @retval None
//  806   */
//  807 void RCC_I2S3CLKConfig(uint32_t RCC_I2S3CLKSource)
//  808 {
//  809   /* Check the parameters */
//  810   assert_param(IS_RCC_I2S3CLK_SOURCE(RCC_I2S3CLKSource));
//  811 
//  812   *(__IO uint32_t *) CFGR2_I2S3SRC_BB = RCC_I2S3CLKSource;
//  813 }
//  814 #endif /* STM32F10X_CL */
//  815 
//  816 /**
//  817   * @brief  Configures the External Low Speed oscillator (LSE).
//  818   * @param  RCC_LSE: specifies the new state of the LSE.
//  819   *   This parameter can be one of the following values:
//  820   *     @arg RCC_LSE_OFF: LSE oscillator OFF
//  821   *     @arg RCC_LSE_ON: LSE oscillator ON
//  822   *     @arg RCC_LSE_Bypass: LSE oscillator bypassed with external clock
//  823   * @retval None
//  824   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  825 void RCC_LSEConfig(uint8_t RCC_LSE)
//  826 {
//  827   /* Check the parameters */
//  828   assert_param(IS_RCC_LSE(RCC_LSE));
//  829   /* Reset LSEON and LSEBYP bits before configuring the LSE ------------------*/
//  830   /* Reset LSEON bit */
//  831   *(__IO uint8_t *) BDCR_ADDRESS = RCC_LSE_OFF;
RCC_LSEConfig:
        LDR.N    R1,??DataTable30_9  ;; 0x40021020
        MOVS     R2,#+0
        STRB     R2,[R1, #+0]
//  832   /* Reset LSEBYP bit */
//  833   *(__IO uint8_t *) BDCR_ADDRESS = RCC_LSE_OFF;
        LDR.N    R1,??DataTable30_9  ;; 0x40021020
        MOVS     R2,#+0
        STRB     R2,[R1, #+0]
//  834   /* Configure LSE (RCC_LSE_OFF is already covered by the code section above) */
//  835   switch(RCC_LSE)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,R0
        CMP      R1,#+1
        BEQ.N    ??RCC_LSEConfig_0
        CMP      R1,#+4
        BEQ.N    ??RCC_LSEConfig_1
        B.N      ??RCC_LSEConfig_2
//  836   {
//  837     case RCC_LSE_ON:
//  838       /* Set LSEON bit */
//  839       *(__IO uint8_t *) BDCR_ADDRESS = RCC_LSE_ON;
??RCC_LSEConfig_0:
        LDR.N    R1,??DataTable30_9  ;; 0x40021020
        MOVS     R2,#+1
        STRB     R2,[R1, #+0]
//  840       break;
        B.N      ??RCC_LSEConfig_3
//  841       
//  842     case RCC_LSE_Bypass:
//  843       /* Set LSEBYP and LSEON bits */
//  844       *(__IO uint8_t *) BDCR_ADDRESS = RCC_LSE_Bypass | RCC_LSE_ON;
??RCC_LSEConfig_1:
        LDR.N    R1,??DataTable30_9  ;; 0x40021020
        MOVS     R2,#+5
        STRB     R2,[R1, #+0]
//  845       break;            
        B.N      ??RCC_LSEConfig_3
//  846       
//  847     default:
//  848       break;      
//  849   }
//  850 }
??RCC_LSEConfig_2:
??RCC_LSEConfig_3:
        BX       LR               ;; return
//  851 
//  852 /**
//  853   * @brief  Enables or disables the Internal Low Speed oscillator (LSI).
//  854   * @note   LSI can not be disabled if the IWDG is running.
//  855   * @param  NewState: new state of the LSI. This parameter can be: ENABLE or DISABLE.
//  856   * @retval None
//  857   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  858 void RCC_LSICmd(FunctionalState NewState)
//  859 {
//  860   /* Check the parameters */
//  861   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  862   *(__IO uint32_t *) CSR_LSION_BB = (uint32_t)NewState;
RCC_LSICmd:
        LDR.N    R1,??DataTable30_10  ;; 0x42420480
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
//  863 }
        BX       LR               ;; return
//  864 
//  865 /**
//  866   * @brief  Configures the RTC clock (RTCCLK).
//  867   * @note   Once the RTC clock is selected it can’t be changed unless the Backup domain is reset.
//  868   * @param  RCC_RTCCLKSource: specifies the RTC clock source.
//  869   *   This parameter can be one of the following values:
//  870   *     @arg RCC_RTCCLKSource_LSE: LSE selected as RTC clock
//  871   *     @arg RCC_RTCCLKSource_LSI: LSI selected as RTC clock
//  872   *     @arg RCC_RTCCLKSource_HSE_Div128: HSE clock divided by 128 selected as RTC clock
//  873   * @retval None
//  874   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  875 void RCC_RTCCLKConfig(uint32_t RCC_RTCCLKSource)
//  876 {
//  877   /* Check the parameters */
//  878   assert_param(IS_RCC_RTCCLK_SOURCE(RCC_RTCCLKSource));
//  879   /* Select the RTC clock source */
//  880   RCC->BDCR |= RCC_RTCCLKSource;
RCC_RTCCLKConfig:
        LDR.N    R1,??DataTable30_9  ;; 0x40021020
        LDR      R1,[R1, #+0]
        ORRS     R1,R0,R1
        LDR.N    R2,??DataTable30_9  ;; 0x40021020
        STR      R1,[R2, #+0]
//  881 }
        BX       LR               ;; return
//  882 
//  883 /**
//  884   * @brief  Enables or disables the RTC clock.
//  885   * @note   This function must be used only after the RTC clock was selected using the RCC_RTCCLKConfig function.
//  886   * @param  NewState: new state of the RTC clock. This parameter can be: ENABLE or DISABLE.
//  887   * @retval None
//  888   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  889 void RCC_RTCCLKCmd(FunctionalState NewState)
//  890 {
//  891   /* Check the parameters */
//  892   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  893   *(__IO uint32_t *) BDCR_RTCEN_BB = (uint32_t)NewState;
RCC_RTCCLKCmd:
        LDR.N    R1,??DataTable30_11  ;; 0x4242043c
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
//  894 }
        BX       LR               ;; return
//  895 
//  896 /**
//  897   * @brief  Returns the frequencies of different on chip clocks.
//  898   * @param  RCC_Clocks: pointer to a RCC_ClocksTypeDef structure which will hold
//  899   *   the clocks frequencies.
//  900   * @retval None
//  901   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  902 void RCC_GetClocksFreq(RCC_ClocksTypeDef* RCC_Clocks)
//  903 {
RCC_GetClocksFreq:
        PUSH     {R4,R5}
//  904   uint32_t tmp = 0, pllmull = 0, pllsource = 0, presc = 0;
        MOVS     R1,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R4,#+0
//  905 
//  906 #ifdef  STM32F10X_CL
//  907   uint32_t prediv1source = 0, prediv1factor = 0, prediv2factor = 0, pll2mull = 0;
//  908 #endif /* STM32F10X_CL */
//  909     
//  910   /* Get SYSCLK source -------------------------------------------------------*/
//  911   tmp = RCC->CFGR & CFGR_SWS_Mask;
        LDR.N    R5,??DataTable30_1  ;; 0x40021004
        LDR      R5,[R5, #+0]
        ANDS     R5,R5,#0xC
        MOVS     R1,R5
//  912   
//  913   switch (tmp)
        MOVS     R5,R1
        CMP      R5,#+0
        BEQ.N    ??RCC_GetClocksFreq_0
        CMP      R5,#+4
        BEQ.N    ??RCC_GetClocksFreq_1
        CMP      R5,#+8
        BEQ.N    ??RCC_GetClocksFreq_2
        B.N      ??RCC_GetClocksFreq_3
//  914   {
//  915     case 0x00:  /* HSI used as system clock */
//  916       RCC_Clocks->SYSCLK_Frequency = HSI_Value;
??RCC_GetClocksFreq_0:
        LDR.N    R5,??DataTable30_12  ;; 0x7a1200
        STR      R5,[R0, #+0]
//  917       break;
        B.N      ??RCC_GetClocksFreq_4
//  918     case 0x04:  /* HSE used as system clock */
//  919       RCC_Clocks->SYSCLK_Frequency = HSE_Value;
??RCC_GetClocksFreq_1:
        LDR.N    R5,??DataTable30_12  ;; 0x7a1200
        STR      R5,[R0, #+0]
//  920       break;
        B.N      ??RCC_GetClocksFreq_4
//  921     case 0x08:  /* PLL used as system clock */
//  922 
//  923       /* Get PLL clock source and multiplication factor ----------------------*/
//  924       pllmull = RCC->CFGR & CFGR_PLLMull_Mask;
??RCC_GetClocksFreq_2:
        LDR.N    R5,??DataTable30_1  ;; 0x40021004
        LDR      R5,[R5, #+0]
        ANDS     R5,R5,#0x3C0000
        MOVS     R2,R5
//  925       pllsource = RCC->CFGR & CFGR_PLLSRC_Mask;
        LDR.N    R5,??DataTable30_1  ;; 0x40021004
        LDR      R5,[R5, #+0]
        ANDS     R5,R5,#0x10000
        MOVS     R3,R5
//  926       
//  927 #ifndef STM32F10X_CL      
//  928       pllmull = ( pllmull >> 18) + 2;
        LSRS     R2,R2,#+18
        ADDS     R2,R2,#+2
//  929       
//  930       if (pllsource == 0x00)
        CMP      R3,#+0
        BNE.N    ??RCC_GetClocksFreq_5
//  931       {/* HSI oscillator clock divided by 2 selected as PLL clock entry */
//  932         RCC_Clocks->SYSCLK_Frequency = (HSI_Value >> 1) * pllmull;
        LDR.N    R5,??DataTable30_13  ;; 0x3d0900
        MUL      R5,R5,R2
        STR      R5,[R0, #+0]
        B.N      ??RCC_GetClocksFreq_6
//  933       }
//  934       else
//  935       {/* HSE selected as PLL clock entry */
//  936         if ((RCC->CFGR & CFGR_PLLXTPRE_Mask) != (uint32_t)RESET)
??RCC_GetClocksFreq_5:
        LDR.N    R5,??DataTable30_1  ;; 0x40021004
        LDR      R5,[R5, #+0]
        LSLS     R5,R5,#+14
        BPL.N    ??RCC_GetClocksFreq_7
//  937         {/* HSE oscillator clock divided by 2 */
//  938           RCC_Clocks->SYSCLK_Frequency = (HSE_Value >> 1) * pllmull;
        LDR.N    R5,??DataTable30_13  ;; 0x3d0900
        MUL      R5,R5,R2
        STR      R5,[R0, #+0]
        B.N      ??RCC_GetClocksFreq_6
//  939         }
//  940         else
//  941         {
//  942           RCC_Clocks->SYSCLK_Frequency = HSE_Value * pllmull;
??RCC_GetClocksFreq_7:
        LDR.N    R5,??DataTable30_12  ;; 0x7a1200
        MUL      R5,R5,R2
        STR      R5,[R0, #+0]
//  943         }
//  944       }
//  945 #else
//  946       pllmull = pllmull >> 18;
//  947       
//  948       if (pllmull != 0x0D)
//  949       {
//  950          pllmull += 2;
//  951       }
//  952       else
//  953       { /* PLL multiplication factor = PLL input clock * 6.5 */
//  954         pllmull = 13 / 2; 
//  955       }
//  956             
//  957       if (pllsource == 0x00)
//  958       {/* HSI oscillator clock divided by 2 selected as PLL clock entry */
//  959         RCC_Clocks->SYSCLK_Frequency = (HSI_Value >> 1) * pllmull;
//  960       }
//  961       else
//  962       {/* PREDIV1 selected as PLL clock entry */
//  963         
//  964         /* Get PREDIV1 clock source and division factor */
//  965         prediv1source = RCC->CFGR2 & CFGR2_PREDIV1SRC;
//  966         prediv1factor = (RCC->CFGR2 & CFGR2_PREDIV1) + 1;
//  967         
//  968         if (prediv1source == 0)
//  969         { /* HSE oscillator clock selected as PREDIV1 clock entry */
//  970           RCC_Clocks->SYSCLK_Frequency = (HSE_Value / prediv1factor) * pllmull;          
//  971         }
//  972         else
//  973         {/* PLL2 clock selected as PREDIV1 clock entry */
//  974           
//  975           /* Get PREDIV2 division factor and PLL2 multiplication factor */
//  976           prediv2factor = ((RCC->CFGR2 & CFGR2_PREDIV2) >> 4) + 1;
//  977           pll2mull = ((RCC->CFGR2 & CFGR2_PLL2MUL) >> 8 ) + 2; 
//  978           RCC_Clocks->SYSCLK_Frequency = (((HSE_Value / prediv2factor) * pll2mull) / prediv1factor) * pllmull;                         
//  979         }
//  980       }
//  981 #endif /* STM32F10X_CL */ 
//  982       break;
??RCC_GetClocksFreq_6:
        B.N      ??RCC_GetClocksFreq_4
//  983 
//  984     default:
//  985       RCC_Clocks->SYSCLK_Frequency = HSI_Value;
??RCC_GetClocksFreq_3:
        LDR.N    R5,??DataTable30_12  ;; 0x7a1200
        STR      R5,[R0, #+0]
//  986       break;
//  987   }
//  988 
//  989   /* Compute HCLK, PCLK1, PCLK2 and ADCCLK clocks frequencies ----------------*/
//  990   /* Get HCLK prescaler */
//  991   tmp = RCC->CFGR & CFGR_HPRE_Set_Mask;
??RCC_GetClocksFreq_4:
        LDR.N    R5,??DataTable30_1  ;; 0x40021004
        LDR      R5,[R5, #+0]
        ANDS     R5,R5,#0xF0
        MOVS     R1,R5
//  992   tmp = tmp >> 4;
        LSRS     R1,R1,#+4
//  993   presc = APBAHBPrescTable[tmp];
        LDR.N    R5,??DataTable30_14
        LDRB     R5,[R1, R5]
        MOVS     R4,R5
//  994   /* HCLK clock frequency */
//  995   RCC_Clocks->HCLK_Frequency = RCC_Clocks->SYSCLK_Frequency >> presc;
        LDR      R5,[R0, #+0]
        LSRS     R5,R5,R4
        STR      R5,[R0, #+4]
//  996   /* Get PCLK1 prescaler */
//  997   tmp = RCC->CFGR & CFGR_PPRE1_Set_Mask;
        LDR.N    R5,??DataTable30_1  ;; 0x40021004
        LDR      R5,[R5, #+0]
        ANDS     R5,R5,#0x700
        MOVS     R1,R5
//  998   tmp = tmp >> 8;
        LSRS     R1,R1,#+8
//  999   presc = APBAHBPrescTable[tmp];
        LDR.N    R5,??DataTable30_14
        LDRB     R5,[R1, R5]
        MOVS     R4,R5
// 1000   /* PCLK1 clock frequency */
// 1001   RCC_Clocks->PCLK1_Frequency = RCC_Clocks->HCLK_Frequency >> presc;
        LDR      R5,[R0, #+4]
        LSRS     R5,R5,R4
        STR      R5,[R0, #+8]
// 1002   /* Get PCLK2 prescaler */
// 1003   tmp = RCC->CFGR & CFGR_PPRE2_Set_Mask;
        LDR.N    R5,??DataTable30_1  ;; 0x40021004
        LDR      R5,[R5, #+0]
        ANDS     R5,R5,#0x3800
        MOVS     R1,R5
// 1004   tmp = tmp >> 11;
        LSRS     R1,R1,#+11
// 1005   presc = APBAHBPrescTable[tmp];
        LDR.N    R5,??DataTable30_14
        LDRB     R5,[R1, R5]
        MOVS     R4,R5
// 1006   /* PCLK2 clock frequency */
// 1007   RCC_Clocks->PCLK2_Frequency = RCC_Clocks->HCLK_Frequency >> presc;
        LDR      R5,[R0, #+4]
        LSRS     R5,R5,R4
        STR      R5,[R0, #+12]
// 1008   /* Get ADCCLK prescaler */
// 1009   tmp = RCC->CFGR & CFGR_ADCPRE_Set_Mask;
        LDR.N    R5,??DataTable30_1  ;; 0x40021004
        LDR      R5,[R5, #+0]
        ANDS     R5,R5,#0xC000
        MOVS     R1,R5
// 1010   tmp = tmp >> 14;
        LSRS     R1,R1,#+14
// 1011   presc = ADCPrescTable[tmp];
        LDR.N    R5,??DataTable30_15
        LDRB     R5,[R1, R5]
        MOVS     R4,R5
// 1012   /* ADCCLK clock frequency */
// 1013   RCC_Clocks->ADCCLK_Frequency = RCC_Clocks->PCLK2_Frequency / presc;
        LDR      R5,[R0, #+12]
        UDIV     R5,R5,R4
        STR      R5,[R0, #+16]
// 1014 }
        POP      {R4,R5}
        BX       LR               ;; return
// 1015 
// 1016 /**
// 1017   * @brief  Enables or disables the AHB peripheral clock.
// 1018   * @param  RCC_AHBPeriph: specifies the AHB peripheral to gates its clock.
// 1019   *   
// 1020   *   For @b STM32_Connectivity_line_devices, this parameter can be any combination
// 1021   *   of the following values:        
// 1022   *     @arg RCC_AHBPeriph_DMA1
// 1023   *     @arg RCC_AHBPeriph_DMA2
// 1024   *     @arg RCC_AHBPeriph_SRAM
// 1025   *     @arg RCC_AHBPeriph_FLITF
// 1026   *     @arg RCC_AHBPeriph_CRC
// 1027   *     @arg RCC_AHBPeriph_OTG_FS    
// 1028   *     @arg RCC_AHBPeriph_ETH_MAC   
// 1029   *     @arg RCC_AHBPeriph_ETH_MAC_Tx
// 1030   *     @arg RCC_AHBPeriph_ETH_MAC_Rx
// 1031   * 
// 1032   *   For @b other_STM32_devices, this parameter can be any combination of the 
// 1033   *   following values:        
// 1034   *     @arg RCC_AHBPeriph_DMA1
// 1035   *     @arg RCC_AHBPeriph_DMA2
// 1036   *     @arg RCC_AHBPeriph_SRAM
// 1037   *     @arg RCC_AHBPeriph_FLITF
// 1038   *     @arg RCC_AHBPeriph_CRC
// 1039   *     @arg RCC_AHBPeriph_FSMC
// 1040   *     @arg RCC_AHBPeriph_SDIO
// 1041   *   
// 1042   * @note SRAM and FLITF clock can be disabled only during sleep mode.
// 1043   * @param  NewState: new state of the specified peripheral clock.
// 1044   *   This parameter can be: ENABLE or DISABLE.
// 1045   * @retval None
// 1046   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1047 void RCC_AHBPeriphClockCmd(uint32_t RCC_AHBPeriph, FunctionalState NewState)
// 1048 {
// 1049   /* Check the parameters */
// 1050   assert_param(IS_RCC_AHB_PERIPH(RCC_AHBPeriph));
// 1051   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1052 
// 1053   if (NewState != DISABLE)
RCC_AHBPeriphClockCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_AHBPeriphClockCmd_0
// 1054   {
// 1055     RCC->AHBENR |= RCC_AHBPeriph;
        LDR.N    R2,??DataTable30_16  ;; 0x40021014
        LDR      R2,[R2, #+0]
        ORRS     R2,R0,R2
        LDR.N    R3,??DataTable30_16  ;; 0x40021014
        STR      R2,[R3, #+0]
        B.N      ??RCC_AHBPeriphClockCmd_1
// 1056   }
// 1057   else
// 1058   {
// 1059     RCC->AHBENR &= ~RCC_AHBPeriph;
??RCC_AHBPeriphClockCmd_0:
        LDR.N    R2,??DataTable30_16  ;; 0x40021014
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR.N    R3,??DataTable30_16  ;; 0x40021014
        STR      R2,[R3, #+0]
// 1060   }
// 1061 }
??RCC_AHBPeriphClockCmd_1:
        BX       LR               ;; return
// 1062 
// 1063 /**
// 1064   * @brief  Enables or disables the High Speed APB (APB2) peripheral clock.
// 1065   * @param  RCC_APB2Periph: specifies the APB2 peripheral to gates its clock.
// 1066   *   This parameter can be any combination of the following values:
// 1067   *     @arg RCC_APB2Periph_AFIO, RCC_APB2Periph_GPIOA, RCC_APB2Periph_GPIOB,
// 1068   *          RCC_APB2Periph_GPIOC, RCC_APB2Periph_GPIOD, RCC_APB2Periph_GPIOE,
// 1069   *          RCC_APB2Periph_GPIOF, RCC_APB2Periph_GPIOG, RCC_APB2Periph_ADC1,
// 1070   *          RCC_APB2Periph_ADC2, RCC_APB2Periph_TIM1, RCC_APB2Periph_SPI1,
// 1071   *          RCC_APB2Periph_TIM8, RCC_APB2Periph_USART1, RCC_APB2Periph_ADC3
// 1072   * @param  NewState: new state of the specified peripheral clock.
// 1073   *   This parameter can be: ENABLE or DISABLE.
// 1074   * @retval None
// 1075   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1076 void RCC_APB2PeriphClockCmd(uint32_t RCC_APB2Periph, FunctionalState NewState)
// 1077 {
// 1078   /* Check the parameters */
// 1079   assert_param(IS_RCC_APB2_PERIPH(RCC_APB2Periph));
// 1080   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1081   if (NewState != DISABLE)
RCC_APB2PeriphClockCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_APB2PeriphClockCmd_0
// 1082   {
// 1083     RCC->APB2ENR |= RCC_APB2Periph;
        LDR.N    R2,??DataTable30_17  ;; 0x40021018
        LDR      R2,[R2, #+0]
        ORRS     R2,R0,R2
        LDR.N    R3,??DataTable30_17  ;; 0x40021018
        STR      R2,[R3, #+0]
        B.N      ??RCC_APB2PeriphClockCmd_1
// 1084   }
// 1085   else
// 1086   {
// 1087     RCC->APB2ENR &= ~RCC_APB2Periph;
??RCC_APB2PeriphClockCmd_0:
        LDR.N    R2,??DataTable30_17  ;; 0x40021018
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR.N    R3,??DataTable30_17  ;; 0x40021018
        STR      R2,[R3, #+0]
// 1088   }
// 1089 }
??RCC_APB2PeriphClockCmd_1:
        BX       LR               ;; return
// 1090 
// 1091 /**
// 1092   * @brief  Enables or disables the Low Speed APB (APB1) peripheral clock.
// 1093   * @param  RCC_APB1Periph: specifies the APB1 peripheral to gates its clock.
// 1094   *   This parameter can be any combination of the following values:
// 1095   *     @arg RCC_APB1Periph_TIM2, RCC_APB1Periph_TIM3, RCC_APB1Periph_TIM4,
// 1096   *          RCC_APB1Periph_TIM5, RCC_APB1Periph_TIM6, RCC_APB1Periph_TIM7,
// 1097   *          RCC_APB1Periph_WWDG, RCC_APB1Periph_SPI2, RCC_APB1Periph_SPI3,
// 1098   *          RCC_APB1Periph_USART2, RCC_APB1Periph_USART3, RCC_APB1Periph_USART4, 
// 1099   *          RCC_APB1Periph_USART5, RCC_APB1Periph_I2C1, RCC_APB1Periph_I2C2,
// 1100   *          RCC_APB1Periph_USB, RCC_APB1Periph_CAN1, RCC_APB1Periph_BKP,
// 1101   *          RCC_APB1Periph_PWR, RCC_APB1Periph_DAC
// 1102   * @param  NewState: new state of the specified peripheral clock.
// 1103   *   This parameter can be: ENABLE or DISABLE.
// 1104   * @retval None
// 1105   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1106 void RCC_APB1PeriphClockCmd(uint32_t RCC_APB1Periph, FunctionalState NewState)
// 1107 {
// 1108   /* Check the parameters */
// 1109   assert_param(IS_RCC_APB1_PERIPH(RCC_APB1Periph));
// 1110   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1111   if (NewState != DISABLE)
RCC_APB1PeriphClockCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_APB1PeriphClockCmd_0
// 1112   {
// 1113     RCC->APB1ENR |= RCC_APB1Periph;
        LDR.N    R2,??DataTable30_18  ;; 0x4002101c
        LDR      R2,[R2, #+0]
        ORRS     R2,R0,R2
        LDR.N    R3,??DataTable30_18  ;; 0x4002101c
        STR      R2,[R3, #+0]
        B.N      ??RCC_APB1PeriphClockCmd_1
// 1114   }
// 1115   else
// 1116   {
// 1117     RCC->APB1ENR &= ~RCC_APB1Periph;
??RCC_APB1PeriphClockCmd_0:
        LDR.N    R2,??DataTable30_18  ;; 0x4002101c
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR.N    R3,??DataTable30_18  ;; 0x4002101c
        STR      R2,[R3, #+0]
// 1118   }
// 1119 }
??RCC_APB1PeriphClockCmd_1:
        BX       LR               ;; return
// 1120 
// 1121 #ifdef STM32F10X_CL
// 1122 /**
// 1123   * @brief  Forces or releases AHB peripheral reset.
// 1124   * @note   This function applies only to STM32 Connectivity line devices.
// 1125   * @param  RCC_AHBPeriph: specifies the AHB peripheral to reset.
// 1126   *   This parameter can be any combination of the following values:
// 1127   *     @arg RCC_AHBPeriph_OTG_FS 
// 1128   *     @arg RCC_AHBPeriph_ETH_MAC
// 1129   * @param  NewState: new state of the specified peripheral reset.
// 1130   *   This parameter can be: ENABLE or DISABLE.
// 1131   * @retval None
// 1132   */
// 1133 void RCC_AHBPeriphResetCmd(uint32_t RCC_AHBPeriph, FunctionalState NewState)
// 1134 {
// 1135   /* Check the parameters */
// 1136   assert_param(IS_RCC_AHB_PERIPH_RESET(RCC_AHBPeriph));
// 1137   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1138 
// 1139   if (NewState != DISABLE)
// 1140   {
// 1141     RCC->AHBRSTR |= RCC_AHBPeriph;
// 1142   }
// 1143   else
// 1144   {
// 1145     RCC->AHBRSTR &= ~RCC_AHBPeriph;
// 1146   }
// 1147 }
// 1148 #endif /* STM32F10X_CL */ 
// 1149 
// 1150 /**
// 1151   * @brief  Forces or releases High Speed APB (APB2) peripheral reset.
// 1152   * @param  RCC_APB2Periph: specifies the APB2 peripheral to reset.
// 1153   *   This parameter can be any combination of the following values:
// 1154   *     @arg RCC_APB2Periph_AFIO, RCC_APB2Periph_GPIOA, RCC_APB2Periph_GPIOB,
// 1155   *          RCC_APB2Periph_GPIOC, RCC_APB2Periph_GPIOD, RCC_APB2Periph_GPIOE,
// 1156   *          RCC_APB2Periph_GPIOF, RCC_APB2Periph_GPIOG, RCC_APB2Periph_ADC1,
// 1157   *          RCC_APB2Periph_ADC2, RCC_APB2Periph_TIM1, RCC_APB2Periph_SPI1,
// 1158   *          RCC_APB2Periph_TIM8, RCC_APB2Periph_USART1, RCC_APB2Periph_ADC3
// 1159   * @param  NewState: new state of the specified peripheral reset.
// 1160   *   This parameter can be: ENABLE or DISABLE.
// 1161   * @retval None
// 1162   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1163 void RCC_APB2PeriphResetCmd(uint32_t RCC_APB2Periph, FunctionalState NewState)
// 1164 {
// 1165   /* Check the parameters */
// 1166   assert_param(IS_RCC_APB2_PERIPH(RCC_APB2Periph));
// 1167   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1168   if (NewState != DISABLE)
RCC_APB2PeriphResetCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_APB2PeriphResetCmd_0
// 1169   {
// 1170     RCC->APB2RSTR |= RCC_APB2Periph;
        LDR.N    R2,??DataTable30_19  ;; 0x4002100c
        LDR      R2,[R2, #+0]
        ORRS     R2,R0,R2
        LDR.N    R3,??DataTable30_19  ;; 0x4002100c
        STR      R2,[R3, #+0]
        B.N      ??RCC_APB2PeriphResetCmd_1
// 1171   }
// 1172   else
// 1173   {
// 1174     RCC->APB2RSTR &= ~RCC_APB2Periph;
??RCC_APB2PeriphResetCmd_0:
        LDR.N    R2,??DataTable30_19  ;; 0x4002100c
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR.N    R3,??DataTable30_19  ;; 0x4002100c
        STR      R2,[R3, #+0]
// 1175   }
// 1176 }
??RCC_APB2PeriphResetCmd_1:
        BX       LR               ;; return
// 1177 
// 1178 /**
// 1179   * @brief  Forces or releases Low Speed APB (APB1) peripheral reset.
// 1180   * @param  RCC_APB1Periph: specifies the APB1 peripheral to reset.
// 1181   *   This parameter can be any combination of the following values:
// 1182   *     @arg RCC_APB1Periph_TIM2, RCC_APB1Periph_TIM3, RCC_APB1Periph_TIM4,
// 1183   *          RCC_APB1Periph_TIM5, RCC_APB1Periph_TIM6, RCC_APB1Periph_TIM7,
// 1184   *          RCC_APB1Periph_WWDG, RCC_APB1Periph_SPI2, RCC_APB1Periph_SPI3,
// 1185   *          RCC_APB1Periph_USART2, RCC_APB1Periph_USART3, RCC_APB1Periph_USART4, 
// 1186   *          RCC_APB1Periph_USART5, RCC_APB1Periph_I2C1, RCC_APB1Periph_I2C2,
// 1187   *          RCC_APB1Periph_USB, RCC_APB1Periph_CAN1, RCC_APB1Periph_BKP,
// 1188   *          RCC_APB1Periph_PWR, RCC_APB1Periph_DAC
// 1189   * @param  NewState: new state of the specified peripheral clock.
// 1190   *   This parameter can be: ENABLE or DISABLE.
// 1191   * @retval None
// 1192   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1193 void RCC_APB1PeriphResetCmd(uint32_t RCC_APB1Periph, FunctionalState NewState)
// 1194 {
// 1195   /* Check the parameters */
// 1196   assert_param(IS_RCC_APB1_PERIPH(RCC_APB1Periph));
// 1197   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1198   if (NewState != DISABLE)
RCC_APB1PeriphResetCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_APB1PeriphResetCmd_0
// 1199   {
// 1200     RCC->APB1RSTR |= RCC_APB1Periph;
        LDR.N    R2,??DataTable30_20  ;; 0x40021010
        LDR      R2,[R2, #+0]
        ORRS     R2,R0,R2
        LDR.N    R3,??DataTable30_20  ;; 0x40021010
        STR      R2,[R3, #+0]
        B.N      ??RCC_APB1PeriphResetCmd_1
// 1201   }
// 1202   else
// 1203   {
// 1204     RCC->APB1RSTR &= ~RCC_APB1Periph;
??RCC_APB1PeriphResetCmd_0:
        LDR.N    R2,??DataTable30_20  ;; 0x40021010
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR.N    R3,??DataTable30_20  ;; 0x40021010
        STR      R2,[R3, #+0]
// 1205   }
// 1206 }
??RCC_APB1PeriphResetCmd_1:
        BX       LR               ;; return
// 1207 
// 1208 /**
// 1209   * @brief  Forces or releases the Backup domain reset.
// 1210   * @param  NewState: new state of the Backup domain reset.
// 1211   *   This parameter can be: ENABLE or DISABLE.
// 1212   * @retval None
// 1213   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1214 void RCC_BackupResetCmd(FunctionalState NewState)
// 1215 {
// 1216   /* Check the parameters */
// 1217   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1218   *(__IO uint32_t *) BDCR_BDRST_BB = (uint32_t)NewState;
RCC_BackupResetCmd:
        LDR.N    R1,??DataTable30_21  ;; 0x42420440
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
// 1219 }
        BX       LR               ;; return
// 1220 
// 1221 /**
// 1222   * @brief  Enables or disables the Clock Security System.
// 1223   * @param  NewState: new state of the Clock Security System..
// 1224   *   This parameter can be: ENABLE or DISABLE.
// 1225   * @retval None
// 1226   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1227 void RCC_ClockSecuritySystemCmd(FunctionalState NewState)
// 1228 {
// 1229   /* Check the parameters */
// 1230   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1231   *(__IO uint32_t *) CR_CSSON_BB = (uint32_t)NewState;
RCC_ClockSecuritySystemCmd:
        LDR.N    R1,??DataTable30_22  ;; 0x4242004c
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
// 1232 }
        BX       LR               ;; return
// 1233 
// 1234 /**
// 1235   * @brief  Selects the clock source to output on MCO pin.
// 1236   * @param  RCC_MCO: specifies the clock source to output.
// 1237   *   
// 1238   *   For @b STM32_Connectivity_line_devices, this parameter can be one of the
// 1239   *   following values:       
// 1240   *     @arg RCC_MCO_NoClock: No clock selected
// 1241   *     @arg RCC_MCO_SYSCLK: System clock selected
// 1242   *     @arg RCC_MCO_HSI: HSI oscillator clock selected
// 1243   *     @arg RCC_MCO_HSE: HSE oscillator clock selected
// 1244   *     @arg RCC_MCO_PLLCLK_Div2: PLL clock divided by 2 selected
// 1245   *     @arg RCC_MCO_PLL2CLK: PLL2 clock selected                     
// 1246   *     @arg RCC_MCO_PLL3CLK_Div2: PLL3 clock divided by 2 selected   
// 1247   *     @arg RCC_MCO_XT1: External 3-25 MHz oscillator clock selected  
// 1248   *     @arg RCC_MCO_PLL3CLK: PLL3 clock selected 
// 1249   * 
// 1250   *   For  @b other_STM32_devices, this parameter can be one of the following values:        
// 1251   *     @arg RCC_MCO_NoClock: No clock selected
// 1252   *     @arg RCC_MCO_SYSCLK: System clock selected
// 1253   *     @arg RCC_MCO_HSI: HSI oscillator clock selected
// 1254   *     @arg RCC_MCO_HSE: HSE oscillator clock selected
// 1255   *     @arg RCC_MCO_PLLCLK_Div2: PLL clock divided by 2 selected
// 1256   *   
// 1257   * @retval None
// 1258   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1259 void RCC_MCOConfig(uint8_t RCC_MCO)
// 1260 {
// 1261   /* Check the parameters */
// 1262   assert_param(IS_RCC_MCO(RCC_MCO));
// 1263 
// 1264   /* Perform Byte access to MCO bits to select the MCO source */
// 1265   *(__IO uint8_t *) CFGR_BYTE4_ADDRESS = RCC_MCO;
RCC_MCOConfig:
        LDR.N    R1,??DataTable30_23  ;; 0x40021007
        STRB     R0,[R1, #+0]
// 1266 }
        BX       LR               ;; return
// 1267 
// 1268 /**
// 1269   * @brief  Checks whether the specified RCC flag is set or not.
// 1270   * @param  RCC_FLAG: specifies the flag to check.
// 1271   *   
// 1272   *   For @b STM32_Connectivity_line_devices, this parameter can be one of the
// 1273   *   following values:
// 1274   *     @arg RCC_FLAG_HSIRDY: HSI oscillator clock ready
// 1275   *     @arg RCC_FLAG_HSERDY: HSE oscillator clock ready
// 1276   *     @arg RCC_FLAG_PLLRDY: PLL clock ready
// 1277   *     @arg RCC_FLAG_PLL2RDY: PLL2 clock ready      
// 1278   *     @arg RCC_FLAG_PLL3RDY: PLL3 clock ready                           
// 1279   *     @arg RCC_FLAG_LSERDY: LSE oscillator clock ready
// 1280   *     @arg RCC_FLAG_LSIRDY: LSI oscillator clock ready
// 1281   *     @arg RCC_FLAG_PINRST: Pin reset
// 1282   *     @arg RCC_FLAG_PORRST: POR/PDR reset
// 1283   *     @arg RCC_FLAG_SFTRST: Software reset
// 1284   *     @arg RCC_FLAG_IWDGRST: Independent Watchdog reset
// 1285   *     @arg RCC_FLAG_WWDGRST: Window Watchdog reset
// 1286   *     @arg RCC_FLAG_LPWRRST: Low Power reset
// 1287   * 
// 1288   *   For @b other_STM32_devices, this parameter can be one of the following values:        
// 1289   *     @arg RCC_FLAG_HSIRDY: HSI oscillator clock ready
// 1290   *     @arg RCC_FLAG_HSERDY: HSE oscillator clock ready
// 1291   *     @arg RCC_FLAG_PLLRDY: PLL clock ready
// 1292   *     @arg RCC_FLAG_LSERDY: LSE oscillator clock ready
// 1293   *     @arg RCC_FLAG_LSIRDY: LSI oscillator clock ready
// 1294   *     @arg RCC_FLAG_PINRST: Pin reset
// 1295   *     @arg RCC_FLAG_PORRST: POR/PDR reset
// 1296   *     @arg RCC_FLAG_SFTRST: Software reset
// 1297   *     @arg RCC_FLAG_IWDGRST: Independent Watchdog reset
// 1298   *     @arg RCC_FLAG_WWDGRST: Window Watchdog reset
// 1299   *     @arg RCC_FLAG_LPWRRST: Low Power reset
// 1300   *   
// 1301   * @retval The new state of RCC_FLAG (SET or RESET).
// 1302   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1303 FlagStatus RCC_GetFlagStatus(uint8_t RCC_FLAG)
// 1304 {
RCC_GetFlagStatus:
        PUSH     {R4}
        MOVS     R1,R0
// 1305   uint32_t tmp = 0;
        MOVS     R2,#+0
// 1306   uint32_t statusreg = 0;
        MOVS     R3,#+0
// 1307   FlagStatus bitstatus = RESET;
        MOVS     R0,#+0
// 1308   /* Check the parameters */
// 1309   assert_param(IS_RCC_FLAG(RCC_FLAG));
// 1310 
// 1311   /* Get the RCC register index */
// 1312   tmp = RCC_FLAG >> 5;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R4,R1,#+5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R2,R4
// 1313   if (tmp == 1)               /* The flag to check is in CR register */
        CMP      R2,#+1
        BNE.N    ??RCC_GetFlagStatus_0
// 1314   {
// 1315     statusreg = RCC->CR;
        LDR.N    R4,??DataTable30  ;; 0x40021000
        LDR      R4,[R4, #+0]
        MOVS     R3,R4
        B.N      ??RCC_GetFlagStatus_1
// 1316   }
// 1317   else if (tmp == 2)          /* The flag to check is in BDCR register */
??RCC_GetFlagStatus_0:
        CMP      R2,#+2
        BNE.N    ??RCC_GetFlagStatus_2
// 1318   {
// 1319     statusreg = RCC->BDCR;
        LDR.N    R4,??DataTable30_9  ;; 0x40021020
        LDR      R4,[R4, #+0]
        MOVS     R3,R4
        B.N      ??RCC_GetFlagStatus_1
// 1320   }
// 1321   else                       /* The flag to check is in CSR register */
// 1322   {
// 1323     statusreg = RCC->CSR;
??RCC_GetFlagStatus_2:
        LDR.N    R4,??DataTable30_24  ;; 0x40021024
        LDR      R4,[R4, #+0]
        MOVS     R3,R4
// 1324   }
// 1325 
// 1326   /* Get the flag position */
// 1327   tmp = RCC_FLAG & FLAG_Mask;
??RCC_GetFlagStatus_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ANDS     R4,R1,#0x1F
        MOVS     R2,R4
// 1328   if ((statusreg & ((uint32_t)1 << tmp)) != (uint32_t)RESET)
        LSRS     R4,R3,R2
        LSLS     R4,R4,#+31
        BPL.N    ??RCC_GetFlagStatus_3
// 1329   {
// 1330     bitstatus = SET;
        MOVS     R4,#+1
        MOVS     R0,R4
        B.N      ??RCC_GetFlagStatus_4
// 1331   }
// 1332   else
// 1333   {
// 1334     bitstatus = RESET;
??RCC_GetFlagStatus_3:
        MOVS     R4,#+0
        MOVS     R0,R4
// 1335   }
// 1336 
// 1337   /* Return the flag status */
// 1338   return bitstatus;
??RCC_GetFlagStatus_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
        BX       LR               ;; return
// 1339 }
// 1340 
// 1341 /**
// 1342   * @brief  Clears the RCC reset flags.
// 1343   * @note   The reset flags are: RCC_FLAG_PINRST, RCC_FLAG_PORRST, RCC_FLAG_SFTRST,
// 1344   *   RCC_FLAG_IWDGRST, RCC_FLAG_WWDGRST, RCC_FLAG_LPWRRST
// 1345   * @param  None
// 1346   * @retval None
// 1347   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1348 void RCC_ClearFlag(void)
// 1349 {
// 1350   /* Set RMVF bit to clear the reset flags */
// 1351   RCC->CSR |= CSR_RMVF_Set;
RCC_ClearFlag:
        LDR.N    R0,??DataTable30_24  ;; 0x40021024
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.N    R1,??DataTable30_24  ;; 0x40021024
        STR      R0,[R1, #+0]
// 1352 }
        BX       LR               ;; return
// 1353 
// 1354 /**
// 1355   * @brief  Checks whether the specified RCC interrupt has occurred or not.
// 1356   * @param  RCC_IT: specifies the RCC interrupt source to check.
// 1357   *   
// 1358   *   For @b STM32_Connectivity_line_devices, this parameter can be one of the
// 1359   *   following values:
// 1360   *     @arg RCC_IT_LSIRDY: LSI ready interrupt
// 1361   *     @arg RCC_IT_LSERDY: LSE ready interrupt
// 1362   *     @arg RCC_IT_HSIRDY: HSI ready interrupt
// 1363   *     @arg RCC_IT_HSERDY: HSE ready interrupt
// 1364   *     @arg RCC_IT_PLLRDY: PLL ready interrupt
// 1365   *     @arg RCC_IT_PLL2RDY: PLL2 ready interrupt 
// 1366   *     @arg RCC_IT_PLL3RDY: PLL3 ready interrupt                      
// 1367   *     @arg RCC_IT_CSS: Clock Security System interrupt
// 1368   * 
// 1369   *   For @b other_STM32_devices, this parameter can be one of the following values:        
// 1370   *     @arg RCC_IT_LSIRDY: LSI ready interrupt
// 1371   *     @arg RCC_IT_LSERDY: LSE ready interrupt
// 1372   *     @arg RCC_IT_HSIRDY: HSI ready interrupt
// 1373   *     @arg RCC_IT_HSERDY: HSE ready interrupt
// 1374   *     @arg RCC_IT_PLLRDY: PLL ready interrupt
// 1375   *     @arg RCC_IT_CSS: Clock Security System interrupt
// 1376   *   
// 1377   * @retval The new state of RCC_IT (SET or RESET).
// 1378   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1379 ITStatus RCC_GetITStatus(uint8_t RCC_IT)
// 1380 {
RCC_GetITStatus:
        MOVS     R1,R0
// 1381   ITStatus bitstatus = RESET;
        MOVS     R0,#+0
// 1382   /* Check the parameters */
// 1383   assert_param(IS_RCC_GET_IT(RCC_IT));
// 1384 
// 1385   /* Check the status of the specified RCC interrupt */
// 1386   if ((RCC->CIR & RCC_IT) != (uint32_t)RESET)
        LDR.N    R2,??DataTable30_4  ;; 0x40021008
        LDR      R2,[R2, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        TST      R2,R1
        BEQ.N    ??RCC_GetITStatus_0
// 1387   {
// 1388     bitstatus = SET;
        MOVS     R2,#+1
        MOVS     R0,R2
        B.N      ??RCC_GetITStatus_1
// 1389   }
// 1390   else
// 1391   {
// 1392     bitstatus = RESET;
??RCC_GetITStatus_0:
        MOVS     R2,#+0
        MOVS     R0,R2
// 1393   }
// 1394 
// 1395   /* Return the RCC_IT status */
// 1396   return  bitstatus;
??RCC_GetITStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
// 1397 }
// 1398 
// 1399 /**
// 1400   * @brief  Clears the RCC’s interrupt pending bits.
// 1401   * @param  RCC_IT: specifies the interrupt pending bit to clear.
// 1402   *   
// 1403   *   For @b STM32_Connectivity_line_devices, this parameter can be any combination
// 1404   *   of the following values:
// 1405   *     @arg RCC_IT_LSIRDY: LSI ready interrupt
// 1406   *     @arg RCC_IT_LSERDY: LSE ready interrupt
// 1407   *     @arg RCC_IT_HSIRDY: HSI ready interrupt
// 1408   *     @arg RCC_IT_HSERDY: HSE ready interrupt
// 1409   *     @arg RCC_IT_PLLRDY: PLL ready interrupt
// 1410   *     @arg RCC_IT_PLL2RDY: PLL2 ready interrupt 
// 1411   *     @arg RCC_IT_PLL3RDY: PLL3 ready interrupt                      
// 1412   *     @arg RCC_IT_CSS: Clock Security System interrupt
// 1413   * 
// 1414   *   For @b other_STM32_devices, this parameter can be any combination of the
// 1415   *   following values:        
// 1416   *     @arg RCC_IT_LSIRDY: LSI ready interrupt
// 1417   *     @arg RCC_IT_LSERDY: LSE ready interrupt
// 1418   *     @arg RCC_IT_HSIRDY: HSI ready interrupt
// 1419   *     @arg RCC_IT_HSERDY: HSE ready interrupt
// 1420   *     @arg RCC_IT_PLLRDY: PLL ready interrupt
// 1421   *   
// 1422   *     @arg RCC_IT_CSS: Clock Security System interrupt
// 1423   * @retval None
// 1424   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1425 void RCC_ClearITPendingBit(uint8_t RCC_IT)
// 1426 {
// 1427   /* Check the parameters */
// 1428   assert_param(IS_RCC_CLEAR_IT(RCC_IT));
// 1429 
// 1430   /* Perform Byte access to RCC_CIR[23:16] bits to clear the selected interrupt
// 1431      pending bits */
// 1432   *(__IO uint8_t *) CIR_BYTE3_ADDRESS = RCC_IT;
RCC_ClearITPendingBit:
        LDR.N    R1,??DataTable30_25  ;; 0x4002100a
        STRB     R0,[R1, #+0]
// 1433 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30:
        DC32     0x40021000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_1:
        DC32     0x40021004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_2:
        DC32     0xf8ff0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_3:
        DC32     0xfef6ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_4:
        DC32     0x40021008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_5:
        DC32     0x42420000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_6:
        DC32     0x42420060

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_7:
        DC32     0x40021009

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_8:
        DC32     0x424200d8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_9:
        DC32     0x40021020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_10:
        DC32     0x42420480

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_11:
        DC32     0x4242043c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_12:
        DC32     0x7a1200

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_13:
        DC32     0x3d0900

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_14:
        DC32     APBAHBPrescTable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_15:
        DC32     ADCPrescTable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_16:
        DC32     0x40021014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_17:
        DC32     0x40021018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_18:
        DC32     0x4002101c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_19:
        DC32     0x4002100c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_20:
        DC32     0x40021010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_21:
        DC32     0x42420440

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_22:
        DC32     0x4242004c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_23:
        DC32     0x40021007

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_24:
        DC32     0x40021024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_25:
        DC32     0x4002100a

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 1434 
// 1435 /**
// 1436   * @}
// 1437   */
// 1438 
// 1439 /**
// 1440   * @}
// 1441   */
// 1442 
// 1443 /**
// 1444   * @}
// 1445   */
// 1446 
// 1447 /******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/
// 
//    20 bytes in section .data
// 1 166 bytes in section .text
// 
// 1 166 bytes of CODE memory
//    20 bytes of DATA memory
//
//Errors: none
//Warnings: none
