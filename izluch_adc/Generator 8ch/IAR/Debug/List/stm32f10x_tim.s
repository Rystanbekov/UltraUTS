///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     31/May/2017  14:31:59 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  Z:\Generator 8ch\IAR\stm32f10x_tim.c                    /
//    Command line =  "Z:\Generator 8ch\IAR\stm32f10x_tim.c" -D STM32F10X_MD  /
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
//    List file    =  Z:\Generator 8ch\IAR\Debug\List\stm32f10x_tim.s         /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm32f10x_tim

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB1PeriphResetCmd
        EXTERN RCC_APB2PeriphResetCmd

        PUBLIC TIM_ARRPreloadConfig
        PUBLIC TIM_BDTRConfig
        PUBLIC TIM_BDTRStructInit
        PUBLIC TIM_CCPreloadControl
        PUBLIC TIM_CCxCmd
        PUBLIC TIM_CCxNCmd
        PUBLIC TIM_ClearFlag
        PUBLIC TIM_ClearITPendingBit
        PUBLIC TIM_ClearOC1Ref
        PUBLIC TIM_ClearOC2Ref
        PUBLIC TIM_ClearOC3Ref
        PUBLIC TIM_ClearOC4Ref
        PUBLIC TIM_Cmd
        PUBLIC TIM_CounterModeConfig
        PUBLIC TIM_CtrlPWMOutputs
        PUBLIC TIM_DMACmd
        PUBLIC TIM_DMAConfig
        PUBLIC TIM_DeInit
        PUBLIC TIM_ETRClockMode1Config
        PUBLIC TIM_ETRClockMode2Config
        PUBLIC TIM_ETRConfig
        PUBLIC TIM_EncoderInterfaceConfig
        PUBLIC TIM_ForcedOC1Config
        PUBLIC TIM_ForcedOC2Config
        PUBLIC TIM_ForcedOC3Config
        PUBLIC TIM_ForcedOC4Config
        PUBLIC TIM_GenerateEvent
        PUBLIC TIM_GetCapture1
        PUBLIC TIM_GetCapture2
        PUBLIC TIM_GetCapture3
        PUBLIC TIM_GetCapture4
        PUBLIC TIM_GetCounter
        PUBLIC TIM_GetFlagStatus
        PUBLIC TIM_GetITStatus
        PUBLIC TIM_GetPrescaler
        PUBLIC TIM_ICInit
        PUBLIC TIM_ICStructInit
        PUBLIC TIM_ITConfig
        PUBLIC TIM_ITRxExternalClockConfig
        PUBLIC TIM_InternalClockConfig
        PUBLIC TIM_OC1FastConfig
        PUBLIC TIM_OC1Init
        PUBLIC TIM_OC1NPolarityConfig
        PUBLIC TIM_OC1PolarityConfig
        PUBLIC TIM_OC1PreloadConfig
        PUBLIC TIM_OC2FastConfig
        PUBLIC TIM_OC2Init
        PUBLIC TIM_OC2NPolarityConfig
        PUBLIC TIM_OC2PolarityConfig
        PUBLIC TIM_OC2PreloadConfig
        PUBLIC TIM_OC3FastConfig
        PUBLIC TIM_OC3Init
        PUBLIC TIM_OC3NPolarityConfig
        PUBLIC TIM_OC3PolarityConfig
        PUBLIC TIM_OC3PreloadConfig
        PUBLIC TIM_OC4FastConfig
        PUBLIC TIM_OC4Init
        PUBLIC TIM_OC4PolarityConfig
        PUBLIC TIM_OC4PreloadConfig
        PUBLIC TIM_OCStructInit
        PUBLIC TIM_PWMIConfig
        PUBLIC TIM_PrescalerConfig
        PUBLIC TIM_SelectCCDMA
        PUBLIC TIM_SelectCOM
        PUBLIC TIM_SelectHallSensor
        PUBLIC TIM_SelectInputTrigger
        PUBLIC TIM_SelectMasterSlaveMode
        PUBLIC TIM_SelectOCxM
        PUBLIC TIM_SelectOnePulseMode
        PUBLIC TIM_SelectOutputTrigger
        PUBLIC TIM_SelectSlaveMode
        PUBLIC TIM_SetAutoreload
        PUBLIC TIM_SetClockDivision
        PUBLIC TIM_SetCompare1
        PUBLIC TIM_SetCompare2
        PUBLIC TIM_SetCompare3
        PUBLIC TIM_SetCompare4
        PUBLIC TIM_SetCounter
        PUBLIC TIM_SetIC1Prescaler
        PUBLIC TIM_SetIC2Prescaler
        PUBLIC TIM_SetIC3Prescaler
        PUBLIC TIM_SetIC4Prescaler
        PUBLIC TIM_TIxExternalClockConfig
        PUBLIC TIM_TimeBaseInit
        PUBLIC TIM_TimeBaseStructInit
        PUBLIC TIM_UpdateDisableConfig
        PUBLIC TIM_UpdateRequestConfig

// Z:\Generator 8ch\IAR\stm32f10x_tim.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm32f10x_tim.c
//    4   * @author  MCD Application Team
//    5   * @version V3.5.0
//    6   * @date    11-March-2011
//    7   * @brief   This file provides all the TIM firmware functions.
//    8   ******************************************************************************
//    9   * @attention
//   10   *
//   11   * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
//   12   * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
//   13   * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
//   14   * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
//   15   * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
//   16   * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
//   17   *
//   18   * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
//   19   ******************************************************************************
//   20   */
//   21 
//   22 /* Includes ------------------------------------------------------------------*/
//   23 #include "stm32f10x_tim.h"
//   24 #include "stm32f10x_rcc.h"
//   25 
//   26 /** @addtogroup STM32F10x_StdPeriph_Driver
//   27   * @{
//   28   */
//   29 
//   30 /** @defgroup TIM 
//   31   * @brief TIM driver modules
//   32   * @{
//   33   */
//   34 
//   35 /** @defgroup TIM_Private_TypesDefinitions
//   36   * @{
//   37   */
//   38 
//   39 /**
//   40   * @}
//   41   */
//   42 
//   43 /** @defgroup TIM_Private_Defines
//   44   * @{
//   45   */
//   46 
//   47 /* ---------------------- TIM registers bit mask ------------------------ */
//   48 #define SMCR_ETR_Mask               ((uint16_t)0x00FF) 
//   49 #define CCMR_Offset                 ((uint16_t)0x0018)
//   50 #define CCER_CCE_Set                ((uint16_t)0x0001)  
//   51 #define	CCER_CCNE_Set               ((uint16_t)0x0004) 
//   52 
//   53 /**
//   54   * @}
//   55   */
//   56 
//   57 /** @defgroup TIM_Private_Macros
//   58   * @{
//   59   */
//   60 
//   61 /**
//   62   * @}
//   63   */
//   64 
//   65 /** @defgroup TIM_Private_Variables
//   66   * @{
//   67   */
//   68 
//   69 /**
//   70   * @}
//   71   */
//   72 
//   73 /** @defgroup TIM_Private_FunctionPrototypes
//   74   * @{
//   75   */
//   76 
//   77 static void TI1_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
//   78                        uint16_t TIM_ICFilter);
//   79 static void TI2_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
//   80                        uint16_t TIM_ICFilter);
//   81 static void TI3_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
//   82                        uint16_t TIM_ICFilter);
//   83 static void TI4_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
//   84                        uint16_t TIM_ICFilter);
//   85 /**
//   86   * @}
//   87   */
//   88 
//   89 /** @defgroup TIM_Private_Macros
//   90   * @{
//   91   */
//   92 
//   93 /**
//   94   * @}
//   95   */
//   96 
//   97 /** @defgroup TIM_Private_Variables
//   98   * @{
//   99   */
//  100 
//  101 /**
//  102   * @}
//  103   */
//  104 
//  105 /** @defgroup TIM_Private_FunctionPrototypes
//  106   * @{
//  107   */
//  108 
//  109 /**
//  110   * @}
//  111   */
//  112 
//  113 /** @defgroup TIM_Private_Functions
//  114   * @{
//  115   */
//  116 
//  117 /**
//  118   * @brief  Deinitializes the TIMx peripheral registers to their default reset values.
//  119   * @param  TIMx: where x can be 1 to 17 to select the TIM peripheral.
//  120   * @retval None
//  121   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  122 void TIM_DeInit(TIM_TypeDef* TIMx)
//  123 {
TIM_DeInit:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  124   /* Check the parameters */
//  125   assert_param(IS_TIM_ALL_PERIPH(TIMx)); 
//  126  
//  127   if (TIMx == TIM1)
        LDR.W    R0,??DataTable9  ;; 0x40012c00
        CMP      R4,R0
        BNE.N    ??TIM_DeInit_0
//  128   {
//  129     RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM1, ENABLE);
        MOVS     R1,#+1
        MOV      R0,#+2048
        BL       RCC_APB2PeriphResetCmd
//  130     RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM1, DISABLE);  
        MOVS     R1,#+0
        MOV      R0,#+2048
        BL       RCC_APB2PeriphResetCmd
        B.N      ??TIM_DeInit_1
//  131   }     
//  132   else if (TIMx == TIM2)
??TIM_DeInit_0:
        CMP      R4,#+1073741824
        BNE.N    ??TIM_DeInit_2
//  133   {
//  134     RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM2, ENABLE);
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       RCC_APB1PeriphResetCmd
//  135     RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM2, DISABLE);
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       RCC_APB1PeriphResetCmd
        B.N      ??TIM_DeInit_1
//  136   }
//  137   else if (TIMx == TIM3)
??TIM_DeInit_2:
        LDR.W    R0,??DataTable9_1  ;; 0x40000400
        CMP      R4,R0
        BNE.N    ??TIM_DeInit_3
//  138   {
//  139     RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM3, ENABLE);
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       RCC_APB1PeriphResetCmd
//  140     RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM3, DISABLE);
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       RCC_APB1PeriphResetCmd
        B.N      ??TIM_DeInit_1
//  141   }
//  142   else if (TIMx == TIM4)
??TIM_DeInit_3:
        LDR.W    R0,??DataTable9_2  ;; 0x40000800
        CMP      R4,R0
        BNE.N    ??TIM_DeInit_4
//  143   {
//  144     RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM4, ENABLE);
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       RCC_APB1PeriphResetCmd
//  145     RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM4, DISABLE);
        MOVS     R1,#+0
        MOVS     R0,#+4
        BL       RCC_APB1PeriphResetCmd
        B.N      ??TIM_DeInit_1
//  146   } 
//  147   else if (TIMx == TIM5)
??TIM_DeInit_4:
        LDR.W    R0,??DataTable10  ;; 0x40000c00
        CMP      R4,R0
        BNE.N    ??TIM_DeInit_5
//  148   {
//  149     RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM5, ENABLE);
        MOVS     R1,#+1
        MOVS     R0,#+8
        BL       RCC_APB1PeriphResetCmd
//  150     RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM5, DISABLE);
        MOVS     R1,#+0
        MOVS     R0,#+8
        BL       RCC_APB1PeriphResetCmd
        B.N      ??TIM_DeInit_1
//  151   } 
//  152   else if (TIMx == TIM6)
??TIM_DeInit_5:
        LDR.W    R0,??DataTable10_1  ;; 0x40001000
        CMP      R4,R0
        BNE.N    ??TIM_DeInit_6
//  153   {
//  154     RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM6, ENABLE);
        MOVS     R1,#+1
        MOVS     R0,#+16
        BL       RCC_APB1PeriphResetCmd
//  155     RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM6, DISABLE);
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       RCC_APB1PeriphResetCmd
        B.N      ??TIM_DeInit_1
//  156   } 
//  157   else if (TIMx == TIM7)
??TIM_DeInit_6:
        LDR.W    R0,??DataTable10_2  ;; 0x40001400
        CMP      R4,R0
        BNE.N    ??TIM_DeInit_7
//  158   {
//  159     RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM7, ENABLE);
        MOVS     R1,#+1
        MOVS     R0,#+32
        BL       RCC_APB1PeriphResetCmd
//  160     RCC_APB1PeriphResetCmd(RCC_APB1Periph_TIM7, DISABLE);
        MOVS     R1,#+0
        MOVS     R0,#+32
        BL       RCC_APB1PeriphResetCmd
        B.N      ??TIM_DeInit_1
//  161   } 
//  162   else if (TIMx == TIM8)
??TIM_DeInit_7:
        LDR.W    R0,??DataTable10_3  ;; 0x40013400
        CMP      R4,R0
        BNE.N    ??TIM_DeInit_1
//  163   {
//  164     RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM8, ENABLE);
        MOVS     R1,#+1
        MOV      R0,#+8192
        BL       RCC_APB2PeriphResetCmd
//  165     RCC_APB2PeriphResetCmd(RCC_APB2Periph_TIM8, DISABLE);
        MOVS     R1,#+0
        MOV      R0,#+8192
        BL       RCC_APB2PeriphResetCmd
//  166   }
//  167 
//  168 }
??TIM_DeInit_1:
        POP      {R4,PC}          ;; return
//  169 
//  170 /**
//  171   * @brief  Initializes the TIMx Time Base Unit peripheral according to 
//  172   *         the specified parameters in the TIM_TimeBaseInitStruct.
//  173   * @param  TIMx: where x can be 1 to 17 to select the TIM peripheral.
//  174   * @param  TIM_TimeBaseInitStruct: pointer to a TIM_TimeBaseInitTypeDef
//  175   *         structure that contains the configuration information for the 
//  176   *         specified TIM peripheral.
//  177   * @retval None
//  178   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  179 void TIM_TimeBaseInit(TIM_TypeDef* TIMx, TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct)
//  180 {
//  181   uint16_t tmpcr1 = 0;
TIM_TimeBaseInit:
        MOVS     R2,#+0
