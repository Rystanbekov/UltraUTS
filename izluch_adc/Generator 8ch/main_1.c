#include "init_periph.h"
#include "stm32f10x_dma.h"
#include "stm32f10x_adc.h"
#include "stm32f10x_gpio.h"
#include "stm32f10x_rcc.h"

void delay(uint32_t i) {
 volatile uint32_t j;
 for (j=0; j!= i * 1000; j++)
  ;
}
uint32_t ADC_Result;
uint32_t sizeBufer;
uint32_t adc_res;
int main(void)
{
  GPIO_InitTypeDef PORT;
  DMA_InitTypeDef  DMA_InitStructure;
  ADC_InitTypeDef ADC_InitStructure;
  //Включаем порты А и С
  RCC_APB2PeriphClockCmd((RCC_APB2Periph_GPIOC | RCC_APB2Periph_GPIOA) , ENABLE);
  //Настраиваем ноги PC8 и PC9 на выход. Там у нас висят светодиоды
  PORT.GPIO_Pin = (GPIO_Pin_9 | GPIO_Pin_8);
  PORT.GPIO_Mode = GPIO_Mode_Out_PP;
  PORT.GPIO_Speed = GPIO_Speed_2MHz;
  GPIO_Init( GPIOC , &PORT);
 
  
  // Подаем тактовый сигнал на DMA.
  RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA1, ENABLE);
  /*Конфигурация DMA*/
  DMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t)& ADC1->DR;   /*источник данных. DR - регистр сохранения результатов преобразования*/
  DMA_InitStructure.DMA_MemoryBaseAddr = (uint32_t)&ADC_Result; /*приёмник данных, Переправлять данные будем в переменную ADC_Result*/
  DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralSRC;// Передача данных из периферии в память
  DMA_InitStructure.DMA_BufferSize = sizeBufer;// Размер буфера
  // Адрес источника данных не инкрементируем - он всегда один и 
  // тот же
  DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
  DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
  // Настройки размера данных
  DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_HalfWord;
  DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_HalfWord;
  DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;//циклтческая форма записи в дма
  DMA_InitStructure.DMA_Priority = DMA_Priority_High;
  DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
  DMA_Init(DMA1_Channel1, &DMA_InitStructure);
  /*Разрешение прерываний*/
  DMA_ITConfig(DMA1_Channel1, DMA_IT_TC, ENABLE);
  /* Разрешить передачу DMA1 Channel1*/
  // Включаем первый канал DMA1
  DMA_Cmd(DMA1_Channel1, ENABLE);
  
  //Порт A настраивать смысла нет, все его ноги по умолчанию входы что нам и нужно
  RCC_APB2PeriphClockCmd(RCC_APB2ENR_ADC1EN, ENABLE); //Включаем тактирование АЦП
  
  ADC1->CR2 |= ADC_CR2_CAL; //Запуск калибровки АЦП
  while (!(ADC1->CR2 & ADC_CR2_CAL)); //Ожидаем окончания калибровки
  ADC1->SMPR2 |= (ADC_SMPR2_SMP1_2 | ADC_SMPR2_SMP1_1 | ADC_SMPR2_SMP1_0); //Задаем длительность выборки
  ADC1->CR2 |= ADC_CR2_JEXTSEL; //Преобразование инжектированной группы
                                //запустится установкой бита JSWSTART
  ADC1->CR2 |= ADC_CR2_JEXTTRIG; //Разрешаем внешний запуск инжектированной группы
  ADC1->CR2 |= ADC_CR2_CONT; //Преобразования запускаются одно за другим
  ADC1->CR1 |= ADC_CR1_JAUTO; //Разрешить преобразование инжектированной группы
                                     //после регулярной. Не понятно зачем, но без этого не работает
  ADC1->JSQR |= (1<<15); //Задаем номер канала (выбран ADC1)
  ADC1->CR2 |= ADC_CR2_ADON;//Теперь включаем АЦП
  ADC1->CR2 |= ADC_CR2_JSWSTART; //Запуск преобразований
  while (!(ADC1->SR & ADC_SR_JEOC)); //ждем пока первое преобразование завершится
    
  ADC_InitStructure.ADC_ContinuousConvMode = ENABLE;
  ADC_InitStructure.ADC_DataAlign = ADC_DataAlign_Right;
  ADC_InitStructure.ADC_ExternalTrigConv = ADC_ExternalTrigConv_None;
  ADC_InitStructure.ADC_Mode = ADC_Mode_Independent;
  ADC_InitStructure.ADC_NbrOfChannel = 1;
  ADC_InitStructure.ADC_ScanConvMode = ENABLE;
  ADC_Init(ADC1, &ADC_InitStructure);   
  ADC_RegularChannelConfig(ADC1, 3, 1, ADC_SampleTime_7Cycles5);  // Включаем третий канал первого модуля АЦП
  ADC_Cmd(ADC1 , ENABLE );
  ADC_DMACmd(ADC1 , ENABLE ); //Включаем работу ДМА через АЦП
  ADC_ResetCalibration(ADC1);
  
  while(ADC_GetResetCalibrationStatus(ADC1));
  ADC_StartCalibration(ADC1);

  while(ADC_GetCalibrationStatus(ADC1));
  ADC_SoftwareStartConvCmd ( ADC1 , ENABLE ) ; 
 
 
 
    // Наконец-то включаем АЦП
    ADC_Cmd(ADC1, ENABLE);  
  /*/ Включаем работу ДМА через АЦП
  ADC_DMACmd(ADC1, ENABLE);
  ADC_DMAConfig(ADC1, ADC_DMAMode_Circular); 
  
  //Теперь можно читать результат из JDR1
   //Использовал переменную для отладки. Можно и без неё*/
  while(1)
  {
    adc_res=ADC1->JDR1;
    delay(adc_res); //Исходя из значения АЦП делаем задержку
    GPIO_WriteBit(GPIOC,GPIO_Pin_8,Bit_RESET); //Гасим диод...
    GPIO_WriteBit(GPIOC,GPIO_Pin_9,Bit_SET); // Зажигаем диод...
    adc_res=ADC1->JDR1;
    delay(adc_res); //Всё повторяется...
    GPIO_WriteBit(GPIOC,GPIO_Pin_9,Bit_RESET);
    GPIO_WriteBit(GPIOC,GPIO_Pin_8,Bit_SET);
  }
}
