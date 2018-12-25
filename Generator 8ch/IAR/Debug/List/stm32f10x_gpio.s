///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     31/May/2017  14:31:56 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  Z:\Generator 8ch\IAR\stm32f10x_gpio.c                   /
//    Command line =  "Z:\Generator 8ch\IAR\stm32f10x_gpio.c" -D              /
//                    STM32F10X_MD -D USE_FULL_ASSERT -lB "Z:\Generator       /
//                    8ch\IAR\Debug\List\" -o "Z:\Generator                   /
//                    8ch\IAR\Debug\Obj\" --no_cse --no_unroll --no_inline    /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M3 -e --fpu=None --dlib_config             /
//                    "D:\Program Files\IAR Systems\Embedded Workbench        /
//                    7.2_3\arm\INC\c\DLib_Config_Normal.h" -On --vla         /
//                    --use_c++_inline -I "D:\Program Files\IAR               /
//                    Systems\Embedded Workbench 7.2_3\arm\CMSIS\Include\"    /
//    List file    =  Z:\Generator 8ch\IAR\Debug\List\stm32f10x_gpio.s        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm32f10x_gpio

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB2PeriphResetCmd

        PUBLIC GPIO_AFIODeInit
        PUBLIC GPIO_DeInit
        PUBLIC GPIO_ETH_MediaInterfaceConfig
        PUBLIC GPIO_EXTILineConfig
        PUBLIC GPIO_EventOutputCmd
        PUBLIC GPIO_EventOutputConfig
        PUBLIC GPIO_Init
        PUBLIC GPIO_PinLockConfig
        PUBLIC GPIO_PinRemapConfig
        PUBLIC GPIO_ReadInputData
        PUBLIC GPIO_ReadInputDataBit
        PUBLIC GPIO_ReadOutputData
        PUBLIC GPIO_ReadOutputDataBit
        PUBLIC GPIO_ResetBits
        PUBLIC GPIO_SetBits
        PUBLIC GPIO_StructInit
        PUBLIC GPIO_Write
        PUBLIC GPIO_WriteBit

// Z:\Generator 8ch\IAR\stm32f10x_gpio.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm32f10x_gpio.c
//    4   * @author  MCD Application Team
//    5   * @version V3.1.0
//    6   * @date    06/19/2009
//    7   * @brief   This file provides all the GPIO firmware functions.
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
//   22 #include "stm32f10x_gpio.h"
//   23 #include "stm32f10x_rcc.h"
//   24 
//   25 /** @addtogroup STM32F10x_StdPeriph_Driver
//   26   * @{
//   27   */
//   28 
//   29 /** @defgroup GPIO 
//   30   * @brief GPIO driver modules
//   31   * @{
//   32   */ 
//   33 
//   34 /** @defgroup GPIO_Private_TypesDefinitions
//   35   * @{
//   36   */
//   37 
//   38 /**
//   39   * @}
//   40   */
//   41 
//   42 /** @defgroup GPIO_Private_Defines
//   43   * @{
//   44   */
//   45 
//   46 /* ------------ RCC registers bit address in the alias region ----------------*/
//   47 #define AFIO_OFFSET                 (AFIO_BASE - PERIPH_BASE)
//   48 
//   49 /* --- EVENTCR Register -----*/
//   50 
//   51 /* Alias word address of EVOE bit */
//   52 #define EVCR_OFFSET                 (AFIO_OFFSET + 0x00)
//   53 #define EVOE_BitNumber              ((uint8_t)0x07)
//   54 #define EVCR_EVOE_BB                (PERIPH_BB_BASE + (EVCR_OFFSET * 32) + (EVOE_BitNumber * 4))
//   55 
//   56 
//   57 /* ---  MAPR Register ---*/ 
//   58 /* Alias word address of MII_RMII_SEL bit */ 
//   59 #define MAPR_OFFSET                 (AFIO_OFFSET + 0x04) 
//   60 #define MII_RMII_SEL_BitNumber      ((u8)0x17) 
//   61 #define MAPR_MII_RMII_SEL_BB        (PERIPH_BB_BASE + (MAPR_OFFSET * 32) + (MII_RMII_SEL_BitNumber * 4))
//   62 
//   63 
//   64 #define EVCR_PORTPINCONFIG_MASK     ((uint16_t)0xFF80)
//   65 #define LSB_MASK                    ((uint16_t)0xFFFF)
//   66 #define DBGAFR_POSITION_MASK        ((uint32_t)0x000F0000)
//   67 #define DBGAFR_SWJCFG_MASK          ((uint32_t)0xF0FFFFFF)
//   68 #define DBGAFR_LOCATION_MASK        ((uint32_t)0x00200000)
//   69 #define DBGAFR_NUMBITS_MASK         ((uint32_t)0x00100000)
//   70 /**
//   71   * @}
//   72   */
//   73 
//   74 /** @defgroup GPIO_Private_Macros
//   75   * @{
//   76   */
//   77 
//   78 /**
//   79   * @}
//   80   */
//   81 
//   82 /** @defgroup GPIO_Private_Variables
//   83   * @{
//   84   */
//   85 
//   86 /**
//   87   * @}
//   88   */
//   89 
//   90 /** @defgroup GPIO_Private_FunctionPrototypes
//   91   * @{
//   92   */
//   93 
//   94 /**
//   95   * @}
//   96   */
//   97 
//   98 /** @defgroup GPIO_Private_Functions
//   99   * @{
//  100   */
//  101 
//  102 /**
//  103   * @brief  Deinitializes the GPIOx peripheral registers to their default reset values.
//  104   * @param  GPIOx: where x can be (A..G) to select the GPIO peripheral.
//  105   * @retval None
//  106   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  107 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
//  108 {
GPIO_DeInit:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  109   /* Check the parameters */
//  110   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
//  111   
//  112   if (GPIOx == GPIOA)
        LDR.W    R0,??DataTable5  ;; 0x40010800
        CMP      R4,R0
        BNE.N    ??GPIO_DeInit_0