//  182 
//  183   /* Check the parameters */
//  184   assert_param(IS_TIM_ALL_PERIPH(TIMx)); 
//  185   assert_param(IS_TIM_COUNTER_MODE(TIM_TimeBaseInitStruct->TIM_CounterMode));
//  186   assert_param(IS_TIM_CKD_DIV(TIM_TimeBaseInitStruct->TIM_ClockDivision));
//  187 
//  188   tmpcr1 = TIMx->CR1;  
        LDRH     R3,[R0, #+0]
        MOVS     R2,R3
//  189 
//  190   if((TIMx == TIM1) || (TIMx == TIM8)|| (TIMx == TIM2) || (TIMx == TIM3)||
//  191      (TIMx == TIM4) || (TIMx == TIM5)) 
        LDR.W    R3,??DataTable9  ;; 0x40012c00
        CMP      R0,R3
        BEQ.N    ??TIM_TimeBaseInit_0
        LDR.W    R3,??DataTable10_3  ;; 0x40013400
        CMP      R0,R3
        BEQ.N    ??TIM_TimeBaseInit_0
        CMP      R0,#+1073741824
        BEQ.N    ??TIM_TimeBaseInit_0
        LDR.W    R3,??DataTable9_1  ;; 0x40000400
        CMP      R0,R3
        BEQ.N    ??TIM_TimeBaseInit_0
        LDR.W    R3,??DataTable9_2  ;; 0x40000800
        CMP      R0,R3
        BEQ.N    ??TIM_TimeBaseInit_0
        LDR.W    R3,??DataTable10  ;; 0x40000c00
        CMP      R0,R3
        BNE.N    ??TIM_TimeBaseInit_1
//  192   {
//  193     /* Select the Counter Mode */
//  194     tmpcr1 &= (uint16_t)(~((uint16_t)(TIM_CR1_DIR | TIM_CR1_CMS)));
??TIM_TimeBaseInit_0:
        MOVW     R3,#+65423
        ANDS     R2,R3,R2
//  195     tmpcr1 |= (uint32_t)TIM_TimeBaseInitStruct->TIM_CounterMode;
        LDRH     R3,[R1, #+2]
        ORRS     R2,R3,R2
//  196   }
//  197  
//  198   if((TIMx != TIM6) && (TIMx != TIM7))
??TIM_TimeBaseInit_1:
        LDR.W    R3,??DataTable10_1  ;; 0x40001000
        CMP      R0,R3
        BEQ.N    ??TIM_TimeBaseInit_2
        LDR.W    R3,??DataTable10_2  ;; 0x40001400
        CMP      R0,R3
        BEQ.N    ??TIM_TimeBaseInit_2
//  199   {
//  200     /* Set the clock division */
//  201     tmpcr1 &= (uint16_t)(~((uint16_t)TIM_CR1_CKD));
        MOVW     R3,#+64767
        ANDS     R2,R3,R2
//  202     tmpcr1 |= (uint32_t)TIM_TimeBaseInitStruct->TIM_ClockDivision;
        LDRH     R3,[R1, #+6]
        ORRS     R2,R3,R2
//  203   }
//  204 
//  205   TIMx->CR1 = tmpcr1;
??TIM_TimeBaseInit_2:
        STRH     R2,[R0, #+0]
//  206 
//  207   /* Set the Autoreload value */
//  208   TIMx->ARR = TIM_TimeBaseInitStruct->TIM_Period ;
        LDRH     R3,[R1, #+4]
        STRH     R3,[R0, #+44]
//  209  
//  210   /* Set the Prescaler value */
//  211   TIMx->PSC = TIM_TimeBaseInitStruct->TIM_Prescaler;
        LDRH     R3,[R1, #+0]
        STRH     R3,[R0, #+40]
//  212     
//  213   if ((TIMx == TIM1) || (TIMx == TIM8)|| (TIMx == TIM15)|| (TIMx == TIM16) || (TIMx == TIM17))  
        LDR.W    R3,??DataTable9  ;; 0x40012c00
        CMP      R0,R3
        BEQ.N    ??TIM_TimeBaseInit_3
        LDR.W    R3,??DataTable10_3  ;; 0x40013400
        CMP      R0,R3
        BEQ.N    ??TIM_TimeBaseInit_3
        LDR.W    R3,??DataTable10_4  ;; 0x40014000
        CMP      R0,R3
        BEQ.N    ??TIM_TimeBaseInit_3
        LDR.W    R3,??DataTable10_5  ;; 0x40014400
        CMP      R0,R3
        BEQ.N    ??TIM_TimeBaseInit_3
        LDR.W    R3,??DataTable10_6  ;; 0x40014800
        CMP      R0,R3
        BNE.N    ??TIM_TimeBaseInit_4
//  214   {
//  215     /* Set the Repetition Counter value */
//  216     TIMx->RCR = TIM_TimeBaseInitStruct->TIM_RepetitionCounter;
??TIM_TimeBaseInit_3:
        LDRB     R3,[R1, #+8]
        STRH     R3,[R0, #+48]
//  217   }
//  218 
//  219   /* Generate an update event to reload the Prescaler and the Repetition counter
//  220      values immediately */
//  221   TIMx->EGR = TIM_PSCReloadMode_Immediate;           
??TIM_TimeBaseInit_4:
        MOVS     R3,#+1
        STRH     R3,[R0, #+20]
//  222 }
        BX       LR               ;; return
//  223 
//  224 /**
//  225   * @brief  Initializes the TIMx Channel1 according to the specified
//  226   *         parameters in the TIM_OCInitStruct.
//  227   * @param  TIMx: where x can be  1 to 17 except 6 and 7 to select the TIM peripheral.
//  228   * @param  TIM_OCInitStruct: pointer to a TIM_OCInitTypeDef structure
//  229   *         that contains the configuration information for the specified TIM peripheral.
//  230   * @retval None
//  231   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  232 void TIM_OC1Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
//  233 {
TIM_OC1Init:
        PUSH     {R4-R6}
//  234   uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R2,#+0
//  235    
//  236   /* Check the parameters */
//  237   assert_param(IS_TIM_LIST8_PERIPH(TIMx));
//  238   assert_param(IS_TIM_OC_MODE(TIM_OCInitStruct->TIM_OCMode));
//  239   assert_param(IS_TIM_OUTPUT_STATE(TIM_OCInitStruct->TIM_OutputState));
//  240   assert_param(IS_TIM_OC_POLARITY(TIM_OCInitStruct->TIM_OCPolarity));   
//  241  /* Disable the Channel 1: Reset the CC1E Bit */
//  242   TIMx->CCER &= (uint16_t)(~(uint16_t)TIM_CCER_CC1E);
        LDRH     R5,[R0, #+32]
        MOVW     R6,#+65534
        ANDS     R5,R6,R5
        STRH     R5,[R0, #+32]
//  243   /* Get the TIMx CCER register value */
//  244   tmpccer = TIMx->CCER;
        LDRH     R5,[R0, #+32]
        MOVS     R4,R5
//  245   /* Get the TIMx CR2 register value */
//  246   tmpcr2 =  TIMx->CR2;
        LDRH     R5,[R0, #+4]
        MOVS     R2,R5
//  247   
//  248   /* Get the TIMx CCMR1 register value */
//  249   tmpccmrx = TIMx->CCMR1;
        LDRH     R5,[R0, #+24]
        MOVS     R3,R5
//  250     
//  251   /* Reset the Output Compare Mode Bits */
//  252   tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CCMR1_OC1M));
        MOVW     R5,#+65423
        ANDS     R3,R5,R3
//  253   tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CCMR1_CC1S));
        MOVW     R5,#+65532
        ANDS     R3,R5,R3
//  254 
//  255   /* Select the Output Compare Mode */
//  256   tmpccmrx |= TIM_OCInitStruct->TIM_OCMode;
        LDRH     R5,[R1, #+0]
        ORRS     R3,R5,R3
//  257   
//  258   /* Reset the Output Polarity level */
//  259   tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC1P));
        MOVW     R5,#+65533
        ANDS     R4,R5,R4
//  260   /* Set the Output Compare Polarity */
//  261   tmpccer |= TIM_OCInitStruct->TIM_OCPolarity;
        LDRH     R5,[R1, #+8]
        ORRS     R4,R5,R4
//  262   
//  263   /* Set the Output State */
//  264   tmpccer |= TIM_OCInitStruct->TIM_OutputState;
        LDRH     R5,[R1, #+2]
        ORRS     R4,R5,R4
//  265     
//  266   if((TIMx == TIM1) || (TIMx == TIM8)|| (TIMx == TIM15)||
//  267      (TIMx == TIM16)|| (TIMx == TIM17))
        LDR.W    R5,??DataTable9  ;; 0x40012c00
        CMP      R0,R5
        BEQ.N    ??TIM_OC1Init_0
        LDR.W    R5,??DataTable10_3  ;; 0x40013400
        CMP      R0,R5
        BEQ.N    ??TIM_OC1Init_0
        LDR.W    R5,??DataTable10_4  ;; 0x40014000
        CMP      R0,R5
        BEQ.N    ??TIM_OC1Init_0
        LDR.W    R5,??DataTable10_5  ;; 0x40014400
        CMP      R0,R5
        BEQ.N    ??TIM_OC1Init_0
        LDR.W    R5,??DataTable10_6  ;; 0x40014800
        CMP      R0,R5
        BNE.N    ??TIM_OC1Init_1
//  268   {
//  269     assert_param(IS_TIM_OUTPUTN_STATE(TIM_OCInitStruct->TIM_OutputNState));
//  270     assert_param(IS_TIM_OCN_POLARITY(TIM_OCInitStruct->TIM_OCNPolarity));
//  271     assert_param(IS_TIM_OCNIDLE_STATE(TIM_OCInitStruct->TIM_OCNIdleState));
//  272     assert_param(IS_TIM_OCIDLE_STATE(TIM_OCInitStruct->TIM_OCIdleState));
//  273     
//  274     /* Reset the Output N Polarity level */
//  275     tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC1NP));
??TIM_OC1Init_0:
        MOVW     R5,#+65527
        ANDS     R4,R5,R4
//  276     /* Set the Output N Polarity */
//  277     tmpccer |= TIM_OCInitStruct->TIM_OCNPolarity;
        LDRH     R5,[R1, #+10]
        ORRS     R4,R5,R4
//  278     
//  279     /* Reset the Output N State */
//  280     tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC1NE));    
        MOVW     R5,#+65531
        ANDS     R4,R5,R4
//  281     /* Set the Output N State */
//  282     tmpccer |= TIM_OCInitStruct->TIM_OutputNState;
        LDRH     R5,[R1, #+4]
        ORRS     R4,R5,R4
//  283     
//  284     /* Reset the Output Compare and Output Compare N IDLE State */
//  285     tmpcr2 &= (uint16_t)(~((uint16_t)TIM_CR2_OIS1));
        MOVW     R5,#+65279
        ANDS     R2,R5,R2
//  286     tmpcr2 &= (uint16_t)(~((uint16_t)TIM_CR2_OIS1N));
        MOVW     R5,#+65023
        ANDS     R2,R5,R2
//  287     
//  288     /* Set the Output Idle state */
//  289     tmpcr2 |= TIM_OCInitStruct->TIM_OCIdleState;
        LDRH     R5,[R1, #+12]
        ORRS     R2,R5,R2
//  290     /* Set the Output N Idle state */
//  291     tmpcr2 |= TIM_OCInitStruct->TIM_OCNIdleState;
        LDRH     R5,[R1, #+14]
        ORRS     R2,R5,R2
//  292   }
//  293   /* Write to TIMx CR2 */
//  294   TIMx->CR2 = tmpcr2;
??TIM_OC1Init_1:
        STRH     R2,[R0, #+4]
//  295   
//  296   /* Write to TIMx CCMR1 */
//  297   TIMx->CCMR1 = tmpccmrx;
        STRH     R3,[R0, #+24]
//  298 
//  299   /* Set the Capture Compare Register value */
//  300   TIMx->CCR1 = TIM_OCInitStruct->TIM_Pulse; 
        LDRH     R5,[R1, #+6]
        STRH     R5,[R0, #+52]
//  301  
//  302   /* Write to TIMx CCER */
//  303   TIMx->CCER = tmpccer;
        STRH     R4,[R0, #+32]
//  304 }
        POP      {R4-R6}
        BX       LR               ;; return
//  305 
//  306 /**
//  307   * @brief  Initializes the TIMx Channel2 according to the specified
//  308   *         parameters in the TIM_OCInitStruct.
//  309   * @param  TIMx: where x can be  1, 2, 3, 4, 5, 8, 9, 12 or 15 to select 
//  310   *         the TIM peripheral.
//  311   * @param  TIM_OCInitStruct: pointer to a TIM_OCInitTypeDef structure
//  312   *         that contains the configuration information for the specified TIM peripheral.
//  313   * @retval None
//  314   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  315 void TIM_OC2Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
//  316 {
TIM_OC2Init:
        PUSH     {R4-R6}
//  317   uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R2,#+0
//  318    
//  319   /* Check the parameters */
//  320   assert_param(IS_TIM_LIST6_PERIPH(TIMx)); 
//  321   assert_param(IS_TIM_OC_MODE(TIM_OCInitStruct->TIM_OCMode));
//  322   assert_param(IS_TIM_OUTPUT_STATE(TIM_OCInitStruct->TIM_OutputState));
//  323   assert_param(IS_TIM_OC_POLARITY(TIM_OCInitStruct->TIM_OCPolarity));   
//  324    /* Disable the Channel 2: Reset the CC2E Bit */
//  325   TIMx->CCER &= (uint16_t)(~((uint16_t)TIM_CCER_CC2E));
        LDRH     R5,[R0, #+32]
        MOVW     R6,#+65519
        ANDS     R5,R6,R5
        STRH     R5,[R0, #+32]
//  326   
//  327   /* Get the TIMx CCER register value */  
//  328   tmpccer = TIMx->CCER;
        LDRH     R5,[R0, #+32]
        MOVS     R4,R5
//  329   /* Get the TIMx CR2 register value */
//  330   tmpcr2 =  TIMx->CR2;
        LDRH     R5,[R0, #+4]
        MOVS     R2,R5
//  331   
//  332   /* Get the TIMx CCMR1 register value */
//  333   tmpccmrx = TIMx->CCMR1;
        LDRH     R5,[R0, #+24]
        MOVS     R3,R5
//  334     
//  335   /* Reset the Output Compare mode and Capture/Compare selection Bits */
//  336   tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CCMR1_OC2M));
        MOVW     R5,#+36863
        ANDS     R3,R5,R3
//  337   tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CCMR1_CC2S));
        MOVW     R5,#+64767
        ANDS     R3,R5,R3
//  338   
//  339   /* Select the Output Compare Mode */
//  340   tmpccmrx |= (uint16_t)(TIM_OCInitStruct->TIM_OCMode << 8);
        LDRH     R5,[R1, #+0]
        ORRS     R3,R3,R5, LSL #+8
//  341   
//  342   /* Reset the Output Polarity level */
//  343   tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC2P));
        MOVW     R5,#+65503
        ANDS     R4,R5,R4
//  344   /* Set the Output Compare Polarity */
//  345   tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 4);
        LDRH     R5,[R1, #+8]
        ORRS     R4,R4,R5, LSL #+4
//  346   
//  347   /* Set the Output State */
//  348   tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 4);
        LDRH     R5,[R1, #+2]
        ORRS     R4,R4,R5, LSL #+4
//  349     
//  350   if((TIMx == TIM1) || (TIMx == TIM8))
        LDR.W    R5,??DataTable9  ;; 0x40012c00
        CMP      R0,R5
        BEQ.N    ??TIM_OC2Init_0
        LDR.W    R5,??DataTable10_3  ;; 0x40013400
        CMP      R0,R5
        BNE.N    ??TIM_OC2Init_1
//  351   {
//  352     assert_param(IS_TIM_OUTPUTN_STATE(TIM_OCInitStruct->TIM_OutputNState));
//  353     assert_param(IS_TIM_OCN_POLARITY(TIM_OCInitStruct->TIM_OCNPolarity));
//  354     assert_param(IS_TIM_OCNIDLE_STATE(TIM_OCInitStruct->TIM_OCNIdleState));
//  355     assert_param(IS_TIM_OCIDLE_STATE(TIM_OCInitStruct->TIM_OCIdleState));
//  356     
//  357     /* Reset the Output N Polarity level */
//  358     tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC2NP));
??TIM_OC2Init_0:
        MOVW     R5,#+65407
        ANDS     R4,R5,R4
//  359     /* Set the Output N Polarity */
//  360     tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCNPolarity << 4);
        LDRH     R5,[R1, #+10]
        ORRS     R4,R4,R5, LSL #+4
//  361     
//  362     /* Reset the Output N State */
//  363     tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC2NE));    
        MOVW     R5,#+65471
        ANDS     R4,R5,R4
//  364     /* Set the Output N State */
//  365     tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputNState << 4);
        LDRH     R5,[R1, #+4]
        ORRS     R4,R4,R5, LSL #+4
//  366     
//  367     /* Reset the Output Compare and Output Compare N IDLE State */
//  368     tmpcr2 &= (uint16_t)(~((uint16_t)TIM_CR2_OIS2));
        MOVW     R5,#+64511
        ANDS     R2,R5,R2
//  369     tmpcr2 &= (uint16_t)(~((uint16_t)TIM_CR2_OIS2N));
        MOVW     R5,#+63487
        ANDS     R2,R5,R2
//  370     
//  371     /* Set the Output Idle state */
//  372     tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 2);
        LDRH     R5,[R1, #+12]
        ORRS     R2,R2,R5, LSL #+2
//  373     /* Set the Output N Idle state */
//  374     tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCNIdleState << 2);
        LDRH     R5,[R1, #+14]
        ORRS     R2,R2,R5, LSL #+2
//  375   }
//  376   /* Write to TIMx CR2 */
//  377   TIMx->CR2 = tmpcr2;
??TIM_OC2Init_1:
        STRH     R2,[R0, #+4]
//  378   
//  379   /* Write to TIMx CCMR1 */
//  380   TIMx->CCMR1 = tmpccmrx;
        STRH     R3,[R0, #+24]
//  381 
//  382   /* Set the Capture Compare Register value */
//  383   TIMx->CCR2 = TIM_OCInitStruct->TIM_Pulse;
        LDRH     R5,[R1, #+6]
        STRH     R5,[R0, #+56]
//  384   
//  385   /* Write to TIMx CCER */
//  386   TIMx->CCER = tmpccer;
        STRH     R4,[R0, #+32]
//  387 }
        POP      {R4-R6}
        BX       LR               ;; return
//  388 
//  389 /**
//  390   * @brief  Initializes the TIMx Channel3 according to the specified
//  391   *         parameters in the TIM_OCInitStruct.
//  392   * @param  TIMx: where x can be  1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
//  393   * @param  TIM_OCInitStruct: pointer to a TIM_OCInitTypeDef structure
//  394   *         that contains the configuration information for the specified TIM peripheral.
//  395   * @retval None
//  396   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  397 void TIM_OC3Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
//  398 {
TIM_OC3Init:
        PUSH     {R4-R6}
//  399   uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R2,#+0
//  400    
//  401   /* Check the parameters */
//  402   assert_param(IS_TIM_LIST3_PERIPH(TIMx)); 
//  403   assert_param(IS_TIM_OC_MODE(TIM_OCInitStruct->TIM_OCMode));
//  404   assert_param(IS_TIM_OUTPUT_STATE(TIM_OCInitStruct->TIM_OutputState));
//  405   assert_param(IS_TIM_OC_POLARITY(TIM_OCInitStruct->TIM_OCPolarity));   
//  406   /* Disable the Channel 2: Reset the CC2E Bit */
//  407   TIMx->CCER &= (uint16_t)(~((uint16_t)TIM_CCER_CC3E));
        LDRH     R5,[R0, #+32]
        MOVW     R6,#+65279
        ANDS     R5,R6,R5
        STRH     R5,[R0, #+32]
//  408   
//  409   /* Get the TIMx CCER register value */
//  410   tmpccer = TIMx->CCER;
        LDRH     R5,[R0, #+32]
        MOVS     R4,R5
//  411   /* Get the TIMx CR2 register value */
//  412   tmpcr2 =  TIMx->CR2;
        LDRH     R5,[R0, #+4]
        MOVS     R2,R5
//  413   
//  414   /* Get the TIMx CCMR2 register value */
//  415   tmpccmrx = TIMx->CCMR2;
        LDRH     R5,[R0, #+28]
        MOVS     R3,R5
//  416     
//  417   /* Reset the Output Compare mode and Capture/Compare selection Bits */
//  418   tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CCMR2_OC3M));
        MOVW     R5,#+65423
        ANDS     R3,R5,R3
//  419   tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CCMR2_CC3S));  
        MOVW     R5,#+65532
        ANDS     R3,R5,R3
//  420   /* Select the Output Compare Mode */
//  421   tmpccmrx |= TIM_OCInitStruct->TIM_OCMode;
        LDRH     R5,[R1, #+0]
        ORRS     R3,R5,R3
//  422   
//  423   /* Reset the Output Polarity level */
//  424   tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC3P));
        MOVW     R5,#+65023
        ANDS     R4,R5,R4
//  425   /* Set the Output Compare Polarity */
//  426   tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 8);
        LDRH     R5,[R1, #+8]
        ORRS     R4,R4,R5, LSL #+8
//  427   
//  428   /* Set the Output State */
//  429   tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 8);
        LDRH     R5,[R1, #+2]
        ORRS     R4,R4,R5, LSL #+8
//  430     
//  431   if((TIMx == TIM1) || (TIMx == TIM8))
        LDR.W    R5,??DataTable9  ;; 0x40012c00
        CMP      R0,R5
        BEQ.N    ??TIM_OC3Init_0
        LDR.W    R5,??DataTable10_3  ;; 0x40013400
        CMP      R0,R5
        BNE.N    ??TIM_OC3Init_1
//  432   {
//  433     assert_param(IS_TIM_OUTPUTN_STATE(TIM_OCInitStruct->TIM_OutputNState));
//  434     assert_param(IS_TIM_OCN_POLARITY(TIM_OCInitStruct->TIM_OCNPolarity));
//  435     assert_param(IS_TIM_OCNIDLE_STATE(TIM_OCInitStruct->TIM_OCNIdleState));
//  436     assert_param(IS_TIM_OCIDLE_STATE(TIM_OCInitStruct->TIM_OCIdleState));
//  437     
//  438     /* Reset the Output N Polarity level */
//  439     tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC3NP));
??TIM_OC3Init_0:
        MOVW     R5,#+63487
        ANDS     R4,R5,R4
//  440     /* Set the Output N Polarity */
//  441     tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCNPolarity << 8);
        LDRH     R5,[R1, #+10]
        ORRS     R4,R4,R5, LSL #+8
//  442     /* Reset the Output N State */
//  443     tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC3NE));
        MOVW     R5,#+64511
        ANDS     R4,R5,R4
//  444     
//  445     /* Set the Output N State */
//  446     tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputNState << 8);
        LDRH     R5,[R1, #+4]
        ORRS     R4,R4,R5, LSL #+8
//  447     /* Reset the Output Compare and Output Compare N IDLE State */
//  448     tmpcr2 &= (uint16_t)(~((uint16_t)TIM_CR2_OIS3));
        MOVW     R5,#+61439
        ANDS     R2,R5,R2
//  449     tmpcr2 &= (uint16_t)(~((uint16_t)TIM_CR2_OIS3N));
        MOVW     R5,#+57343
        ANDS     R2,R5,R2
//  450     /* Set the Output Idle state */
//  451     tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 4);
        LDRH     R5,[R1, #+12]
        ORRS     R2,R2,R5, LSL #+4
//  452     /* Set the Output N Idle state */
//  453     tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCNIdleState << 4);
        LDRH     R5,[R1, #+14]
        ORRS     R2,R2,R5, LSL #+4
//  454   }
//  455   /* Write to TIMx CR2 */
//  456   TIMx->CR2 = tmpcr2;
??TIM_OC3Init_1:
        STRH     R2,[R0, #+4]
//  457   
//  458   /* Write to TIMx CCMR2 */
//  459   TIMx->CCMR2 = tmpccmrx;
        STRH     R3,[R0, #+28]
//  460 
//  461   /* Set the Capture Compare Register value */
//  462   TIMx->CCR3 = TIM_OCInitStruct->TIM_Pulse;
        LDRH     R5,[R1, #+6]
        STRH     R5,[R0, #+60]
//  463   
//  464   /* Write to TIMx CCER */
//  465   TIMx->CCER = tmpccer;
        STRH     R4,[R0, #+32]
//  466 }
        POP      {R4-R6}
        BX       LR               ;; return
//  467 
//  468 /**
//  469   * @brief  Initializes the TIMx Channel4 according to the specified
//  470   *         parameters in the TIM_OCInitStruct.
//  471   * @param  TIMx: where x can be  1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
//  472   * @param  TIM_OCInitStruct: pointer to a TIM_OCInitTypeDef structure
//  473   *         that contains the configuration information for the specified TIM peripheral.
//  474   * @retval None
//  475   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  476 void TIM_OC4Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
//  477 {
TIM_OC4Init:
        PUSH     {R4-R6}
//  478   uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R2,#+0
//  479    
//  480   /* Check the parameters */
//  481   assert_param(IS_TIM_LIST3_PERIPH(TIMx)); 
//  482   assert_param(IS_TIM_OC_MODE(TIM_OCInitStruct->TIM_OCMode));
//  483   assert_param(IS_TIM_OUTPUT_STATE(TIM_OCInitStruct->TIM_OutputState));
//  484   assert_param(IS_TIM_OC_POLARITY(TIM_OCInitStruct->TIM_OCPolarity));   
//  485   /* Disable the Channel 2: Reset the CC4E Bit */
//  486   TIMx->CCER &= (uint16_t)(~((uint16_t)TIM_CCER_CC4E));
        LDRH     R5,[R0, #+32]
        MOVW     R6,#+61439
        ANDS     R5,R6,R5
        STRH     R5,[R0, #+32]
//  487   
//  488   /* Get the TIMx CCER register value */
//  489   tmpccer = TIMx->CCER;
        LDRH     R5,[R0, #+32]
        MOVS     R4,R5
//  490   /* Get the TIMx CR2 register value */
//  491   tmpcr2 =  TIMx->CR2;
        LDRH     R5,[R0, #+4]
        MOVS     R2,R5
//  492   
//  493   /* Get the TIMx CCMR2 register value */
//  494   tmpccmrx = TIMx->CCMR2;
        LDRH     R5,[R0, #+28]
        MOVS     R3,R5
//  495     
//  496   /* Reset the Output Compare mode and Capture/Compare selection Bits */
//  497   tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CCMR2_OC4M));
        MOVW     R5,#+36863
        ANDS     R3,R5,R3
//  498   tmpccmrx &= (uint16_t)(~((uint16_t)TIM_CCMR2_CC4S));
        MOVW     R5,#+64767
        ANDS     R3,R5,R3
//  499   
//  500   /* Select the Output Compare Mode */
//  501   tmpccmrx |= (uint16_t)(TIM_OCInitStruct->TIM_OCMode << 8);
        LDRH     R5,[R1, #+0]
        ORRS     R3,R3,R5, LSL #+8
//  502   
//  503   /* Reset the Output Polarity level */
//  504   tmpccer &= (uint16_t)(~((uint16_t)TIM_CCER_CC4P));
        MOVW     R5,#+57343
        ANDS     R4,R5,R4
//  505   /* Set the Output Compare Polarity */
//  506   tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 12);
        LDRH     R5,[R1, #+8]
        ORRS     R4,R4,R5, LSL #+12
//  507   
//  508   /* Set the Output State */
//  509   tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 12);
        LDRH     R5,[R1, #+2]
        ORRS     R4,R4,R5, LSL #+12
//  510     
//  511   if((TIMx == TIM1) || (TIMx == TIM8))
        LDR.W    R5,??DataTable9  ;; 0x40012c00
        CMP      R0,R5
        BEQ.N    ??TIM_OC4Init_0
        LDR.W    R5,??DataTable10_3  ;; 0x40013400
        CMP      R0,R5
        BNE.N    ??TIM_OC4Init_1
//  512   {
//  513     assert_param(IS_TIM_OCIDLE_STATE(TIM_OCInitStruct->TIM_OCIdleState));
//  514     /* Reset the Output Compare IDLE State */
//  515     tmpcr2 &= (uint16_t)(~((uint16_t)TIM_CR2_OIS4));
??TIM_OC4Init_0:
        MOVW     R5,#+49151
        ANDS     R2,R5,R2
//  516     /* Set the Output Idle state */
//  517     tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 6);
        LDRH     R5,[R1, #+12]
        ORRS     R2,R2,R5, LSL #+6
//  518   }
//  519   /* Write to TIMx CR2 */
//  520   TIMx->CR2 = tmpcr2;
??TIM_OC4Init_1:
        STRH     R2,[R0, #+4]
//  521   
//  522   /* Write to TIMx CCMR2 */  
//  523   TIMx->CCMR2 = tmpccmrx;
        STRH     R3,[R0, #+28]
//  524 
//  525   /* Set the Capture Compare Register value */
//  526   TIMx->CCR4 = TIM_OCInitStruct->TIM_Pulse;
        LDRH     R5,[R1, #+6]
        STRH     R5,[R0, #+64]
//  527   
//  528   /* Write to TIMx CCER */
//  529   TIMx->CCER = tmpccer;
        STRH     R4,[R0, #+32]
//  530 }
        POP      {R4-R6}
        BX       LR               ;; return
//  531 
//  532 /**
//  533   * @brief  Initializes the TIM peripheral according to the specified
//  534   *         parameters in the TIM_ICInitStruct.
//  535   * @param  TIMx: where x can be  1 to 17 except 6 and 7 to select the TIM peripheral.
//  536   * @param  TIM_ICInitStruct: pointer to a TIM_ICInitTypeDef structure
//  537   *         that contains the configuration information for the specified TIM peripheral.
//  538   * @retval None
//  539   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  540 void TIM_ICInit(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct)
//  541 {
TIM_ICInit:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  542   /* Check the parameters */
//  543   assert_param(IS_TIM_CHANNEL(TIM_ICInitStruct->TIM_Channel));  
//  544   assert_param(IS_TIM_IC_SELECTION(TIM_ICInitStruct->TIM_ICSelection));
//  545   assert_param(IS_TIM_IC_PRESCALER(TIM_ICInitStruct->TIM_ICPrescaler));
//  546   assert_param(IS_TIM_IC_FILTER(TIM_ICInitStruct->TIM_ICFilter));
//  547   
//  548   if((TIMx == TIM1) || (TIMx == TIM8) || (TIMx == TIM2) || (TIMx == TIM3) ||
//  549      (TIMx == TIM4) ||(TIMx == TIM5))
        LDR.W    R0,??DataTable9  ;; 0x40012c00
        CMP      R4,R0
        BEQ.N    ??TIM_ICInit_0
        LDR.W    R0,??DataTable10_3  ;; 0x40013400
        CMP      R4,R0
        BEQ.N    ??TIM_ICInit_0
        CMP      R4,#+1073741824
        BEQ.N    ??TIM_ICInit_0
        LDR.W    R0,??DataTable9_1  ;; 0x40000400
        CMP      R4,R0
        BEQ.N    ??TIM_ICInit_0
        LDR.W    R0,??DataTable9_2  ;; 0x40000800
        CMP      R4,R0
        BEQ.N    ??TIM_ICInit_0
        LDR.W    R0,??DataTable10  ;; 0x40000c00
        CMP      R4,R0
        BNE.N    ??TIM_ICInit_1
//  550   {
//  551     assert_param(IS_TIM_IC_POLARITY(TIM_ICInitStruct->TIM_ICPolarity));
??TIM_ICInit_0:
        B.N      ??TIM_ICInit_2
//  552   }
//  553   else
//  554   {
//  555     assert_param(IS_TIM_IC_POLARITY_LITE(TIM_ICInitStruct->TIM_ICPolarity));
//  556   }
//  557   if (TIM_ICInitStruct->TIM_Channel == TIM_Channel_1)
??TIM_ICInit_1:
??TIM_ICInit_2:
        LDRH     R0,[R5, #+0]
        CMP      R0,#+0
        BNE.N    ??TIM_ICInit_3
//  558   {
//  559     assert_param(IS_TIM_LIST8_PERIPH(TIMx));
//  560     /* TI1 Configuration */
//  561     TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
//  562                TIM_ICInitStruct->TIM_ICSelection,
//  563                TIM_ICInitStruct->TIM_ICFilter);
        LDRH     R3,[R5, #+8]
        LDRH     R2,[R5, #+4]
        LDRH     R1,[R5, #+2]
        MOVS     R0,R4
        BL       TI1_Config
//  564     /* Set the Input Capture Prescaler value */
//  565     TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
        LDRH     R1,[R5, #+6]
        MOVS     R0,R4
        BL       TIM_SetIC1Prescaler
        B.N      ??TIM_ICInit_4
//  566   }
//  567   else if (TIM_ICInitStruct->TIM_Channel == TIM_Channel_2)
??TIM_ICInit_3:
        LDRH     R0,[R5, #+0]
        CMP      R0,#+4
        BNE.N    ??TIM_ICInit_5
//  568   {
//  569     assert_param(IS_TIM_LIST6_PERIPH(TIMx));
//  570     /* TI2 Configuration */
//  571     TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
//  572                TIM_ICInitStruct->TIM_ICSelection,
//  573                TIM_ICInitStruct->TIM_ICFilter);
        LDRH     R3,[R5, #+8]
        LDRH     R2,[R5, #+4]
        LDRH     R1,[R5, #+2]
        MOVS     R0,R4
        BL       TI2_Config
//  574     /* Set the Input Capture Prescaler value */
//  575     TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
        LDRH     R1,[R5, #+6]
        MOVS     R0,R4
        BL       TIM_SetIC2Prescaler
        B.N      ??TIM_ICInit_4
//  576   }
//  577   else if (TIM_ICInitStruct->TIM_Channel == TIM_Channel_3)
??TIM_ICInit_5:
        LDRH     R0,[R5, #+0]
        CMP      R0,#+8
        BNE.N    ??TIM_ICInit_6
//  578   {
//  579     assert_param(IS_TIM_LIST3_PERIPH(TIMx));
//  580     /* TI3 Configuration */
//  581     TI3_Config(TIMx,  TIM_ICInitStruct->TIM_ICPolarity,
//  582                TIM_ICInitStruct->TIM_ICSelection,
//  583                TIM_ICInitStruct->TIM_ICFilter);
        LDRH     R3,[R5, #+8]
        LDRH     R2,[R5, #+4]
        LDRH     R1,[R5, #+2]
        MOVS     R0,R4
        BL       TI3_Config
//  584     /* Set the Input Capture Prescaler value */
//  585     TIM_SetIC3Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
        LDRH     R1,[R5, #+6]
        MOVS     R0,R4
        BL       TIM_SetIC3Prescaler
        B.N      ??TIM_ICInit_4
//  586   }
//  587   else
//  588   {
//  589     assert_param(IS_TIM_LIST3_PERIPH(TIMx));
//  590     /* TI4 Configuration */
//  591     TI4_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
//  592                TIM_ICInitStruct->TIM_ICSelection,
//  593                TIM_ICInitStruct->TIM_ICFilter);
??TIM_ICInit_6:
        LDRH     R3,[R5, #+8]
        LDRH     R2,[R5, #+4]
        LDRH     R1,[R5, #+2]
        MOVS     R0,R4
        BL       TI4_Config
//  594     /* Set the Input Capture Prescaler value */
//  595     TIM_SetIC4Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
        LDRH     R1,[R5, #+6]
        MOVS     R0,R4
        BL       TIM_SetIC4Prescaler
//  596   }
//  597 }
??TIM_ICInit_4:
        POP      {R0,R4,R5,PC}    ;; return
//  598 
//  599 /**
//  600   * @brief  Configures the TIM peripheral according to the specified
//  601   *         parameters in the TIM_ICInitStruct to measure an external PWM signal.
//  602   * @param  TIMx: where x can be  1, 2, 3, 4, 5, 8, 9, 12 or 15 to select the TIM peripheral.
//  603   * @param  TIM_ICInitStruct: pointer to a TIM_ICInitTypeDef structure
//  604   *         that contains the configuration information for the specified TIM peripheral.
//  605   * @retval None
//  606   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  607 void TIM_PWMIConfig(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct)
//  608 {
TIM_PWMIConfig:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  609   uint16_t icoppositepolarity = TIM_ICPolarity_Rising;
        MOVS     R6,#+0
//  610   uint16_t icoppositeselection = TIM_ICSelection_DirectTI;
        MOVS     R7,#+1
//  611   /* Check the parameters */
//  612   assert_param(IS_TIM_LIST6_PERIPH(TIMx));
//  613   /* Select the Opposite Input Polarity */
//  614   if (TIM_ICInitStruct->TIM_ICPolarity == TIM_ICPolarity_Rising)
        LDRH     R0,[R5, #+2]
        CMP      R0,#+0
        BNE.N    ??TIM_PWMIConfig_0
//  615   {
//  616     icoppositepolarity = TIM_ICPolarity_Falling;
        MOVS     R0,#+2
        MOVS     R6,R0
        B.N      ??TIM_PWMIConfig_1
//  617   }
//  618   else
//  619   {
//  620     icoppositepolarity = TIM_ICPolarity_Rising;
??TIM_PWMIConfig_0:
        MOVS     R0,#+0
        MOVS     R6,R0
//  621   }
//  622   /* Select the Opposite Input */
//  623   if (TIM_ICInitStruct->TIM_ICSelection == TIM_ICSelection_DirectTI)
??TIM_PWMIConfig_1:
        LDRH     R0,[R5, #+4]
        CMP      R0,#+1
        BNE.N    ??TIM_PWMIConfig_2
//  624   {
//  625     icoppositeselection = TIM_ICSelection_IndirectTI;
        MOVS     R0,#+2
        MOVS     R7,R0
        B.N      ??TIM_PWMIConfig_3
//  626   }
//  627   else
//  628   {
//  629     icoppositeselection = TIM_ICSelection_DirectTI;
??TIM_PWMIConfig_2:
        MOVS     R0,#+1
        MOVS     R7,R0
//  630   }
//  631   if (TIM_ICInitStruct->TIM_Channel == TIM_Channel_1)
??TIM_PWMIConfig_3:
        LDRH     R0,[R5, #+0]
        CMP      R0,#+0
        BNE.N    ??TIM_PWMIConfig_4
//  632   {
//  633     /* TI1 Configuration */
//  634     TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
//  635                TIM_ICInitStruct->TIM_ICFilter);
        LDRH     R3,[R5, #+8]
        LDRH     R2,[R5, #+4]
        LDRH     R1,[R5, #+2]
        MOVS     R0,R4
        BL       TI1_Config
//  636     /* Set the Input Capture Prescaler value */
//  637     TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
        LDRH     R1,[R5, #+6]
        MOVS     R0,R4
        BL       TIM_SetIC1Prescaler
//  638     /* TI2 Configuration */
//  639     TI2_Config(TIMx, icoppositepolarity, icoppositeselection, TIM_ICInitStruct->TIM_ICFilter);
        LDRH     R3,[R5, #+8]
        MOVS     R2,R7
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       TI2_Config
//  640     /* Set the Input Capture Prescaler value */
//  641     TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
        LDRH     R1,[R5, #+6]
        MOVS     R0,R4
        BL       TIM_SetIC2Prescaler
        B.N      ??TIM_PWMIConfig_5
//  642   }
//  643   else
//  644   { 
//  645     /* TI2 Configuration */
//  646     TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
//  647                TIM_ICInitStruct->TIM_ICFilter);
??TIM_PWMIConfig_4:
        LDRH     R3,[R5, #+8]
        LDRH     R2,[R5, #+4]
        LDRH     R1,[R5, #+2]
        MOVS     R0,R4
        BL       TI2_Config
//  648     /* Set the Input Capture Prescaler value */
//  649     TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
        LDRH     R1,[R5, #+6]
        MOVS     R0,R4
        BL       TIM_SetIC2Prescaler
//  650     /* TI1 Configuration */
//  651     TI1_Config(TIMx, icoppositepolarity, icoppositeselection, TIM_ICInitStruct->TIM_ICFilter);
        LDRH     R3,[R5, #+8]
        MOVS     R2,R7
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       TI1_Config
//  652     /* Set the Input Capture Prescaler value */
//  653     TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
        LDRH     R1,[R5, #+6]
        MOVS     R0,R4
        BL       TIM_SetIC1Prescaler
//  654   }
//  655 }
??TIM_PWMIConfig_5:
        POP      {R0,R4-R7,PC}    ;; return
//  656 
//  657 /**
//  658   * @brief  Configures the: Break feature, dead time, Lock level, the OSSI,
//  659   *         the OSSR State and the AOE(automatic output enable).
//  660   * @param  TIMx: where x can be  1 or 8 to select the TIM 
//  661   * @param  TIM_BDTRInitStruct: pointer to a TIM_BDTRInitTypeDef structure that
//  662   *         contains the BDTR Register configuration  information for the TIM peripheral.
//  663   * @retval None
//  664   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  665 void TIM_BDTRConfig(TIM_TypeDef* TIMx, TIM_BDTRInitTypeDef *TIM_BDTRInitStruct)
//  666 {
//  667   /* Check the parameters */
//  668   assert_param(IS_TIM_LIST2_PERIPH(TIMx));
//  669   assert_param(IS_TIM_OSSR_STATE(TIM_BDTRInitStruct->TIM_OSSRState));
//  670   assert_param(IS_TIM_OSSI_STATE(TIM_BDTRInitStruct->TIM_OSSIState));
//  671   assert_param(IS_TIM_LOCK_LEVEL(TIM_BDTRInitStruct->TIM_LOCKLevel));
//  672   assert_param(IS_TIM_BREAK_STATE(TIM_BDTRInitStruct->TIM_Break));
//  673   assert_param(IS_TIM_BREAK_POLARITY(TIM_BDTRInitStruct->TIM_BreakPolarity));
//  674   assert_param(IS_TIM_AUTOMATIC_OUTPUT_STATE(TIM_BDTRInitStruct->TIM_AutomaticOutput));
//  675   /* Set the Lock level, the Break enable Bit and the Ploarity, the OSSR State,
//  676      the OSSI State, the dead time value and the Automatic Output Enable Bit */
//  677   TIMx->BDTR = (uint32_t)TIM_BDTRInitStruct->TIM_OSSRState | TIM_BDTRInitStruct->TIM_OSSIState |
//  678              TIM_BDTRInitStruct->TIM_LOCKLevel | TIM_BDTRInitStruct->TIM_DeadTime |
//  679              TIM_BDTRInitStruct->TIM_Break | TIM_BDTRInitStruct->TIM_BreakPolarity |
//  680              TIM_BDTRInitStruct->TIM_AutomaticOutput;
TIM_BDTRConfig:
        LDRH     R2,[R1, #+0]
        LDRH     R3,[R1, #+2]
        ORRS     R2,R3,R2
        LDRH     R3,[R1, #+4]
        ORRS     R2,R3,R2
        LDRH     R3,[R1, #+6]
        ORRS     R2,R3,R2
        LDRH     R3,[R1, #+8]
        ORRS     R2,R3,R2
        LDRH     R3,[R1, #+10]
        ORRS     R2,R3,R2
        LDRH     R3,[R1, #+12]
        ORRS     R2,R3,R2
        STRH     R2,[R0, #+68]
//  681 }
        BX       LR               ;; return
//  682 
//  683 /**
//  684   * @brief  Fills each TIM_TimeBaseInitStruct member with its default value.
//  685   * @param  TIM_TimeBaseInitStruct : pointer to a TIM_TimeBaseInitTypeDef
//  686   *         structure which will be initialized.
//  687   * @retval None
//  688   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  689 void TIM_TimeBaseStructInit(TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct)
//  690 {
//  691   /* Set the default configuration */
//  692   TIM_TimeBaseInitStruct->TIM_Period = 0xFFFF;
TIM_TimeBaseStructInit:
        MOVW     R1,#+65535
        STRH     R1,[R0, #+4]
//  693   TIM_TimeBaseInitStruct->TIM_Prescaler = 0x0000;
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  694   TIM_TimeBaseInitStruct->TIM_ClockDivision = TIM_CKD_DIV1;
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
//  695   TIM_TimeBaseInitStruct->TIM_CounterMode = TIM_CounterMode_Up;
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
//  696   TIM_TimeBaseInitStruct->TIM_RepetitionCounter = 0x0000;
        MOVS     R1,#+0
        STRB     R1,[R0, #+8]
//  697 }
        BX       LR               ;; return
//  698 
//  699 /**
//  700   * @brief  Fills each TIM_OCInitStruct member with its default value.
//  701   * @param  TIM_OCInitStruct : pointer to a TIM_OCInitTypeDef structure which will
//  702   *         be initialized.
//  703   * @retval None
//  704   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  705 void TIM_OCStructInit(TIM_OCInitTypeDef* TIM_OCInitStruct)
//  706 {
//  707   /* Set the default configuration */
//  708   TIM_OCInitStruct->TIM_OCMode = TIM_OCMode_Timing;
TIM_OCStructInit:
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  709   TIM_OCInitStruct->TIM_OutputState = TIM_OutputState_Disable;
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
//  710   TIM_OCInitStruct->TIM_OutputNState = TIM_OutputNState_Disable;
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
//  711   TIM_OCInitStruct->TIM_Pulse = 0x0000;
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
//  712   TIM_OCInitStruct->TIM_OCPolarity = TIM_OCPolarity_High;
        MOVS     R1,#+0
        STRH     R1,[R0, #+8]
//  713   TIM_OCInitStruct->TIM_OCNPolarity = TIM_OCPolarity_High;
        MOVS     R1,#+0
        STRH     R1,[R0, #+10]
//  714   TIM_OCInitStruct->TIM_OCIdleState = TIM_OCIdleState_Reset;
        MOVS     R1,#+0
        STRH     R1,[R0, #+12]
//  715   TIM_OCInitStruct->TIM_OCNIdleState = TIM_OCNIdleState_Reset;
        MOVS     R1,#+0
        STRH     R1,[R0, #+14]
//  716 }
        BX       LR               ;; return
//  717 
//  718 /**
//  719   * @brief  Fills each TIM_ICInitStruct member with its default value.
//  720   * @param  TIM_ICInitStruct: pointer to a TIM_ICInitTypeDef structure which will
//  721   *         be initialized.
//  722   * @retval None
//  723   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  724 void TIM_ICStructInit(TIM_ICInitTypeDef* TIM_ICInitStruct)
//  725 {
//  726   /* Set the default configuration */
//  727   TIM_ICInitStruct->TIM_Channel = TIM_Channel_1;
TIM_ICStructInit:
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  728   TIM_ICInitStruct->TIM_ICPolarity = TIM_ICPolarity_Rising;
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
//  729   TIM_ICInitStruct->TIM_ICSelection = TIM_ICSelection_DirectTI;
        MOVS     R1,#+1
        STRH     R1,[R0, #+4]
//  730   TIM_ICInitStruct->TIM_ICPrescaler = TIM_ICPSC_DIV1;
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
//  731   TIM_ICInitStruct->TIM_ICFilter = 0x00;
        MOVS     R1,#+0
        STRH     R1,[R0, #+8]
//  732 }
        BX       LR               ;; return
//  733 
//  734 /**
//  735   * @brief  Fills each TIM_BDTRInitStruct member with its default value.
//  736   * @param  TIM_BDTRInitStruct: pointer to a TIM_BDTRInitTypeDef structure which
//  737   *         will be initialized.
//  738   * @retval None
//  739   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  740 void TIM_BDTRStructInit(TIM_BDTRInitTypeDef* TIM_BDTRInitStruct)
//  741 {
//  742   /* Set the default configuration */
//  743   TIM_BDTRInitStruct->TIM_OSSRState = TIM_OSSRState_Disable;
TIM_BDTRStructInit:
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  744   TIM_BDTRInitStruct->TIM_OSSIState = TIM_OSSIState_Disable;
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
//  745   TIM_BDTRInitStruct->TIM_LOCKLevel = TIM_LOCKLevel_OFF;
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
//  746   TIM_BDTRInitStruct->TIM_DeadTime = 0x00;
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
//  747   TIM_BDTRInitStruct->TIM_Break = TIM_Break_Disable;
        MOVS     R1,#+0
        STRH     R1,[R0, #+8]
//  748   TIM_BDTRInitStruct->TIM_BreakPolarity = TIM_BreakPolarity_Low;
        MOVS     R1,#+0
        STRH     R1,[R0, #+10]
//  749   TIM_BDTRInitStruct->TIM_AutomaticOutput = TIM_AutomaticOutput_Disable;
        MOVS     R1,#+0
        STRH     R1,[R0, #+12]
//  750 }
        BX       LR               ;; return
//  751 
//  752 /**
//  753   * @brief  Enables or disables the specified TIM peripheral.
//  754   * @param  TIMx: where x can be 1 to 17 to select the TIMx peripheral.
//  755   * @param  NewState: new state of the TIMx peripheral.
//  756   *   This parameter can be: ENABLE or DISABLE.
//  757   * @retval None
//  758   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  759 void TIM_Cmd(TIM_TypeDef* TIMx, FunctionalState NewState)
//  760 {
//  761   /* Check the parameters */
//  762   assert_param(IS_TIM_ALL_PERIPH(TIMx));
//  763   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  764   
//  765   if (NewState != DISABLE)
TIM_Cmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??TIM_Cmd_0
//  766   {
//  767     /* Enable the TIM Counter */
//  768     TIMx->CR1 |= TIM_CR1_CEN;
        LDRH     R2,[R0, #+0]
        ORRS     R2,R2,#0x1
        STRH     R2,[R0, #+0]
        B.N      ??TIM_Cmd_1
//  769   }
//  770   else
//  771   {
//  772     /* Disable the TIM Counter */
//  773     TIMx->CR1 &= (uint16_t)(~((uint16_t)TIM_CR1_CEN));
??TIM_Cmd_0:
        LDRH     R2,[R0, #+0]
        MOVW     R3,#+65534
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+0]
//  774   }
//  775 }
??TIM_Cmd_1:
        BX       LR               ;; return
//  776 
//  777 /**
//  778   * @brief  Enables or disables the TIM peripheral Main Outputs.
//  779   * @param  TIMx: where x can be 1, 8, 15, 16 or 17 to select the TIMx peripheral.
//  780   * @param  NewState: new state of the TIM peripheral Main Outputs.
//  781   *   This parameter can be: ENABLE or DISABLE.
//  782   * @retval None
//  783   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  784 void TIM_CtrlPWMOutputs(TIM_TypeDef* TIMx, FunctionalState NewState)
//  785 {
//  786   /* Check the parameters */
//  787   assert_param(IS_TIM_LIST2_PERIPH(TIMx));
//  788   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  789   if (NewState != DISABLE)
TIM_CtrlPWMOutputs:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??TIM_CtrlPWMOutputs_0
//  790   {
//  791     /* Enable the TIM Main Output */
//  792     TIMx->BDTR |= TIM_BDTR_MOE;
        LDRH     R2,[R0, #+68]
        ORRS     R2,R2,#0x8000
        STRH     R2,[R0, #+68]
        B.N      ??TIM_CtrlPWMOutputs_1
//  793   }
//  794   else
//  795   {
//  796     /* Disable the TIM Main Output */
//  797     TIMx->BDTR &= (uint16_t)(~((uint16_t)TIM_BDTR_MOE));
??TIM_CtrlPWMOutputs_0:
        LDRH     R2,[R0, #+68]
        LSLS     R2,R2,#+17       ;; ZeroExtS R2,R2,#+17,#+17
        LSRS     R2,R2,#+17
        STRH     R2,[R0, #+68]
//  798   }  
//  799 }
??TIM_CtrlPWMOutputs_1:
        BX       LR               ;; return
//  800 
//  801 /**
//  802   * @brief  Enables or disables the specified TIM interrupts.
//  803   * @param  TIMx: where x can be 1 to 17 to select the TIMx peripheral.
//  804   * @param  TIM_IT: specifies the TIM interrupts sources to be enabled or disabled.
//  805   *   This parameter can be any combination of the following values:
//  806   *     @arg TIM_IT_Update: TIM update Interrupt source
//  807   *     @arg TIM_IT_CC1: TIM Capture Compare 1 Interrupt source
//  808   *     @arg TIM_IT_CC2: TIM Capture Compare 2 Interrupt source
//  809   *     @arg TIM_IT_CC3: TIM Capture Compare 3 Interrupt source
//  810   *     @arg TIM_IT_CC4: TIM Capture Compare 4 Interrupt source
//  811   *     @arg TIM_IT_COM: TIM Commutation Interrupt source
//  812   *     @arg TIM_IT_Trigger: TIM Trigger Interrupt source
//  813   *     @arg TIM_IT_Break: TIM Break Interrupt source
//  814   * @note 
//  815   *   - TIM6 and TIM7 can only generate an update interrupt.
//  816   *   - TIM9, TIM12 and TIM15 can have only TIM_IT_Update, TIM_IT_CC1,
//  817   *      TIM_IT_CC2 or TIM_IT_Trigger. 
//  818   *   - TIM10, TIM11, TIM13, TIM14, TIM16 and TIM17 can have TIM_IT_Update or TIM_IT_CC1.   
//  819   *   - TIM_IT_Break is used only with TIM1, TIM8 and TIM15. 
//  820   *   - TIM_IT_COM is used only with TIM1, TIM8, TIM15, TIM16 and TIM17.    
//  821   * @param  NewState: new state of the TIM interrupts.
//  822   *   This parameter can be: ENABLE or DISABLE.
//  823   * @retval None
//  824   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  825 void TIM_ITConfig(TIM_TypeDef* TIMx, uint16_t TIM_IT, FunctionalState NewState)
//  826 {  
//  827   /* Check the parameters */
//  828   assert_param(IS_TIM_ALL_PERIPH(TIMx));
//  829   assert_param(IS_TIM_IT(TIM_IT));
//  830   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  831   
//  832   if (NewState != DISABLE)
TIM_ITConfig:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??TIM_ITConfig_0
//  833   {
//  834     /* Enable the Interrupt sources */
//  835     TIMx->DIER |= TIM_IT;
        LDRH     R3,[R0, #+12]
        ORRS     R3,R1,R3
        STRH     R3,[R0, #+12]
        B.N      ??TIM_ITConfig_1
//  836   }
//  837   else
//  838   {
//  839     /* Disable the Interrupt sources */
//  840     TIMx->DIER &= (uint16_t)~TIM_IT;
??TIM_ITConfig_0:
        LDRH     R3,[R0, #+12]
        BICS     R3,R3,R1
        STRH     R3,[R0, #+12]
//  841   }
//  842 }
??TIM_ITConfig_1:
        BX       LR               ;; return
//  843 
//  844 /**
//  845   * @brief  Configures the TIMx event to be generate by software.
//  846   * @param  TIMx: where x can be 1 to 17 to select the TIM peripheral.
//  847   * @param  TIM_EventSource: specifies the event source.
//  848   *   This parameter can be one or more of the following values:	   
//  849   *     @arg TIM_EventSource_Update: Timer update Event source
//  850   *     @arg TIM_EventSource_CC1: Timer Capture Compare 1 Event source
//  851   *     @arg TIM_EventSource_CC2: Timer Capture Compare 2 Event source
//  852   *     @arg TIM_EventSource_CC3: Timer Capture Compare 3 Event source
//  853   *     @arg TIM_EventSource_CC4: Timer Capture Compare 4 Event source
//  854   *     @arg TIM_EventSource_COM: Timer COM event source  
//  855   *     @arg TIM_EventSource_Trigger: Timer Trigger Event source
//  856   *     @arg TIM_EventSource_Break: Timer Break event source
//  857   * @note 
//  858   *   - TIM6 and TIM7 can only generate an update event. 
//  859   *   - TIM_EventSource_COM and TIM_EventSource_Break are used only with TIM1 and TIM8.      
//  860   * @retval None
//  861   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  862 void TIM_GenerateEvent(TIM_TypeDef* TIMx, uint16_t TIM_EventSource)
//  863 { 
//  864   /* Check the parameters */
//  865   assert_param(IS_TIM_ALL_PERIPH(TIMx));
//  866   assert_param(IS_TIM_EVENT_SOURCE(TIM_EventSource));
//  867   
//  868   /* Set the event sources */
//  869   TIMx->EGR = TIM_EventSource;
TIM_GenerateEvent:
        STRH     R1,[R0, #+20]
//  870 }
        BX       LR               ;; return
//  871 
//  872 /**
//  873   * @brief  Configures the TIMx's DMA interface.
//  874   * @param  TIMx: where x can be  1, 2, 3, 4, 5, 8, 15, 16 or 17 to select 
//  875   *   the TIM peripheral.
//  876   * @param  TIM_DMABase: DMA Base address.
//  877   *   This parameter can be one of the following values:
//  878   *     @arg TIM_DMABase_CR, TIM_DMABase_CR2, TIM_DMABase_SMCR,
//  879   *          TIM_DMABase_DIER, TIM1_DMABase_SR, TIM_DMABase_EGR,
//  880   *          TIM_DMABase_CCMR1, TIM_DMABase_CCMR2, TIM_DMABase_CCER,
//  881   *          TIM_DMABase_CNT, TIM_DMABase_PSC, TIM_DMABase_ARR,
//  882   *          TIM_DMABase_RCR, TIM_DMABase_CCR1, TIM_DMABase_CCR2,
//  883   *          TIM_DMABase_CCR3, TIM_DMABase_CCR4, TIM_DMABase_BDTR,
//  884   *          TIM_DMABase_DCR.
//  885   * @param  TIM_DMABurstLength: DMA Burst length.
//  886   *   This parameter can be one value between:
//  887   *   TIM_DMABurstLength_1Transfer and TIM_DMABurstLength_18Transfers.
//  888   * @retval None
//  889   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  890 void TIM_DMAConfig(TIM_TypeDef* TIMx, uint16_t TIM_DMABase, uint16_t TIM_DMABurstLength)
//  891 {
//  892   /* Check the parameters */
//  893   assert_param(IS_TIM_LIST4_PERIPH(TIMx));
//  894   assert_param(IS_TIM_DMA_BASE(TIM_DMABase));
//  895   assert_param(IS_TIM_DMA_LENGTH(TIM_DMABurstLength));
//  896   /* Set the DMA Base and the DMA Burst Length */
//  897   TIMx->DCR = TIM_DMABase | TIM_DMABurstLength;
TIM_DMAConfig:
        ORRS     R3,R2,R1
        STRH     R3,[R0, #+72]
//  898 }
        BX       LR               ;; return
//  899 
//  900 /**
//  901   * @brief  Enables or disables the TIMx's DMA Requests.
//  902   * @param  TIMx: where x can be  1, 2, 3, 4, 5, 6, 7, 8, 15, 16 or 17 
//  903   *   to select the TIM peripheral. 
//  904   * @param  TIM_DMASource: specifies the DMA Request sources.
//  905   *   This parameter can be any combination of the following values:
//  906   *     @arg TIM_DMA_Update: TIM update Interrupt source
//  907   *     @arg TIM_DMA_CC1: TIM Capture Compare 1 DMA source
//  908   *     @arg TIM_DMA_CC2: TIM Capture Compare 2 DMA source
//  909   *     @arg TIM_DMA_CC3: TIM Capture Compare 3 DMA source
//  910   *     @arg TIM_DMA_CC4: TIM Capture Compare 4 DMA source
//  911   *     @arg TIM_DMA_COM: TIM Commutation DMA source
//  912   *     @arg TIM_DMA_Trigger: TIM Trigger DMA source
//  913   * @param  NewState: new state of the DMA Request sources.
//  914   *   This parameter can be: ENABLE or DISABLE.
//  915   * @retval None
//  916   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  917 void TIM_DMACmd(TIM_TypeDef* TIMx, uint16_t TIM_DMASource, FunctionalState NewState)
//  918 { 
//  919   /* Check the parameters */
//  920   assert_param(IS_TIM_LIST9_PERIPH(TIMx));
//  921   assert_param(IS_TIM_DMA_SOURCE(TIM_DMASource));
//  922   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  923   
//  924   if (NewState != DISABLE)
TIM_DMACmd:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??TIM_DMACmd_0
//  925   {
//  926     /* Enable the DMA sources */
//  927     TIMx->DIER |= TIM_DMASource; 
        LDRH     R3,[R0, #+12]
        ORRS     R3,R1,R3
        STRH     R3,[R0, #+12]
        B.N      ??TIM_DMACmd_1
//  928   }
//  929   else
//  930   {
//  931     /* Disable the DMA sources */
//  932     TIMx->DIER &= (uint16_t)~TIM_DMASource;
??TIM_DMACmd_0:
        LDRH     R3,[R0, #+12]
        BICS     R3,R3,R1
        STRH     R3,[R0, #+12]
//  933   }
//  934 }
??TIM_DMACmd_1:
        BX       LR               ;; return
//  935 
//  936 /**
//  937   * @brief  Configures the TIMx internal Clock
//  938   * @param  TIMx: where x can be  1, 2, 3, 4, 5, 8, 9, 12 or 15
//  939   *         to select the TIM peripheral.
//  940   * @retval None
//  941   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  942 void TIM_InternalClockConfig(TIM_TypeDef* TIMx)
//  943 {
//  944   /* Check the parameters */
//  945   assert_param(IS_TIM_LIST6_PERIPH(TIMx));
//  946   /* Disable slave mode to clock the prescaler directly with the internal clock */
//  947   TIMx->SMCR &=  (uint16_t)(~((uint16_t)TIM_SMCR_SMS));
TIM_InternalClockConfig:
        LDRH     R1,[R0, #+8]
        MOVW     R2,#+65528
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+8]
//  948 }
        BX       LR               ;; return
//  949 
//  950 /**
//  951   * @brief  Configures the TIMx Internal Trigger as External Clock
//  952   * @param  TIMx: where x can be  1, 2, 3, 4, 5, 9, 12 or 15 to select the TIM peripheral.
//  953   * @param  TIM_ITRSource: Trigger source.
//  954   *   This parameter can be one of the following values:
//  955   * @param  TIM_TS_ITR0: Internal Trigger 0
//  956   * @param  TIM_TS_ITR1: Internal Trigger 1
//  957   * @param  TIM_TS_ITR2: Internal Trigger 2
//  958   * @param  TIM_TS_ITR3: Internal Trigger 3
//  959   * @retval None
//  960   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  961 void TIM_ITRxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource)
//  962 {
TIM_ITRxExternalClockConfig:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  963   /* Check the parameters */
//  964   assert_param(IS_TIM_LIST6_PERIPH(TIMx));
//  965   assert_param(IS_TIM_INTERNAL_TRIGGER_SELECTION(TIM_InputTriggerSource));
//  966   /* Select the Internal Trigger */
//  967   TIM_SelectInputTrigger(TIMx, TIM_InputTriggerSource);
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       TIM_SelectInputTrigger
//  968   /* Select the External clock mode1 */
//  969   TIMx->SMCR |= TIM_SlaveMode_External1;
        LDRH     R0,[R4, #+8]
        ORRS     R0,R0,#0x7
        STRH     R0,[R4, #+8]
//  970 }
        POP      {R0,R4,R5,PC}    ;; return
//  971 
//  972 /**
//  973   * @brief  Configures the TIMx Trigger as External Clock
//  974   * @param  TIMx: where x can be  1, 2, 3, 4, 5, 9, 12 or 15 to select the TIM peripheral.
//  975   * @param  TIM_TIxExternalCLKSource: Trigger source.
//  976   *   This parameter can be one of the following values:
//  977   *     @arg TIM_TIxExternalCLK1Source_TI1ED: TI1 Edge Detector
//  978   *     @arg TIM_TIxExternalCLK1Source_TI1: Filtered Timer Input 1
//  979   *     @arg TIM_TIxExternalCLK1Source_TI2: Filtered Timer Input 2
//  980   * @param  TIM_ICPolarity: specifies the TIx Polarity.
//  981   *   This parameter can be one of the following values:
//  982   *     @arg TIM_ICPolarity_Rising
//  983   *     @arg TIM_ICPolarity_Falling
//  984   * @param  ICFilter : specifies the filter value.
//  985   *   This parameter must be a value between 0x0 and 0xF.
//  986   * @retval None
//  987   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  988 void TIM_TIxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_TIxExternalCLKSource,
//  989                                 uint16_t TIM_ICPolarity, uint16_t ICFilter)
//  990 {
TIM_TIxExternalClockConfig:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//  991   /* Check the parameters */
//  992   assert_param(IS_TIM_LIST6_PERIPH(TIMx));
//  993   assert_param(IS_TIM_TIXCLK_SOURCE(TIM_TIxExternalCLKSource));
//  994   assert_param(IS_TIM_IC_POLARITY(TIM_ICPolarity));
//  995   assert_param(IS_TIM_IC_FILTER(ICFilter));
//  996   /* Configure the Timer Input Clock Source */
//  997   if (TIM_TIxExternalCLKSource == TIM_TIxExternalCLK1Source_TI2)
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+96
        BNE.N    ??TIM_TIxExternalClockConfig_0
//  998   {
//  999     TI2_Config(TIMx, TIM_ICPolarity, TIM_ICSelection_DirectTI, ICFilter);
        MOVS     R3,R7
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,#+1
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       TI2_Config
        B.N      ??TIM_TIxExternalClockConfig_1
// 1000   }
// 1001   else
// 1002   {
// 1003     TI1_Config(TIMx, TIM_ICPolarity, TIM_ICSelection_DirectTI, ICFilter);
??TIM_TIxExternalClockConfig_0:
        MOVS     R3,R7
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,#+1
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       TI1_Config
// 1004   }
// 1005   /* Select the Trigger source */
// 1006   TIM_SelectInputTrigger(TIMx, TIM_TIxExternalCLKSource);
??TIM_TIxExternalClockConfig_1:
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       TIM_SelectInputTrigger
// 1007   /* Select the External clock mode1 */
// 1008   TIMx->SMCR |= TIM_SlaveMode_External1;
        LDRH     R0,[R4, #+8]
        ORRS     R0,R0,#0x7
        STRH     R0,[R4, #+8]
// 1009 }
        POP      {R0,R4-R7,PC}    ;; return
// 1010 
// 1011 /**
// 1012   * @brief  Configures the External clock Mode1
// 1013   * @param  TIMx: where x can be  1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 1014   * @param  TIM_ExtTRGPrescaler: The external Trigger Prescaler.
// 1015   *   This parameter can be one of the following values:
// 1016   *     @arg TIM_ExtTRGPSC_OFF: ETRP Prescaler OFF.
// 1017   *     @arg TIM_ExtTRGPSC_DIV2: ETRP frequency divided by 2.
// 1018   *     @arg TIM_ExtTRGPSC_DIV4: ETRP frequency divided by 4.
// 1019   *     @arg TIM_ExtTRGPSC_DIV8: ETRP frequency divided by 8.
// 1020   * @param  TIM_ExtTRGPolarity: The external Trigger Polarity.
// 1021   *   This parameter can be one of the following values:
// 1022   *     @arg TIM_ExtTRGPolarity_Inverted: active low or falling edge active.
// 1023   *     @arg TIM_ExtTRGPolarity_NonInverted: active high or rising edge active.
// 1024   * @param  ExtTRGFilter: External Trigger Filter.
// 1025   *   This parameter must be a value between 0x00 and 0x0F
// 1026   * @retval None
// 1027   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1028 void TIM_ETRClockMode1Config(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, uint16_t TIM_ExtTRGPolarity,
// 1029                              uint16_t ExtTRGFilter)
// 1030 {
TIM_ETRClockMode1Config:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
// 1031   uint16_t tmpsmcr = 0;
        MOVS     R8,#+0
// 1032   /* Check the parameters */
// 1033   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 1034   assert_param(IS_TIM_EXT_PRESCALER(TIM_ExtTRGPrescaler));
// 1035   assert_param(IS_TIM_EXT_POLARITY(TIM_ExtTRGPolarity));
// 1036   assert_param(IS_TIM_EXT_FILTER(ExtTRGFilter));
// 1037   /* Configure the ETR Clock source */
// 1038   TIM_ETRConfig(TIMx, TIM_ExtTRGPrescaler, TIM_ExtTRGPolarity, ExtTRGFilter);
        MOVS     R3,R7
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R6
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       TIM_ETRConfig
// 1039   
// 1040   /* Get the TIMx SMCR register value */
// 1041   tmpsmcr = TIMx->SMCR;
        LDRH     R0,[R4, #+8]
        MOV      R8,R0
// 1042   /* Reset the SMS Bits */
// 1043   tmpsmcr &= (uint16_t)(~((uint16_t)TIM_SMCR_SMS));
        MOVW     R0,#+65528
        ANDS     R8,R0,R8
// 1044   /* Select the External clock mode1 */
// 1045   tmpsmcr |= TIM_SlaveMode_External1;
        ORRS     R8,R8,#0x7
// 1046   /* Select the Trigger selection : ETRF */
// 1047   tmpsmcr &= (uint16_t)(~((uint16_t)TIM_SMCR_TS));
        MOVW     R0,#+65423
        ANDS     R8,R0,R8
// 1048   tmpsmcr |= TIM_TS_ETRF;
        ORRS     R8,R8,#0x70
// 1049   /* Write to TIMx SMCR */
// 1050   TIMx->SMCR = tmpsmcr;
        STRH     R8,[R4, #+8]
// 1051 }
        POP      {R4-R8,PC}       ;; return
// 1052 
// 1053 /**
// 1054   * @brief  Configures the External clock Mode2
// 1055   * @param  TIMx: where x can be  1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 1056   * @param  TIM_ExtTRGPrescaler: The external Trigger Prescaler.
// 1057   *   This parameter can be one of the following values:
// 1058   *     @arg TIM_ExtTRGPSC_OFF: ETRP Prescaler OFF.
// 1059   *     @arg TIM_ExtTRGPSC_DIV2: ETRP frequency divided by 2.
// 1060   *     @arg TIM_ExtTRGPSC_DIV4: ETRP frequency divided by 4.
// 1061   *     @arg TIM_ExtTRGPSC_DIV8: ETRP frequency divided by 8.
// 1062   * @param  TIM_ExtTRGPolarity: The external Trigger Polarity.
// 1063   *   This parameter can be one of the following values:
// 1064   *     @arg TIM_ExtTRGPolarity_Inverted: active low or falling edge active.
// 1065   *     @arg TIM_ExtTRGPolarity_NonInverted: active high or rising edge active.
// 1066   * @param  ExtTRGFilter: External Trigger Filter.
// 1067   *   This parameter must be a value between 0x00 and 0x0F
// 1068   * @retval None
// 1069   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1070 void TIM_ETRClockMode2Config(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, 
// 1071                              uint16_t TIM_ExtTRGPolarity, uint16_t ExtTRGFilter)
// 1072 {
TIM_ETRClockMode2Config:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
// 1073   /* Check the parameters */
// 1074   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 1075   assert_param(IS_TIM_EXT_PRESCALER(TIM_ExtTRGPrescaler));
// 1076   assert_param(IS_TIM_EXT_POLARITY(TIM_ExtTRGPolarity));
// 1077   assert_param(IS_TIM_EXT_FILTER(ExtTRGFilter));
// 1078   /* Configure the ETR Clock source */
// 1079   TIM_ETRConfig(TIMx, TIM_ExtTRGPrescaler, TIM_ExtTRGPolarity, ExtTRGFilter);
        MOVS     R3,R7
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R6
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       TIM_ETRConfig
// 1080   /* Enable the External clock mode2 */
// 1081   TIMx->SMCR |= TIM_SMCR_ECE;
        LDRH     R0,[R4, #+8]
        ORRS     R0,R0,#0x4000
        STRH     R0,[R4, #+8]
// 1082 }
        POP      {R0,R4-R7,PC}    ;; return
// 1083 
// 1084 /**
// 1085   * @brief  Configures the TIMx External Trigger (ETR).
// 1086   * @param  TIMx: where x can be  1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 1087   * @param  TIM_ExtTRGPrescaler: The external Trigger Prescaler.
// 1088   *   This parameter can be one of the following values:
// 1089   *     @arg TIM_ExtTRGPSC_OFF: ETRP Prescaler OFF.
// 1090   *     @arg TIM_ExtTRGPSC_DIV2: ETRP frequency divided by 2.
// 1091   *     @arg TIM_ExtTRGPSC_DIV4: ETRP frequency divided by 4.
// 1092   *     @arg TIM_ExtTRGPSC_DIV8: ETRP frequency divided by 8.
// 1093   * @param  TIM_ExtTRGPolarity: The external Trigger Polarity.
// 1094   *   This parameter can be one of the following values:
// 1095   *     @arg TIM_ExtTRGPolarity_Inverted: active low or falling edge active.
// 1096   *     @arg TIM_ExtTRGPolarity_NonInverted: active high or rising edge active.
// 1097   * @param  ExtTRGFilter: External Trigger Filter.
// 1098   *   This parameter must be a value between 0x00 and 0x0F
// 1099   * @retval None
// 1100   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1101 void TIM_ETRConfig(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, uint16_t TIM_ExtTRGPolarity,
// 1102                    uint16_t ExtTRGFilter)
// 1103 {
TIM_ETRConfig:
        PUSH     {R4,R5}
// 1104   uint16_t tmpsmcr = 0;
        MOVS     R4,#+0
// 1105   /* Check the parameters */
// 1106   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 1107   assert_param(IS_TIM_EXT_PRESCALER(TIM_ExtTRGPrescaler));
// 1108   assert_param(IS_TIM_EXT_POLARITY(TIM_ExtTRGPolarity));
// 1109   assert_param(IS_TIM_EXT_FILTER(ExtTRGFilter));
// 1110   tmpsmcr = TIMx->SMCR;
        LDRH     R5,[R0, #+8]
        MOVS     R4,R5
// 1111   /* Reset the ETR Bits */
// 1112   tmpsmcr &= SMCR_ETR_Mask;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
// 1113   /* Set the Prescaler, the Filter value and the Polarity */
// 1114   tmpsmcr |= (uint16_t)(TIM_ExtTRGPrescaler | (uint16_t)(TIM_ExtTRGPolarity | (uint16_t)(ExtTRGFilter << (uint16_t)8)));
        ORRS     R5,R2,R3, LSL #+8
        ORRS     R5,R5,R1
        ORRS     R4,R5,R4
// 1115   /* Write to TIMx SMCR */
// 1116   TIMx->SMCR = tmpsmcr;
        STRH     R4,[R0, #+8]
// 1117 }
        POP      {R4,R5}
        BX       LR               ;; return
// 1118 
// 1119 /**
// 1120   * @brief  Configures the TIMx Prescaler.
// 1121   * @param  TIMx: where x can be 1 to 17 to select the TIM peripheral.
// 1122   * @param  Prescaler: specifies the Prescaler Register value
// 1123   * @param  TIM_PSCReloadMode: specifies the TIM Prescaler Reload mode
// 1124   *   This parameter can be one of the following values:
// 1125   *     @arg TIM_PSCReloadMode_Update: The Prescaler is loaded at the update event.
// 1126   *     @arg TIM_PSCReloadMode_Immediate: The Prescaler is loaded immediately.
// 1127   * @retval None
// 1128   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1129 void TIM_PrescalerConfig(TIM_TypeDef* TIMx, uint16_t Prescaler, uint16_t TIM_PSCReloadMode)
// 1130 {
// 1131   /* Check the parameters */
// 1132   assert_param(IS_TIM_ALL_PERIPH(TIMx));
// 1133   assert_param(IS_TIM_PRESCALER_RELOAD(TIM_PSCReloadMode));
// 1134   /* Set the Prescaler value */
// 1135   TIMx->PSC = Prescaler;
TIM_PrescalerConfig:
        STRH     R1,[R0, #+40]
// 1136   /* Set or reset the UG Bit */
// 1137   TIMx->EGR = TIM_PSCReloadMode;
        STRH     R2,[R0, #+20]
// 1138 }
        BX       LR               ;; return
// 1139 
// 1140 /**
// 1141   * @brief  Specifies the TIMx Counter Mode to be used.
// 1142   * @param  TIMx: where x can be  1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 1143   * @param  TIM_CounterMode: specifies the Counter Mode to be used
// 1144   *   This parameter can be one of the following values:
// 1145   *     @arg TIM_CounterMode_Up: TIM Up Counting Mode
// 1146   *     @arg TIM_CounterMode_Down: TIM Down Counting Mode
// 1147   *     @arg TIM_CounterMode_CenterAligned1: TIM Center Aligned Mode1
// 1148   *     @arg TIM_CounterMode_CenterAligned2: TIM Center Aligned Mode2
// 1149   *     @arg TIM_CounterMode_CenterAligned3: TIM Center Aligned Mode3
// 1150   * @retval None
// 1151   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1152 void TIM_CounterModeConfig(TIM_TypeDef* TIMx, uint16_t TIM_CounterMode)
// 1153 {
// 1154   uint16_t tmpcr1 = 0;
TIM_CounterModeConfig:
        MOVS     R2,#+0
// 1155   /* Check the parameters */
// 1156   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 1157   assert_param(IS_TIM_COUNTER_MODE(TIM_CounterMode));
// 1158   tmpcr1 = TIMx->CR1;
        LDRH     R3,[R0, #+0]
        MOVS     R2,R3
// 1159   /* Reset the CMS and DIR Bits */
// 1160   tmpcr1 &= (uint16_t)(~((uint16_t)(TIM_CR1_DIR | TIM_CR1_CMS)));
        MOVW     R3,#+65423
        ANDS     R2,R3,R2
// 1161   /* Set the Counter Mode */
// 1162   tmpcr1 |= TIM_CounterMode;
        ORRS     R2,R1,R2
// 1163   /* Write to TIMx CR1 register */
// 1164   TIMx->CR1 = tmpcr1;
        STRH     R2,[R0, #+0]
// 1165 }
        BX       LR               ;; return
// 1166 
// 1167 /**
// 1168   * @brief  Selects the Input Trigger source
// 1169   * @param  TIMx: where x can be  1, 2, 3, 4, 5, 8, 9, 12 or 15 to select the TIM peripheral.
// 1170   * @param  TIM_InputTriggerSource: The Input Trigger source.
// 1171   *   This parameter can be one of the following values:
// 1172   *     @arg TIM_TS_ITR0: Internal Trigger 0
// 1173   *     @arg TIM_TS_ITR1: Internal Trigger 1
// 1174   *     @arg TIM_TS_ITR2: Internal Trigger 2
// 1175   *     @arg TIM_TS_ITR3: Internal Trigger 3
// 1176   *     @arg TIM_TS_TI1F_ED: TI1 Edge Detector
// 1177   *     @arg TIM_TS_TI1FP1: Filtered Timer Input 1
// 1178   *     @arg TIM_TS_TI2FP2: Filtered Timer Input 2
// 1179   *     @arg TIM_TS_ETRF: External Trigger input
// 1180   * @retval None
// 1181   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1182 void TIM_SelectInputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource)
// 1183 {
// 1184   uint16_t tmpsmcr = 0;
TIM_SelectInputTrigger:
        MOVS     R2,#+0
// 1185   /* Check the parameters */
// 1186   assert_param(IS_TIM_LIST6_PERIPH(TIMx));
// 1187   assert_param(IS_TIM_TRIGGER_SELECTION(TIM_InputTriggerSource));
// 1188   /* Get the TIMx SMCR register value */
// 1189   tmpsmcr = TIMx->SMCR;
        LDRH     R3,[R0, #+8]
        MOVS     R2,R3
// 1190   /* Reset the TS Bits */
// 1191   tmpsmcr &= (uint16_t)(~((uint16_t)TIM_SMCR_TS));
        MOVW     R3,#+65423
        ANDS     R2,R3,R2
// 1192   /* Set the Input Trigger source */
// 1193   tmpsmcr |= TIM_InputTriggerSource;
        ORRS     R2,R1,R2
// 1194   /* Write to TIMx SMCR */
// 1195   TIMx->SMCR = tmpsmcr;
        STRH     R2,[R0, #+8]
// 1196 }
        BX       LR               ;; return
// 1197 
// 1198 /**
// 1199   * @brief  Configures the TIMx Encoder Interface.
// 1200   * @param  TIMx: where x can be  1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 1201   * @param  TIM_EncoderMode: specifies the TIMx Encoder Mode.
// 1202   *   This parameter can be one of the following values:
// 1203   *     @arg TIM_EncoderMode_TI1: Counter counts on TI1FP1 edge depending on TI2FP2 level.
// 1204   *     @arg TIM_EncoderMode_TI2: Counter counts on TI2FP2 edge depending on TI1FP1 level.
// 1205   *     @arg TIM_EncoderMode_TI12: Counter counts on both TI1FP1 and TI2FP2 edges depending
// 1206   *                                on the level of the other input.
// 1207   * @param  TIM_IC1Polarity: specifies the IC1 Polarity
// 1208   *   This parameter can be one of the following values:
// 1209   *     @arg TIM_ICPolarity_Falling: IC Falling edge.
// 1210   *     @arg TIM_ICPolarity_Rising: IC Rising edge.
// 1211   * @param  TIM_IC2Polarity: specifies the IC2 Polarity
// 1212   *   This parameter can be one of the following values:
// 1213   *     @arg TIM_ICPolarity_Falling: IC Falling edge.
// 1214   *     @arg TIM_ICPolarity_Rising: IC Rising edge.
// 1215   * @retval None
// 1216   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1217 void TIM_EncoderInterfaceConfig(TIM_TypeDef* TIMx, uint16_t TIM_EncoderMode,
// 1218                                 uint16_t TIM_IC1Polarity, uint16_t TIM_IC2Polarity)
// 1219 {
TIM_EncoderInterfaceConfig:
        PUSH     {R4-R7}
// 1220   uint16_t tmpsmcr = 0;
        MOVS     R4,#+0
// 1221   uint16_t tmpccmr1 = 0;
        MOVS     R5,#+0
// 1222   uint16_t tmpccer = 0;
        MOVS     R6,#+0
// 1223     
// 1224   /* Check the parameters */
// 1225   assert_param(IS_TIM_LIST5_PERIPH(TIMx));
// 1226   assert_param(IS_TIM_ENCODER_MODE(TIM_EncoderMode));
// 1227   assert_param(IS_TIM_IC_POLARITY(TIM_IC1Polarity));
// 1228   assert_param(IS_TIM_IC_POLARITY(TIM_IC2Polarity));
// 1229 
// 1230   /* Get the TIMx SMCR register value */
// 1231   tmpsmcr = TIMx->SMCR;
        LDRH     R7,[R0, #+8]
        MOVS     R4,R7
// 1232   
// 1233   /* Get the TIMx CCMR1 register value */
// 1234   tmpccmr1 = TIMx->CCMR1;
        LDRH     R7,[R0, #+24]
        MOVS     R5,R7
// 1235   
// 1236   /* Get the TIMx CCER register value */
// 1237   tmpccer = TIMx->CCER;
        LDRH     R7,[R0, #+32]
        MOVS     R6,R7
// 1238   
// 1239   /* Set the encoder Mode */
// 1240   tmpsmcr &= (uint16_t)(~((uint16_t)TIM_SMCR_SMS));
        MOVW     R7,#+65528
        ANDS     R4,R7,R4
// 1241   tmpsmcr |= TIM_EncoderMode;
        ORRS     R4,R1,R4
// 1242   
// 1243   /* Select the Capture Compare 1 and the Capture Compare 2 as input */
// 1244   tmpccmr1 &= (uint16_t)(((uint16_t)~((uint16_t)TIM_CCMR1_CC1S)) & (uint16_t)(~((uint16_t)TIM_CCMR1_CC2S)));
        MOVW     R7,#+64764
        ANDS     R5,R7,R5
// 1245   tmpccmr1 |= TIM_CCMR1_CC1S_0 | TIM_CCMR1_CC2S_0;
        MOVW     R7,#+257
        ORRS     R5,R7,R5
// 1246   
// 1247   /* Set the TI1 and the TI2 Polarities */
// 1248   tmpccer &= (uint16_t)(((uint16_t)~((uint16_t)TIM_CCER_CC1P)) & ((uint16_t)~((uint16_t)TIM_CCER_CC2P)));
        MOVW     R7,#+65501
        ANDS     R6,R7,R6
// 1249   tmpccer |= (uint16_t)(TIM_IC1Polarity | (uint16_t)(TIM_IC2Polarity << (uint16_t)4));
        ORRS     R7,R2,R3, LSL #+4
        ORRS     R6,R7,R6
// 1250   
// 1251   /* Write to TIMx SMCR */
// 1252   TIMx->SMCR = tmpsmcr;
        STRH     R4,[R0, #+8]
// 1253   /* Write to TIMx CCMR1 */
// 1254   TIMx->CCMR1 = tmpccmr1;
        STRH     R5,[R0, #+24]
// 1255   /* Write to TIMx CCER */
// 1256   TIMx->CCER = tmpccer;
        STRH     R6,[R0, #+32]
// 1257 }
        POP      {R4-R7}
        BX       LR               ;; return
// 1258 
// 1259 /**
// 1260   * @brief  Forces the TIMx output 1 waveform to active or inactive level.
// 1261   * @param  TIMx: where x can be  1 to 17 except 6 and 7 to select the TIM peripheral.
// 1262   * @param  TIM_ForcedAction: specifies the forced Action to be set to the output waveform.
// 1263   *   This parameter can be one of the following values:
// 1264   *     @arg TIM_ForcedAction_Active: Force active level on OC1REF
// 1265   *     @arg TIM_ForcedAction_InActive: Force inactive level on OC1REF.
// 1266   * @retval None
// 1267   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1268 void TIM_ForcedOC1Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
// 1269 {
// 1270   uint16_t tmpccmr1 = 0;
TIM_ForcedOC1Config:
        MOVS     R2,#+0
// 1271   /* Check the parameters */
// 1272   assert_param(IS_TIM_LIST8_PERIPH(TIMx));
// 1273   assert_param(IS_TIM_FORCED_ACTION(TIM_ForcedAction));
// 1274   tmpccmr1 = TIMx->CCMR1;
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
// 1275   /* Reset the OC1M Bits */
// 1276   tmpccmr1 &= (uint16_t)~((uint16_t)TIM_CCMR1_OC1M);
        MOVW     R3,#+65423
        ANDS     R2,R3,R2
// 1277   /* Configure The Forced output Mode */
// 1278   tmpccmr1 |= TIM_ForcedAction;
        ORRS     R2,R1,R2
// 1279   /* Write to TIMx CCMR1 register */
// 1280   TIMx->CCMR1 = tmpccmr1;
        STRH     R2,[R0, #+24]
// 1281 }
        BX       LR               ;; return
// 1282 
// 1283 /**
// 1284   * @brief  Forces the TIMx output 2 waveform to active or inactive level.
// 1285   * @param  TIMx: where x can be  1, 2, 3, 4, 5, 8, 9, 12 or 15 to select the TIM peripheral.
// 1286   * @param  TIM_ForcedAction: specifies the forced Action to be set to the output waveform.
// 1287   *   This parameter can be one of the following values:
// 1288   *     @arg TIM_ForcedAction_Active: Force active level on OC2REF
// 1289   *     @arg TIM_ForcedAction_InActive: Force inactive level on OC2REF.
// 1290   * @retval None
// 1291   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1292 void TIM_ForcedOC2Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
// 1293 {
// 1294   uint16_t tmpccmr1 = 0;
TIM_ForcedOC2Config:
        MOVS     R2,#+0
// 1295   /* Check the parameters */
// 1296   assert_param(IS_TIM_LIST6_PERIPH(TIMx));
// 1297   assert_param(IS_TIM_FORCED_ACTION(TIM_ForcedAction));
// 1298   tmpccmr1 = TIMx->CCMR1;
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
// 1299   /* Reset the OC2M Bits */
// 1300   tmpccmr1 &= (uint16_t)~((uint16_t)TIM_CCMR1_OC2M);
        MOVW     R3,#+36863
        ANDS     R2,R3,R2
// 1301   /* Configure The Forced output Mode */
// 1302   tmpccmr1 |= (uint16_t)(TIM_ForcedAction << 8);
        ORRS     R2,R2,R1, LSL #+8
// 1303   /* Write to TIMx CCMR1 register */
// 1304   TIMx->CCMR1 = tmpccmr1;
        STRH     R2,[R0, #+24]
// 1305 }
        BX       LR               ;; return
// 1306 
// 1307 /**
// 1308   * @brief  Forces the TIMx output 3 waveform to active or inactive level.
// 1309   * @param  TIMx: where x can be  1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 1310   * @param  TIM_ForcedAction: specifies the forced Action to be set to the output waveform.
// 1311   *   This parameter can be one of the following values:
// 1312   *     @arg TIM_ForcedAction_Active: Force active level on OC3REF
// 1313   *     @arg TIM_ForcedAction_InActive: Force inactive level on OC3REF.
// 1314   * @retval None
// 1315   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1316 void TIM_ForcedOC3Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
// 1317 {
// 1318   uint16_t tmpccmr2 = 0;
TIM_ForcedOC3Config:
        MOVS     R2,#+0
// 1319   /* Check the parameters */
// 1320   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 1321   assert_param(IS_TIM_FORCED_ACTION(TIM_ForcedAction));
// 1322   tmpccmr2 = TIMx->CCMR2;
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
// 1323   /* Reset the OC1M Bits */
// 1324   tmpccmr2 &= (uint16_t)~((uint16_t)TIM_CCMR2_OC3M);
        MOVW     R3,#+65423
        ANDS     R2,R3,R2
// 1325   /* Configure The Forced output Mode */
// 1326   tmpccmr2 |= TIM_ForcedAction;
        ORRS     R2,R1,R2
// 1327   /* Write to TIMx CCMR2 register */
// 1328   TIMx->CCMR2 = tmpccmr2;
        STRH     R2,[R0, #+28]
// 1329 }
        BX       LR               ;; return
// 1330 
// 1331 /**
// 1332   * @brief  Forces the TIMx output 4 waveform to active or inactive level.
// 1333   * @param  TIMx: where x can be  1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 1334   * @param  TIM_ForcedAction: specifies the forced Action to be set to the output waveform.
// 1335   *   This parameter can be one of the following values:
// 1336   *     @arg TIM_ForcedAction_Active: Force active level on OC4REF
// 1337   *     @arg TIM_ForcedAction_InActive: Force inactive level on OC4REF.
// 1338   * @retval None
// 1339   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1340 void TIM_ForcedOC4Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
// 1341 {
// 1342   uint16_t tmpccmr2 = 0;
TIM_ForcedOC4Config:
        MOVS     R2,#+0
// 1343   /* Check the parameters */
// 1344   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 1345   assert_param(IS_TIM_FORCED_ACTION(TIM_ForcedAction));
// 1346   tmpccmr2 = TIMx->CCMR2;
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
// 1347   /* Reset the OC2M Bits */
// 1348   tmpccmr2 &= (uint16_t)~((uint16_t)TIM_CCMR2_OC4M);
        MOVW     R3,#+36863
        ANDS     R2,R3,R2
// 1349   /* Configure The Forced output Mode */
// 1350   tmpccmr2 |= (uint16_t)(TIM_ForcedAction << 8);
        ORRS     R2,R2,R1, LSL #+8
// 1351   /* Write to TIMx CCMR2 register */
// 1352   TIMx->CCMR2 = tmpccmr2;
        STRH     R2,[R0, #+28]
// 1353 }
        BX       LR               ;; return
// 1354 
// 1355 /**
// 1356   * @brief  Enables or disables TIMx peripheral Preload register on ARR.
// 1357   * @param  TIMx: where x can be  1 to 17 to select the TIM peripheral.
// 1358   * @param  NewState: new state of the TIMx peripheral Preload register
// 1359   *   This parameter can be: ENABLE or DISABLE.
// 1360   * @retval None
// 1361   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1362 void TIM_ARRPreloadConfig(TIM_TypeDef* TIMx, FunctionalState NewState)
// 1363 {
// 1364   /* Check the parameters */
// 1365   assert_param(IS_TIM_ALL_PERIPH(TIMx));
// 1366   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1367   if (NewState != DISABLE)
TIM_ARRPreloadConfig:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??TIM_ARRPreloadConfig_0
// 1368   {
// 1369     /* Set the ARR Preload Bit */
// 1370     TIMx->CR1 |= TIM_CR1_ARPE;
        LDRH     R2,[R0, #+0]
        ORRS     R2,R2,#0x80
        STRH     R2,[R0, #+0]
        B.N      ??TIM_ARRPreloadConfig_1
// 1371   }
// 1372   else
// 1373   {
// 1374     /* Reset the ARR Preload Bit */
// 1375     TIMx->CR1 &= (uint16_t)~((uint16_t)TIM_CR1_ARPE);
??TIM_ARRPreloadConfig_0:
        LDRH     R2,[R0, #+0]
        MOVW     R3,#+65407
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+0]
// 1376   }
// 1377 }
??TIM_ARRPreloadConfig_1:
        BX       LR               ;; return
// 1378 
// 1379 /**
// 1380   * @brief  Selects the TIM peripheral Commutation event.
// 1381   * @param  TIMx: where x can be  1, 8, 15, 16 or 17 to select the TIMx peripheral
// 1382   * @param  NewState: new state of the Commutation event.
// 1383   *   This parameter can be: ENABLE or DISABLE.
// 1384   * @retval None
// 1385   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1386 void TIM_SelectCOM(TIM_TypeDef* TIMx, FunctionalState NewState)
// 1387 {
// 1388   /* Check the parameters */
// 1389   assert_param(IS_TIM_LIST2_PERIPH(TIMx));
// 1390   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1391   if (NewState != DISABLE)
TIM_SelectCOM:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??TIM_SelectCOM_0
// 1392   {
// 1393     /* Set the COM Bit */
// 1394     TIMx->CR2 |= TIM_CR2_CCUS;
        LDRH     R2,[R0, #+4]
        ORRS     R2,R2,#0x4
        STRH     R2,[R0, #+4]
        B.N      ??TIM_SelectCOM_1
// 1395   }
// 1396   else
// 1397   {
// 1398     /* Reset the COM Bit */
// 1399     TIMx->CR2 &= (uint16_t)~((uint16_t)TIM_CR2_CCUS);
??TIM_SelectCOM_0:
        LDRH     R2,[R0, #+4]
        MOVW     R3,#+65531
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+4]
// 1400   }
// 1401 }
??TIM_SelectCOM_1:
        BX       LR               ;; return
// 1402 
// 1403 /**
// 1404   * @brief  Selects the TIMx peripheral Capture Compare DMA source.
// 1405   * @param  TIMx: where x can be  1, 2, 3, 4, 5, 8, 15, 16 or 17 to select 
// 1406   *         the TIM peripheral.
// 1407   * @param  NewState: new state of the Capture Compare DMA source
// 1408   *   This parameter can be: ENABLE or DISABLE.
// 1409   * @retval None
// 1410   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1411 void TIM_SelectCCDMA(TIM_TypeDef* TIMx, FunctionalState NewState)
// 1412 {
// 1413   /* Check the parameters */
// 1414   assert_param(IS_TIM_LIST4_PERIPH(TIMx));
// 1415   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1416   if (NewState != DISABLE)
TIM_SelectCCDMA:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??TIM_SelectCCDMA_0
// 1417   {
// 1418     /* Set the CCDS Bit */
// 1419     TIMx->CR2 |= TIM_CR2_CCDS;
        LDRH     R2,[R0, #+4]
        ORRS     R2,R2,#0x8
        STRH     R2,[R0, #+4]
        B.N      ??TIM_SelectCCDMA_1
// 1420   }
// 1421   else
// 1422   {
// 1423     /* Reset the CCDS Bit */
// 1424     TIMx->CR2 &= (uint16_t)~((uint16_t)TIM_CR2_CCDS);
??TIM_SelectCCDMA_0:
        LDRH     R2,[R0, #+4]
        MOVW     R3,#+65527
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+4]
// 1425   }
// 1426 }
??TIM_SelectCCDMA_1:
        BX       LR               ;; return
// 1427 
// 1428 /**
// 1429   * @brief  Sets or Resets the TIM peripheral Capture Compare Preload Control bit.
// 1430   * @param  TIMx: where x can be   1, 2, 3, 4, 5, 8 or 15 
// 1431   *         to select the TIMx peripheral
// 1432   * @param  NewState: new state of the Capture Compare Preload Control bit
// 1433   *   This parameter can be: ENABLE or DISABLE.
// 1434   * @retval None
// 1435   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1436 void TIM_CCPreloadControl(TIM_TypeDef* TIMx, FunctionalState NewState)
// 1437 { 
// 1438   /* Check the parameters */
// 1439   assert_param(IS_TIM_LIST5_PERIPH(TIMx));
// 1440   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 1441   if (NewState != DISABLE)
TIM_CCPreloadControl:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??TIM_CCPreloadControl_0
// 1442   {
// 1443     /* Set the CCPC Bit */
// 1444     TIMx->CR2 |= TIM_CR2_CCPC;
        LDRH     R2,[R0, #+4]
        ORRS     R2,R2,#0x1
        STRH     R2,[R0, #+4]
        B.N      ??TIM_CCPreloadControl_1
// 1445   }
// 1446   else
// 1447   {
// 1448     /* Reset the CCPC Bit */
// 1449     TIMx->CR2 &= (uint16_t)~((uint16_t)TIM_CR2_CCPC);
??TIM_CCPreloadControl_0:
        LDRH     R2,[R0, #+4]
        MOVW     R3,#+65534
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+4]
// 1450   }
// 1451 }
??TIM_CCPreloadControl_1:
        BX       LR               ;; return
// 1452 
// 1453 /**
// 1454   * @brief  Enables or disables the TIMx peripheral Preload register on CCR1.
// 1455   * @param  TIMx: where x can be  1 to 17 except 6 and 7 to select the TIM peripheral.
// 1456   * @param  TIM_OCPreload: new state of the TIMx peripheral Preload register
// 1457   *   This parameter can be one of the following values:
// 1458   *     @arg TIM_OCPreload_Enable
// 1459   *     @arg TIM_OCPreload_Disable
// 1460   * @retval None
// 1461   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1462 void TIM_OC1PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
// 1463 {
// 1464   uint16_t tmpccmr1 = 0;
TIM_OC1PreloadConfig:
        MOVS     R2,#+0
// 1465   /* Check the parameters */
// 1466   assert_param(IS_TIM_LIST8_PERIPH(TIMx));
// 1467   assert_param(IS_TIM_OCPRELOAD_STATE(TIM_OCPreload));
// 1468   tmpccmr1 = TIMx->CCMR1;
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
// 1469   /* Reset the OC1PE Bit */
// 1470   tmpccmr1 &= (uint16_t)~((uint16_t)TIM_CCMR1_OC1PE);
        MOVW     R3,#+65527
        ANDS     R2,R3,R2
// 1471   /* Enable or Disable the Output Compare Preload feature */
// 1472   tmpccmr1 |= TIM_OCPreload;
        ORRS     R2,R1,R2
// 1473   /* Write to TIMx CCMR1 register */
// 1474   TIMx->CCMR1 = tmpccmr1;
        STRH     R2,[R0, #+24]
// 1475 }
        BX       LR               ;; return
// 1476 
// 1477 /**
// 1478   * @brief  Enables or disables the TIMx peripheral Preload register on CCR2.
// 1479   * @param  TIMx: where x can be  1, 2, 3, 4, 5, 8, 9, 12 or 15 to select 
// 1480   *         the TIM peripheral.
// 1481   * @param  TIM_OCPreload: new state of the TIMx peripheral Preload register
// 1482   *   This parameter can be one of the following values:
// 1483   *     @arg TIM_OCPreload_Enable
// 1484   *     @arg TIM_OCPreload_Disable
// 1485   * @retval None
// 1486   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1487 void TIM_OC2PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
// 1488 {
// 1489   uint16_t tmpccmr1 = 0;
TIM_OC2PreloadConfig:
        MOVS     R2,#+0
// 1490   /* Check the parameters */
// 1491   assert_param(IS_TIM_LIST6_PERIPH(TIMx));
// 1492   assert_param(IS_TIM_OCPRELOAD_STATE(TIM_OCPreload));
// 1493   tmpccmr1 = TIMx->CCMR1;
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
// 1494   /* Reset the OC2PE Bit */
// 1495   tmpccmr1 &= (uint16_t)~((uint16_t)TIM_CCMR1_OC2PE);
        MOVW     R3,#+63487
        ANDS     R2,R3,R2
// 1496   /* Enable or Disable the Output Compare Preload feature */
// 1497   tmpccmr1 |= (uint16_t)(TIM_OCPreload << 8);
        ORRS     R2,R2,R1, LSL #+8
// 1498   /* Write to TIMx CCMR1 register */
// 1499   TIMx->CCMR1 = tmpccmr1;
        STRH     R2,[R0, #+24]
// 1500 }
        BX       LR               ;; return
// 1501 
// 1502 /**
// 1503   * @brief  Enables or disables the TIMx peripheral Preload register on CCR3.
// 1504   * @param  TIMx: where x can be  1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 1505   * @param  TIM_OCPreload: new state of the TIMx peripheral Preload register
// 1506   *   This parameter can be one of the following values:
// 1507   *     @arg TIM_OCPreload_Enable
// 1508   *     @arg TIM_OCPreload_Disable
// 1509   * @retval None
// 1510   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1511 void TIM_OC3PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
// 1512 {
// 1513   uint16_t tmpccmr2 = 0;
TIM_OC3PreloadConfig:
        MOVS     R2,#+0
// 1514   /* Check the parameters */
// 1515   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 1516   assert_param(IS_TIM_OCPRELOAD_STATE(TIM_OCPreload));
// 1517   tmpccmr2 = TIMx->CCMR2;
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
// 1518   /* Reset the OC3PE Bit */
// 1519   tmpccmr2 &= (uint16_t)~((uint16_t)TIM_CCMR2_OC3PE);
        MOVW     R3,#+65527
        ANDS     R2,R3,R2
// 1520   /* Enable or Disable the Output Compare Preload feature */
// 1521   tmpccmr2 |= TIM_OCPreload;
        ORRS     R2,R1,R2
// 1522   /* Write to TIMx CCMR2 register */
// 1523   TIMx->CCMR2 = tmpccmr2;
        STRH     R2,[R0, #+28]
// 1524 }
        BX       LR               ;; return
// 1525 
// 1526 /**
// 1527   * @brief  Enables or disables the TIMx peripheral Preload register on CCR4.
// 1528   * @param  TIMx: where x can be  1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 1529   * @param  TIM_OCPreload: new state of the TIMx peripheral Preload register
// 1530   *   This parameter can be one of the following values:
// 1531   *     @arg TIM_OCPreload_Enable
// 1532   *     @arg TIM_OCPreload_Disable
// 1533   * @retval None
// 1534   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1535 void TIM_OC4PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
// 1536 {
// 1537   uint16_t tmpccmr2 = 0;
TIM_OC4PreloadConfig:
        MOVS     R2,#+0
// 1538   /* Check the parameters */
// 1539   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 1540   assert_param(IS_TIM_OCPRELOAD_STATE(TIM_OCPreload));
// 1541   tmpccmr2 = TIMx->CCMR2;
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
// 1542   /* Reset the OC4PE Bit */
// 1543   tmpccmr2 &= (uint16_t)~((uint16_t)TIM_CCMR2_OC4PE);
        MOVW     R3,#+63487
        ANDS     R2,R3,R2
// 1544   /* Enable or Disable the Output Compare Preload feature */
// 1545   tmpccmr2 |= (uint16_t)(TIM_OCPreload << 8);
        ORRS     R2,R2,R1, LSL #+8
// 1546   /* Write to TIMx CCMR2 register */
// 1547   TIMx->CCMR2 = tmpccmr2;
        STRH     R2,[R0, #+28]
// 1548 }
        BX       LR               ;; return
// 1549 
// 1550 /**
// 1551   * @brief  Configures the TIMx Output Compare 1 Fast feature.
// 1552   * @param  TIMx: where x can be  1 to 17 except 6 and 7 to select the TIM peripheral.
// 1553   * @param  TIM_OCFast: new state of the Output Compare Fast Enable Bit.
// 1554   *   This parameter can be one of the following values:
// 1555   *     @arg TIM_OCFast_Enable: TIM output compare fast enable
// 1556   *     @arg TIM_OCFast_Disable: TIM output compare fast disable
// 1557   * @retval None
// 1558   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1559 void TIM_OC1FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
// 1560 {
// 1561   uint16_t tmpccmr1 = 0;
TIM_OC1FastConfig:
        MOVS     R2,#+0
// 1562   /* Check the parameters */
// 1563   assert_param(IS_TIM_LIST8_PERIPH(TIMx));
// 1564   assert_param(IS_TIM_OCFAST_STATE(TIM_OCFast));
// 1565   /* Get the TIMx CCMR1 register value */
// 1566   tmpccmr1 = TIMx->CCMR1;
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
// 1567   /* Reset the OC1FE Bit */
// 1568   tmpccmr1 &= (uint16_t)~((uint16_t)TIM_CCMR1_OC1FE);
        MOVW     R3,#+65531
        ANDS     R2,R3,R2
// 1569   /* Enable or Disable the Output Compare Fast Bit */
// 1570   tmpccmr1 |= TIM_OCFast;
        ORRS     R2,R1,R2
// 1571   /* Write to TIMx CCMR1 */
// 1572   TIMx->CCMR1 = tmpccmr1;
        STRH     R2,[R0, #+24]
// 1573 }
        BX       LR               ;; return
// 1574 
// 1575 /**
// 1576   * @brief  Configures the TIMx Output Compare 2 Fast feature.
// 1577   * @param  TIMx: where x can be  1, 2, 3, 4, 5, 8, 9, 12 or 15 to select 
// 1578   *         the TIM peripheral.
// 1579   * @param  TIM_OCFast: new state of the Output Compare Fast Enable Bit.
// 1580   *   This parameter can be one of the following values:
// 1581   *     @arg TIM_OCFast_Enable: TIM output compare fast enable
// 1582   *     @arg TIM_OCFast_Disable: TIM output compare fast disable
// 1583   * @retval None
// 1584   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1585 void TIM_OC2FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
// 1586 {
// 1587   uint16_t tmpccmr1 = 0;
TIM_OC2FastConfig:
        MOVS     R2,#+0
// 1588   /* Check the parameters */
// 1589   assert_param(IS_TIM_LIST6_PERIPH(TIMx));
// 1590   assert_param(IS_TIM_OCFAST_STATE(TIM_OCFast));
// 1591   /* Get the TIMx CCMR1 register value */
// 1592   tmpccmr1 = TIMx->CCMR1;
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
// 1593   /* Reset the OC2FE Bit */
// 1594   tmpccmr1 &= (uint16_t)~((uint16_t)TIM_CCMR1_OC2FE);
        MOVW     R3,#+64511
        ANDS     R2,R3,R2
// 1595   /* Enable or Disable the Output Compare Fast Bit */
// 1596   tmpccmr1 |= (uint16_t)(TIM_OCFast << 8);
        ORRS     R2,R2,R1, LSL #+8
// 1597   /* Write to TIMx CCMR1 */
// 1598   TIMx->CCMR1 = tmpccmr1;
        STRH     R2,[R0, #+24]
// 1599 }
        BX       LR               ;; return
// 1600 
// 1601 /**
// 1602   * @brief  Configures the TIMx Output Compare 3 Fast feature.
// 1603   * @param  TIMx: where x can be  1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 1604   * @param  TIM_OCFast: new state of the Output Compare Fast Enable Bit.
// 1605   *   This parameter can be one of the following values:
// 1606   *     @arg TIM_OCFast_Enable: TIM output compare fast enable
// 1607   *     @arg TIM_OCFast_Disable: TIM output compare fast disable
// 1608   * @retval None
// 1609   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1610 void TIM_OC3FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
// 1611 {
// 1612   uint16_t tmpccmr2 = 0;
TIM_OC3FastConfig:
        MOVS     R2,#+0
// 1613   /* Check the parameters */
// 1614   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 1615   assert_param(IS_TIM_OCFAST_STATE(TIM_OCFast));
// 1616   /* Get the TIMx CCMR2 register value */
// 1617   tmpccmr2 = TIMx->CCMR2;
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
// 1618   /* Reset the OC3FE Bit */
// 1619   tmpccmr2 &= (uint16_t)~((uint16_t)TIM_CCMR2_OC3FE);
        MOVW     R3,#+65531
        ANDS     R2,R3,R2
// 1620   /* Enable or Disable the Output Compare Fast Bit */
// 1621   tmpccmr2 |= TIM_OCFast;
        ORRS     R2,R1,R2
// 1622   /* Write to TIMx CCMR2 */
// 1623   TIMx->CCMR2 = tmpccmr2;
        STRH     R2,[R0, #+28]
// 1624 }
        BX       LR               ;; return
// 1625 
// 1626 /**
// 1627   * @brief  Configures the TIMx Output Compare 4 Fast feature.
// 1628   * @param  TIMx: where x can be  1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 1629   * @param  TIM_OCFast: new state of the Output Compare Fast Enable Bit.
// 1630   *   This parameter can be one of the following values:
// 1631   *     @arg TIM_OCFast_Enable: TIM output compare fast enable
// 1632   *     @arg TIM_OCFast_Disable: TIM output compare fast disable
// 1633   * @retval None
// 1634   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1635 void TIM_OC4FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
// 1636 {
// 1637   uint16_t tmpccmr2 = 0;
TIM_OC4FastConfig:
        MOVS     R2,#+0
// 1638   /* Check the parameters */
// 1639   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 1640   assert_param(IS_TIM_OCFAST_STATE(TIM_OCFast));
// 1641   /* Get the TIMx CCMR2 register value */
// 1642   tmpccmr2 = TIMx->CCMR2;
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
// 1643   /* Reset the OC4FE Bit */
// 1644   tmpccmr2 &= (uint16_t)~((uint16_t)TIM_CCMR2_OC4FE);
        MOVW     R3,#+64511
        ANDS     R2,R3,R2
// 1645   /* Enable or Disable the Output Compare Fast Bit */
// 1646   tmpccmr2 |= (uint16_t)(TIM_OCFast << 8);
        ORRS     R2,R2,R1, LSL #+8
// 1647   /* Write to TIMx CCMR2 */
// 1648   TIMx->CCMR2 = tmpccmr2;
        STRH     R2,[R0, #+28]
// 1649 }
        BX       LR               ;; return
// 1650 
// 1651 /**
// 1652   * @brief  Clears or safeguards the OCREF1 signal on an external event
// 1653   * @param  TIMx: where x can be  1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 1654   * @param  TIM_OCClear: new state of the Output Compare Clear Enable Bit.
// 1655   *   This parameter can be one of the following values:
// 1656   *     @arg TIM_OCClear_Enable: TIM Output clear enable
// 1657   *     @arg TIM_OCClear_Disable: TIM Output clear disable
// 1658   * @retval None
// 1659   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1660 void TIM_ClearOC1Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
// 1661 {
// 1662   uint16_t tmpccmr1 = 0;
TIM_ClearOC1Ref:
        MOVS     R2,#+0
// 1663   /* Check the parameters */
// 1664   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 1665   assert_param(IS_TIM_OCCLEAR_STATE(TIM_OCClear));
// 1666 
// 1667   tmpccmr1 = TIMx->CCMR1;
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
// 1668 
// 1669   /* Reset the OC1CE Bit */
// 1670   tmpccmr1 &= (uint16_t)~((uint16_t)TIM_CCMR1_OC1CE);
        MOVW     R3,#+65407
        ANDS     R2,R3,R2
// 1671   /* Enable or Disable the Output Compare Clear Bit */
// 1672   tmpccmr1 |= TIM_OCClear;
        ORRS     R2,R1,R2
// 1673   /* Write to TIMx CCMR1 register */
// 1674   TIMx->CCMR1 = tmpccmr1;
        STRH     R2,[R0, #+24]
// 1675 }
        BX       LR               ;; return
// 1676 
// 1677 /**
// 1678   * @brief  Clears or safeguards the OCREF2 signal on an external event
// 1679   * @param  TIMx: where x can be  1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 1680   * @param  TIM_OCClear: new state of the Output Compare Clear Enable Bit.
// 1681   *   This parameter can be one of the following values:
// 1682   *     @arg TIM_OCClear_Enable: TIM Output clear enable
// 1683   *     @arg TIM_OCClear_Disable: TIM Output clear disable
// 1684   * @retval None
// 1685   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1686 void TIM_ClearOC2Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
// 1687 {
// 1688   uint16_t tmpccmr1 = 0;
TIM_ClearOC2Ref:
        MOVS     R2,#+0
// 1689   /* Check the parameters */
// 1690   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 1691   assert_param(IS_TIM_OCCLEAR_STATE(TIM_OCClear));
// 1692   tmpccmr1 = TIMx->CCMR1;
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
// 1693   /* Reset the OC2CE Bit */
// 1694   tmpccmr1 &= (uint16_t)~((uint16_t)TIM_CCMR1_OC2CE);
        LSLS     R2,R2,#+17       ;; ZeroExtS R2,R2,#+17,#+17
        LSRS     R2,R2,#+17
// 1695   /* Enable or Disable the Output Compare Clear Bit */
// 1696   tmpccmr1 |= (uint16_t)(TIM_OCClear << 8);
        ORRS     R2,R2,R1, LSL #+8
// 1697   /* Write to TIMx CCMR1 register */
// 1698   TIMx->CCMR1 = tmpccmr1;
        STRH     R2,[R0, #+24]
// 1699 }
        BX       LR               ;; return
// 1700 
// 1701 /**
// 1702   * @brief  Clears or safeguards the OCREF3 signal on an external event
// 1703   * @param  TIMx: where x can be  1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 1704   * @param  TIM_OCClear: new state of the Output Compare Clear Enable Bit.
// 1705   *   This parameter can be one of the following values:
// 1706   *     @arg TIM_OCClear_Enable: TIM Output clear enable
// 1707   *     @arg TIM_OCClear_Disable: TIM Output clear disable
// 1708   * @retval None
// 1709   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1710 void TIM_ClearOC3Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
// 1711 {
// 1712   uint16_t tmpccmr2 = 0;
TIM_ClearOC3Ref:
        MOVS     R2,#+0
// 1713   /* Check the parameters */
// 1714   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 1715   assert_param(IS_TIM_OCCLEAR_STATE(TIM_OCClear));
// 1716   tmpccmr2 = TIMx->CCMR2;
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
// 1717   /* Reset the OC3CE Bit */
// 1718   tmpccmr2 &= (uint16_t)~((uint16_t)TIM_CCMR2_OC3CE);
        MOVW     R3,#+65407
        ANDS     R2,R3,R2
// 1719   /* Enable or Disable the Output Compare Clear Bit */
// 1720   tmpccmr2 |= TIM_OCClear;
        ORRS     R2,R1,R2
// 1721   /* Write to TIMx CCMR2 register */
// 1722   TIMx->CCMR2 = tmpccmr2;
        STRH     R2,[R0, #+28]
// 1723 }
        BX       LR               ;; return
// 1724 
// 1725 /**
// 1726   * @brief  Clears or safeguards the OCREF4 signal on an external event
// 1727   * @param  TIMx: where x can be  1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 1728   * @param  TIM_OCClear: new state of the Output Compare Clear Enable Bit.
// 1729   *   This parameter can be one of the following values:
// 1730   *     @arg TIM_OCClear_Enable: TIM Output clear enable
// 1731   *     @arg TIM_OCClear_Disable: TIM Output clear disable
// 1732   * @retval None
// 1733   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1734 void TIM_ClearOC4Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
// 1735 {
// 1736   uint16_t tmpccmr2 = 0;
TIM_ClearOC4Ref:
        MOVS     R2,#+0
// 1737   /* Check the parameters */
// 1738   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 1739   assert_param(IS_TIM_OCCLEAR_STATE(TIM_OCClear));
// 1740   tmpccmr2 = TIMx->CCMR2;
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
// 1741   /* Reset the OC4CE Bit */
// 1742   tmpccmr2 &= (uint16_t)~((uint16_t)TIM_CCMR2_OC4CE);
        LSLS     R2,R2,#+17       ;; ZeroExtS R2,R2,#+17,#+17
        LSRS     R2,R2,#+17
// 1743   /* Enable or Disable the Output Compare Clear Bit */
// 1744   tmpccmr2 |= (uint16_t)(TIM_OCClear << 8);
        ORRS     R2,R2,R1, LSL #+8
// 1745   /* Write to TIMx CCMR2 register */
// 1746   TIMx->CCMR2 = tmpccmr2;
        STRH     R2,[R0, #+28]
// 1747 }
        BX       LR               ;; return
// 1748 
// 1749 /**
// 1750   * @brief  Configures the TIMx channel 1 polarity.
// 1751   * @param  TIMx: where x can be 1 to 17 except 6 and 7 to select the TIM peripheral.
// 1752   * @param  TIM_OCPolarity: specifies the OC1 Polarity
// 1753   *   This parameter can be one of the following values:
// 1754   *     @arg TIM_OCPolarity_High: Output Compare active high
// 1755   *     @arg TIM_OCPolarity_Low: Output Compare active low
// 1756   * @retval None
// 1757   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1758 void TIM_OC1PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
// 1759 {
// 1760   uint16_t tmpccer = 0;
TIM_OC1PolarityConfig:
        MOVS     R2,#+0
// 1761   /* Check the parameters */
// 1762   assert_param(IS_TIM_LIST8_PERIPH(TIMx));
// 1763   assert_param(IS_TIM_OC_POLARITY(TIM_OCPolarity));
// 1764   tmpccer = TIMx->CCER;
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
// 1765   /* Set or Reset the CC1P Bit */
// 1766   tmpccer &= (uint16_t)~((uint16_t)TIM_CCER_CC1P);
        MOVW     R3,#+65533
        ANDS     R2,R3,R2
// 1767   tmpccer |= TIM_OCPolarity;
        ORRS     R2,R1,R2
// 1768   /* Write to TIMx CCER register */
// 1769   TIMx->CCER = tmpccer;
        STRH     R2,[R0, #+32]
// 1770 }
        BX       LR               ;; return
// 1771 
// 1772 /**
// 1773   * @brief  Configures the TIMx Channel 1N polarity.
// 1774   * @param  TIMx: where x can be 1, 8, 15, 16 or 17 to select the TIM peripheral.
// 1775   * @param  TIM_OCNPolarity: specifies the OC1N Polarity
// 1776   *   This parameter can be one of the following values:
// 1777   *     @arg TIM_OCNPolarity_High: Output Compare active high
// 1778   *     @arg TIM_OCNPolarity_Low: Output Compare active low
// 1779   * @retval None
// 1780   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1781 void TIM_OC1NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
// 1782 {
// 1783   uint16_t tmpccer = 0;
TIM_OC1NPolarityConfig:
        MOVS     R2,#+0
// 1784   /* Check the parameters */
// 1785   assert_param(IS_TIM_LIST2_PERIPH(TIMx));
// 1786   assert_param(IS_TIM_OCN_POLARITY(TIM_OCNPolarity));
// 1787    
// 1788   tmpccer = TIMx->CCER;
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
// 1789   /* Set or Reset the CC1NP Bit */
// 1790   tmpccer &= (uint16_t)~((uint16_t)TIM_CCER_CC1NP);
        MOVW     R3,#+65527
        ANDS     R2,R3,R2
// 1791   tmpccer |= TIM_OCNPolarity;
        ORRS     R2,R1,R2
// 1792   /* Write to TIMx CCER register */
// 1793   TIMx->CCER = tmpccer;
        STRH     R2,[R0, #+32]
// 1794 }
        BX       LR               ;; return
// 1795 
// 1796 /**
// 1797   * @brief  Configures the TIMx channel 2 polarity.
// 1798   * @param  TIMx: where x can be 1, 2, 3, 4, 5, 8, 9, 12 or 15 to select the TIM peripheral.
// 1799   * @param  TIM_OCPolarity: specifies the OC2 Polarity
// 1800   *   This parameter can be one of the following values:
// 1801   *     @arg TIM_OCPolarity_High: Output Compare active high
// 1802   *     @arg TIM_OCPolarity_Low: Output Compare active low
// 1803   * @retval None
// 1804   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1805 void TIM_OC2PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
// 1806 {
// 1807   uint16_t tmpccer = 0;
TIM_OC2PolarityConfig:
        MOVS     R2,#+0
// 1808   /* Check the parameters */
// 1809   assert_param(IS_TIM_LIST6_PERIPH(TIMx));
// 1810   assert_param(IS_TIM_OC_POLARITY(TIM_OCPolarity));
// 1811   tmpccer = TIMx->CCER;
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
// 1812   /* Set or Reset the CC2P Bit */
// 1813   tmpccer &= (uint16_t)~((uint16_t)TIM_CCER_CC2P);
        MOVW     R3,#+65503
        ANDS     R2,R3,R2
// 1814   tmpccer |= (uint16_t)(TIM_OCPolarity << 4);
        ORRS     R2,R2,R1, LSL #+4
// 1815   /* Write to TIMx CCER register */
// 1816   TIMx->CCER = tmpccer;
        STRH     R2,[R0, #+32]
// 1817 }
        BX       LR               ;; return
// 1818 
// 1819 /**
// 1820   * @brief  Configures the TIMx Channel 2N polarity.
// 1821   * @param  TIMx: where x can be 1 or 8 to select the TIM peripheral.
// 1822   * @param  TIM_OCNPolarity: specifies the OC2N Polarity
// 1823   *   This parameter can be one of the following values:
// 1824   *     @arg TIM_OCNPolarity_High: Output Compare active high
// 1825   *     @arg TIM_OCNPolarity_Low: Output Compare active low
// 1826   * @retval None
// 1827   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1828 void TIM_OC2NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
// 1829 {
// 1830   uint16_t tmpccer = 0;
TIM_OC2NPolarityConfig:
        MOVS     R2,#+0
// 1831   /* Check the parameters */
// 1832   assert_param(IS_TIM_LIST1_PERIPH(TIMx));
// 1833   assert_param(IS_TIM_OCN_POLARITY(TIM_OCNPolarity));
// 1834   
// 1835   tmpccer = TIMx->CCER;
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
// 1836   /* Set or Reset the CC2NP Bit */
// 1837   tmpccer &= (uint16_t)~((uint16_t)TIM_CCER_CC2NP);
        MOVW     R3,#+65407
        ANDS     R2,R3,R2
// 1838   tmpccer |= (uint16_t)(TIM_OCNPolarity << 4);
        ORRS     R2,R2,R1, LSL #+4
// 1839   /* Write to TIMx CCER register */
// 1840   TIMx->CCER = tmpccer;
        STRH     R2,[R0, #+32]
// 1841 }
        BX       LR               ;; return
// 1842 
// 1843 /**
// 1844   * @brief  Configures the TIMx channel 3 polarity.
// 1845   * @param  TIMx: where x can be 1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 1846   * @param  TIM_OCPolarity: specifies the OC3 Polarity
// 1847   *   This parameter can be one of the following values:
// 1848   *     @arg TIM_OCPolarity_High: Output Compare active high
// 1849   *     @arg TIM_OCPolarity_Low: Output Compare active low
// 1850   * @retval None
// 1851   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1852 void TIM_OC3PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
// 1853 {
// 1854   uint16_t tmpccer = 0;
TIM_OC3PolarityConfig:
        MOVS     R2,#+0
// 1855   /* Check the parameters */
// 1856   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 1857   assert_param(IS_TIM_OC_POLARITY(TIM_OCPolarity));
// 1858   tmpccer = TIMx->CCER;
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
// 1859   /* Set or Reset the CC3P Bit */
// 1860   tmpccer &= (uint16_t)~((uint16_t)TIM_CCER_CC3P);
        MOVW     R3,#+65023
        ANDS     R2,R3,R2
// 1861   tmpccer |= (uint16_t)(TIM_OCPolarity << 8);
        ORRS     R2,R2,R1, LSL #+8
// 1862   /* Write to TIMx CCER register */
// 1863   TIMx->CCER = tmpccer;
        STRH     R2,[R0, #+32]
// 1864 }
        BX       LR               ;; return
// 1865 
// 1866 /**
// 1867   * @brief  Configures the TIMx Channel 3N polarity.
// 1868   * @param  TIMx: where x can be 1 or 8 to select the TIM peripheral.
// 1869   * @param  TIM_OCNPolarity: specifies the OC3N Polarity
// 1870   *   This parameter can be one of the following values:
// 1871   *     @arg TIM_OCNPolarity_High: Output Compare active high
// 1872   *     @arg TIM_OCNPolarity_Low: Output Compare active low
// 1873   * @retval None
// 1874   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1875 void TIM_OC3NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
// 1876 {
// 1877   uint16_t tmpccer = 0;
TIM_OC3NPolarityConfig:
        MOVS     R2,#+0
// 1878  
// 1879   /* Check the parameters */
// 1880   assert_param(IS_TIM_LIST1_PERIPH(TIMx));
// 1881   assert_param(IS_TIM_OCN_POLARITY(TIM_OCNPolarity));
// 1882     
// 1883   tmpccer = TIMx->CCER;
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
// 1884   /* Set or Reset the CC3NP Bit */
// 1885   tmpccer &= (uint16_t)~((uint16_t)TIM_CCER_CC3NP);
        MOVW     R3,#+63487
        ANDS     R2,R3,R2
// 1886   tmpccer |= (uint16_t)(TIM_OCNPolarity << 8);
        ORRS     R2,R2,R1, LSL #+8
// 1887   /* Write to TIMx CCER register */
// 1888   TIMx->CCER = tmpccer;
        STRH     R2,[R0, #+32]
// 1889 }
        BX       LR               ;; return
// 1890 
// 1891 /**
// 1892   * @brief  Configures the TIMx channel 4 polarity.
// 1893   * @param  TIMx: where x can be 1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 1894   * @param  TIM_OCPolarity: specifies the OC4 Polarity
// 1895   *   This parameter can be one of the following values:
// 1896   *     @arg TIM_OCPolarity_High: Output Compare active high
// 1897   *     @arg TIM_OCPolarity_Low: Output Compare active low
// 1898   * @retval None
// 1899   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1900 void TIM_OC4PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
// 1901 {
// 1902   uint16_t tmpccer = 0;
TIM_OC4PolarityConfig:
        MOVS     R2,#+0
// 1903   /* Check the parameters */
// 1904   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 1905   assert_param(IS_TIM_OC_POLARITY(TIM_OCPolarity));
// 1906   tmpccer = TIMx->CCER;
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
// 1907   /* Set or Reset the CC4P Bit */
// 1908   tmpccer &= (uint16_t)~((uint16_t)TIM_CCER_CC4P);
        MOVW     R3,#+57343
        ANDS     R2,R3,R2
// 1909   tmpccer |= (uint16_t)(TIM_OCPolarity << 12);
        ORRS     R2,R2,R1, LSL #+12
// 1910   /* Write to TIMx CCER register */
// 1911   TIMx->CCER = tmpccer;
        STRH     R2,[R0, #+32]
// 1912 }
        BX       LR               ;; return
// 1913 
// 1914 /**
// 1915   * @brief  Enables or disables the TIM Capture Compare Channel x.
// 1916   * @param  TIMx: where x can be 1 to 17 except 6 and 7 to select the TIM peripheral.
// 1917   * @param  TIM_Channel: specifies the TIM Channel
// 1918   *   This parameter can be one of the following values:
// 1919   *     @arg TIM_Channel_1: TIM Channel 1
// 1920   *     @arg TIM_Channel_2: TIM Channel 2
// 1921   *     @arg TIM_Channel_3: TIM Channel 3
// 1922   *     @arg TIM_Channel_4: TIM Channel 4
// 1923   * @param  TIM_CCx: specifies the TIM Channel CCxE bit new state.
// 1924   *   This parameter can be: TIM_CCx_Enable or TIM_CCx_Disable. 
// 1925   * @retval None
// 1926   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1927 void TIM_CCxCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCx)
// 1928 {
TIM_CCxCmd:
        PUSH     {R4,R5}
// 1929   uint16_t tmp = 0;
        MOVS     R3,#+0
// 1930 
// 1931   /* Check the parameters */
// 1932   assert_param(IS_TIM_LIST8_PERIPH(TIMx));
// 1933   assert_param(IS_TIM_CHANNEL(TIM_Channel));
// 1934   assert_param(IS_TIM_CCX(TIM_CCx));
// 1935 
// 1936   tmp = CCER_CCE_Set << TIM_Channel;
        MOVS     R4,#+1
        LSLS     R4,R4,R1
        MOVS     R3,R4
// 1937 
// 1938   /* Reset the CCxE Bit */
// 1939   TIMx->CCER &= (uint16_t)~ tmp;
        LDRH     R4,[R0, #+32]
        BICS     R4,R4,R3
        STRH     R4,[R0, #+32]
// 1940 
// 1941   /* Set or reset the CCxE Bit */ 
// 1942   TIMx->CCER |=  (uint16_t)(TIM_CCx << TIM_Channel);
        LDRH     R4,[R0, #+32]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LSLS     R5,R2,R1
        ORRS     R4,R5,R4
        STRH     R4,[R0, #+32]
// 1943 }
        POP      {R4,R5}
        BX       LR               ;; return
// 1944 
// 1945 /**
// 1946   * @brief  Enables or disables the TIM Capture Compare Channel xN.
// 1947   * @param  TIMx: where x can be 1, 8, 15, 16 or 17 to select the TIM peripheral.
// 1948   * @param  TIM_Channel: specifies the TIM Channel
// 1949   *   This parameter can be one of the following values:
// 1950   *     @arg TIM_Channel_1: TIM Channel 1
// 1951   *     @arg TIM_Channel_2: TIM Channel 2
// 1952   *     @arg TIM_Channel_3: TIM Channel 3
// 1953   * @param  TIM_CCxN: specifies the TIM Channel CCxNE bit new state.
// 1954   *   This parameter can be: TIM_CCxN_Enable or TIM_CCxN_Disable. 
// 1955   * @retval None
// 1956   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1957 void TIM_CCxNCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCxN)
// 1958 {
TIM_CCxNCmd:
        PUSH     {R4,R5}
// 1959   uint16_t tmp = 0;
        MOVS     R3,#+0
// 1960 
// 1961   /* Check the parameters */
// 1962   assert_param(IS_TIM_LIST2_PERIPH(TIMx));
// 1963   assert_param(IS_TIM_COMPLEMENTARY_CHANNEL(TIM_Channel));
// 1964   assert_param(IS_TIM_CCXN(TIM_CCxN));
// 1965 
// 1966   tmp = CCER_CCNE_Set << TIM_Channel;
        MOVS     R4,#+4
        LSLS     R4,R4,R1
        MOVS     R3,R4
// 1967 
// 1968   /* Reset the CCxNE Bit */
// 1969   TIMx->CCER &= (uint16_t) ~tmp;
        LDRH     R4,[R0, #+32]
        BICS     R4,R4,R3
        STRH     R4,[R0, #+32]
// 1970 
// 1971   /* Set or reset the CCxNE Bit */ 
// 1972   TIMx->CCER |=  (uint16_t)(TIM_CCxN << TIM_Channel);
        LDRH     R4,[R0, #+32]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LSLS     R5,R2,R1
        ORRS     R4,R5,R4
        STRH     R4,[R0, #+32]
// 1973 }
        POP      {R4,R5}
        BX       LR               ;; return
// 1974 
// 1975 /**
// 1976   * @brief  Selects the TIM Output Compare Mode.
// 1977   * @note   This function disables the selected channel before changing the Output
// 1978   *         Compare Mode.
// 1979   *         User has to enable this channel using TIM_CCxCmd and TIM_CCxNCmd functions.
// 1980   * @param  TIMx: where x can be 1 to 17 except 6 and 7 to select the TIM peripheral.
// 1981   * @param  TIM_Channel: specifies the TIM Channel
// 1982   *   This parameter can be one of the following values:
// 1983   *     @arg TIM_Channel_1: TIM Channel 1
// 1984   *     @arg TIM_Channel_2: TIM Channel 2
// 1985   *     @arg TIM_Channel_3: TIM Channel 3
// 1986   *     @arg TIM_Channel_4: TIM Channel 4
// 1987   * @param  TIM_OCMode: specifies the TIM Output Compare Mode.
// 1988   *   This parameter can be one of the following values:
// 1989   *     @arg TIM_OCMode_Timing
// 1990   *     @arg TIM_OCMode_Active
// 1991   *     @arg TIM_OCMode_Toggle
// 1992   *     @arg TIM_OCMode_PWM1
// 1993   *     @arg TIM_OCMode_PWM2
// 1994   *     @arg TIM_ForcedAction_Active
// 1995   *     @arg TIM_ForcedAction_InActive
// 1996   * @retval None
// 1997   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1998 void TIM_SelectOCxM(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_OCMode)
// 1999 {
TIM_SelectOCxM:
        PUSH     {R4-R6}
// 2000   uint32_t tmp = 0;
        MOVS     R4,#+0
// 2001   uint16_t tmp1 = 0;
        MOVS     R3,#+0
// 2002 
// 2003   /* Check the parameters */
// 2004   assert_param(IS_TIM_LIST8_PERIPH(TIMx));
// 2005   assert_param(IS_TIM_CHANNEL(TIM_Channel));
// 2006   assert_param(IS_TIM_OCM(TIM_OCMode));
// 2007 
// 2008   tmp = (uint32_t) TIMx;
        MOVS     R4,R0
// 2009   tmp += CCMR_Offset;
        ADDS     R4,R4,#+24
// 2010 
// 2011   tmp1 = CCER_CCE_Set << (uint16_t)TIM_Channel;
        MOVS     R5,#+1
        LSLS     R5,R5,R1
        MOVS     R3,R5
// 2012 
// 2013   /* Disable the Channel: Reset the CCxE Bit */
// 2014   TIMx->CCER &= (uint16_t) ~tmp1;
        LDRH     R5,[R0, #+32]
        BICS     R5,R5,R3
        STRH     R5,[R0, #+32]
// 2015 
// 2016   if((TIM_Channel == TIM_Channel_1) ||(TIM_Channel == TIM_Channel_3))
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??TIM_SelectOCxM_0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+8
        BNE.N    ??TIM_SelectOCxM_1
// 2017   {
// 2018     tmp += (TIM_Channel>>1);
??TIM_SelectOCxM_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R5,R1,#+1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     R4,R5,R4
// 2019 
// 2020     /* Reset the OCxM bits in the CCMRx register */
// 2021     *(__IO uint32_t *) tmp &= (uint32_t)~((uint32_t)TIM_CCMR1_OC1M);
        LDR      R5,[R4, #+0]
        BICS     R5,R5,#0x70
        STR      R5,[R4, #+0]
// 2022    
// 2023     /* Configure the OCxM bits in the CCMRx register */
// 2024     *(__IO uint32_t *) tmp |= TIM_OCMode;
        LDR      R5,[R4, #+0]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ORRS     R5,R2,R5
        STR      R5,[R4, #+0]
        B.N      ??TIM_SelectOCxM_2
// 2025   }
// 2026   else
// 2027   {
// 2028     tmp += (uint16_t)(TIM_Channel - (uint16_t)4)>> (uint16_t)1;
??TIM_SelectOCxM_1:
        SUBS     R5,R1,#+4
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LSRS     R5,R5,#+1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     R4,R5,R4
// 2029 
// 2030     /* Reset the OCxM bits in the CCMRx register */
// 2031     *(__IO uint32_t *) tmp &= (uint32_t)~((uint32_t)TIM_CCMR1_OC2M);
        LDR      R5,[R4, #+0]
        BICS     R5,R5,#0x7000
        STR      R5,[R4, #+0]
// 2032     
// 2033     /* Configure the OCxM bits in the CCMRx register */
// 2034     *(__IO uint32_t *) tmp |= (uint16_t)(TIM_OCMode << 8);
        LDR      R5,[R4, #+0]
        LSLS     R6,R2,#+8
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ORRS     R5,R6,R5
        STR      R5,[R4, #+0]
// 2035   }
// 2036 }
??TIM_SelectOCxM_2:
        POP      {R4-R6}
        BX       LR               ;; return
// 2037 
// 2038 /**
// 2039   * @brief  Enables or Disables the TIMx Update event.
// 2040   * @param  TIMx: where x can be 1 to 17 to select the TIM peripheral.
// 2041   * @param  NewState: new state of the TIMx UDIS bit
// 2042   *   This parameter can be: ENABLE or DISABLE.
// 2043   * @retval None
// 2044   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2045 void TIM_UpdateDisableConfig(TIM_TypeDef* TIMx, FunctionalState NewState)
// 2046 {
// 2047   /* Check the parameters */
// 2048   assert_param(IS_TIM_ALL_PERIPH(TIMx));
// 2049   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 2050   if (NewState != DISABLE)
TIM_UpdateDisableConfig:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??TIM_UpdateDisableConfig_0
// 2051   {
// 2052     /* Set the Update Disable Bit */
// 2053     TIMx->CR1 |= TIM_CR1_UDIS;
        LDRH     R2,[R0, #+0]
        ORRS     R2,R2,#0x2
        STRH     R2,[R0, #+0]
        B.N      ??TIM_UpdateDisableConfig_1
// 2054   }
// 2055   else
// 2056   {
// 2057     /* Reset the Update Disable Bit */
// 2058     TIMx->CR1 &= (uint16_t)~((uint16_t)TIM_CR1_UDIS);
??TIM_UpdateDisableConfig_0:
        LDRH     R2,[R0, #+0]
        MOVW     R3,#+65533
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+0]
// 2059   }
// 2060 }
??TIM_UpdateDisableConfig_1:
        BX       LR               ;; return
// 2061 
// 2062 /**
// 2063   * @brief  Configures the TIMx Update Request Interrupt source.
// 2064   * @param  TIMx: where x can be 1 to 17 to select the TIM peripheral.
// 2065   * @param  TIM_UpdateSource: specifies the Update source.
// 2066   *   This parameter can be one of the following values:
// 2067   *     @arg TIM_UpdateSource_Regular: Source of update is the counter overflow/underflow
// 2068                                        or the setting of UG bit, or an update generation
// 2069                                        through the slave mode controller.
// 2070   *     @arg TIM_UpdateSource_Global: Source of update is counter overflow/underflow.
// 2071   * @retval None
// 2072   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2073 void TIM_UpdateRequestConfig(TIM_TypeDef* TIMx, uint16_t TIM_UpdateSource)
// 2074 {
// 2075   /* Check the parameters */
// 2076   assert_param(IS_TIM_ALL_PERIPH(TIMx));
// 2077   assert_param(IS_TIM_UPDATE_SOURCE(TIM_UpdateSource));
// 2078   if (TIM_UpdateSource != TIM_UpdateSource_Global)
TIM_UpdateRequestConfig:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??TIM_UpdateRequestConfig_0
// 2079   {
// 2080     /* Set the URS Bit */
// 2081     TIMx->CR1 |= TIM_CR1_URS;
        LDRH     R2,[R0, #+0]
        ORRS     R2,R2,#0x4
        STRH     R2,[R0, #+0]
        B.N      ??TIM_UpdateRequestConfig_1
// 2082   }
// 2083   else
// 2084   {
// 2085     /* Reset the URS Bit */
// 2086     TIMx->CR1 &= (uint16_t)~((uint16_t)TIM_CR1_URS);
??TIM_UpdateRequestConfig_0:
        LDRH     R2,[R0, #+0]
        MOVW     R3,#+65531
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+0]
// 2087   }
// 2088 }
??TIM_UpdateRequestConfig_1:
        BX       LR               ;; return
// 2089 
// 2090 /**
// 2091   * @brief  Enables or disables the TIMx's Hall sensor interface.
// 2092   * @param  TIMx: where x can be 1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 2093   * @param  NewState: new state of the TIMx Hall sensor interface.
// 2094   *   This parameter can be: ENABLE or DISABLE.
// 2095   * @retval None
// 2096   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2097 void TIM_SelectHallSensor(TIM_TypeDef* TIMx, FunctionalState NewState)
// 2098 {
// 2099   /* Check the parameters */
// 2100   assert_param(IS_TIM_LIST6_PERIPH(TIMx));
// 2101   assert_param(IS_FUNCTIONAL_STATE(NewState));
// 2102   if (NewState != DISABLE)
TIM_SelectHallSensor:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??TIM_SelectHallSensor_0
// 2103   {
// 2104     /* Set the TI1S Bit */
// 2105     TIMx->CR2 |= TIM_CR2_TI1S;
        LDRH     R2,[R0, #+4]
        ORRS     R2,R2,#0x80
        STRH     R2,[R0, #+4]
        B.N      ??TIM_SelectHallSensor_1
// 2106   }
// 2107   else
// 2108   {
// 2109     /* Reset the TI1S Bit */
// 2110     TIMx->CR2 &= (uint16_t)~((uint16_t)TIM_CR2_TI1S);
??TIM_SelectHallSensor_0:
        LDRH     R2,[R0, #+4]
        MOVW     R3,#+65407
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+4]
// 2111   }
// 2112 }
??TIM_SelectHallSensor_1:
        BX       LR               ;; return
// 2113 
// 2114 /**
// 2115   * @brief  Selects the TIMx's One Pulse Mode.
// 2116   * @param  TIMx: where x can be 1 to 17 to select the TIM peripheral.
// 2117   * @param  TIM_OPMode: specifies the OPM Mode to be used.
// 2118   *   This parameter can be one of the following values:
// 2119   *     @arg TIM_OPMode_Single
// 2120   *     @arg TIM_OPMode_Repetitive
// 2121   * @retval None
// 2122   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2123 void TIM_SelectOnePulseMode(TIM_TypeDef* TIMx, uint16_t TIM_OPMode)
// 2124 {
// 2125   /* Check the parameters */
// 2126   assert_param(IS_TIM_ALL_PERIPH(TIMx));
// 2127   assert_param(IS_TIM_OPM_MODE(TIM_OPMode));
// 2128   /* Reset the OPM Bit */
// 2129   TIMx->CR1 &= (uint16_t)~((uint16_t)TIM_CR1_OPM);
TIM_SelectOnePulseMode:
        LDRH     R2,[R0, #+0]
        MOVW     R3,#+65527
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+0]
// 2130   /* Configure the OPM Mode */
// 2131   TIMx->CR1 |= TIM_OPMode;
        LDRH     R2,[R0, #+0]
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+0]
// 2132 }
        BX       LR               ;; return
// 2133 
// 2134 /**
// 2135   * @brief  Selects the TIMx Trigger Output Mode.
// 2136   * @param  TIMx: where x can be 1, 2, 3, 4, 5, 6, 7, 8, 9, 12 or 15 to select the TIM peripheral.
// 2137   * @param  TIM_TRGOSource: specifies the Trigger Output source.
// 2138   *   This paramter can be one of the following values:
// 2139   *
// 2140   *  - For all TIMx
// 2141   *     @arg TIM_TRGOSource_Reset:  The UG bit in the TIM_EGR register is used as the trigger output (TRGO).
// 2142   *     @arg TIM_TRGOSource_Enable: The Counter Enable CEN is used as the trigger output (TRGO).
// 2143   *     @arg TIM_TRGOSource_Update: The update event is selected as the trigger output (TRGO).
// 2144   *
// 2145   *  - For all TIMx except TIM6 and TIM7
// 2146   *     @arg TIM_TRGOSource_OC1: The trigger output sends a positive pulse when the CC1IF flag
// 2147   *                              is to be set, as soon as a capture or compare match occurs (TRGO).
// 2148   *     @arg TIM_TRGOSource_OC1Ref: OC1REF signal is used as the trigger output (TRGO).
// 2149   *     @arg TIM_TRGOSource_OC2Ref: OC2REF signal is used as the trigger output (TRGO).
// 2150   *     @arg TIM_TRGOSource_OC3Ref: OC3REF signal is used as the trigger output (TRGO).
// 2151   *     @arg TIM_TRGOSource_OC4Ref: OC4REF signal is used as the trigger output (TRGO).
// 2152   *
// 2153   * @retval None
// 2154   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2155 void TIM_SelectOutputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_TRGOSource)
// 2156 {
// 2157   /* Check the parameters */
// 2158   assert_param(IS_TIM_LIST7_PERIPH(TIMx));
// 2159   assert_param(IS_TIM_TRGO_SOURCE(TIM_TRGOSource));
// 2160   /* Reset the MMS Bits */
// 2161   TIMx->CR2 &= (uint16_t)~((uint16_t)TIM_CR2_MMS);
TIM_SelectOutputTrigger:
        LDRH     R2,[R0, #+4]
        MOVW     R3,#+65423
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+4]
// 2162   /* Select the TRGO source */
// 2163   TIMx->CR2 |=  TIM_TRGOSource;
        LDRH     R2,[R0, #+4]
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+4]
// 2164 }
        BX       LR               ;; return
// 2165 
// 2166 /**
// 2167   * @brief  Selects the TIMx Slave Mode.
// 2168   * @param  TIMx: where x can be 1, 2, 3, 4, 5, 8, 9, 12 or 15 to select the TIM peripheral.
// 2169   * @param  TIM_SlaveMode: specifies the Timer Slave Mode.
// 2170   *   This parameter can be one of the following values:
// 2171   *     @arg TIM_SlaveMode_Reset: Rising edge of the selected trigger signal (TRGI) re-initializes
// 2172   *                               the counter and triggers an update of the registers.
// 2173   *     @arg TIM_SlaveMode_Gated:     The counter clock is enabled when the trigger signal (TRGI) is high.
// 2174   *     @arg TIM_SlaveMode_Trigger:   The counter starts at a rising edge of the trigger TRGI.
// 2175   *     @arg TIM_SlaveMode_External1: Rising edges of the selected trigger (TRGI) clock the counter.
// 2176   * @retval None
// 2177   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2178 void TIM_SelectSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_SlaveMode)
// 2179 {
// 2180   /* Check the parameters */
// 2181   assert_param(IS_TIM_LIST6_PERIPH(TIMx));
// 2182   assert_param(IS_TIM_SLAVE_MODE(TIM_SlaveMode));
// 2183  /* Reset the SMS Bits */
// 2184   TIMx->SMCR &= (uint16_t)~((uint16_t)TIM_SMCR_SMS);
TIM_SelectSlaveMode:
        LDRH     R2,[R0, #+8]
        MOVW     R3,#+65528
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+8]
// 2185   /* Select the Slave Mode */
// 2186   TIMx->SMCR |= TIM_SlaveMode;
        LDRH     R2,[R0, #+8]
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+8]
// 2187 }
        BX       LR               ;; return
// 2188 
// 2189 /**
// 2190   * @brief  Sets or Resets the TIMx Master/Slave Mode.
// 2191   * @param  TIMx: where x can be 1, 2, 3, 4, 5, 8, 9, 12 or 15 to select the TIM peripheral.
// 2192   * @param  TIM_MasterSlaveMode: specifies the Timer Master Slave Mode.
// 2193   *   This parameter can be one of the following values:
// 2194   *     @arg TIM_MasterSlaveMode_Enable: synchronization between the current timer
// 2195   *                                      and its slaves (through TRGO).
// 2196   *     @arg TIM_MasterSlaveMode_Disable: No action
// 2197   * @retval None
// 2198   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2199 void TIM_SelectMasterSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_MasterSlaveMode)
// 2200 {
// 2201   /* Check the parameters */
// 2202   assert_param(IS_TIM_LIST6_PERIPH(TIMx));
// 2203   assert_param(IS_TIM_MSM_STATE(TIM_MasterSlaveMode));
// 2204   /* Reset the MSM Bit */
// 2205   TIMx->SMCR &= (uint16_t)~((uint16_t)TIM_SMCR_MSM);
TIM_SelectMasterSlaveMode:
        LDRH     R2,[R0, #+8]
        MOVW     R3,#+65407
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+8]
// 2206   
// 2207   /* Set or Reset the MSM Bit */
// 2208   TIMx->SMCR |= TIM_MasterSlaveMode;
        LDRH     R2,[R0, #+8]
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+8]
// 2209 }
        BX       LR               ;; return
// 2210 
// 2211 /**
// 2212   * @brief  Sets the TIMx Counter Register value
// 2213   * @param  TIMx: where x can be 1 to 17 to select the TIM peripheral.
// 2214   * @param  Counter: specifies the Counter register new value.
// 2215   * @retval None
// 2216   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2217 void TIM_SetCounter(TIM_TypeDef* TIMx, uint16_t Counter)
// 2218 {
// 2219   /* Check the parameters */
// 2220   assert_param(IS_TIM_ALL_PERIPH(TIMx));
// 2221   /* Set the Counter Register value */
// 2222   TIMx->CNT = Counter;
TIM_SetCounter:
        STRH     R1,[R0, #+36]
// 2223 }
        BX       LR               ;; return
// 2224 
// 2225 /**
// 2226   * @brief  Sets the TIMx Autoreload Register value
// 2227   * @param  TIMx: where x can be 1 to 17 to select the TIM peripheral.
// 2228   * @param  Autoreload: specifies the Autoreload register new value.
// 2229   * @retval None
// 2230   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2231 void TIM_SetAutoreload(TIM_TypeDef* TIMx, uint16_t Autoreload)
// 2232 {
// 2233   /* Check the parameters */
// 2234   assert_param(IS_TIM_ALL_PERIPH(TIMx));
// 2235   /* Set the Autoreload Register value */
// 2236   TIMx->ARR = Autoreload;
TIM_SetAutoreload:
        STRH     R1,[R0, #+44]
// 2237 }
        BX       LR               ;; return
// 2238 
// 2239 /**
// 2240   * @brief  Sets the TIMx Capture Compare1 Register value
// 2241   * @param  TIMx: where x can be 1 to 17 except 6 and 7 to select the TIM peripheral.
// 2242   * @param  Compare1: specifies the Capture Compare1 register new value.
// 2243   * @retval None
// 2244   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2245 void TIM_SetCompare1(TIM_TypeDef* TIMx, uint16_t Compare1)
// 2246 {
// 2247   /* Check the parameters */
// 2248   assert_param(IS_TIM_LIST8_PERIPH(TIMx));
// 2249   /* Set the Capture Compare1 Register value */
// 2250   TIMx->CCR1 = Compare1;
TIM_SetCompare1:
        STRH     R1,[R0, #+52]
// 2251 }
        BX       LR               ;; return
// 2252 
// 2253 /**
// 2254   * @brief  Sets the TIMx Capture Compare2 Register value
// 2255   * @param  TIMx: where x can be 1, 2, 3, 4, 5, 8, 9, 12 or 15 to select the TIM peripheral.
// 2256   * @param  Compare2: specifies the Capture Compare2 register new value.
// 2257   * @retval None
// 2258   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2259 void TIM_SetCompare2(TIM_TypeDef* TIMx, uint16_t Compare2)
// 2260 {
// 2261   /* Check the parameters */
// 2262   assert_param(IS_TIM_LIST6_PERIPH(TIMx));
// 2263   /* Set the Capture Compare2 Register value */
// 2264   TIMx->CCR2 = Compare2;
TIM_SetCompare2:
        STRH     R1,[R0, #+56]
// 2265 }
        BX       LR               ;; return
// 2266 
// 2267 /**
// 2268   * @brief  Sets the TIMx Capture Compare3 Register value
// 2269   * @param  TIMx: where x can be 1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 2270   * @param  Compare3: specifies the Capture Compare3 register new value.
// 2271   * @retval None
// 2272   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2273 void TIM_SetCompare3(TIM_TypeDef* TIMx, uint16_t Compare3)
// 2274 {
// 2275   /* Check the parameters */
// 2276   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 2277   /* Set the Capture Compare3 Register value */
// 2278   TIMx->CCR3 = Compare3;
TIM_SetCompare3:
        STRH     R1,[R0, #+60]
// 2279 }
        BX       LR               ;; return
// 2280 
// 2281 /**
// 2282   * @brief  Sets the TIMx Capture Compare4 Register value
// 2283   * @param  TIMx: where x can be 1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 2284   * @param  Compare4: specifies the Capture Compare4 register new value.
// 2285   * @retval None
// 2286   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2287 void TIM_SetCompare4(TIM_TypeDef* TIMx, uint16_t Compare4)
// 2288 {
// 2289   /* Check the parameters */
// 2290   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 2291   /* Set the Capture Compare4 Register value */
// 2292   TIMx->CCR4 = Compare4;
TIM_SetCompare4:
        STRH     R1,[R0, #+64]
// 2293 }
        BX       LR               ;; return
// 2294 
// 2295 /**
// 2296   * @brief  Sets the TIMx Input Capture 1 prescaler.
// 2297   * @param  TIMx: where x can be 1 to 17 except 6 and 7 to select the TIM peripheral.
// 2298   * @param  TIM_ICPSC: specifies the Input Capture1 prescaler new value.
// 2299   *   This parameter can be one of the following values:
// 2300   *     @arg TIM_ICPSC_DIV1: no prescaler
// 2301   *     @arg TIM_ICPSC_DIV2: capture is done once every 2 events
// 2302   *     @arg TIM_ICPSC_DIV4: capture is done once every 4 events
// 2303   *     @arg TIM_ICPSC_DIV8: capture is done once every 8 events
// 2304   * @retval None
// 2305   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2306 void TIM_SetIC1Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
// 2307 {
// 2308   /* Check the parameters */
// 2309   assert_param(IS_TIM_LIST8_PERIPH(TIMx));
// 2310   assert_param(IS_TIM_IC_PRESCALER(TIM_ICPSC));
// 2311   /* Reset the IC1PSC Bits */
// 2312   TIMx->CCMR1 &= (uint16_t)~((uint16_t)TIM_CCMR1_IC1PSC);
TIM_SetIC1Prescaler:
        LDRH     R2,[R0, #+24]
        MOVW     R3,#+65523
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+24]
// 2313   /* Set the IC1PSC value */
// 2314   TIMx->CCMR1 |= TIM_ICPSC;
        LDRH     R2,[R0, #+24]
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+24]
// 2315 }
        BX       LR               ;; return
// 2316 
// 2317 /**
// 2318   * @brief  Sets the TIMx Input Capture 2 prescaler.
// 2319   * @param  TIMx: where x can be 1, 2, 3, 4, 5, 8, 9, 12 or 15 to select the TIM peripheral.
// 2320   * @param  TIM_ICPSC: specifies the Input Capture2 prescaler new value.
// 2321   *   This parameter can be one of the following values:
// 2322   *     @arg TIM_ICPSC_DIV1: no prescaler
// 2323   *     @arg TIM_ICPSC_DIV2: capture is done once every 2 events
// 2324   *     @arg TIM_ICPSC_DIV4: capture is done once every 4 events
// 2325   *     @arg TIM_ICPSC_DIV8: capture is done once every 8 events
// 2326   * @retval None
// 2327   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2328 void TIM_SetIC2Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
// 2329 {
// 2330   /* Check the parameters */
// 2331   assert_param(IS_TIM_LIST6_PERIPH(TIMx));
// 2332   assert_param(IS_TIM_IC_PRESCALER(TIM_ICPSC));
// 2333   /* Reset the IC2PSC Bits */
// 2334   TIMx->CCMR1 &= (uint16_t)~((uint16_t)TIM_CCMR1_IC2PSC);
TIM_SetIC2Prescaler:
        LDRH     R2,[R0, #+24]
        MOVW     R3,#+62463
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+24]
// 2335   /* Set the IC2PSC value */
// 2336   TIMx->CCMR1 |= (uint16_t)(TIM_ICPSC << 8);
        LDRH     R2,[R0, #+24]
        ORRS     R2,R2,R1, LSL #+8
        STRH     R2,[R0, #+24]
// 2337 }
        BX       LR               ;; return
// 2338 
// 2339 /**
// 2340   * @brief  Sets the TIMx Input Capture 3 prescaler.
// 2341   * @param  TIMx: where x can be 1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 2342   * @param  TIM_ICPSC: specifies the Input Capture3 prescaler new value.
// 2343   *   This parameter can be one of the following values:
// 2344   *     @arg TIM_ICPSC_DIV1: no prescaler
// 2345   *     @arg TIM_ICPSC_DIV2: capture is done once every 2 events
// 2346   *     @arg TIM_ICPSC_DIV4: capture is done once every 4 events
// 2347   *     @arg TIM_ICPSC_DIV8: capture is done once every 8 events
// 2348   * @retval None
// 2349   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2350 void TIM_SetIC3Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
// 2351 {
// 2352   /* Check the parameters */
// 2353   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 2354   assert_param(IS_TIM_IC_PRESCALER(TIM_ICPSC));
// 2355   /* Reset the IC3PSC Bits */
// 2356   TIMx->CCMR2 &= (uint16_t)~((uint16_t)TIM_CCMR2_IC3PSC);
TIM_SetIC3Prescaler:
        LDRH     R2,[R0, #+28]
        MOVW     R3,#+65523
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+28]
// 2357   /* Set the IC3PSC value */
// 2358   TIMx->CCMR2 |= TIM_ICPSC;
        LDRH     R2,[R0, #+28]
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+28]
// 2359 }
        BX       LR               ;; return
// 2360 
// 2361 /**
// 2362   * @brief  Sets the TIMx Input Capture 4 prescaler.
// 2363   * @param  TIMx: where x can be 1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 2364   * @param  TIM_ICPSC: specifies the Input Capture4 prescaler new value.
// 2365   *   This parameter can be one of the following values:
// 2366   *     @arg TIM_ICPSC_DIV1: no prescaler
// 2367   *     @arg TIM_ICPSC_DIV2: capture is done once every 2 events
// 2368   *     @arg TIM_ICPSC_DIV4: capture is done once every 4 events
// 2369   *     @arg TIM_ICPSC_DIV8: capture is done once every 8 events
// 2370   * @retval None
// 2371   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2372 void TIM_SetIC4Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
// 2373 {  
// 2374   /* Check the parameters */
// 2375   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 2376   assert_param(IS_TIM_IC_PRESCALER(TIM_ICPSC));
// 2377   /* Reset the IC4PSC Bits */
// 2378   TIMx->CCMR2 &= (uint16_t)~((uint16_t)TIM_CCMR2_IC4PSC);
TIM_SetIC4Prescaler:
        LDRH     R2,[R0, #+28]
        MOVW     R3,#+62463
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+28]
// 2379   /* Set the IC4PSC value */
// 2380   TIMx->CCMR2 |= (uint16_t)(TIM_ICPSC << 8);
        LDRH     R2,[R0, #+28]
        ORRS     R2,R2,R1, LSL #+8
        STRH     R2,[R0, #+28]
// 2381 }
        BX       LR               ;; return
// 2382 
// 2383 /**
// 2384   * @brief  Sets the TIMx Clock Division value.
// 2385   * @param  TIMx: where x can be  1 to 17 except 6 and 7 to select 
// 2386   *   the TIM peripheral.
// 2387   * @param  TIM_CKD: specifies the clock division value.
// 2388   *   This parameter can be one of the following value:
// 2389   *     @arg TIM_CKD_DIV1: TDTS = Tck_tim
// 2390   *     @arg TIM_CKD_DIV2: TDTS = 2*Tck_tim
// 2391   *     @arg TIM_CKD_DIV4: TDTS = 4*Tck_tim
// 2392   * @retval None
// 2393   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2394 void TIM_SetClockDivision(TIM_TypeDef* TIMx, uint16_t TIM_CKD)
// 2395 {
// 2396   /* Check the parameters */
// 2397   assert_param(IS_TIM_LIST8_PERIPH(TIMx));
// 2398   assert_param(IS_TIM_CKD_DIV(TIM_CKD));
// 2399   /* Reset the CKD Bits */
// 2400   TIMx->CR1 &= (uint16_t)~((uint16_t)TIM_CR1_CKD);
TIM_SetClockDivision:
        LDRH     R2,[R0, #+0]
        MOVW     R3,#+64767
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+0]
// 2401   /* Set the CKD value */
// 2402   TIMx->CR1 |= TIM_CKD;
        LDRH     R2,[R0, #+0]
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+0]
// 2403 }
        BX       LR               ;; return
// 2404 
// 2405 /**
// 2406   * @brief  Gets the TIMx Input Capture 1 value.
// 2407   * @param  TIMx: where x can be 1 to 17 except 6 and 7 to select the TIM peripheral.
// 2408   * @retval Capture Compare 1 Register value.
// 2409   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2410 uint16_t TIM_GetCapture1(TIM_TypeDef* TIMx)
// 2411 {
// 2412   /* Check the parameters */
// 2413   assert_param(IS_TIM_LIST8_PERIPH(TIMx));
// 2414   /* Get the Capture 1 Register value */
// 2415   return TIMx->CCR1;
TIM_GetCapture1:
        LDRH     R0,[R0, #+52]
        BX       LR               ;; return
// 2416 }
// 2417 
// 2418 /**
// 2419   * @brief  Gets the TIMx Input Capture 2 value.
// 2420   * @param  TIMx: where x can be 1, 2, 3, 4, 5, 8, 9, 12 or 15 to select the TIM peripheral.
// 2421   * @retval Capture Compare 2 Register value.
// 2422   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2423 uint16_t TIM_GetCapture2(TIM_TypeDef* TIMx)
// 2424 {
// 2425   /* Check the parameters */
// 2426   assert_param(IS_TIM_LIST6_PERIPH(TIMx));
// 2427   /* Get the Capture 2 Register value */
// 2428   return TIMx->CCR2;
TIM_GetCapture2:
        LDRH     R0,[R0, #+56]
        BX       LR               ;; return
// 2429 }
// 2430 
// 2431 /**
// 2432   * @brief  Gets the TIMx Input Capture 3 value.
// 2433   * @param  TIMx: where x can be 1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 2434   * @retval Capture Compare 3 Register value.
// 2435   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2436 uint16_t TIM_GetCapture3(TIM_TypeDef* TIMx)
// 2437 {
// 2438   /* Check the parameters */
// 2439   assert_param(IS_TIM_LIST3_PERIPH(TIMx)); 
// 2440   /* Get the Capture 3 Register value */
// 2441   return TIMx->CCR3;
TIM_GetCapture3:
        LDRH     R0,[R0, #+60]
        BX       LR               ;; return
// 2442 }
// 2443 
// 2444 /**
// 2445   * @brief  Gets the TIMx Input Capture 4 value.
// 2446   * @param  TIMx: where x can be 1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 2447   * @retval Capture Compare 4 Register value.
// 2448   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2449 uint16_t TIM_GetCapture4(TIM_TypeDef* TIMx)
// 2450 {
// 2451   /* Check the parameters */
// 2452   assert_param(IS_TIM_LIST3_PERIPH(TIMx));
// 2453   /* Get the Capture 4 Register value */
// 2454   return TIMx->CCR4;
TIM_GetCapture4:
        LDRH     R0,[R0, #+64]
        BX       LR               ;; return
// 2455 }
// 2456 
// 2457 /**
// 2458   * @brief  Gets the TIMx Counter value.
// 2459   * @param  TIMx: where x can be 1 to 17 to select the TIM peripheral.
// 2460   * @retval Counter Register value.
// 2461   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2462 uint16_t TIM_GetCounter(TIM_TypeDef* TIMx)
// 2463 {
// 2464   /* Check the parameters */
// 2465   assert_param(IS_TIM_ALL_PERIPH(TIMx));
// 2466   /* Get the Counter Register value */
// 2467   return TIMx->CNT;
TIM_GetCounter:
        LDRH     R0,[R0, #+36]
        BX       LR               ;; return
// 2468 }
// 2469 
// 2470 /**
// 2471   * @brief  Gets the TIMx Prescaler value.
// 2472   * @param  TIMx: where x can be 1 to 17 to select the TIM peripheral.
// 2473   * @retval Prescaler Register value.
// 2474   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2475 uint16_t TIM_GetPrescaler(TIM_TypeDef* TIMx)
// 2476 {
// 2477   /* Check the parameters */
// 2478   assert_param(IS_TIM_ALL_PERIPH(TIMx));
// 2479   /* Get the Prescaler Register value */
// 2480   return TIMx->PSC;
TIM_GetPrescaler:
        LDRH     R0,[R0, #+40]
        BX       LR               ;; return
// 2481 }
// 2482 
// 2483 /**
// 2484   * @brief  Checks whether the specified TIM flag is set or not.
// 2485   * @param  TIMx: where x can be 1 to 17 to select the TIM peripheral.
// 2486   * @param  TIM_FLAG: specifies the flag to check.
// 2487   *   This parameter can be one of the following values:
// 2488   *     @arg TIM_FLAG_Update: TIM update Flag
// 2489   *     @arg TIM_FLAG_CC1: TIM Capture Compare 1 Flag
// 2490   *     @arg TIM_FLAG_CC2: TIM Capture Compare 2 Flag
// 2491   *     @arg TIM_FLAG_CC3: TIM Capture Compare 3 Flag
// 2492   *     @arg TIM_FLAG_CC4: TIM Capture Compare 4 Flag
// 2493   *     @arg TIM_FLAG_COM: TIM Commutation Flag
// 2494   *     @arg TIM_FLAG_Trigger: TIM Trigger Flag
// 2495   *     @arg TIM_FLAG_Break: TIM Break Flag
// 2496   *     @arg TIM_FLAG_CC1OF: TIM Capture Compare 1 overcapture Flag
// 2497   *     @arg TIM_FLAG_CC2OF: TIM Capture Compare 2 overcapture Flag
// 2498   *     @arg TIM_FLAG_CC3OF: TIM Capture Compare 3 overcapture Flag
// 2499   *     @arg TIM_FLAG_CC4OF: TIM Capture Compare 4 overcapture Flag
// 2500   * @note
// 2501   *   - TIM6 and TIM7 can have only one update flag. 
// 2502   *   - TIM9, TIM12 and TIM15 can have only TIM_FLAG_Update, TIM_FLAG_CC1,
// 2503   *      TIM_FLAG_CC2 or TIM_FLAG_Trigger. 
// 2504   *   - TIM10, TIM11, TIM13, TIM14, TIM16 and TIM17 can have TIM_FLAG_Update or TIM_FLAG_CC1.   
// 2505   *   - TIM_FLAG_Break is used only with TIM1, TIM8 and TIM15. 
// 2506   *   - TIM_FLAG_COM is used only with TIM1, TIM8, TIM15, TIM16 and TIM17.    
// 2507   * @retval The new state of TIM_FLAG (SET or RESET).
// 2508   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2509 FlagStatus TIM_GetFlagStatus(TIM_TypeDef* TIMx, uint16_t TIM_FLAG)
// 2510 { 
TIM_GetFlagStatus:
        MOVS     R2,R0
// 2511   ITStatus bitstatus = RESET;  
        MOVS     R0,#+0
// 2512   /* Check the parameters */
// 2513   assert_param(IS_TIM_ALL_PERIPH(TIMx));
// 2514   assert_param(IS_TIM_GET_FLAG(TIM_FLAG));
// 2515   
// 2516   if ((TIMx->SR & TIM_FLAG) != (uint16_t)RESET)
        LDRH     R3,[R2, #+16]
        TST      R3,R1
        BEQ.N    ??TIM_GetFlagStatus_0
// 2517   {
// 2518     bitstatus = SET;
        MOVS     R3,#+1
        MOVS     R0,R3
        B.N      ??TIM_GetFlagStatus_1
// 2519   }
// 2520   else
// 2521   {
// 2522     bitstatus = RESET;
??TIM_GetFlagStatus_0:
        MOVS     R3,#+0
        MOVS     R0,R3
// 2523   }
// 2524   return bitstatus;
??TIM_GetFlagStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
// 2525 }
// 2526 
// 2527 /**
// 2528   * @brief  Clears the TIMx's pending flags.
// 2529   * @param  TIMx: where x can be 1 to 17 to select the TIM peripheral.
// 2530   * @param  TIM_FLAG: specifies the flag bit to clear.
// 2531   *   This parameter can be any combination of the following values:
// 2532   *     @arg TIM_FLAG_Update: TIM update Flag
// 2533   *     @arg TIM_FLAG_CC1: TIM Capture Compare 1 Flag
// 2534   *     @arg TIM_FLAG_CC2: TIM Capture Compare 2 Flag
// 2535   *     @arg TIM_FLAG_CC3: TIM Capture Compare 3 Flag
// 2536   *     @arg TIM_FLAG_CC4: TIM Capture Compare 4 Flag
// 2537   *     @arg TIM_FLAG_COM: TIM Commutation Flag
// 2538   *     @arg TIM_FLAG_Trigger: TIM Trigger Flag
// 2539   *     @arg TIM_FLAG_Break: TIM Break Flag
// 2540   *     @arg TIM_FLAG_CC1OF: TIM Capture Compare 1 overcapture Flag
// 2541   *     @arg TIM_FLAG_CC2OF: TIM Capture Compare 2 overcapture Flag
// 2542   *     @arg TIM_FLAG_CC3OF: TIM Capture Compare 3 overcapture Flag
// 2543   *     @arg TIM_FLAG_CC4OF: TIM Capture Compare 4 overcapture Flag
// 2544   * @note
// 2545   *   - TIM6 and TIM7 can have only one update flag. 
// 2546   *   - TIM9, TIM12 and TIM15 can have only TIM_FLAG_Update, TIM_FLAG_CC1,
// 2547   *      TIM_FLAG_CC2 or TIM_FLAG_Trigger. 
// 2548   *   - TIM10, TIM11, TIM13, TIM14, TIM16 and TIM17 can have TIM_FLAG_Update or TIM_FLAG_CC1.   
// 2549   *   - TIM_FLAG_Break is used only with TIM1, TIM8 and TIM15. 
// 2550   *   - TIM_FLAG_COM is used only with TIM1, TIM8, TIM15, TIM16 and TIM17.   
// 2551   * @retval None
// 2552   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2553 void TIM_ClearFlag(TIM_TypeDef* TIMx, uint16_t TIM_FLAG)
// 2554 {  
// 2555   /* Check the parameters */
// 2556   assert_param(IS_TIM_ALL_PERIPH(TIMx));
// 2557   assert_param(IS_TIM_CLEAR_FLAG(TIM_FLAG));
// 2558    
// 2559   /* Clear the flags */
// 2560   TIMx->SR = (uint16_t)~TIM_FLAG;
TIM_ClearFlag:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R2,R1
        STRH     R2,[R0, #+16]
// 2561 }
        BX       LR               ;; return
// 2562 
// 2563 /**
// 2564   * @brief  Checks whether the TIM interrupt has occurred or not.
// 2565   * @param  TIMx: where x can be 1 to 17 to select the TIM peripheral.
// 2566   * @param  TIM_IT: specifies the TIM interrupt source to check.
// 2567   *   This parameter can be one of the following values:
// 2568   *     @arg TIM_IT_Update: TIM update Interrupt source
// 2569   *     @arg TIM_IT_CC1: TIM Capture Compare 1 Interrupt source
// 2570   *     @arg TIM_IT_CC2: TIM Capture Compare 2 Interrupt source
// 2571   *     @arg TIM_IT_CC3: TIM Capture Compare 3 Interrupt source
// 2572   *     @arg TIM_IT_CC4: TIM Capture Compare 4 Interrupt source
// 2573   *     @arg TIM_IT_COM: TIM Commutation Interrupt source
// 2574   *     @arg TIM_IT_Trigger: TIM Trigger Interrupt source
// 2575   *     @arg TIM_IT_Break: TIM Break Interrupt source
// 2576   * @note
// 2577   *   - TIM6 and TIM7 can generate only an update interrupt.
// 2578   *   - TIM9, TIM12 and TIM15 can have only TIM_IT_Update, TIM_IT_CC1,
// 2579   *      TIM_IT_CC2 or TIM_IT_Trigger. 
// 2580   *   - TIM10, TIM11, TIM13, TIM14, TIM16 and TIM17 can have TIM_IT_Update or TIM_IT_CC1.   
// 2581   *   - TIM_IT_Break is used only with TIM1, TIM8 and TIM15. 
// 2582   *   - TIM_IT_COM is used only with TIM1, TIM8, TIM15, TIM16 and TIM17.  
// 2583   * @retval The new state of the TIM_IT(SET or RESET).
// 2584   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2585 ITStatus TIM_GetITStatus(TIM_TypeDef* TIMx, uint16_t TIM_IT)
// 2586 {
TIM_GetITStatus:
        PUSH     {R4,R5}
        MOVS     R2,R0
// 2587   ITStatus bitstatus = RESET;  
        MOVS     R0,#+0
// 2588   uint16_t itstatus = 0x0, itenable = 0x0;
        MOVS     R3,#+0
        MOVS     R4,#+0
// 2589   /* Check the parameters */
// 2590   assert_param(IS_TIM_ALL_PERIPH(TIMx));
// 2591   assert_param(IS_TIM_GET_IT(TIM_IT));
// 2592    
// 2593   itstatus = TIMx->SR & TIM_IT;
        LDRH     R5,[R2, #+16]
        ANDS     R5,R1,R5
        MOVS     R3,R5
// 2594   
// 2595   itenable = TIMx->DIER & TIM_IT;
        LDRH     R5,[R2, #+12]
        ANDS     R5,R1,R5
        MOVS     R4,R5
// 2596   if ((itstatus != (uint16_t)RESET) && (itenable != (uint16_t)RESET))
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        CMP      R3,#+0
        BEQ.N    ??TIM_GetITStatus_0
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+0
        BEQ.N    ??TIM_GetITStatus_0
// 2597   {
// 2598     bitstatus = SET;
        MOVS     R5,#+1
        MOVS     R0,R5
        B.N      ??TIM_GetITStatus_1
// 2599   }
// 2600   else
// 2601   {
// 2602     bitstatus = RESET;
??TIM_GetITStatus_0:
        MOVS     R5,#+0
        MOVS     R0,R5
// 2603   }
// 2604   return bitstatus;
??TIM_GetITStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,R5}
        BX       LR               ;; return
// 2605 }
// 2606 
// 2607 /**
// 2608   * @brief  Clears the TIMx's interrupt pending bits.
// 2609   * @param  TIMx: where x can be 1 to 17 to select the TIM peripheral.
// 2610   * @param  TIM_IT: specifies the pending bit to clear.
// 2611   *   This parameter can be any combination of the following values:
// 2612   *     @arg TIM_IT_Update: TIM1 update Interrupt source
// 2613   *     @arg TIM_IT_CC1: TIM Capture Compare 1 Interrupt source
// 2614   *     @arg TIM_IT_CC2: TIM Capture Compare 2 Interrupt source
// 2615   *     @arg TIM_IT_CC3: TIM Capture Compare 3 Interrupt source
// 2616   *     @arg TIM_IT_CC4: TIM Capture Compare 4 Interrupt source
// 2617   *     @arg TIM_IT_COM: TIM Commutation Interrupt source
// 2618   *     @arg TIM_IT_Trigger: TIM Trigger Interrupt source
// 2619   *     @arg TIM_IT_Break: TIM Break Interrupt source
// 2620   * @note
// 2621   *   - TIM6 and TIM7 can generate only an update interrupt.
// 2622   *   - TIM9, TIM12 and TIM15 can have only TIM_IT_Update, TIM_IT_CC1,
// 2623   *      TIM_IT_CC2 or TIM_IT_Trigger. 
// 2624   *   - TIM10, TIM11, TIM13, TIM14, TIM16 and TIM17 can have TIM_IT_Update or TIM_IT_CC1.   
// 2625   *   - TIM_IT_Break is used only with TIM1, TIM8 and TIM15. 
// 2626   *   - TIM_IT_COM is used only with TIM1, TIM8, TIM15, TIM16 and TIM17.    
// 2627   * @retval None
// 2628   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2629 void TIM_ClearITPendingBit(TIM_TypeDef* TIMx, uint16_t TIM_IT)
// 2630 {
// 2631   /* Check the parameters */
// 2632   assert_param(IS_TIM_ALL_PERIPH(TIMx));
// 2633   assert_param(IS_TIM_IT(TIM_IT));
// 2634   /* Clear the IT pending Bit */
// 2635   TIMx->SR = (uint16_t)~TIM_IT;
TIM_ClearITPendingBit:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R2,R1
        STRH     R2,[R0, #+16]
// 2636 }
        BX       LR               ;; return
// 2637 
// 2638 /**
// 2639   * @brief  Configure the TI1 as Input.
// 2640   * @param  TIMx: where x can be 1 to 17 except 6 and 7 to select the TIM peripheral.
// 2641   * @param  TIM_ICPolarity : The Input Polarity.
// 2642   *   This parameter can be one of the following values:
// 2643   *     @arg TIM_ICPolarity_Rising
// 2644   *     @arg TIM_ICPolarity_Falling
// 2645   * @param  TIM_ICSelection: specifies the input to be used.
// 2646   *   This parameter can be one of the following values:
// 2647   *     @arg TIM_ICSelection_DirectTI: TIM Input 1 is selected to be connected to IC1.
// 2648   *     @arg TIM_ICSelection_IndirectTI: TIM Input 1 is selected to be connected to IC2.
// 2649   *     @arg TIM_ICSelection_TRC: TIM Input 1 is selected to be connected to TRC.
// 2650   * @param  TIM_ICFilter: Specifies the Input Capture Filter.
// 2651   *   This parameter must be a value between 0x00 and 0x0F.
// 2652   * @retval None
// 2653   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2654 static void TI1_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
// 2655                        uint16_t TIM_ICFilter)
// 2656 {
TI1_Config:
        PUSH     {R4-R7}
// 2657   uint16_t tmpccmr1 = 0, tmpccer = 0;
        MOVS     R5,#+0
        MOVS     R4,#+0
// 2658   /* Disable the Channel 1: Reset the CC1E Bit */
// 2659   TIMx->CCER &= (uint16_t)~((uint16_t)TIM_CCER_CC1E);
        LDRH     R6,[R0, #+32]
        MOVW     R7,#+65534
        ANDS     R6,R7,R6
        STRH     R6,[R0, #+32]
// 2660   tmpccmr1 = TIMx->CCMR1;
        LDRH     R6,[R0, #+24]
        MOVS     R5,R6
// 2661   tmpccer = TIMx->CCER;
        LDRH     R6,[R0, #+32]
        MOVS     R4,R6
// 2662   /* Select the Input and set the filter */
// 2663   tmpccmr1 &= (uint16_t)(((uint16_t)~((uint16_t)TIM_CCMR1_CC1S)) & ((uint16_t)~((uint16_t)TIM_CCMR1_IC1F)));
        MOVW     R6,#+65292
        ANDS     R5,R6,R5
// 2664   tmpccmr1 |= (uint16_t)(TIM_ICSelection | (uint16_t)(TIM_ICFilter << (uint16_t)4));
        ORRS     R6,R2,R3, LSL #+4
        ORRS     R5,R6,R5
// 2665   
// 2666   if((TIMx == TIM1) || (TIMx == TIM8) || (TIMx == TIM2) || (TIMx == TIM3) ||
// 2667      (TIMx == TIM4) ||(TIMx == TIM5))
        LDR.N    R6,??DataTable9  ;; 0x40012c00
        CMP      R0,R6
        BEQ.N    ??TI1_Config_0
        LDR.N    R6,??DataTable10_3  ;; 0x40013400
        CMP      R0,R6
        BEQ.N    ??TI1_Config_0
        CMP      R0,#+1073741824
        BEQ.N    ??TI1_Config_0
        LDR.N    R6,??DataTable9_1  ;; 0x40000400
        CMP      R0,R6
        BEQ.N    ??TI1_Config_0
        LDR.N    R6,??DataTable9_2  ;; 0x40000800
        CMP      R0,R6
        BEQ.N    ??TI1_Config_0
        LDR.N    R6,??DataTable10  ;; 0x40000c00
        CMP      R0,R6
        BNE.N    ??TI1_Config_1
// 2668   {
// 2669     /* Select the Polarity and set the CC1E Bit */
// 2670     tmpccer &= (uint16_t)~((uint16_t)(TIM_CCER_CC1P));
??TI1_Config_0:
        MOVW     R6,#+65533
        ANDS     R4,R6,R4
// 2671     tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)TIM_CCER_CC1E);
        ORRS     R6,R1,#0x1
        ORRS     R4,R6,R4
        B.N      ??TI1_Config_2
// 2672   }
// 2673   else
// 2674   {
// 2675     /* Select the Polarity and set the CC1E Bit */
// 2676     tmpccer &= (uint16_t)~((uint16_t)(TIM_CCER_CC1P | TIM_CCER_CC1NP));
??TI1_Config_1:
        MOVW     R6,#+65525
        ANDS     R4,R6,R4
// 2677     tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)TIM_CCER_CC1E);
        ORRS     R6,R1,#0x1
        ORRS     R4,R6,R4
// 2678   }
// 2679 
// 2680   /* Write to TIMx CCMR1 and CCER registers */
// 2681   TIMx->CCMR1 = tmpccmr1;
??TI1_Config_2:
        STRH     R5,[R0, #+24]
// 2682   TIMx->CCER = tmpccer;
        STRH     R4,[R0, #+32]
// 2683 }
        POP      {R4-R7}
        BX       LR               ;; return
// 2684 
// 2685 /**
// 2686   * @brief  Configure the TI2 as Input.
// 2687   * @param  TIMx: where x can be 1, 2, 3, 4, 5, 8, 9, 12 or 15 to select the TIM peripheral.
// 2688   * @param  TIM_ICPolarity : The Input Polarity.
// 2689   *   This parameter can be one of the following values:
// 2690   *     @arg TIM_ICPolarity_Rising
// 2691   *     @arg TIM_ICPolarity_Falling
// 2692   * @param  TIM_ICSelection: specifies the input to be used.
// 2693   *   This parameter can be one of the following values:
// 2694   *     @arg TIM_ICSelection_DirectTI: TIM Input 2 is selected to be connected to IC2.
// 2695   *     @arg TIM_ICSelection_IndirectTI: TIM Input 2 is selected to be connected to IC1.
// 2696   *     @arg TIM_ICSelection_TRC: TIM Input 2 is selected to be connected to TRC.
// 2697   * @param  TIM_ICFilter: Specifies the Input Capture Filter.
// 2698   *   This parameter must be a value between 0x00 and 0x0F.
// 2699   * @retval None
// 2700   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2701 static void TI2_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
// 2702                        uint16_t TIM_ICFilter)
// 2703 {
TI2_Config:
        PUSH     {R4-R7}
// 2704   uint16_t tmpccmr1 = 0, tmpccer = 0, tmp = 0;
        MOVS     R6,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
// 2705   /* Disable the Channel 2: Reset the CC2E Bit */
// 2706   TIMx->CCER &= (uint16_t)~((uint16_t)TIM_CCER_CC2E);
        LDRH     R7,[R0, #+32]
        MOVW     R12,#+65519
        ANDS     R7,R12,R7
        STRH     R7,[R0, #+32]
// 2707   tmpccmr1 = TIMx->CCMR1;
        LDRH     R7,[R0, #+24]
        MOVS     R6,R7
// 2708   tmpccer = TIMx->CCER;
        LDRH     R7,[R0, #+32]
        MOVS     R4,R7
// 2709   tmp = (uint16_t)(TIM_ICPolarity << 4);
        LSLS     R7,R1,#+4
        MOVS     R5,R7
// 2710   /* Select the Input and set the filter */
// 2711   tmpccmr1 &= (uint16_t)(((uint16_t)~((uint16_t)TIM_CCMR1_CC2S)) & ((uint16_t)~((uint16_t)TIM_CCMR1_IC2F)));
        MOVW     R7,#+3327
        ANDS     R6,R7,R6
// 2712   tmpccmr1 |= (uint16_t)(TIM_ICFilter << 12);
        ORRS     R6,R6,R3, LSL #+12
// 2713   tmpccmr1 |= (uint16_t)(TIM_ICSelection << 8);
        ORRS     R6,R6,R2, LSL #+8
// 2714   
// 2715   if((TIMx == TIM1) || (TIMx == TIM8) || (TIMx == TIM2) || (TIMx == TIM3) ||
// 2716      (TIMx == TIM4) ||(TIMx == TIM5))
        LDR.N    R7,??DataTable9  ;; 0x40012c00
        CMP      R0,R7
        BEQ.N    ??TI2_Config_0
        LDR.N    R7,??DataTable10_3  ;; 0x40013400
        CMP      R0,R7
        BEQ.N    ??TI2_Config_0
        CMP      R0,#+1073741824
        BEQ.N    ??TI2_Config_0
        LDR.N    R7,??DataTable9_1  ;; 0x40000400
        CMP      R0,R7
        BEQ.N    ??TI2_Config_0
        LDR.N    R7,??DataTable9_2  ;; 0x40000800
        CMP      R0,R7
        BEQ.N    ??TI2_Config_0
        LDR.N    R7,??DataTable10  ;; 0x40000c00
        CMP      R0,R7
        BNE.N    ??TI2_Config_1
// 2717   {
// 2718     /* Select the Polarity and set the CC2E Bit */
// 2719     tmpccer &= (uint16_t)~((uint16_t)(TIM_CCER_CC2P));
??TI2_Config_0:
        MOVW     R7,#+65503
        ANDS     R4,R7,R4
// 2720     tmpccer |=  (uint16_t)(tmp | (uint16_t)TIM_CCER_CC2E);
        ORRS     R7,R5,#0x10
        ORRS     R4,R7,R4
        B.N      ??TI2_Config_2
// 2721   }
// 2722   else
// 2723   {
// 2724     /* Select the Polarity and set the CC2E Bit */
// 2725     tmpccer &= (uint16_t)~((uint16_t)(TIM_CCER_CC2P | TIM_CCER_CC2NP));
??TI2_Config_1:
        MOVW     R7,#+65375
        ANDS     R4,R7,R4
// 2726     tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)TIM_CCER_CC2E);
        ORRS     R7,R1,#0x10
        ORRS     R4,R7,R4
// 2727   }
// 2728   
// 2729   /* Write to TIMx CCMR1 and CCER registers */
// 2730   TIMx->CCMR1 = tmpccmr1 ;
??TI2_Config_2:
        STRH     R6,[R0, #+24]
// 2731   TIMx->CCER = tmpccer;
        STRH     R4,[R0, #+32]
// 2732 }
        POP      {R4-R7}
        BX       LR               ;; return
// 2733 
// 2734 /**
// 2735   * @brief  Configure the TI3 as Input.
// 2736   * @param  TIMx: where x can be 1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 2737   * @param  TIM_ICPolarity : The Input Polarity.
// 2738   *   This parameter can be one of the following values:
// 2739   *     @arg TIM_ICPolarity_Rising
// 2740   *     @arg TIM_ICPolarity_Falling
// 2741   * @param  TIM_ICSelection: specifies the input to be used.
// 2742   *   This parameter can be one of the following values:
// 2743   *     @arg TIM_ICSelection_DirectTI: TIM Input 3 is selected to be connected to IC3.
// 2744   *     @arg TIM_ICSelection_IndirectTI: TIM Input 3 is selected to be connected to IC4.
// 2745   *     @arg TIM_ICSelection_TRC: TIM Input 3 is selected to be connected to TRC.
// 2746   * @param  TIM_ICFilter: Specifies the Input Capture Filter.
// 2747   *   This parameter must be a value between 0x00 and 0x0F.
// 2748   * @retval None
// 2749   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2750 static void TI3_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
// 2751                        uint16_t TIM_ICFilter)
// 2752 {
TI3_Config:
        PUSH     {R4-R7}
// 2753   uint16_t tmpccmr2 = 0, tmpccer = 0, tmp = 0;
        MOVS     R6,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
// 2754   /* Disable the Channel 3: Reset the CC3E Bit */
// 2755   TIMx->CCER &= (uint16_t)~((uint16_t)TIM_CCER_CC3E);
        LDRH     R7,[R0, #+32]
        MOVW     R12,#+65279
        ANDS     R7,R12,R7
        STRH     R7,[R0, #+32]
// 2756   tmpccmr2 = TIMx->CCMR2;
        LDRH     R7,[R0, #+28]
        MOVS     R6,R7
// 2757   tmpccer = TIMx->CCER;
        LDRH     R7,[R0, #+32]
        MOVS     R4,R7
// 2758   tmp = (uint16_t)(TIM_ICPolarity << 8);
        LSLS     R7,R1,#+8
        MOVS     R5,R7
// 2759   /* Select the Input and set the filter */
// 2760   tmpccmr2 &= (uint16_t)(((uint16_t)~((uint16_t)TIM_CCMR2_CC3S)) & ((uint16_t)~((uint16_t)TIM_CCMR2_IC3F)));
        MOVW     R7,#+65292
        ANDS     R6,R7,R6
// 2761   tmpccmr2 |= (uint16_t)(TIM_ICSelection | (uint16_t)(TIM_ICFilter << (uint16_t)4));
        ORRS     R7,R2,R3, LSL #+4
        ORRS     R6,R7,R6
// 2762     
// 2763   if((TIMx == TIM1) || (TIMx == TIM8) || (TIMx == TIM2) || (TIMx == TIM3) ||
// 2764      (TIMx == TIM4) ||(TIMx == TIM5))
        LDR.N    R7,??DataTable9  ;; 0x40012c00
        CMP      R0,R7
        BEQ.N    ??TI3_Config_0
        LDR.N    R7,??DataTable10_3  ;; 0x40013400
        CMP      R0,R7
        BEQ.N    ??TI3_Config_0
        CMP      R0,#+1073741824
        BEQ.N    ??TI3_Config_0
        LDR.N    R7,??DataTable9_1  ;; 0x40000400
        CMP      R0,R7
        BEQ.N    ??TI3_Config_0
        LDR.N    R7,??DataTable9_2  ;; 0x40000800
        CMP      R0,R7
        BEQ.N    ??TI3_Config_0
        LDR.N    R7,??DataTable10  ;; 0x40000c00
        CMP      R0,R7
        BNE.N    ??TI3_Config_1
// 2765   {
// 2766     /* Select the Polarity and set the CC3E Bit */
// 2767     tmpccer &= (uint16_t)~((uint16_t)(TIM_CCER_CC3P));
??TI3_Config_0:
        MOVW     R7,#+65023
        ANDS     R4,R7,R4
// 2768     tmpccer |= (uint16_t)(tmp | (uint16_t)TIM_CCER_CC3E);
        ORRS     R7,R5,#0x100
        ORRS     R4,R7,R4
        B.N      ??TI3_Config_2
// 2769   }
// 2770   else
// 2771   {
// 2772     /* Select the Polarity and set the CC3E Bit */
// 2773     tmpccer &= (uint16_t)~((uint16_t)(TIM_CCER_CC3P | TIM_CCER_CC3NP));
??TI3_Config_1:
        MOVW     R7,#+62975
        ANDS     R4,R7,R4
// 2774     tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)TIM_CCER_CC3E);
        ORRS     R7,R1,#0x100
        ORRS     R4,R7,R4
// 2775   }
// 2776   
// 2777   /* Write to TIMx CCMR2 and CCER registers */
// 2778   TIMx->CCMR2 = tmpccmr2;
??TI3_Config_2:
        STRH     R6,[R0, #+28]
// 2779   TIMx->CCER = tmpccer;
        STRH     R4,[R0, #+32]
// 2780 }
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     0x40012c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     0x40000400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     0x40000800
// 2781 
// 2782 /**
// 2783   * @brief  Configure the TI4 as Input.
// 2784   * @param  TIMx: where x can be 1, 2, 3, 4, 5 or 8 to select the TIM peripheral.
// 2785   * @param  TIM_ICPolarity : The Input Polarity.
// 2786   *   This parameter can be one of the following values:
// 2787   *     @arg TIM_ICPolarity_Rising
// 2788   *     @arg TIM_ICPolarity_Falling
// 2789   * @param  TIM_ICSelection: specifies the input to be used.
// 2790   *   This parameter can be one of the following values:
// 2791   *     @arg TIM_ICSelection_DirectTI: TIM Input 4 is selected to be connected to IC4.
// 2792   *     @arg TIM_ICSelection_IndirectTI: TIM Input 4 is selected to be connected to IC3.
// 2793   *     @arg TIM_ICSelection_TRC: TIM Input 4 is selected to be connected to TRC.
// 2794   * @param  TIM_ICFilter: Specifies the Input Capture Filter.
// 2795   *   This parameter must be a value between 0x00 and 0x0F.
// 2796   * @retval None
// 2797   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2798 static void TI4_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
// 2799                        uint16_t TIM_ICFilter)
// 2800 {
TI4_Config:
        PUSH     {R4-R7}
// 2801   uint16_t tmpccmr2 = 0, tmpccer = 0, tmp = 0;
        MOVS     R6,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
// 2802 
// 2803    /* Disable the Channel 4: Reset the CC4E Bit */
// 2804   TIMx->CCER &= (uint16_t)~((uint16_t)TIM_CCER_CC4E);
        LDRH     R7,[R0, #+32]
        MOVW     R12,#+61439
        ANDS     R7,R12,R7
        STRH     R7,[R0, #+32]
// 2805   tmpccmr2 = TIMx->CCMR2;
        LDRH     R7,[R0, #+28]
        MOVS     R6,R7
// 2806   tmpccer = TIMx->CCER;
        LDRH     R7,[R0, #+32]
        MOVS     R4,R7
// 2807   tmp = (uint16_t)(TIM_ICPolarity << 12);
        LSLS     R7,R1,#+12
        MOVS     R5,R7
// 2808   /* Select the Input and set the filter */
// 2809   tmpccmr2 &= (uint16_t)((uint16_t)(~(uint16_t)TIM_CCMR2_CC4S) & ((uint16_t)~((uint16_t)TIM_CCMR2_IC4F)));
        MOVW     R7,#+3327
        ANDS     R6,R7,R6
// 2810   tmpccmr2 |= (uint16_t)(TIM_ICSelection << 8);
        ORRS     R6,R6,R2, LSL #+8
// 2811   tmpccmr2 |= (uint16_t)(TIM_ICFilter << 12);
        ORRS     R6,R6,R3, LSL #+12
// 2812   
// 2813   if((TIMx == TIM1) || (TIMx == TIM8) || (TIMx == TIM2) || (TIMx == TIM3) ||
// 2814      (TIMx == TIM4) ||(TIMx == TIM5))
        LDR.N    R7,??DataTable10_7  ;; 0x40012c00
        CMP      R0,R7
        BEQ.N    ??TI4_Config_0
        LDR.N    R7,??DataTable10_3  ;; 0x40013400
        CMP      R0,R7
        BEQ.N    ??TI4_Config_0
        CMP      R0,#+1073741824
        BEQ.N    ??TI4_Config_0
        LDR.N    R7,??DataTable10_8  ;; 0x40000400
        CMP      R0,R7
        BEQ.N    ??TI4_Config_0
        LDR.N    R7,??DataTable10_9  ;; 0x40000800
        CMP      R0,R7
        BEQ.N    ??TI4_Config_0
        LDR.N    R7,??DataTable10  ;; 0x40000c00
        CMP      R0,R7
        BNE.N    ??TI4_Config_1
// 2815   {
// 2816     /* Select the Polarity and set the CC4E Bit */
// 2817     tmpccer &= (uint16_t)~((uint16_t)(TIM_CCER_CC4P));
??TI4_Config_0:
        MOVW     R7,#+57343
        ANDS     R4,R7,R4
// 2818     tmpccer |= (uint16_t)(tmp | (uint16_t)TIM_CCER_CC4E);
        ORRS     R7,R5,#0x1000
        ORRS     R4,R7,R4
        B.N      ??TI4_Config_2
// 2819   }
// 2820   else
// 2821   {
// 2822     /* Select the Polarity and set the CC4E Bit */
// 2823     tmpccer &= (uint16_t)~((uint16_t)(TIM_CCER_CC3P | TIM_CCER_CC4NP));
??TI4_Config_1:
        MOVW     R7,#+32255
        ANDS     R4,R7,R4
// 2824     tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)TIM_CCER_CC4E);
        ORRS     R7,R1,#0x1000
        ORRS     R4,R7,R4
// 2825   }
// 2826   /* Write to TIMx CCMR2 and CCER registers */
// 2827   TIMx->CCMR2 = tmpccmr2;
??TI4_Config_2:
        STRH     R6,[R0, #+28]
// 2828   TIMx->CCER = tmpccer;
        STRH     R4,[R0, #+32]
// 2829 }
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x40000c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     0x40001000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     0x40001400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     0x40013400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     0x40014000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     0x40014400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_6:
        DC32     0x40014800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_7:
        DC32     0x40012c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_8:
        DC32     0x40000400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_9:
        DC32     0x40000800

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 2830 
// 2831 /**
// 2832   * @}
// 2833   */
// 2834 
// 2835 /**
// 2836   * @}
// 2837   */
// 2838 
// 2839 /**
// 2840   * @}
// 2841   */
// 2842 
// 2843 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
// 3 422 bytes in section .text
// 
// 3 422 bytes of CODE memory
//
//Errors: none
//Warnings: none
