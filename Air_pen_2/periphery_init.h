#ifndef _periphery_init_H
#define _periphery_init_H

#include "stm32f4xx.h"
#include "stm32f4xx_gpio.h"
#include "stm32f4xx_exti.h"
#include "pinouts_config.h"
#include "dsp.h"

extern uint16_t ADC_buf1[SAMPLE_SIZE], ADC_buf2[SAMPLE_SIZE];
extern uint8_t segment[195], segment1[195];

extern void delay(uint32_t delay);
void RCC_Initialization(void);
void GPIO_Initialization(void);

void ADC_Initialization(void);
void DMA_Initialization(void);

#endif