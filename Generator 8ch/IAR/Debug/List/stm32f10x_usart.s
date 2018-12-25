///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.50.3.4676/W32 for ARM     01/Jun/2017  10:23:24 /
// Copyright 1999-2013 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  Z:\Generator 8ch\IAR\stm32f10x_usart.c                  /
//    Command line =  "Z:\Generator 8ch\IAR\stm32f10x_usart.c" -D             /
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
//    List file    =  Z:\Generator 8ch\IAR\Debug\List\stm32f10x_usart.s       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm32f10x_usart

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB1PeriphResetCmd
        EXTERN RCC_APB2PeriphResetCmd
        EXTERN RCC_GetClocksFreq

        PUBLIC USART_ClearFlag
        PUBLIC USART_ClearITPendingBit
        PUBLIC USART_ClockInit
        PUBLIC USART_ClockStructInit
        PUBLIC USART_Cmd
        PUBLIC USART_DMACmd
        PUBLIC USART_DeInit
        PUBLIC USART_GetFlagStatus
        PUBLIC USART_GetITStatus
        PUBLIC USART_HalfDuplexCmd
        PUBLIC USART_ITConfig
        PUBLIC USART_Init
        PUBLIC USART_IrDACmd
        PUBLIC USART_IrDAConfig
        PUBLIC USART_LINBreakDetectLengthConfig
        PUBLIC USART_LINCmd
        PUBLIC USART_ReceiveData
        PUBLIC USART_ReceiverWakeUpCmd
        PUBLIC USART_SendBreak
        PUBLIC USART_SendData
        PUBLIC USART_SetAddress
        PUBLIC USART_SetGuardTime
        PUBLIC USART_SetPrescaler
        PUBLIC USART_SmartCardCmd
        PUBLIC USART_SmartCardNACKCmd
        PUBLIC USART_StructInit
        PUBLIC USART_WakeUpConfig

// Z:\Generator 8ch\IAR\stm32f10x_usart.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm32f10x_usart.c
//    4   * @author  MCD Application Team
//    5   * @version V3.1.0
//    6   * @date    06/19/2009
//    7   * @brief   This file provides all the USART firmware functions.
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
//   22 #include "stm32f10x_usart.h"
//   23 #include "stm32f10x_rcc.h"
//   24 
//   25 /** @addtogroup STM32F10x_StdPeriph_Driver
//   26   * @{
//   27   */
//   28 
//   29 /** @defgroup USART 
//   30   * @brief USART driver modules
//   31   * @{
//   32   */
//   33 
//   34 /** @defgroup USART_Private_TypesDefinitions
//   35   * @{
//   36   */
//   37 
//   38 /**
//   39   * @}
//   40   */
//   41 
//   42 /** @defgroup USART_Private_Defines
//   43   * @{
//   44   */
//   45 
//   46 #define CR1_UE_Set                ((uint16_t)0x2000)  /*!< USART Enable Mask */
//   47 #define CR1_UE_Reset              ((uint16_t)0xDFFF)  /*!< USART Disable Mask */
//   48 
//   49 #define CR1_WAKE_Mask             ((uint16_t)0xF7FF)  /*!< USART WakeUp Method Mask */
//   50 
//   51 #define CR1_RWU_Set               ((uint16_t)0x0002)  /*!< USART mute mode Enable Mask */
//   52 #define CR1_RWU_Reset             ((uint16_t)0xFFFD)  /*!< USART mute mode Enable Mask */
//   53 #define CR1_SBK_Set               ((uint16_t)0x0001)  /*!< USART Break Character send Mask */
//   54 #define CR1_CLEAR_Mask            ((uint16_t)0xE9F3)  /*!< USART CR1 Mask */
//   55 #define CR2_Address_Mask          ((uint16_t)0xFFF0)  /*!< USART address Mask */
//   56 
//   57 #define CR2_LINEN_Set              ((uint16_t)0x4000)  /*!< USART LIN Enable Mask */
//   58 #define CR2_LINEN_Reset            ((uint16_t)0xBFFF)  /*!< USART LIN Disable Mask */
//   59 
//   60 #define CR2_LBDL_Mask             ((uint16_t)0xFFDF)  /*!< USART LIN Break detection Mask */
//   61 #define CR2_STOP_CLEAR_Mask       ((uint16_t)0xCFFF)  /*!< USART CR2 STOP Bits Mask */
//   62 #define CR2_CLOCK_CLEAR_Mask      ((uint16_t)0xF0FF)  /*!< USART CR2 Clock Mask */
//   63 
//   64 #define CR3_SCEN_Set              ((uint16_t)0x0020)  /*!< USART SC Enable Mask */
//   65 #define CR3_SCEN_Reset            ((uint16_t)0xFFDF)  /*!< USART SC Disable Mask */
//   66 
//   67 #define CR3_NACK_Set              ((uint16_t)0x0010)  /*!< USART SC NACK Enable Mask */
//   68 #define CR3_NACK_Reset            ((uint16_t)0xFFEF)  /*!< USART SC NACK Disable Mask */
//   69 
//   70 #define CR3_HDSEL_Set             ((uint16_t)0x0008)  /*!< USART Half-Duplex Enable Mask */
//   71 #define CR3_HDSEL_Reset           ((uint16_t)0xFFF7)  /*!< USART Half-Duplex Disable Mask */
//   72 
//   73 #define CR3_IRLP_Mask             ((uint16_t)0xFFFB)  /*!< USART IrDA LowPower mode Mask */
//   74 #define CR3_CLEAR_Mask            ((uint16_t)0xFCFF)  /*!< USART CR3 Mask */
//   75 
//   76 #define CR3_IREN_Set              ((uint16_t)0x0002)  /*!< USART IrDA Enable Mask */
//   77 #define CR3_IREN_Reset            ((uint16_t)0xFFFD)  /*!< USART IrDA Disable Mask */
//   78 #define GTPR_LSB_Mask             ((uint16_t)0x00FF)  /*!< Guard Time Register LSB Mask */
//   79 #define GTPR_MSB_Mask             ((uint16_t)0xFF00)  /*!< Guard Time Register MSB Mask */
//   80 #define IT_Mask                   ((uint16_t)0x001F)  /*!< USART Interrupt Mask */
//   81 
//   82 /**
//   83   * @}
//   84   */
//   85 
//   86 /** @defgroup USART_Private_Macros
//   87   * @{
//   88   */
//   89 
//   90 /**
//   91   * @}
//   92   */
//   93 
//   94 /** @defgroup USART_Private_Variables
//   95   * @{
//   96   */
//   97 
//   98 /**
//   99   * @}
//  100   */
//  101 
//  102 /** @defgroup USART_Private_FunctionPrototypes
//  103   * @{
//  104   */
//  105 
//  106 /**
//  107   * @}
//  108   */
//  109 
//  110 /** @defgroup USART_Private_Functions
//  111   * @{
//  112   */
//  113 
//  114 /**
//  115   * @brief  Deinitializes the USARTx peripheral registers to their default reset values.
//  116   * @param  USARTx: Select the USART or the UART peripheral. 
//  117   *   This parameter can be one of the following values: USART1, USART2, USART3, UART4 or UART5.
//  118   * @retval None
//  119   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  120 void USART_DeInit(USART_TypeDef* USARTx)
//  121 {
USART_DeInit:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  122   /* Check the parameters */
//  123   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  124 
//  125   if (USARTx == USART1)
        LDR.N    R0,??DataTable1  ;; 0x40013800
        CMP      R4,R0
        BNE.N    ??USART_DeInit_0
//  126   {
//  127     RCC_APB2PeriphResetCmd(RCC_APB2Periph_USART1, ENABLE);
        MOVS     R1,#+1
        MOV      R0,#+16384
        BL       RCC_APB2PeriphResetCmd
