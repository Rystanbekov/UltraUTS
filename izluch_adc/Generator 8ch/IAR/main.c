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

#define Ntap 63
uint16_t adc_buffer[1024];
float OUT[1024];

void my_fir(uint16_t data[]);
void DMA1_Channel1_IRQHandler (void);

int main(void)
{
  GPIO_InitTypeDef PORT;
  //Включаем порты А и С
  RCC_APB2PeriphClockCmd((RCC_APB2Periph_GPIOC | RCC_APB2Periph_GPIOA) , ENABLE);
  //Настраиваем ноги PC8 и PC9 на выход. Там у нас висят светодиоды
  PORT.GPIO_Pin = (GPIO_Pin_9 | GPIO_Pin_8);
  PORT.GPIO_Mode = GPIO_Mode_Out_PP;
  PORT.GPIO_Speed = GPIO_Speed_2MHz;
  GPIO_Init( GPIOC , &PORT);
  
  PORT.GPIO_Pin = (GPIO_Pin_1);
  PORT.GPIO_Mode = GPIO_Mode_AIN;
  GPIO_Init( GPIOA , &PORT);
   
  //Порт A настраивать смысла нет, все его ноги по умолчанию входы что нам и нужно
  RCC_APB2PeriphClockCmd(RCC_APB2ENR_ADC1EN, ENABLE); //Включаем тактирование АЦП
  
  ADC1->CR2 |= ADC_CR2_CAL; //Запуск калибровки АЦП
  while (!(ADC1->CR2 & ADC_CR2_CAL)); //Ожидаем окончания калибровки
  ADC1->SMPR2 |=  ADC_SMPR2_SMP0_0; //Задаем длительность выборки
  ADC1->CR2 |= ADC_CR2_JEXTSEL; //Преобразование инжектированной группы
                                //запустится установкой бита JSWSTART
  ADC1->CR2 |= ADC_CR2_JEXTTRIG; //Разрешаем внешний запуск инжектированной группы
  ADC1->CR2 |= ADC_CR2_CONT; //Преобразования запускаются одно за другим то есть сont=1
  ADC1->CR1 |= ADC_CR1_JAUTO; //Разрешить преобразование инжектированной группы
                                     //после регулярной. Не понятно зачем, но без этого не работает
  ADC1->JSQR |= (1<<15); //Задаем номер канала (выбран ADC1)
  ADC1->CR2 |= ADC_CR2_ADON;//Теперь включаем АЦП
  ADC1->CR2 |= ADC_CR2_JSWSTART; //Запуск преобразований
  while (!(ADC1->SR & ADC_SR_JEOC)); //ждем пока первое преобразование завершится
    
  while(ADC_GetResetCalibrationStatus(ADC1));
  ADC_StartCalibration(ADC1);

  while(ADC_GetCalibrationStatus(ADC1));
  ADC_SoftwareStartConvCmd ( ADC1 , ENABLE ); 
 
     // Наконец-то включаем АЦП
  ADC_Cmd(ADC1, ENABLE);  
  /*/ Включаем работу ДМА через АЦП
  ADC_DMACmd(ADC1, ENABLE);
  ADC_DMAConfig(ADC1, ADC_DMAMode_Circular); */
 
  ADC1->CR2  |=    ADC_CR2_DMA; // Включаем работу ДМА через АЦП
  

  RCC->AHBENR |= RCC_AHBENR_DMA1EN; //Разрешаем тактирование первого DMA модуля
  DMA1_Channel1->CPAR = (uint32_t) &ADC1->JDR1;; //Указываем адрес периферии - регистр результата преобразования АЦП для регулярных каналов
  DMA1_Channel1->CMAR = (uint32_t)&adc_buffer[0]; //Задаем адрес памяти - базовый адрес массива в RAM
  DMA1_Channel1->CCR &= ~DMA_CCR1_DIR; //Указываем направление передачи данных, из периферии в память
  DMA1_Channel1->CNDTR = 1024; //Количество пересылаемых значений
  DMA1_Channel1->CCR &= ~DMA_CCR1_PINC; //Адрес периферии не инкрементируем после каждой пересылки
  DMA1_Channel1->CCR |= DMA_CCR1_MINC; //Адрес памяти инкрементируем после каждой пересылки.
  DMA1_Channel1->CCR |= DMA_CCR1_PSIZE_0; //Размерность данных периферии - 16 бит
  DMA1_Channel1->CCR |= DMA_CCR1_MSIZE_0; //Размерность данных памяти - 16 бит
  DMA1_Channel1->CCR |= DMA_CCR1_PL; //Приоритет - очень высокий 
  
  DMA1_Channel1->CCR |= DMA_CCR1_TCIE; //канал 1 Разрешить прерывание по завершении 
   
  
  //DMA1_Channel1->CCR |= DMA_CCR1_CIRC; //Разрешаем работу DMA в циклическом режиме
  delay(10000);
  DMA1_Channel1->CCR |= DMA_CCR1_EN; //Разрешаем работу 1-го канала DMA
  NVIC_EnableIRQ (DMA1_Channel1_IRQn);  //Разрешить прерывания от DMA_1 
  
 // float NewSample;
  //Теперь можно читать результат из JDR1
   //Использовал переменную для отладки. Можно и без неё
  while(1)
  {
    
     
    /* if (ADC1->SR & ADC_SR_JEOC)
    {
      uint16_t temp = ADC1->JDR1;
      GPIOA->ODR ^= 0x0001;
    }*/
    
/*     //adc_res=ADC1->JDR1;
    delay(adc_buffer[0]); //Исходя из значения АЦП делаем задержку
    GPIO_WriteBit(GPIOC,GPIO_Pin_8,Bit_RESET); //Гасим диод...
    GPIO_WriteBit(GPIOC,GPIO_Pin_9,Bit_SET); // Зажигаем диод...
    //adc_res=ADC1->JDR1;
    delay(adc_buffer[0]); //Всё повторяется...
    GPIO_WriteBit(GPIOC,GPIO_Pin_9,Bit_RESET);
    GPIO_WriteBit(GPIOC,GPIO_Pin_8,Bit_SET);*/
  }
}

