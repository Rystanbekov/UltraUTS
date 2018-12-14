#include "periphery_init.h"
#include "dsp.h"
extern uint16_t ADC1_buffer[8][256];






/***********************функции инициализации***********************/
void RCC_Initialization(void)
{
  /* Резонатор=8 МГц, HCLK=192 МГц, APB1=24 МГц, APB2=24 МГц */
  
  //переводим системное тактирование на HSI
  RCC->CFGR &= ~RCC_CFGR_SW;
  //выключаем PLL
  RCC->CR &= ~RCC_CR_PLLON;
  
  //включаем резонатор
  RCC->CR |= RCC_CR_HSEON;
  //ждём готовности резонатора
  while((RCC->CR & RCC_CR_HSERDY)==0){;}
  
  //RCC->CFGR &= ~RCC_CFGR_HPRE;
  //RCC->CFGR |= RCC_CFGR_HPRE_DIV1;
  //инициализация делителей для шин
  RCC->CFGR &= ~RCC_CFGR_PPRE1;   
  RCC->CFGR |= RCC_CFGR_PPRE1_DIV8;
  RCC->CFGR &= ~RCC_CFGR_PPRE2;
  RCC->CFGR |= RCC_CFGR_PPRE2_DIV16;
  
  //prefetch BUF enable, WAIT_STATE=6
  //FLASH->ACR &=  ~(FLASH_ACR_PRFTEN | FLASH_ACR_LATENCY);
  FLASH->ACR |=  FLASH_ACR_PRFTEN | FLASH_ACR_LATENCY_6WS;
  
  //устанавливаем коэффициенты M, N и P для PLL 
  RCC->PLLCFGR &= ~(RCC_PLLCFGR_PLLM | RCC_PLLCFGR_PLLN | RCC_PLLCFGR_PLLP);
  //M = 4
  RCC->PLLCFGR |= 4;
  //N = 192
  RCC->PLLCFGR |= 168<<6;
  //P = 2
  RCC->PLLCFGR &= ~RCC_PLLCFGR_PLLP;  

  //тактирование PLL от HSE
  RCC->PLLCFGR |= RCC_PLLCFGR_PLLSRC ;
  //включаем PLL
  RCC->CR |= RCC_CR_PLLON;
  
  //переводим системное тактирование на PLL
  RCC->CFGR |= RCC_CFGR_SW_1;  
}


void GPIO_Initialization(void)
{ 
  //GPIO CLK Init   
  RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN | RCC_AHB1ENR_GPIOBEN | RCC_AHB1ENR_GPIOCEN;    
  
  GPIO_InitTypeDef GPIO_InitStructure; 
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT; 
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_NOPULL;   
  
  //настройка выводов мультиплексора
  GPIO_InitStructure.GPIO_Pin = A0_PIN | A1_PIN | A2_PIN;  
  GPIO_Init(MUX_PORT, &GPIO_InitStructure);  
  
  
  //тест PIN
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_11; 
  GPIO_Init(GPIOC, &GPIO_InitStructure);   
  
  
  //вывод синхронизации ADM485
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN; 
  GPIO_InitStructure.GPIO_Pin = TX_EN_PIN;  
  GPIO_Init(TX_EN_PORT, &GPIO_InitStructure);  
  
  EXTI_InitTypeDef exti;
  exti.EXTI_Line=EXTI_Line4;
  exti.EXTI_Mode=EXTI_Mode_Interrupt;
  exti.EXTI_Trigger=EXTI_Trigger_Rising_Falling;
  exti.EXTI_LineCmd=ENABLE;
  EXTI_Init(&exti);
  NVIC_EnableIRQ(EXTI4_IRQn);
}