//  113   {
//  114     RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOA, ENABLE);
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       RCC_APB2PeriphResetCmd
//  115     RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOA, DISABLE);
        MOVS     R1,#+0
        MOVS     R0,#+4
        BL       RCC_APB2PeriphResetCmd
        B.N      ??GPIO_DeInit_1
//  116   }
//  117   else if (GPIOx == GPIOB)
??GPIO_DeInit_0:
        LDR.N    R0,??DataTable5_1  ;; 0x40010c00
        CMP      R4,R0
        BNE.N    ??GPIO_DeInit_2
//  118   {
//  119     RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOB, ENABLE);
        MOVS     R1,#+1
        MOVS     R0,#+8
        BL       RCC_APB2PeriphResetCmd
//  120     RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOB, DISABLE);
        MOVS     R1,#+0
        MOVS     R0,#+8
        BL       RCC_APB2PeriphResetCmd
        B.N      ??GPIO_DeInit_1
//  121   }
//  122   else if (GPIOx == GPIOC)
??GPIO_DeInit_2:
        LDR.N    R0,??DataTable5_2  ;; 0x40011000
        CMP      R4,R0
        BNE.N    ??GPIO_DeInit_3
//  123   {
//  124     RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOC, ENABLE);
        MOVS     R1,#+1
        MOVS     R0,#+16
        BL       RCC_APB2PeriphResetCmd
//  125     RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOC, DISABLE);
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       RCC_APB2PeriphResetCmd
        B.N      ??GPIO_DeInit_1
//  126   }
//  127   else if (GPIOx == GPIOD)
??GPIO_DeInit_3:
        LDR.N    R0,??DataTable5_3  ;; 0x40011400
        CMP      R4,R0
        BNE.N    ??GPIO_DeInit_4
//  128   {
//  129     RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOD, ENABLE);
        MOVS     R1,#+1
        MOVS     R0,#+32
        BL       RCC_APB2PeriphResetCmd
//  130     RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOD, DISABLE);
        MOVS     R1,#+0
        MOVS     R0,#+32
        BL       RCC_APB2PeriphResetCmd
        B.N      ??GPIO_DeInit_1
//  131   }    
//  132   else if (GPIOx == GPIOE)
??GPIO_DeInit_4:
        LDR.N    R0,??DataTable5_4  ;; 0x40011800
        CMP      R4,R0
        BNE.N    ??GPIO_DeInit_5
//  133   {
//  134     RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOE, ENABLE);
        MOVS     R1,#+1
        MOVS     R0,#+64
        BL       RCC_APB2PeriphResetCmd
//  135     RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOE, DISABLE);
        MOVS     R1,#+0
        MOVS     R0,#+64
        BL       RCC_APB2PeriphResetCmd
        B.N      ??GPIO_DeInit_1
//  136   } 
//  137   else if (GPIOx == GPIOF)
??GPIO_DeInit_5:
        LDR.N    R0,??DataTable5_5  ;; 0x40011c00
        CMP      R4,R0
        BNE.N    ??GPIO_DeInit_6
//  138   {
//  139     RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOF, ENABLE);
        MOVS     R1,#+1
        MOVS     R0,#+128
        BL       RCC_APB2PeriphResetCmd
//  140     RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOF, DISABLE);
        MOVS     R1,#+0
        MOVS     R0,#+128
        BL       RCC_APB2PeriphResetCmd
        B.N      ??GPIO_DeInit_1
//  141   }
//  142   else
//  143   {
//  144     if (GPIOx == GPIOG)
??GPIO_DeInit_6:
        LDR.N    R0,??DataTable5_6  ;; 0x40012000
        CMP      R4,R0
        BNE.N    ??GPIO_DeInit_1
//  145     {
//  146       RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOG, ENABLE);
        MOVS     R1,#+1
        MOV      R0,#+256
        BL       RCC_APB2PeriphResetCmd
//  147       RCC_APB2PeriphResetCmd(RCC_APB2Periph_GPIOG, DISABLE);
        MOVS     R1,#+0
        MOV      R0,#+256
        BL       RCC_APB2PeriphResetCmd
//  148     }
//  149   }
//  150 }
??GPIO_DeInit_1:
        POP      {R4,PC}          ;; return
//  151 
//  152 /**
//  153   * @brief  Deinitializes the Alternate Functions (remap, event control
//  154   *   and EXTI configuration) registers to their default reset values.
//  155   * @param  None
//  156   * @retval None
//  157   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  158 void GPIO_AFIODeInit(void)
//  159 {
GPIO_AFIODeInit:
        PUSH     {R7,LR}
//  160   RCC_APB2PeriphResetCmd(RCC_APB2Periph_AFIO, ENABLE);
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       RCC_APB2PeriphResetCmd
//  161   RCC_APB2PeriphResetCmd(RCC_APB2Periph_AFIO, DISABLE);
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       RCC_APB2PeriphResetCmd
//  162 }
        POP      {R0,PC}          ;; return