void DMA1_Channel1_IRQHandler (void)
{
  
  //Если обмен завершен
  //if(DMA1->ISR & DMA_ISR_TCIF1) { }      //что-то делаем
 
  //Если передана половина буфера
  //if(DMA1->ISR & DMA_ISR_HTIF1) { }      //что-то делаем
 
  //Если произошла ошибка при обмене
  //if(DMA1->ISR & DMA_ISR_TEIF1) { }      //что-то делаем
  
  my_fir(adc_buffer);
  DMA1->IFCR |= DMA_IFCR_CTCIF1; 
  DMA1->IFCR |= DMA_IFCR_CHTIF1;
  DMA1->IFCR |= DMA_IFCR_CGIF1;
  DMA1_Channel1->CCR |= DMA_CCR1_EN; 
}
//Chebychev
void my_fir(uint16_t data[])
{
   float k[Ntap] = { 
        -0.00660633854987524410,
        -0.00791660875753908560,
        -0.00836524485628787130,
        -0.00757776990748253250,
        -0.00531300926428128310,
        -0.00152305544560557410,
        0.00360875251308657430,
        0.00965988405041829160,
        0.01599512069729550400,
        0.02182733602803954900,
        0.02630742751702461900,
        0.02863363985409626800,
        0.02816688450634743900,
        0.02453661747756656300,
        0.01772179255101579900,
        0.00809351425743025200,
        -0.00358986222768506010,
        -0.01623872164437723700,
        -0.02853617227835065000,
        -0.03908022182957316500,
        -0.04654850034858880300,
        -0.04986578031698470800,
        -0.04835287169919277900,
        -0.04183659762196536400,
        -0.03070442671761500900,
        -0.01589345557662023500,
        0.00118902085862111370,
        0.01880805554405127300,
        0.03509358321495238700,
        0.04826244474632326900,
        0.05684098801638862200,
        0.05988027610725982900,
        0.05684098801638862200,
        0.04826244474632326900,
        0.03509358321495238700,
        0.01880805554405127300,
        0.00118902085862111370,
        -0.01589345557662023500,
        -0.03070442671761500900,
        -0.04183659762196536400,
        -0.04835287169919277900,
        -0.04986578031698470800,
        -0.04654850034858880300,
        -0.03908022182957316500,
        -0.02853617227835065000,
        -0.01623872164437723700,
        -0.00358986222768506010,
        0.00809351425743025200,
        0.01772179255101579900,
        0.02453661747756656300,
        0.02816688450634743900,
        0.02863363985409626800,
        0.02630742751702461900,
        0.02182733602803954900,
        0.01599512069729550400,
        0.00965988405041829160,
        0.00360875251308657430,
        -0.00152305544560557410,
        -0.00531300926428128310,
        -0.00757776990748253250,
        -0.00836524485628787130,
        -0.00791660875753908560,
        -0.00660633854987524410
    };
   
   uint16_t n=0;
   uint16_t m=0;
   
   for(n=0; n<(1024-(Ntap+1)); n++)
   {
     
     OUT[n]=0;
     for(m=0; m<Ntap+1; m++)
     {
       OUT[n] += (float)(data[n+m]) * k[m];      
     }
     
   }
}