//  128     RCC_APB2PeriphResetCmd(RCC_APB2Periph_USART1, DISABLE);
        MOVS     R1,#+0
        MOV      R0,#+16384
        BL       RCC_APB2PeriphResetCmd
        B.N      ??USART_DeInit_1
//  129   }
//  130   else if (USARTx == USART2)
??USART_DeInit_0:
        LDR.N    R0,??DataTable1_1  ;; 0x40004400
        CMP      R4,R0
        BNE.N    ??USART_DeInit_2
//  131   {
//  132     RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART2, ENABLE);
        MOVS     R1,#+1
        MOVS     R0,#+131072
        BL       RCC_APB1PeriphResetCmd
//  133     RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART2, DISABLE);
        MOVS     R1,#+0
        MOVS     R0,#+131072
        BL       RCC_APB1PeriphResetCmd
        B.N      ??USART_DeInit_1
//  134   }
//  135   else if (USARTx == USART3)
??USART_DeInit_2:
        LDR.N    R0,??DataTable1_2  ;; 0x40004800
        CMP      R4,R0
        BNE.N    ??USART_DeInit_3
//  136   {
//  137     RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART3, ENABLE);
        MOVS     R1,#+1
        MOVS     R0,#+262144
        BL       RCC_APB1PeriphResetCmd
//  138     RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART3, DISABLE);
        MOVS     R1,#+0
        MOVS     R0,#+262144
        BL       RCC_APB1PeriphResetCmd
        B.N      ??USART_DeInit_1
//  139   }    
//  140   else if (USARTx == UART4)
??USART_DeInit_3:
        LDR.N    R0,??DataTable1_3  ;; 0x40004c00
        CMP      R4,R0
        BNE.N    ??USART_DeInit_4
//  141   {
//  142     RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART4, ENABLE);
        MOVS     R1,#+1
        MOVS     R0,#+524288
        BL       RCC_APB1PeriphResetCmd
//  143     RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART4, DISABLE);
        MOVS     R1,#+0
        MOVS     R0,#+524288
        BL       RCC_APB1PeriphResetCmd
        B.N      ??USART_DeInit_1
//  144   }    
//  145   else
//  146   {
//  147     if (USARTx == UART5)
??USART_DeInit_4:
        LDR.N    R0,??DataTable1_4  ;; 0x40005000
        CMP      R4,R0
        BNE.N    ??USART_DeInit_1
//  148     { 
//  149       RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART5, ENABLE);
        MOVS     R1,#+1
        MOVS     R0,#+1048576
        BL       RCC_APB1PeriphResetCmd
//  150       RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART5, DISABLE);
        MOVS     R1,#+0
        MOVS     R0,#+1048576
        BL       RCC_APB1PeriphResetCmd
//  151     }
//  152   }
//  153 }
??USART_DeInit_1:
        POP      {R4,PC}          ;; return
//  154 
//  155 /**
//  156   * @brief  Initializes the USARTx peripheral according to the specified
//  157   *   parameters in the USART_InitStruct .
//  158   * @param  USARTx: Select the USART or the UART peripheral. 
//  159   *   This parameter can be one of the following values:
//  160   *   USART1, USART2, USART3, UART4 or UART5.
//  161   * @param  USART_InitStruct: pointer to a USART_InitTypeDef structure
//  162   *   that contains the configuration information for the specified USART peripheral.
//  163   * @retval None
//  164   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  165 void USART_Init(USART_TypeDef* USARTx, USART_InitTypeDef* USART_InitStruct)
//  166 {
USART_Init:
        PUSH     {R4-R10,LR}
        SUB      SP,SP,#+24
        MOVS     R4,R0
        MOVS     R5,R1
//  167   uint32_t tmpreg = 0x00, apbclock = 0x00;
        MOVS     R6,#+0
        MOVS     R7,#+0
//  168   uint32_t integerdivider = 0x00;
        MOVS     R8,#+0
//  169   uint32_t fractionaldivider = 0x00;
        MOVS     R9,#+0
//  170   uint32_t usartxbase = 0;
        MOVS     R10,#+0