//  163 
//  164 /**
//  165   * @brief  Initializes the GPIOx peripheral according to the specified
//  166   *   parameters in the GPIO_InitStruct.
//  167   * @param  GPIOx: where x can be (A..G) to select the GPIO peripheral.
//  168   * @param  GPIO_InitStruct: pointer to a GPIO_InitTypeDef structure that
//  169   *   contains the configuration information for the specified GPIO peripheral.
//  170   * @retval None
//  171   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  172 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_InitTypeDef* GPIO_InitStruct)
//  173 {
GPIO_Init:
        PUSH     {R4-R7,LR}
//  174   uint32_t currentmode = 0x00, currentpin = 0x00, pinpos = 0x00, pos = 0x00;
        MOVS     R7,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R4,#+0
//  175   uint32_t tmpreg = 0x00, pinmask = 0x00;
        MOVS     R5,#+0
        MOVS     R6,#+0
//  176   /* Check the parameters */
//  177   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
//  178   assert_param(IS_GPIO_MODE(GPIO_InitStruct->GPIO_Mode));
//  179   assert_param(IS_GPIO_PIN(GPIO_InitStruct->GPIO_Pin));  
//  180   
//  181 /*---------------------------- GPIO Mode Configuration -----------------------*/
//  182   currentmode = ((uint32_t)GPIO_InitStruct->GPIO_Mode) & ((uint32_t)0x0F);
        LDRB     R12,[R1, #+3]
        ANDS     R12,R12,#0xF
        MOV      R7,R12
//  183   if ((((uint32_t)GPIO_InitStruct->GPIO_Mode) & ((uint32_t)0x10)) != 0x00)
        LDRB     R12,[R1, #+3]
        LSLS     R12,R12,#+27
        BPL.N    ??GPIO_Init_0
//  184   { 
//  185     /* Check the parameters */
//  186     assert_param(IS_GPIO_SPEED(GPIO_InitStruct->GPIO_Speed));
//  187     /* Output mode */
//  188     currentmode |= (uint32_t)GPIO_InitStruct->GPIO_Speed;
        LDRB     R12,[R1, #+2]
        ORRS     R7,R12,R7
//  189   }
//  190 /*---------------------------- GPIO CRL Configuration ------------------------*/
//  191   /* Configure the eight low port pins */
//  192   if (((uint32_t)GPIO_InitStruct->GPIO_Pin & ((uint32_t)0x00FF)) != 0x00)
??GPIO_Init_0:
        LDRB     R12,[R1, #+0]
        LSLS     R12,R12,#+24
        BEQ.N    ??GPIO_Init_1
//  193   {
//  194     tmpreg = GPIOx->CRL;
        LDR      R12,[R0, #+0]
        MOV      R5,R12
//  195     for (pinpos = 0x00; pinpos < 0x08; pinpos++)
        MOVS     R12,#+0
        MOV      R3,R12
??GPIO_Init_2:
        CMP      R3,#+8
        BCS.N    ??GPIO_Init_3
//  196     {
//  197       pos = ((uint32_t)0x01) << pinpos;
        MOVS     R12,#+1
        LSLS     R12,R12,R3
        MOV      R4,R12
//  198       /* Get the port pins position */
//  199       currentpin = (GPIO_InitStruct->GPIO_Pin) & pos;
        LDRH     R12,[R1, #+0]
        ANDS     R12,R4,R12
        MOV      R2,R12
//  200       if (currentpin == pos)
        CMP      R2,R4
        BNE.N    ??GPIO_Init_4
//  201       {
//  202         pos = pinpos << 2;
        LSLS     R12,R3,#+2
        MOV      R4,R12
//  203         /* Clear the corresponding low control register bits */
//  204         pinmask = ((uint32_t)0x0F) << pos;
        MOVS     R12,#+15
        LSLS     R12,R12,R4
        MOV      R6,R12
//  205         tmpreg &= ~pinmask;
        BICS     R5,R5,R6
//  206         /* Write the mode configuration in the corresponding bits */
//  207         tmpreg |= (currentmode << pos);
        LSLS     R12,R7,R4
        ORRS     R5,R12,R5
//  208         /* Reset the corresponding ODR bit */
//  209         if (GPIO_InitStruct->GPIO_Mode == GPIO_Mode_IPD)
        LDRB     R12,[R1, #+3]
        CMP      R12,#+40
        BNE.N    ??GPIO_Init_5
//  210         {
//  211           GPIOx->BRR = (((uint32_t)0x01) << pinpos);
        MOVS     R12,#+1
        LSLS     R12,R12,R3
        STR      R12,[R0, #+20]
        B.N      ??GPIO_Init_4
//  212         }
//  213         else
//  214         {
//  215           /* Set the corresponding ODR bit */
//  216           if (GPIO_InitStruct->GPIO_Mode == GPIO_Mode_IPU)
??GPIO_Init_5:
        LDRB     R12,[R1, #+3]
        CMP      R12,#+72
        BNE.N    ??GPIO_Init_4
//  217           {
//  218             GPIOx->BSRR = (((uint32_t)0x01) << pinpos);
        MOVS     R12,#+1
        LSLS     R12,R12,R3
        STR      R12,[R0, #+16]
//  219           }
//  220         }
//  221       }
//  222     }
??GPIO_Init_4:
        ADDS     R3,R3,#+1
        B.N      ??GPIO_Init_2
//  223     GPIOx->CRL = tmpreg;
??GPIO_Init_3:
        STR      R5,[R0, #+0]
//  224   }
//  225 /*---------------------------- GPIO CRH Configuration ------------------------*/
//  226   /* Configure the eight high port pins */
//  227   if (GPIO_InitStruct->GPIO_Pin > 0x00FF)
??GPIO_Init_1:
        LDRH     R12,[R1, #+0]
        CMP      R12,#+255
        BLE.N    ??GPIO_Init_6
//  228   {
//  229     tmpreg = GPIOx->CRH;
        LDR      R12,[R0, #+4]
        MOV      R5,R12
//  230     for (pinpos = 0x00; pinpos < 0x08; pinpos++)
        MOVS     R12,#+0
        MOV      R3,R12
??GPIO_Init_7:
        CMP      R3,#+8
        BCS.N    ??GPIO_Init_8
//  231     {
//  232       pos = (((uint32_t)0x01) << (pinpos + 0x08));
        MOVS     R12,#+1
        ADDS     LR,R3,#+8
        LSLS     R12,R12,LR
        MOV      R4,R12
//  233       /* Get the port pins position */
//  234       currentpin = ((GPIO_InitStruct->GPIO_Pin) & pos);
        LDRH     R12,[R1, #+0]
        ANDS     R12,R4,R12
        MOV      R2,R12
//  235       if (currentpin == pos)
        CMP      R2,R4
        BNE.N    ??GPIO_Init_9
//  236       {
//  237         pos = pinpos << 2;
        LSLS     R12,R3,#+2
        MOV      R4,R12
//  238         /* Clear the corresponding high control register bits */
//  239         pinmask = ((uint32_t)0x0F) << pos;
        MOVS     R12,#+15
        LSLS     R12,R12,R4
        MOV      R6,R12
//  240         tmpreg &= ~pinmask;
        BICS     R5,R5,R6
//  241         /* Write the mode configuration in the corresponding bits */
//  242         tmpreg |= (currentmode << pos);
        LSLS     R12,R7,R4
        ORRS     R5,R12,R5
//  243         /* Reset the corresponding ODR bit */
//  244         if (GPIO_InitStruct->GPIO_Mode == GPIO_Mode_IPD)
        LDRB     R12,[R1, #+3]
        CMP      R12,#+40
        BNE.N    ??GPIO_Init_10
//  245         {
//  246           GPIOx->BRR = (((uint32_t)0x01) << (pinpos + 0x08));
        MOVS     R12,#+1
        ADDS     LR,R3,#+8
        LSLS     R12,R12,LR
        STR      R12,[R0, #+20]
//  247         }
//  248         /* Set the corresponding ODR bit */
//  249         if (GPIO_InitStruct->GPIO_Mode == GPIO_Mode_IPU)
??GPIO_Init_10:
        LDRB     R12,[R1, #+3]
        CMP      R12,#+72
        BNE.N    ??GPIO_Init_9
//  250         {
//  251           GPIOx->BSRR = (((uint32_t)0x01) << (pinpos + 0x08));
        MOVS     R12,#+1
        ADDS     LR,R3,#+8
        LSLS     R12,R12,LR
        STR      R12,[R0, #+16]
//  252         }
//  253       }
//  254     }
??GPIO_Init_9:
        ADDS     R3,R3,#+1
        B.N      ??GPIO_Init_7
//  255     GPIOx->CRH = tmpreg;
??GPIO_Init_8:
        STR      R5,[R0, #+4]
//  256   }
//  257 }
??GPIO_Init_6:
        POP      {R4-R7,PC}       ;; return
//  258 
//  259 /**
//  260   * @brief  Fills each GPIO_InitStruct member with its default value.
//  261   * @param  GPIO_InitStruct : pointer to a GPIO_InitTypeDef structure which will
//  262   *   be initialized.
//  263   * @retval None
//  264   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  265 void GPIO_StructInit(GPIO_InitTypeDef* GPIO_InitStruct)
//  266 {
//  267   /* Reset GPIO init structure parameters values */
//  268   GPIO_InitStruct->GPIO_Pin  = GPIO_Pin_All;
GPIO_StructInit:
        MOVW     R1,#+65535
        STRH     R1,[R0, #+0]
//  269   GPIO_InitStruct->GPIO_Speed = GPIO_Speed_2MHz;
        MOVS     R1,#+2
        STRB     R1,[R0, #+2]
//  270   GPIO_InitStruct->GPIO_Mode = GPIO_Mode_IN_FLOATING;
        MOVS     R1,#+4
        STRB     R1,[R0, #+3]
//  271 }
        BX       LR               ;; return
//  272 
//  273 /**
//  274   * @brief  Reads the specified input port pin.
//  275   * @param  GPIOx: where x can be (A..G) to select the GPIO peripheral.
//  276   * @param  GPIO_Pin:  specifies the port bit to read.
//  277   *   This parameter can be GPIO_Pin_x where x can be (0..15).
//  278   * @retval The input port pin value.
//  279   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  280 uint8_t GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
//  281 {
GPIO_ReadInputDataBit:
        MOVS     R2,R0
//  282   uint8_t bitstatus = 0x00;
        MOVS     R0,#+0
//  283   
//  284   /* Check the parameters */
//  285   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
//  286   assert_param(IS_GET_GPIO_PIN(GPIO_Pin)); 
//  287   
//  288   if ((GPIOx->IDR & GPIO_Pin) != (uint32_t)Bit_RESET)
        LDR      R3,[R2, #+8]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        TST      R3,R1
        BEQ.N    ??GPIO_ReadInputDataBit_0
//  289   {
//  290     bitstatus = (uint8_t)Bit_SET;
        MOVS     R3,#+1
        MOVS     R0,R3
        B.N      ??GPIO_ReadInputDataBit_1
//  291   }
//  292   else
//  293   {
//  294     bitstatus = (uint8_t)Bit_RESET;
??GPIO_ReadInputDataBit_0:
        MOVS     R3,#+0
        MOVS     R0,R3
//  295   }
//  296   return bitstatus;
??GPIO_ReadInputDataBit_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
//  297 }
//  298 
//  299 /**
//  300   * @brief  Reads the specified GPIO input data port.
//  301   * @param  GPIOx: where x can be (A..G) to select the GPIO peripheral.
//  302   * @retval GPIO input data port value.
//  303   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  304 uint16_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
//  305 {
//  306   /* Check the parameters */
//  307   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
//  308   
//  309   return ((uint16_t)GPIOx->IDR);
GPIO_ReadInputData:
        LDR      R0,[R0, #+8]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
//  310 }
//  311 
//  312 /**
//  313   * @brief  Reads the specified output data port bit.
//  314   * @param  GPIOx: where x can be (A..G) to select the GPIO peripheral.
//  315   * @param  GPIO_Pin:  specifies the port bit to read.
//  316   *   This parameter can be GPIO_Pin_x where x can be (0..15).
//  317   * @retval The output port pin value.
//  318   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  319 uint8_t GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
//  320 {
GPIO_ReadOutputDataBit:
        MOVS     R2,R0
//  321   uint8_t bitstatus = 0x00;
        MOVS     R0,#+0
//  322   /* Check the parameters */
//  323   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
//  324   assert_param(IS_GET_GPIO_PIN(GPIO_Pin)); 
//  325   
//  326   if ((GPIOx->ODR & GPIO_Pin) != (uint32_t)Bit_RESET)
        LDR      R3,[R2, #+12]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        TST      R3,R1
        BEQ.N    ??GPIO_ReadOutputDataBit_0
//  327   {
//  328     bitstatus = (uint8_t)Bit_SET;
        MOVS     R3,#+1
        MOVS     R0,R3
        B.N      ??GPIO_ReadOutputDataBit_1
//  329   }
//  330   else
//  331   {
//  332     bitstatus = (uint8_t)Bit_RESET;
??GPIO_ReadOutputDataBit_0:
        MOVS     R3,#+0
        MOVS     R0,R3
//  333   }
//  334   return bitstatus;
??GPIO_ReadOutputDataBit_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
//  335 }
//  336 
//  337 /**
//  338   * @brief  Reads the specified GPIO output data port.
//  339   * @param  GPIOx: where x can be (A..G) to select the GPIO peripheral.
//  340   * @retval GPIO output data port value.
//  341   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  342 uint16_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
//  343 {
//  344   /* Check the parameters */
//  345   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
//  346     
//  347   return ((uint16_t)GPIOx->ODR);
GPIO_ReadOutputData:
        LDR      R0,[R0, #+12]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
//  348 }
//  349 
//  350 /**
//  351   * @brief  Sets the selected data port bits.
//  352   * @param  GPIOx: where x can be (A..G) to select the GPIO peripheral.
//  353   * @param  GPIO_Pin: specifies the port bits to be written.
//  354   *   This parameter can be any combination of GPIO_Pin_x where x can be (0..15).
//  355   * @retval None
//  356   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  357 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
//  358 {
//  359   /* Check the parameters */
//  360   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
//  361   assert_param(IS_GPIO_PIN(GPIO_Pin));
//  362   
//  363   GPIOx->BSRR = GPIO_Pin;
GPIO_SetBits:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+16]
//  364 }
        BX       LR               ;; return
//  365 
//  366 /**
//  367   * @brief  Clears the selected data port bits.
//  368   * @param  GPIOx: where x can be (A..G) to select the GPIO peripheral.
//  369   * @param  GPIO_Pin: specifies the port bits to be written.
//  370   *   This parameter can be any combination of GPIO_Pin_x where x can be (0..15).
//  371   * @retval None
//  372   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  373 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
//  374 {
//  375   /* Check the parameters */
//  376   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
//  377   assert_param(IS_GPIO_PIN(GPIO_Pin));
//  378   
//  379   GPIOx->BRR = GPIO_Pin;
GPIO_ResetBits:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+20]
//  380 }
        BX       LR               ;; return
//  381 
//  382 /**
//  383   * @brief  Sets or clears the selected data port bit.
//  384   * @param  GPIOx: where x can be (A..G) to select the GPIO peripheral.
//  385   * @param  GPIO_Pin: specifies the port bit to be written.
//  386   *   This parameter can be one of GPIO_Pin_x where x can be (0..15).
//  387   * @param  BitVal: specifies the value to be written to the selected bit.
//  388   *   This parameter can be one of the BitAction enum values:
//  389   *     @arg Bit_RESET: to clear the port pin
//  390   *     @arg Bit_SET: to set the port pin
//  391   * @retval None
//  392   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  393 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, BitAction BitVal)
//  394 {
//  395   /* Check the parameters */
//  396   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
//  397   assert_param(IS_GET_GPIO_PIN(GPIO_Pin));
//  398   assert_param(IS_GPIO_BIT_ACTION(BitVal)); 
//  399   
//  400   if (BitVal != Bit_RESET)
GPIO_WriteBit:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??GPIO_WriteBit_0
//  401   {
//  402     GPIOx->BSRR = GPIO_Pin;
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+16]
        B.N      ??GPIO_WriteBit_1
//  403   }
//  404   else
//  405   {
//  406     GPIOx->BRR = GPIO_Pin;
??GPIO_WriteBit_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+20]
//  407   }
//  408 }
??GPIO_WriteBit_1:
        BX       LR               ;; return
//  409 
//  410 /**
//  411   * @brief  Writes data to the specified GPIO data port.
//  412   * @param  GPIOx: where x can be (A..G) to select the GPIO peripheral.
//  413   * @param  PortVal: specifies the value to be written to the port output data register.
//  414   * @retval None
//  415   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  416 void GPIO_Write(GPIO_TypeDef* GPIOx, uint16_t PortVal)
//  417 {
//  418   /* Check the parameters */
//  419   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
//  420   
//  421   GPIOx->ODR = PortVal;
GPIO_Write:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+12]
//  422 }
        BX       LR               ;; return
//  423 
//  424 /**
//  425   * @brief  Locks GPIO Pins configuration registers.
//  426   * @param  GPIOx: where x can be (A..G) to select the GPIO peripheral.
//  427   * @param  GPIO_Pin: specifies the port bit to be written.
//  428   *   This parameter can be any combination of GPIO_Pin_x where x can be (0..15).
//  429   * @retval None
//  430   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  431 void GPIO_PinLockConfig(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
//  432 {
//  433   uint32_t tmp = 0x00010000;
GPIO_PinLockConfig:
        MOVS     R2,#+65536
//  434   
//  435   /* Check the parameters */
//  436   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
//  437   assert_param(IS_GPIO_PIN(GPIO_Pin));
//  438   
//  439   tmp |= GPIO_Pin;
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R2,R1,R2
//  440   /* Set LCKK bit */
//  441   GPIOx->LCKR = tmp;
        STR      R2,[R0, #+24]
//  442   /* Reset LCKK bit */
//  443   GPIOx->LCKR =  GPIO_Pin;
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+24]
//  444   /* Set LCKK bit */
//  445   GPIOx->LCKR = tmp;
        STR      R2,[R0, #+24]
//  446   /* Read LCKK bit*/
//  447   tmp = GPIOx->LCKR;
        LDR      R3,[R0, #+24]
        MOVS     R2,R3
//  448   /* Read LCKK bit*/
//  449   tmp = GPIOx->LCKR;
        LDR      R3,[R0, #+24]
        MOVS     R2,R3
//  450 }
        BX       LR               ;; return
//  451 
//  452 /**
//  453   * @brief  Selects the GPIO pin used as Event output.
//  454   * @param  GPIO_PortSource: selects the GPIO port to be used as source
//  455   *   for Event output.
//  456   *   This parameter can be GPIO_PortSourceGPIOx where x can be (A..E).
//  457   * @param  GPIO_PinSource: specifies the pin for the Event output.
//  458   *   This parameter can be GPIO_PinSourcex where x can be (0..15).
//  459   * @retval None
//  460   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  461 void GPIO_EventOutputConfig(uint8_t GPIO_PortSource, uint8_t GPIO_PinSource)
//  462 {
//  463   uint32_t tmpreg = 0x00;
GPIO_EventOutputConfig:
        MOVS     R2,#+0
//  464   /* Check the parameters */
//  465   assert_param(IS_GPIO_EVENTOUT_PORT_SOURCE(GPIO_PortSource));
//  466   assert_param(IS_GPIO_PIN_SOURCE(GPIO_PinSource));
//  467     
//  468   tmpreg = AFIO->EVCR;
        LDR.N    R3,??DataTable5_7  ;; 0x40010000
        LDR      R3,[R3, #+0]
        MOVS     R2,R3
//  469   /* Clear the PORT[6:4] and PIN[3:0] bits */
//  470   tmpreg &= EVCR_PORTPINCONFIG_MASK;
        MOVW     R3,#+65408
        ANDS     R2,R3,R2
//  471   tmpreg |= (uint32_t)GPIO_PortSource << 0x04;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R2,R2,R0, LSL #+4
//  472   tmpreg |= GPIO_PinSource;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R2,R1,R2
//  473   AFIO->EVCR = tmpreg;
        LDR.N    R3,??DataTable5_7  ;; 0x40010000
        STR      R2,[R3, #+0]
//  474 }
        BX       LR               ;; return
//  475 
//  476 /**
//  477   * @brief  Enables or disables the Event Output.
//  478   * @param  NewState: new state of the Event output.
//  479   *   This parameter can be: ENABLE or DISABLE.
//  480   * @retval None
//  481   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  482 void GPIO_EventOutputCmd(FunctionalState NewState)
//  483 {
//  484   /* Check the parameters */
//  485   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  486   
//  487   *(__IO uint32_t *) EVCR_EVOE_BB = (uint32_t)NewState;
GPIO_EventOutputCmd:
        LDR.N    R1,??DataTable5_8  ;; 0x4220001c
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R0,[R1, #+0]
//  488 }
        BX       LR               ;; return
//  489 
//  490 /**
//  491   * @brief  Changes the mapping of the specified pin.
//  492   * @param  GPIO_Remap: selects the pin to remap.
//  493   *   This parameter can be one of the following values:
//  494   *     @arg GPIO_Remap_SPI1
//  495   *     @arg GPIO_Remap_I2C1
//  496   *     @arg GPIO_Remap_USART1
//  497   *     @arg GPIO_Remap_USART2
//  498   *     @arg GPIO_PartialRemap_USART3
//  499   *     @arg GPIO_FullRemap_USART3
//  500   *     @arg GPIO_PartialRemap_TIM1
//  501   *     @arg GPIO_FullRemap_TIM1
//  502   *     @arg GPIO_PartialRemap1_TIM2
//  503   *     @arg GPIO_PartialRemap2_TIM2
//  504   *     @arg GPIO_FullRemap_TIM2
//  505   *     @arg GPIO_PartialRemap_TIM3
//  506   *     @arg GPIO_FullRemap_TIM3
//  507   *     @arg GPIO_Remap_TIM4
//  508   *     @arg GPIO_Remap1_CAN1
//  509   *     @arg GPIO_Remap2_CAN1
//  510   *     @arg GPIO_Remap_PD01
//  511   *     @arg GPIO_Remap_TIM5CH4_LSI
//  512   *     @arg GPIO_Remap_ADC1_ETRGINJ
//  513   *     @arg GPIO_Remap_ADC1_ETRGREG
//  514   *     @arg GPIO_Remap_ADC2_ETRGINJ
//  515   *     @arg GPIO_Remap_ADC2_ETRGREG
//  516   *     @arg GPIO_Remap_ETH
//  517   *     @arg GPIO_Remap_CAN2  
//  518   *     @arg GPIO_Remap_SWJ_NoJTRST
//  519   *     @arg GPIO_Remap_SWJ_JTAGDisable
//  520   *     @arg GPIO_Remap_SWJ_Disable
//  521   *     @arg GPIO_Remap_SPI3
//  522   *     @arg GPIO_Remap_TIM2ITR1_PTP_SOF
//  523   *     @arg GPIO_Remap_PTP_PPS  
//  524   * @note  If the GPIO_Remap_TIM2ITR1_PTP_SOF is enabled the TIM2 ITR1 is connected 
//  525   *        to Ethernet PTP output. When Reset TIM2 ITR1 is connected to USB OTG SOF output.       
//  526   * @param  NewState: new state of the port pin remapping.
//  527   *   This parameter can be: ENABLE or DISABLE.
//  528   * @retval None
//  529   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  530 void GPIO_PinRemapConfig(uint32_t GPIO_Remap, FunctionalState NewState)
//  531 {
GPIO_PinRemapConfig:
        PUSH     {R4-R7}
//  532   uint32_t tmp = 0x00, tmp1 = 0x00, tmpreg = 0x00, tmpmask = 0x00;
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R5,#+0
        MOVS     R4,#+0
//  533 
//  534   /* Check the parameters */
//  535   assert_param(IS_GPIO_REMAP(GPIO_Remap));
//  536   assert_param(IS_FUNCTIONAL_STATE(NewState));  
//  537   
//  538   tmpreg = AFIO->MAPR;
        LDR.N    R6,??DataTable5_9  ;; 0x40010004
        LDR      R6,[R6, #+0]
        MOVS     R5,R6
//  539 
//  540   tmpmask = (GPIO_Remap & DBGAFR_POSITION_MASK) >> 0x10;
        UBFX     R6,R0,#+16,#+4
        MOVS     R4,R6
//  541   tmp = GPIO_Remap & LSB_MASK;
        UXTH     R6,R0            ;; ZeroExt  R6,R0,#+16,#+16
        MOVS     R2,R6
//  542 
//  543   if ((GPIO_Remap & (DBGAFR_LOCATION_MASK | DBGAFR_NUMBITS_MASK)) == (DBGAFR_LOCATION_MASK | DBGAFR_NUMBITS_MASK))
        ANDS     R6,R0,#0x300000
        CMP      R6,#+3145728
        BNE.N    ??GPIO_PinRemapConfig_0
//  544   {
//  545     tmpreg &= DBGAFR_SWJCFG_MASK;
        BICS     R5,R5,#0xF000000
//  546     AFIO->MAPR &= DBGAFR_SWJCFG_MASK;
        LDR.N    R6,??DataTable5_9  ;; 0x40010004
        LDR      R6,[R6, #+0]
        BICS     R6,R6,#0xF000000
        LDR.N    R7,??DataTable5_9  ;; 0x40010004
        STR      R6,[R7, #+0]
        B.N      ??GPIO_PinRemapConfig_1
//  547   }
//  548   else if ((GPIO_Remap & DBGAFR_NUMBITS_MASK) == DBGAFR_NUMBITS_MASK)
??GPIO_PinRemapConfig_0:
        LSLS     R6,R0,#+11
        BPL.N    ??GPIO_PinRemapConfig_2
//  549   {
//  550     tmp1 = ((uint32_t)0x03) << tmpmask;
        MOVS     R6,#+3
        LSLS     R6,R6,R4
        MOVS     R3,R6
//  551     tmpreg &= ~tmp1;
        BICS     R5,R5,R3
//  552     tmpreg |= ~DBGAFR_SWJCFG_MASK;
        ORRS     R5,R5,#0xF000000
        B.N      ??GPIO_PinRemapConfig_1
//  553   }
//  554   else
//  555   {
//  556     tmpreg &= ~(tmp << ((GPIO_Remap >> 0x15)*0x10));
??GPIO_PinRemapConfig_2:
        LSRS     R6,R0,#+21
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LSLS     R6,R6,#+4
        LSLS     R6,R2,R6
        BICS     R5,R5,R6
//  557     tmpreg |= ~DBGAFR_SWJCFG_MASK;
        ORRS     R5,R5,#0xF000000
//  558   }
//  559 
//  560   if (NewState != DISABLE)
??GPIO_PinRemapConfig_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??GPIO_PinRemapConfig_3
//  561   {
//  562     tmpreg |= (tmp << ((GPIO_Remap >> 0x15)*0x10));
        LSRS     R6,R0,#+21
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LSLS     R6,R6,#+4
        LSLS     R6,R2,R6
        ORRS     R5,R6,R5
//  563   }
//  564 
//  565   AFIO->MAPR = tmpreg;
??GPIO_PinRemapConfig_3:
        LDR.N    R6,??DataTable5_9  ;; 0x40010004
        STR      R5,[R6, #+0]
//  566 }
        POP      {R4-R7}
        BX       LR               ;; return
//  567 
//  568 /**
//  569   * @brief  Selects the GPIO pin used as EXTI Line.
//  570   * @param  GPIO_PortSource: selects the GPIO port to be used as source for EXTI lines.
//  571   *   This parameter can be GPIO_PortSourceGPIOx where x can be (A..G).
//  572   * @param  GPIO_PinSource: specifies the EXTI line to be configured.
//  573   *   This parameter can be GPIO_PinSourcex where x can be (0..15).
//  574   * @retval None
//  575   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  576 void GPIO_EXTILineConfig(uint8_t GPIO_PortSource, uint8_t GPIO_PinSource)
//  577 {
GPIO_EXTILineConfig:
        PUSH     {R4,R5}
//  578   uint32_t tmp = 0x00;
        MOVS     R2,#+0
//  579   /* Check the parameters */
//  580   assert_param(IS_GPIO_EXTI_PORT_SOURCE(GPIO_PortSource));
//  581   assert_param(IS_GPIO_PIN_SOURCE(GPIO_PinSource));
//  582   
//  583   tmp = ((uint32_t)0x0F) << (0x04 * (GPIO_PinSource & (uint8_t)0x03));
        MOVS     R3,#+15
        ANDS     R4,R1,#0x3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R4,R4,#+2
        LSLS     R3,R3,R4
        MOVS     R2,R3
//  584   AFIO->EXTICR[GPIO_PinSource >> 0x02] &= ~tmp;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ASRS     R3,R1,#+2
        LDR.N    R4,??DataTable5_10  ;; 0x40010008
        LDR      R3,[R4, R3, LSL #+2]
        BICS     R3,R3,R2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ASRS     R4,R1,#+2
        LDR.N    R5,??DataTable5_10  ;; 0x40010008
        STR      R3,[R5, R4, LSL #+2]
//  585   AFIO->EXTICR[GPIO_PinSource >> 0x02] |= (((uint32_t)GPIO_PortSource) << (0x04 * (GPIO_PinSource & (uint8_t)0x03)));
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ASRS     R3,R1,#+2
        LDR.N    R4,??DataTable5_10  ;; 0x40010008
        LDR      R3,[R4, R3, LSL #+2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ANDS     R4,R1,#0x3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R4,R4,#+2
        LSLS     R4,R0,R4
        ORRS     R3,R4,R3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ASRS     R4,R1,#+2
        LDR.N    R5,??DataTable5_10  ;; 0x40010008
        STR      R3,[R5, R4, LSL #+2]
//  586 }
        POP      {R4,R5}
        BX       LR               ;; return
//  587 
//  588 /**
//  589   * @brief  Selects the Ethernet media interface.
//  590   * @note   This function applies only to STM32 Connectivity line devices.  
//  591   * @param  GPIO_ETH_MediaInterface: specifies the Media Interface mode.
//  592   *   This parameter can be one of the following values:
//  593   *     @arg GPIO_ETH_MediaInterface_MII: MII mode
//  594   *     @arg GPIO_ETH_MediaInterface_RMII: RMII mode    
//  595   * @retval None
//  596   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  597 void GPIO_ETH_MediaInterfaceConfig(uint32_t GPIO_ETH_MediaInterface) 
//  598 { 
//  599   assert_param(IS_GPIO_ETH_MEDIA_INTERFACE(GPIO_ETH_MediaInterface)); 
//  600 
//  601   /* Configure MII_RMII selection bit */ 
//  602   *(__IO uint32_t *) MAPR_MII_RMII_SEL_BB = GPIO_ETH_MediaInterface; 
GPIO_ETH_MediaInterfaceConfig:
        LDR.N    R1,??DataTable5_11  ;; 0x422000dc
        STR      R0,[R1, #+0]
//  603 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x40010800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x40010c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0x40011000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x40011400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0x40011800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x40011c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x40012000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     0x40010000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     0x4220001c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     0x40010004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     0x40010008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     0x422000dc

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  604   
//  605 /**
//  606   * @}
//  607   */
//  608 
//  609 /**
//  610   * @}
//  611   */
//  612 
//  613 /**
//  614   * @}
//  615   */
//  616 
//  617 /******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/
// 
// 936 bytes in section .text
// 
// 936 bytes of CODE memory
//
//Errors: none
//Warnings: none