//  171   RCC_ClocksTypeDef RCC_ClocksStatus;
//  172   /* Check the parameters */
//  173   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  174   assert_param(IS_USART_BAUDRATE(USART_InitStruct->USART_BaudRate));  
//  175   assert_param(IS_USART_WORD_LENGTH(USART_InitStruct->USART_WordLength));
//  176   assert_param(IS_USART_STOPBITS(USART_InitStruct->USART_StopBits));
//  177   assert_param(IS_USART_PARITY(USART_InitStruct->USART_Parity));
//  178   assert_param(IS_USART_MODE(USART_InitStruct->USART_Mode));
//  179   assert_param(IS_USART_HARDWARE_FLOW_CONTROL(USART_InitStruct->USART_HardwareFlowControl));
//  180   /* The hardware flow control is available only for USART1, USART2 and USART3 */
//  181   if (USART_InitStruct->USART_HardwareFlowControl != USART_HardwareFlowControl_None)
        LDRH     R0,[R5, #+12]
        CMP      R0,#+0
//  182   {
//  183     assert_param(IS_USART_123_PERIPH(USARTx));
//  184   }
//  185 
//  186   usartxbase = (uint32_t)USARTx;
??USART_Init_0:
        MOV      R10,R4
//  187 
//  188 /*---------------------------- USART CR2 Configuration -----------------------*/
//  189   tmpreg = USARTx->CR2;
        LDRH     R0,[R4, #+16]
        MOVS     R6,R0
//  190   /* Clear STOP[13:12] bits */
//  191   tmpreg &= CR2_STOP_CLEAR_Mask;
        MOVW     R0,#+53247
        ANDS     R6,R0,R6
//  192   /* Configure the USART Stop Bits, Clock, CPOL, CPHA and LastBit ------------*/
//  193   /* Set STOP[13:12] bits according to USART_StopBits value */
//  194   tmpreg |= (uint32_t)USART_InitStruct->USART_StopBits;
        LDRH     R0,[R5, #+6]
        ORRS     R6,R0,R6
//  195   
//  196   /* Write to USART CR2 */
//  197   USARTx->CR2 = (uint16_t)tmpreg;
        STRH     R6,[R4, #+16]
//  198 
//  199 /*---------------------------- USART CR1 Configuration -----------------------*/
//  200   tmpreg = USARTx->CR1;
        LDRH     R0,[R4, #+12]
        MOVS     R6,R0
//  201   /* Clear M, PCE, PS, TE and RE bits */
//  202   tmpreg &= CR1_CLEAR_Mask;
        MOVW     R0,#+59891
        ANDS     R6,R0,R6
//  203   /* Configure the USART Word Length, Parity and mode ----------------------- */
//  204   /* Set the M bits according to USART_WordLength value */
//  205   /* Set PCE and PS bits according to USART_Parity value */
//  206   /* Set TE and RE bits according to USART_Mode value */
//  207   tmpreg |= (uint32_t)USART_InitStruct->USART_WordLength | USART_InitStruct->USART_Parity |
//  208             USART_InitStruct->USART_Mode;
        LDRH     R0,[R5, #+4]
        LDRH     R1,[R5, #+8]
        ORRS     R0,R1,R0
        LDRH     R1,[R5, #+10]
        ORRS     R0,R1,R0
        ORRS     R6,R0,R6
//  209   /* Write to USART CR1 */
//  210   USARTx->CR1 = (uint16_t)tmpreg;
        STRH     R6,[R4, #+12]
//  211 
//  212 /*---------------------------- USART CR3 Configuration -----------------------*/  
//  213   tmpreg = USARTx->CR3;
        LDRH     R0,[R4, #+20]
        MOVS     R6,R0
//  214   /* Clear CTSE and RTSE bits */
//  215   tmpreg &= CR3_CLEAR_Mask;
        MOVW     R0,#+64767
        ANDS     R6,R0,R6
//  216   /* Configure the USART HFC -------------------------------------------------*/
//  217   /* Set CTSE and RTSE bits according to USART_HardwareFlowControl value */
//  218   tmpreg |= USART_InitStruct->USART_HardwareFlowControl;
        LDRH     R0,[R5, #+12]
        ORRS     R6,R0,R6
//  219   /* Write to USART CR3 */
//  220   USARTx->CR3 = (uint16_t)tmpreg;
        STRH     R6,[R4, #+20]
//  221 
//  222 /*---------------------------- USART BRR Configuration -----------------------*/
//  223   /* Configure the USART Baud Rate -------------------------------------------*/
//  224   RCC_GetClocksFreq(&RCC_ClocksStatus);
        ADD      R0,SP,#+0
        BL       RCC_GetClocksFreq
//  225   if (usartxbase == USART1_BASE)
        LDR.N    R0,??DataTable1  ;; 0x40013800
        CMP      R10,R0
        BNE.N    ??USART_Init_1
//  226   {
//  227     apbclock = RCC_ClocksStatus.PCLK2_Frequency;
        LDR      R0,[SP, #+12]
        MOVS     R7,R0
        B.N      ??USART_Init_2
//  228   }
//  229   else
//  230   {
//  231     apbclock = RCC_ClocksStatus.PCLK1_Frequency;
??USART_Init_1:
        LDR      R0,[SP, #+8]
        MOVS     R7,R0
//  232   }
//  233   /* Determine the integer part */
//  234   integerdivider = ((0x19 * apbclock) / (0x04 * (USART_InitStruct->USART_BaudRate)));
??USART_Init_2:
        MOVS     R0,#+25
        MUL      R0,R0,R7
        LDR      R1,[R5, #+0]
        LSLS     R1,R1,#+2
        UDIV     R0,R0,R1
        MOV      R8,R0
//  235   tmpreg = (integerdivider / 0x64) << 0x04;
        MOVS     R0,#+100
        UDIV     R0,R8,R0
        LSLS     R0,R0,#+4
        MOVS     R6,R0
//  236   /* Determine the fractional part */
//  237   fractionaldivider = integerdivider - (0x64 * (tmpreg >> 0x04));
        LSRS     R0,R6,#+4
        MOVS     R1,#+100
        MLS      R0,R1,R0,R8
        MOV      R9,R0
//  238   tmpreg |= ((((fractionaldivider * 0x10) + 0x32) / 0x64)) & ((uint8_t)0x0F);
        LSLS     R0,R9,#+4
        ADDS     R0,R0,#+50
        MOVS     R1,#+100
        UDIV     R0,R0,R1
        ANDS     R0,R0,#0xF
        ORRS     R6,R0,R6
//  239   /* Write to USART BRR */
//  240   USARTx->BRR = (uint16_t)tmpreg;
        STRH     R6,[R4, #+8]
//  241 }
        ADD      SP,SP,#+24
        POP      {R4-R10,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x40013800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x40004400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x40004800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x40004c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x40005000
//  242 
//  243 /**
//  244   * @brief  Fills each USART_InitStruct member with its default value.
//  245   * @param  USART_InitStruct: pointer to a USART_InitTypeDef structure
//  246   *   which will be initialized.
//  247   * @retval None
//  248   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  249 void USART_StructInit(USART_InitTypeDef* USART_InitStruct)
//  250 {
//  251   /* USART_InitStruct members default value */
//  252   USART_InitStruct->USART_BaudRate = 9600;
USART_StructInit:
        MOV      R1,#+9600
        STR      R1,[R0, #+0]
//  253   USART_InitStruct->USART_WordLength = USART_WordLength_8b;
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
//  254   USART_InitStruct->USART_StopBits = USART_StopBits_1;
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
//  255   USART_InitStruct->USART_Parity = USART_Parity_No ;
        MOVS     R1,#+0
        STRH     R1,[R0, #+8]
//  256   USART_InitStruct->USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
        MOVS     R1,#+12
        STRH     R1,[R0, #+10]
//  257   USART_InitStruct->USART_HardwareFlowControl = USART_HardwareFlowControl_None;  
        MOVS     R1,#+0
        STRH     R1,[R0, #+12]
//  258 }
        BX       LR               ;; return
//  259 
//  260 /**
//  261   * @brief  Initializes the USARTx peripheral Clock according to the 
//  262   *   specified parameters in the USART_ClockInitStruct .
//  263   * @param  USARTx: where x can be 1, 2, 3 to select the USART peripheral.
//  264   * @param  USART_ClockInitStruct: pointer to a USART_ClockInitTypeDef
//  265   *   structure that contains the configuration information for the specified 
//  266   *   USART peripheral.  
//  267   * @note The Smart Card mode is not available for UART4 and UART5.
//  268   * @retval None
//  269   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  270 void USART_ClockInit(USART_TypeDef* USARTx, USART_ClockInitTypeDef* USART_ClockInitStruct)
//  271 {
USART_ClockInit:
        PUSH     {R4}
//  272   uint32_t tmpreg = 0x00;
        MOVS     R2,#+0
//  273   /* Check the parameters */
//  274   assert_param(IS_USART_123_PERIPH(USARTx));
//  275   assert_param(IS_USART_CLOCK(USART_ClockInitStruct->USART_Clock));
//  276   assert_param(IS_USART_CPOL(USART_ClockInitStruct->USART_CPOL));
//  277   assert_param(IS_USART_CPHA(USART_ClockInitStruct->USART_CPHA));
//  278   assert_param(IS_USART_LASTBIT(USART_ClockInitStruct->USART_LastBit));
//  279   
//  280 /*---------------------------- USART CR2 Configuration -----------------------*/
//  281   tmpreg = USARTx->CR2;
        LDRH     R3,[R0, #+16]
        MOVS     R2,R3
//  282   /* Clear CLKEN, CPOL, CPHA and LBCL bits */
//  283   tmpreg &= CR2_CLOCK_CLEAR_Mask;
        MOVW     R3,#+61695
        ANDS     R2,R3,R2
//  284   /* Configure the USART Clock, CPOL, CPHA and LastBit ------------*/
//  285   /* Set CLKEN bit according to USART_Clock value */
//  286   /* Set CPOL bit according to USART_CPOL value */
//  287   /* Set CPHA bit according to USART_CPHA value */
//  288   /* Set LBCL bit according to USART_LastBit value */
//  289   tmpreg |= (uint32_t)USART_ClockInitStruct->USART_Clock | USART_ClockInitStruct->USART_CPOL | 
//  290                  USART_ClockInitStruct->USART_CPHA | USART_ClockInitStruct->USART_LastBit;
        LDRH     R3,[R1, #+0]
        LDRH     R4,[R1, #+2]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+4]
        ORRS     R3,R4,R3
        LDRH     R4,[R1, #+6]
        ORRS     R3,R4,R3
        ORRS     R2,R3,R2
//  291   /* Write to USART CR2 */
//  292   USARTx->CR2 = (uint16_t)tmpreg;
        STRH     R2,[R0, #+16]
//  293 }
        POP      {R4}
        BX       LR               ;; return
//  294 
//  295 /**
//  296   * @brief  Fills each USART_ClockInitStruct member with its default value.
//  297   * @param  USART_ClockInitStruct: pointer to a USART_ClockInitTypeDef
//  298   *   structure which will be initialized.
//  299   * @retval None
//  300   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  301 void USART_ClockStructInit(USART_ClockInitTypeDef* USART_ClockInitStruct)
//  302 {
//  303   /* USART_ClockInitStruct members default value */
//  304   USART_ClockInitStruct->USART_Clock = USART_Clock_Disable;
USART_ClockStructInit:
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
//  305   USART_ClockInitStruct->USART_CPOL = USART_CPOL_Low;
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
//  306   USART_ClockInitStruct->USART_CPHA = USART_CPHA_1Edge;
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
//  307   USART_ClockInitStruct->USART_LastBit = USART_LastBit_Disable;
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
//  308 }
        BX       LR               ;; return
//  309 
//  310 /**
//  311   * @brief  Enables or disables the specified USART peripheral.
//  312   * @param  USARTx: Select the USART or the UART peripheral. 
//  313   *   This parameter can be one of the following values:
//  314   *   USART1, USART2, USART3, UART4 or UART5.
//  315   * @param  NewState: new state of the USARTx peripheral.
//  316   *   This parameter can be: ENABLE or DISABLE.
//  317   * @retval None
//  318   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  319 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
//  320 {
//  321   /* Check the parameters */
//  322   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  323   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  324   
//  325   if (NewState != DISABLE)
USART_Cmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_Cmd_0
//  326   {
//  327     /* Enable the selected USART by setting the UE bit in the CR1 register */
//  328     USARTx->CR1 |= CR1_UE_Set;
        LDRH     R2,[R0, #+12]
        ORRS     R2,R2,#0x2000
        STRH     R2,[R0, #+12]
        B.N      ??USART_Cmd_1
//  329   }
//  330   else
//  331   {
//  332     /* Disable the selected USART by clearing the UE bit in the CR1 register */
//  333     USARTx->CR1 &= CR1_UE_Reset;
??USART_Cmd_0:
        LDRH     R2,[R0, #+12]
        MOVW     R3,#+57343
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+12]
//  334   }
//  335 }
??USART_Cmd_1:
        BX       LR               ;; return
//  336 
//  337 /**
//  338   * @brief  Enables or disables the specified USART interrupts.
//  339   * @param  USARTx: Select the USART or the UART peripheral. 
//  340   *   This parameter can be one of the following values:
//  341   *   USART1, USART2, USART3, UART4 or UART5.
//  342   * @param  USART_IT: specifies the USART interrupt sources to be enabled or disabled.
//  343   *   This parameter can be one of the following values:
//  344   *     @arg USART_IT_CTS:  CTS change interrupt (not available for UART4 and UART5)
//  345   *     @arg USART_IT_LBD:  LIN Break detection interrupt
//  346   *     @arg USART_IT_TXE:  Tansmit Data Register empty interrupt
//  347   *     @arg USART_IT_TC:   Transmission complete interrupt
//  348   *     @arg USART_IT_RXNE: Receive Data register not empty interrupt
//  349   *     @arg USART_IT_IDLE: Idle line detection interrupt
//  350   *     @arg USART_IT_PE:   Parity Error interrupt
//  351   *     @arg USART_IT_ERR:  Error interrupt(Frame error, noise error, overrun error)
//  352   * @param  NewState: new state of the specified USARTx interrupts.
//  353   *   This parameter can be: ENABLE or DISABLE.
//  354   * @retval None
//  355   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  356 void USART_ITConfig(USART_TypeDef* USARTx, uint16_t USART_IT, FunctionalState NewState)
//  357 {
USART_ITConfig:
        PUSH     {R4-R7}
//  358   uint32_t usartreg = 0x00, itpos = 0x00, itmask = 0x00;
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
//  359   uint32_t usartxbase = 0x00;
        MOVS     R6,#+0
//  360   /* Check the parameters */
//  361   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  362   assert_param(IS_USART_CONFIG_IT(USART_IT));
//  363   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  364   /* The CTS interrupt is not available for UART4 and UART5 */
//  365   if (USART_IT == USART_IT_CTS)
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVW     R7,#+2410
        CMP      R1,R7
//  366   {
//  367     assert_param(IS_USART_123_PERIPH(USARTx));
//  368   }   
//  369   
//  370   usartxbase = (uint32_t)USARTx;
??USART_ITConfig_0:
        MOVS     R6,R0
//  371 
//  372   /* Get the USART register index */
//  373   usartreg = (((uint8_t)USART_IT) >> 0x05);
        MOVS     R7,R1
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LSRS     R7,R7,#+5
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R3,R7
//  374 
//  375   /* Get the interrupt position */
//  376   itpos = USART_IT & IT_Mask;
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ANDS     R7,R1,#0x1F
        MOVS     R4,R7
//  377   itmask = (((uint32_t)0x01) << itpos);
        MOVS     R7,#+1
        LSLS     R7,R7,R4
        MOVS     R5,R7
//  378     
//  379   if (usartreg == 0x01) /* The IT is in CR1 register */
        CMP      R3,#+1
        BNE.N    ??USART_ITConfig_1
//  380   {
//  381     usartxbase += 0x0C;
        ADDS     R6,R6,#+12
        B.N      ??USART_ITConfig_2
//  382   }
//  383   else if (usartreg == 0x02) /* The IT is in CR2 register */
??USART_ITConfig_1:
        CMP      R3,#+2
        BNE.N    ??USART_ITConfig_3
//  384   {
//  385     usartxbase += 0x10;
        ADDS     R6,R6,#+16
        B.N      ??USART_ITConfig_2
//  386   }
//  387   else /* The IT is in CR3 register */
//  388   {
//  389     usartxbase += 0x14; 
??USART_ITConfig_3:
        ADDS     R6,R6,#+20
//  390   }
//  391   if (NewState != DISABLE)
??USART_ITConfig_2:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??USART_ITConfig_4
//  392   {
//  393     *(__IO uint32_t*)usartxbase  |= itmask;
        LDR      R7,[R6, #+0]
        ORRS     R7,R5,R7
        STR      R7,[R6, #+0]
        B.N      ??USART_ITConfig_5
//  394   }
//  395   else
//  396   {
//  397     *(__IO uint32_t*)usartxbase &= ~itmask;
??USART_ITConfig_4:
        LDR      R7,[R6, #+0]
        BICS     R7,R7,R5
        STR      R7,[R6, #+0]
//  398   }
//  399 }
??USART_ITConfig_5:
        POP      {R4-R7}
        BX       LR               ;; return
//  400 
//  401 /**
//  402   * @brief  Enables or disables the USART’s DMA interface.
//  403   * @param  USARTx: Select the USART or the UART peripheral. 
//  404   *   This parameter can be one of the following values:
//  405   *   USART1, USART2, USART3 or UART4.  
//  406   * @param  USART_DMAReq: specifies the DMA request.
//  407   *   This parameter can be any combination of the following values:
//  408   *     @arg USART_DMAReq_Tx: USART DMA transmit request
//  409   *     @arg USART_DMAReq_Rx: USART DMA receive request
//  410   * @param  NewState: new state of the DMA Request sources.
//  411   *   This parameter can be: ENABLE or DISABLE.
//  412   * @note The DMA mode is not available for UART5.  
//  413   * @retval None
//  414   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  415 void USART_DMACmd(USART_TypeDef* USARTx, uint16_t USART_DMAReq, FunctionalState NewState)
//  416 {
//  417   /* Check the parameters */
//  418   assert_param(IS_USART_1234_PERIPH(USARTx));
//  419   assert_param(IS_USART_DMAREQ(USART_DMAReq));  
//  420   assert_param(IS_FUNCTIONAL_STATE(NewState)); 
//  421   if (NewState != DISABLE)
USART_DMACmd:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??USART_DMACmd_0
//  422   {
//  423     /* Enable the DMA transfer for selected requests by setting the DMAT and/or
//  424        DMAR bits in the USART CR3 register */
//  425     USARTx->CR3 |= USART_DMAReq;
        LDRH     R3,[R0, #+20]
        ORRS     R3,R1,R3
        STRH     R3,[R0, #+20]
        B.N      ??USART_DMACmd_1
//  426   }
//  427   else
//  428   {
//  429     /* Disable the DMA transfer for selected requests by clearing the DMAT and/or
//  430        DMAR bits in the USART CR3 register */
//  431     USARTx->CR3 &= (uint16_t)~USART_DMAReq;
??USART_DMACmd_0:
        LDRH     R3,[R0, #+20]
        BICS     R3,R3,R1
        STRH     R3,[R0, #+20]
//  432   }
//  433 }
??USART_DMACmd_1:
        BX       LR               ;; return
//  434 
//  435 /**
//  436   * @brief  Sets the address of the USART node.
//  437   * @param  USARTx: Select the USART or the UART peripheral. 
//  438   *   This parameter can be one of the following values:
//  439   *   USART1, USART2, USART3, UART4 or UART5.
//  440   * @param  USART_Address: Indicates the address of the USART node.
//  441   * @retval None
//  442   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  443 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
//  444 {
//  445   /* Check the parameters */
//  446   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  447   assert_param(IS_USART_ADDRESS(USART_Address)); 
//  448     
//  449   /* Clear the USART address */
//  450   USARTx->CR2 &= CR2_Address_Mask;
USART_SetAddress:
        LDRH     R2,[R0, #+16]
        MOVW     R3,#+65520
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+16]
//  451   /* Set the USART address node */
//  452   USARTx->CR2 |= USART_Address;
        LDRH     R2,[R0, #+16]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+16]
//  453 }
        BX       LR               ;; return
//  454 
//  455 /**
//  456   * @brief  Selects the USART WakeUp method.
//  457   * @param  USARTx: Select the USART or the UART peripheral. 
//  458   *   This parameter can be one of the following values:
//  459   *   USART1, USART2, USART3, UART4 or UART5.
//  460   * @param  USART_WakeUp: specifies the USART wakeup method.
//  461   *   This parameter can be one of the following values:
//  462   *     @arg USART_WakeUp_IdleLine: WakeUp by an idle line detection
//  463   *     @arg USART_WakeUp_AddressMark: WakeUp by an address mark
//  464   * @retval None
//  465   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  466 void USART_WakeUpConfig(USART_TypeDef* USARTx, uint16_t USART_WakeUp)
//  467 {
//  468   /* Check the parameters */
//  469   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  470   assert_param(IS_USART_WAKEUP(USART_WakeUp));
//  471   
//  472   USARTx->CR1 &= CR1_WAKE_Mask;
USART_WakeUpConfig:
        LDRH     R2,[R0, #+12]
        MOVW     R3,#+63487
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+12]
//  473   USARTx->CR1 |= USART_WakeUp;
        LDRH     R2,[R0, #+12]
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+12]
//  474 }
        BX       LR               ;; return
//  475 
//  476 /**
//  477   * @brief  Determines if the USART is in mute mode or not.
//  478   * @param  USARTx: Select the USART or the UART peripheral. 
//  479   *   This parameter can be one of the following values:
//  480   *   USART1, USART2, USART3, UART4 or UART5.
//  481   * @param  NewState: new state of the USART mute mode.
//  482   *   This parameter can be: ENABLE or DISABLE.
//  483   * @retval None
//  484   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  485 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
//  486 {
//  487   /* Check the parameters */
//  488   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  489   assert_param(IS_FUNCTIONAL_STATE(NewState)); 
//  490   
//  491   if (NewState != DISABLE)
USART_ReceiverWakeUpCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_ReceiverWakeUpCmd_0
//  492   {
//  493     /* Enable the USART mute mode  by setting the RWU bit in the CR1 register */
//  494     USARTx->CR1 |= CR1_RWU_Set;
        LDRH     R2,[R0, #+12]
        ORRS     R2,R2,#0x2
        STRH     R2,[R0, #+12]
        B.N      ??USART_ReceiverWakeUpCmd_1
//  495   }
//  496   else
//  497   {
//  498     /* Disable the USART mute mode by clearing the RWU bit in the CR1 register */
//  499     USARTx->CR1 &= CR1_RWU_Reset;
??USART_ReceiverWakeUpCmd_0:
        LDRH     R2,[R0, #+12]
        MOVW     R3,#+65533
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+12]
//  500   }
//  501 }
??USART_ReceiverWakeUpCmd_1:
        BX       LR               ;; return
//  502 
//  503 /**
//  504   * @brief  Sets the USART LIN Break detection length.
//  505   * @param  USARTx: Select the USART or the UART peripheral. 
//  506   *   This parameter can be one of the following values:
//  507   *   USART1, USART2, USART3, UART4 or UART5.
//  508   * @param  USART_LINBreakDetectLength: specifies the LIN break detection length.
//  509   *   This parameter can be one of the following values:
//  510   *     @arg USART_LINBreakDetectLength_10b: 10-bit break detection
//  511   *     @arg USART_LINBreakDetectLength_11b: 11-bit break detection
//  512   * @retval None
//  513   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  514 void USART_LINBreakDetectLengthConfig(USART_TypeDef* USARTx, uint16_t USART_LINBreakDetectLength)
//  515 {
//  516   /* Check the parameters */
//  517   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  518   assert_param(IS_USART_LIN_BREAK_DETECT_LENGTH(USART_LINBreakDetectLength));
//  519   
//  520   USARTx->CR2 &= CR2_LBDL_Mask;
USART_LINBreakDetectLengthConfig:
        LDRH     R2,[R0, #+16]
        MOVW     R3,#+65503
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+16]
//  521   USARTx->CR2 |= USART_LINBreakDetectLength;  
        LDRH     R2,[R0, #+16]
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+16]
//  522 }
        BX       LR               ;; return
//  523 
//  524 /**
//  525   * @brief  Enables or disables the USART’s LIN mode.
//  526   * @param  USARTx: Select the USART or the UART peripheral. 
//  527   *   This parameter can be one of the following values:
//  528   *   USART1, USART2, USART3, UART4 or UART5.
//  529   * @param  NewState: new state of the USART LIN mode.
//  530   *   This parameter can be: ENABLE or DISABLE.
//  531   * @retval None
//  532   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  533 void USART_LINCmd(USART_TypeDef* USARTx, FunctionalState NewState)
//  534 {
//  535   /* Check the parameters */
//  536   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  537   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  538   
//  539   if (NewState != DISABLE)
USART_LINCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_LINCmd_0
//  540   {
//  541     /* Enable the LIN mode by setting the LINEN bit in the CR2 register */
//  542     USARTx->CR2 |= CR2_LINEN_Set;
        LDRH     R2,[R0, #+16]
        ORRS     R2,R2,#0x4000
        STRH     R2,[R0, #+16]
        B.N      ??USART_LINCmd_1
//  543   }
//  544   else
//  545   {
//  546     /* Disable the LIN mode by clearing the LINEN bit in the CR2 register */
//  547     USARTx->CR2 &= CR2_LINEN_Reset;
??USART_LINCmd_0:
        LDRH     R2,[R0, #+16]
        MOVW     R3,#+49151
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+16]
//  548   }
//  549 }
??USART_LINCmd_1:
        BX       LR               ;; return
//  550 
//  551 /**
//  552   * @brief  Transmits single data through the USARTx peripheral.
//  553   * @param  USARTx: Select the USART or the UART peripheral. 
//  554   *   This parameter can be one of the following values:
//  555   *   USART1, USART2, USART3, UART4 or UART5.
//  556   * @param  Data: the data to transmit.
//  557   * @retval None
//  558   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  559 void USART_SendData(USART_TypeDef* USARTx, uint16_t Data)
//  560 {
//  561   /* Check the parameters */
//  562   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  563   assert_param(IS_USART_DATA(Data)); 
//  564     
//  565   /* Transmit Data */
//  566   USARTx->DR = (Data & (uint16_t)0x01FF);
USART_SendData:
        LSLS     R2,R1,#+23       ;; ZeroExtS R2,R1,#+23,#+23
        LSRS     R2,R2,#+23
        STRH     R2,[R0, #+4]
//  567 }
        BX       LR               ;; return
//  568 
//  569 /**
//  570   * @brief  Returns the most recent received data by the USARTx peripheral.
//  571   * @param  USARTx: Select the USART or the UART peripheral. 
//  572   *   This parameter can be one of the following values:
//  573   *   USART1, USART2, USART3, UART4 or UART5.
//  574   * @retval The received data.
//  575   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  576 uint16_t USART_ReceiveData(USART_TypeDef* USARTx)
//  577 {
//  578   /* Check the parameters */
//  579   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  580   
//  581   /* Receive Data */
//  582   return (uint16_t)(USARTx->DR & (uint16_t)0x01FF);
USART_ReceiveData:
        LDRH     R0,[R0, #+4]
        LSLS     R0,R0,#+23       ;; ZeroExtS R0,R0,#+23,#+23
        LSRS     R0,R0,#+23
        BX       LR               ;; return
//  583 }
//  584 
//  585 /**
//  586   * @brief  Transmits break characters.
//  587   * @param  USARTx: Select the USART or the UART peripheral. 
//  588   *   This parameter can be one of the following values:
//  589   *   USART1, USART2, USART3, UART4 or UART5.
//  590   * @retval None
//  591   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  592 void USART_SendBreak(USART_TypeDef* USARTx)
//  593 {
//  594   /* Check the parameters */
//  595   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  596   
//  597   /* Send break characters */
//  598   USARTx->CR1 |= CR1_SBK_Set;
USART_SendBreak:
        LDRH     R1,[R0, #+12]
        ORRS     R1,R1,#0x1
        STRH     R1,[R0, #+12]
//  599 }
        BX       LR               ;; return
//  600 
//  601 /**
//  602   * @brief  Sets the specified USART guard time.
//  603   * @param  USARTx: where x can be 1, 2 or 3 to select the USART peripheral.
//  604   * @param  USART_GuardTime: specifies the guard time.
//  605   * @note The guard time bits are not available for UART4 and UART5.   
//  606   * @retval None
//  607   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  608 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
//  609 {    
//  610   /* Check the parameters */
//  611   assert_param(IS_USART_123_PERIPH(USARTx));
//  612   
//  613   /* Clear the USART Guard time */
//  614   USARTx->GTPR &= GTPR_LSB_Mask;
USART_SetGuardTime:
        LDRH     R2,[R0, #+24]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        STRH     R2,[R0, #+24]
//  615   /* Set the USART guard time */
//  616   USARTx->GTPR |= (uint16_t)((uint16_t)USART_GuardTime << 0x08);
        LDRH     R2,[R0, #+24]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R2,R2,R1, LSL #+8
        STRH     R2,[R0, #+24]
//  617 }
        BX       LR               ;; return
//  618 
//  619 /**
//  620   * @brief  Sets the system clock prescaler.
//  621   * @param  USARTx: Select the USART or the UART peripheral. 
//  622   *   This parameter can be one of the following values:
//  623   *   USART1, USART2, USART3, UART4 or UART5.
//  624   * @param  USART_Prescaler: specifies the prescaler clock.  
//  625   * @note   The function is used for IrDA mode with UART4 and UART5.
//  626   * @retval None
//  627   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  628 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
//  629 { 
//  630   /* Check the parameters */
//  631   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  632   
//  633   /* Clear the USART prescaler */
//  634   USARTx->GTPR &= GTPR_MSB_Mask;
USART_SetPrescaler:
        LDRH     R2,[R0, #+24]
        ANDS     R2,R2,#0xFF00
        STRH     R2,[R0, #+24]
//  635   /* Set the USART prescaler */
//  636   USARTx->GTPR |= USART_Prescaler;
        LDRH     R2,[R0, #+24]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+24]
//  637 }
        BX       LR               ;; return
//  638 
//  639 /**
//  640   * @brief  Enables or disables the USART’s Smart Card mode.
//  641   * @param  USARTx: where x can be 1, 2 or 3 to select the USART peripheral.
//  642   * @param  NewState: new state of the Smart Card mode.
//  643   *   This parameter can be: ENABLE or DISABLE.     
//  644   * @note The Smart Card mode is not available for UART4 and UART5. 
//  645   * @retval None
//  646   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  647 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
//  648 {
//  649   /* Check the parameters */
//  650   assert_param(IS_USART_123_PERIPH(USARTx));
//  651   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  652   if (NewState != DISABLE)
USART_SmartCardCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_SmartCardCmd_0
//  653   {
//  654     /* Enable the SC mode by setting the SCEN bit in the CR3 register */
//  655     USARTx->CR3 |= CR3_SCEN_Set;
        LDRH     R2,[R0, #+20]
        ORRS     R2,R2,#0x20
        STRH     R2,[R0, #+20]
        B.N      ??USART_SmartCardCmd_1
//  656   }
//  657   else
//  658   {
//  659     /* Disable the SC mode by clearing the SCEN bit in the CR3 register */
//  660     USARTx->CR3 &= CR3_SCEN_Reset;
??USART_SmartCardCmd_0:
        LDRH     R2,[R0, #+20]
        MOVW     R3,#+65503
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+20]
//  661   }
//  662 }
??USART_SmartCardCmd_1:
        BX       LR               ;; return
//  663 
//  664 /**
//  665   * @brief  Enables or disables NACK transmission.
//  666   * @param  USARTx: where x can be 1, 2 or 3 to select the USART peripheral. 
//  667   * @param  NewState: new state of the NACK transmission.
//  668   *   This parameter can be: ENABLE or DISABLE.  
//  669   * @note The Smart Card mode is not available for UART4 and UART5.
//  670   * @retval None
//  671   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  672 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
//  673 {
//  674   /* Check the parameters */
//  675   assert_param(IS_USART_123_PERIPH(USARTx));  
//  676   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  677   if (NewState != DISABLE)
USART_SmartCardNACKCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_SmartCardNACKCmd_0
//  678   {
//  679     /* Enable the NACK transmission by setting the NACK bit in the CR3 register */
//  680     USARTx->CR3 |= CR3_NACK_Set;
        LDRH     R2,[R0, #+20]
        ORRS     R2,R2,#0x10
        STRH     R2,[R0, #+20]
        B.N      ??USART_SmartCardNACKCmd_1
//  681   }
//  682   else
//  683   {
//  684     /* Disable the NACK transmission by clearing the NACK bit in the CR3 register */
//  685     USARTx->CR3 &= CR3_NACK_Reset;
??USART_SmartCardNACKCmd_0:
        LDRH     R2,[R0, #+20]
        MOVW     R3,#+65519
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+20]
//  686   }
//  687 }
??USART_SmartCardNACKCmd_1:
        BX       LR               ;; return
//  688 
//  689 /**
//  690   * @brief  Enables or disables the USART’s Half Duplex communication.
//  691   * @param  USARTx: Select the USART or the UART peripheral. 
//  692   *   This parameter can be one of the following values:
//  693   *   USART1, USART2, USART3, UART4 or UART5.
//  694   * @param  NewState: new state of the USART Communication.
//  695   *   This parameter can be: ENABLE or DISABLE.
//  696   * @retval None
//  697   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  698 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
//  699 {
//  700   /* Check the parameters */
//  701   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  702   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  703   
//  704   if (NewState != DISABLE)
USART_HalfDuplexCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_HalfDuplexCmd_0
//  705   {
//  706     /* Enable the Half-Duplex mode by setting the HDSEL bit in the CR3 register */
//  707     USARTx->CR3 |= CR3_HDSEL_Set;
        LDRH     R2,[R0, #+20]
        ORRS     R2,R2,#0x8
        STRH     R2,[R0, #+20]
        B.N      ??USART_HalfDuplexCmd_1
//  708   }
//  709   else
//  710   {
//  711     /* Disable the Half-Duplex mode by clearing the HDSEL bit in the CR3 register */
//  712     USARTx->CR3 &= CR3_HDSEL_Reset;
??USART_HalfDuplexCmd_0:
        LDRH     R2,[R0, #+20]
        MOVW     R3,#+65527
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+20]
//  713   }
//  714 }
??USART_HalfDuplexCmd_1:
        BX       LR               ;; return
//  715 
//  716 /**
//  717   * @brief  Configures the USART’s IrDA interface.
//  718   * @param  USARTx: Select the USART or the UART peripheral. 
//  719   *   This parameter can be one of the following values:
//  720   *   USART1, USART2, USART3, UART4 or UART5.
//  721   * @param  USART_IrDAMode: specifies the IrDA mode.
//  722   *   This parameter can be one of the following values:
//  723   *     @arg USART_IrDAMode_LowPower
//  724   *     @arg USART_IrDAMode_Normal
//  725   * @retval None
//  726   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  727 void USART_IrDAConfig(USART_TypeDef* USARTx, uint16_t USART_IrDAMode)
//  728 {
//  729   /* Check the parameters */
//  730   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  731   assert_param(IS_USART_IRDA_MODE(USART_IrDAMode));
//  732     
//  733   USARTx->CR3 &= CR3_IRLP_Mask;
USART_IrDAConfig:
        LDRH     R2,[R0, #+20]
        MOVW     R3,#+65531
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+20]
//  734   USARTx->CR3 |= USART_IrDAMode;
        LDRH     R2,[R0, #+20]
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+20]
//  735 }
        BX       LR               ;; return
//  736 
//  737 /**
//  738   * @brief  Enables or disables the USART’s IrDA interface.
//  739   * @param  USARTx: Select the USART or the UART peripheral. 
//  740   *   This parameter can be one of the following values:
//  741   *   USART1, USART2, USART3, UART4 or UART5.
//  742   * @param  NewState: new state of the IrDA mode.
//  743   *   This parameter can be: ENABLE or DISABLE.
//  744   * @retval None
//  745   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  746 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
//  747 {
//  748   /* Check the parameters */
//  749   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  750   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  751     
//  752   if (NewState != DISABLE)
USART_IrDACmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??USART_IrDACmd_0
//  753   {
//  754     /* Enable the IrDA mode by setting the IREN bit in the CR3 register */
//  755     USARTx->CR3 |= CR3_IREN_Set;
        LDRH     R2,[R0, #+20]
        ORRS     R2,R2,#0x2
        STRH     R2,[R0, #+20]
        B.N      ??USART_IrDACmd_1
//  756   }
//  757   else
//  758   {
//  759     /* Disable the IrDA mode by clearing the IREN bit in the CR3 register */
//  760     USARTx->CR3 &= CR3_IREN_Reset;
??USART_IrDACmd_0:
        LDRH     R2,[R0, #+20]
        MOVW     R3,#+65533
        ANDS     R2,R3,R2
        STRH     R2,[R0, #+20]
//  761   }
//  762 }
??USART_IrDACmd_1:
        BX       LR               ;; return
//  763 
//  764 /**
//  765   * @brief  Checks whether the specified USART flag is set or not.
//  766   * @param  USARTx: Select the USART or the UART peripheral. 
//  767   *   This parameter can be one of the following values:
//  768   *   USART1, USART2, USART3, UART4 or UART5.
//  769   * @param  USART_FLAG: specifies the flag to check.
//  770   *   This parameter can be one of the following values:
//  771   *     @arg USART_FLAG_CTS:  CTS Change flag (not available for UART4 and UART5)
//  772   *     @arg USART_FLAG_LBD:  LIN Break detection flag
//  773   *     @arg USART_FLAG_TXE:  Transmit data register empty flag
//  774   *     @arg USART_FLAG_TC:   Transmission Complete flag
//  775   *     @arg USART_FLAG_RXNE: Receive data register not empty flag
//  776   *     @arg USART_FLAG_IDLE: Idle Line detection flag
//  777   *     @arg USART_FLAG_ORE:  OverRun Error flag
//  778   *     @arg USART_FLAG_NE:   Noise Error flag
//  779   *     @arg USART_FLAG_FE:   Framing Error flag
//  780   *     @arg USART_FLAG_PE:   Parity Error flag
//  781   * @retval The new state of USART_FLAG (SET or RESET).
//  782   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  783 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, uint16_t USART_FLAG)
//  784 {
USART_GetFlagStatus:
        MOVS     R2,R0
//  785   FlagStatus bitstatus = RESET;
        MOVS     R0,#+0
//  786   /* Check the parameters */
//  787   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  788   assert_param(IS_USART_FLAG(USART_FLAG));
//  789   /* The CTS flag is not available for UART4 and UART5 */
//  790   if (USART_FLAG == USART_FLAG_CTS)
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+512
//  791   {
//  792     assert_param(IS_USART_123_PERIPH(USARTx));
//  793   }  
//  794   
//  795   if ((USARTx->SR & USART_FLAG) != (uint16_t)RESET)
??USART_GetFlagStatus_0:
        LDRH     R3,[R2, #+0]
        TST      R3,R1
        BEQ.N    ??USART_GetFlagStatus_1
//  796   {
//  797     bitstatus = SET;
        MOVS     R3,#+1
        MOVS     R0,R3
        B.N      ??USART_GetFlagStatus_2
//  798   }
//  799   else
//  800   {
//  801     bitstatus = RESET;
??USART_GetFlagStatus_1:
        MOVS     R3,#+0
        MOVS     R0,R3
//  802   }
//  803   return bitstatus;
??USART_GetFlagStatus_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
//  804 }
//  805 
//  806 /**
//  807   * @brief  Clears the USARTx's pending flags.
//  808   * @param  USARTx: Select the USART or the UART peripheral. 
//  809   *   This parameter can be one of the following values:
//  810   *   USART1, USART2, USART3, UART4 or UART5.
//  811   * @param  USART_FLAG: specifies the flag to clear.
//  812   *   This parameter can be any combination of the following values:
//  813   *     @arg USART_FLAG_CTS:  CTS Change flag (not available for UART4 and UART5).
//  814   *     @arg USART_FLAG_LBD:  LIN Break detection flag.
//  815   *     @arg USART_FLAG_TC:   Transmission Complete flag.
//  816   *     @arg USART_FLAG_RXNE: Receive data register not empty flag.
//  817   *   
//  818   * @note
//  819   *   - PE (Parity error), FE (Framing error), NE (Noise error), ORE (OverRun 
//  820   *     error) and IDLE (Idle line detected) flags are cleared by software 
//  821   *     sequence: a read operation to USART_SR register (USART_GetFlagStatus()) 
//  822   *     followed by a read operation to USART_DR register (USART_ReceiveData()).
//  823   *   - RXNE flag can be also cleared by a read to the USART_DR register 
//  824   *     (USART_ReceiveData()).
//  825   *   - TC flag can be also cleared by software sequence: a read operation to 
//  826   *     USART_SR register (USART_GetFlagStatus()) followed by a write operation
//  827   *     to USART_DR register (USART_SendData()).
//  828   *   - TXE flag is cleared only by a write to the USART_DR register 
//  829   *     (USART_SendData()).
//  830   * @retval None
//  831   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  832 void USART_ClearFlag(USART_TypeDef* USARTx, uint16_t USART_FLAG)
//  833 {
//  834   /* Check the parameters */
//  835   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  836   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
//  837   /* The CTS flag is not available for UART4 and UART5 */
//  838   if ((USART_FLAG & USART_FLAG_CTS) == USART_FLAG_CTS)
USART_ClearFlag:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSLS     R2,R1,#+22
//  839   {
//  840     assert_param(IS_USART_123_PERIPH(USARTx));
//  841   } 
//  842    
//  843   USARTx->SR = (uint16_t)~USART_FLAG;
??USART_ClearFlag_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MVNS     R2,R1
        STRH     R2,[R0, #+0]
//  844 }
        BX       LR               ;; return
//  845 
//  846 /**
//  847   * @brief  Checks whether the specified USART interrupt has occurred or not.
//  848   * @param  USARTx: Select the USART or the UART peripheral. 
//  849   *   This parameter can be one of the following values:
//  850   *   USART1, USART2, USART3, UART4 or UART5.
//  851   * @param  USART_IT: specifies the USART interrupt source to check.
//  852   *   This parameter can be one of the following values:
//  853   *     @arg USART_IT_CTS:  CTS change interrupt (not available for UART4 and UART5)
//  854   *     @arg USART_IT_LBD:  LIN Break detection interrupt
//  855   *     @arg USART_IT_TXE:  Tansmit Data Register empty interrupt
//  856   *     @arg USART_IT_TC:   Transmission complete interrupt
//  857   *     @arg USART_IT_RXNE: Receive Data register not empty interrupt
//  858   *     @arg USART_IT_IDLE: Idle line detection interrupt
//  859   *     @arg USART_IT_ORE:  OverRun Error interrupt
//  860   *     @arg USART_IT_NE:   Noise Error interrupt
//  861   *     @arg USART_IT_FE:   Framing Error interrupt
//  862   *     @arg USART_IT_PE:   Parity Error interrupt
//  863   * @retval The new state of USART_IT (SET or RESET).
//  864   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  865 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, uint16_t USART_IT)
//  866 {
USART_GetITStatus:
        PUSH     {R4-R6}
        MOVS     R2,R0
//  867   uint32_t bitpos = 0x00, itmask = 0x00, usartreg = 0x00;
        MOVS     R3,#+0
        MOVS     R5,#+0
        MOVS     R4,#+0
//  868   ITStatus bitstatus = RESET;
        MOVS     R0,#+0
//  869   /* Check the parameters */
//  870   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  871   assert_param(IS_USART_GET_IT(USART_IT));
//  872   /* The CTS interrupt is not available for UART4 and UART5 */ 
//  873   if (USART_IT == USART_IT_CTS)
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVW     R6,#+2410
        CMP      R1,R6
//  874   {
//  875     assert_param(IS_USART_123_PERIPH(USARTx));
//  876   }   
//  877   
//  878   /* Get the USART register index */
//  879   usartreg = (((uint8_t)USART_IT) >> 0x05);
??USART_GetITStatus_0:
        MOVS     R6,R1
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LSRS     R6,R6,#+5
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R4,R6
//  880   /* Get the interrupt position */
//  881   itmask = USART_IT & IT_Mask;
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ANDS     R6,R1,#0x1F
        MOVS     R5,R6
//  882   itmask = (uint32_t)0x01 << itmask;
        MOVS     R6,#+1
        LSLS     R5,R6,R5
//  883   
//  884   if (usartreg == 0x01) /* The IT  is in CR1 register */
        CMP      R4,#+1
        BNE.N    ??USART_GetITStatus_1
//  885   {
//  886     itmask &= USARTx->CR1;
        LDRH     R6,[R2, #+12]
        ANDS     R5,R6,R5
        B.N      ??USART_GetITStatus_2
//  887   }
//  888   else if (usartreg == 0x02) /* The IT  is in CR2 register */
??USART_GetITStatus_1:
        CMP      R4,#+2
        BNE.N    ??USART_GetITStatus_3
//  889   {
//  890     itmask &= USARTx->CR2;
        LDRH     R6,[R2, #+16]
        ANDS     R5,R6,R5
        B.N      ??USART_GetITStatus_2
//  891   }
//  892   else /* The IT  is in CR3 register */
//  893   {
//  894     itmask &= USARTx->CR3;
??USART_GetITStatus_3:
        LDRH     R6,[R2, #+20]
        ANDS     R5,R6,R5
//  895   }
//  896   
//  897   bitpos = USART_IT >> 0x08;
??USART_GetITStatus_2:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R6,R1,#+8
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R3,R6
//  898   bitpos = (uint32_t)0x01 << bitpos;
        MOVS     R6,#+1
        LSLS     R3,R6,R3
//  899   bitpos &= USARTx->SR;
        LDRH     R6,[R2, #+0]
        ANDS     R3,R6,R3
//  900   if ((itmask != (uint16_t)RESET)&&(bitpos != (uint16_t)RESET))
        CMP      R5,#+0
        BEQ.N    ??USART_GetITStatus_4
        CMP      R3,#+0
        BEQ.N    ??USART_GetITStatus_4
//  901   {
//  902     bitstatus = SET;
        MOVS     R6,#+1
        MOVS     R0,R6
        B.N      ??USART_GetITStatus_5
//  903   }
//  904   else
//  905   {
//  906     bitstatus = RESET;
??USART_GetITStatus_4:
        MOVS     R6,#+0
        MOVS     R0,R6
//  907   }
//  908   
//  909   return bitstatus;  
??USART_GetITStatus_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6}
        BX       LR               ;; return
//  910 }
//  911 
//  912 /**
//  913   * @brief  Clears the USARTx’s interrupt pending bits.
//  914   * @param  USARTx: Select the USART or the UART peripheral. 
//  915   *   This parameter can be one of the following values:
//  916   *   USART1, USART2, USART3, UART4 or UART5.
//  917   * @param  USART_IT: specifies the interrupt pending bit to clear.
//  918   *   This parameter can be one of the following values:
//  919   *     @arg USART_IT_CTS:  CTS change interrupt (not available for UART4 and UART5)
//  920   *     @arg USART_IT_LBD:  LIN Break detection interrupt
//  921   *     @arg USART_IT_TC:   Transmission complete interrupt. 
//  922   *     @arg USART_IT_RXNE: Receive Data register not empty interrupt.
//  923   *   
//  924   * @note
//  925   *   - PE (Parity error), FE (Framing error), NE (Noise error), ORE (OverRun 
//  926   *     error) and IDLE (Idle line detected) pending bits are cleared by 
//  927   *     software sequence: a read operation to USART_SR register 
//  928   *     (USART_GetITStatus()) followed by a read operation to USART_DR register 
//  929   *     (USART_ReceiveData()).
//  930   *   - RXNE pending bit can be also cleared by a read to the USART_DR register 
//  931   *     (USART_ReceiveData()).
//  932   *   - TC pending bit can be also cleared by software sequence: a read 
//  933   *     operation to USART_SR register (USART_GetITStatus()) followed by a write 
//  934   *     operation to USART_DR register (USART_SendData()).
//  935   *   - TXE pending bit is cleared only by a write to the USART_DR register 
//  936   *     (USART_SendData()).
//  937   * @retval None
//  938   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  939 void USART_ClearITPendingBit(USART_TypeDef* USARTx, uint16_t USART_IT)
//  940 {
USART_ClearITPendingBit:
        PUSH     {R4}
//  941   uint16_t bitpos = 0x00, itmask = 0x00;
        MOVS     R2,#+0
        MOVS     R3,#+0
//  942   /* Check the parameters */
//  943   assert_param(IS_USART_ALL_PERIPH(USARTx));
//  944   assert_param(IS_USART_CLEAR_IT(USART_IT));
//  945   /* The CTS interrupt is not available for UART4 and UART5 */
//  946   if (USART_IT == USART_IT_CTS)
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVW     R4,#+2410
        CMP      R1,R4
//  947   {
//  948     assert_param(IS_USART_123_PERIPH(USARTx));
//  949   }   
//  950   
//  951   bitpos = USART_IT >> 0x08;
??USART_ClearITPendingBit_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R4,R1,#+8
        MOVS     R2,R4
//  952   itmask = ((uint16_t)0x01 << (uint16_t)bitpos);
        MOVS     R4,#+1
        LSLS     R4,R4,R2
        MOVS     R3,R4
//  953   USARTx->SR = (uint16_t)~itmask;
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MVNS     R4,R3
        STRH     R4,[R0, #+0]
//  954 }
        POP      {R4}
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
//  955 /**
//  956   * @}
//  957   */
//  958 
//  959 /**
//  960   * @}
//  961   */
//  962 
//  963 /**
//  964   * @}
//  965   */
//  966 
//  967 /******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/
// 
// 1 046 bytes in section .text
// 
// 1 046 bytes of CODE memory
//
//Errors: none
//Warnings: none
