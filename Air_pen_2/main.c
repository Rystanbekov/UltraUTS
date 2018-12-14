#include "stm32f4xx.h"
#include "periphery_init.h"
#include "math.h"

uint16_t ADC_buffer1[2048];
//uint16_t adc_res[8];


void DMA1_Channel1_IRQHandler (void);
void DMA_Initialization(void);

void delay(uint32_t i) {
 volatile uint32_t j;
 for (j=0; j!= i * 1000; j++)
  ;
}

int main(void)
{    
  while(1)
  {     
         /*
         uint16_t n=0;
         for(n=0; n<8; n++)
         {
            adc_res[n] = ADC1->DR;
         }*/         
  }
}

void DMA_Initialization(void) 
{
    //enable clock DMA2    
    RCC-> AHB1ENR |= RCC_AHB1ENR_DMA2EN; 
    
    //ADC1 Channel=0, memory data size = 16, peripheral data size = 16, increment memory ADDR, periph to mem
    DMA2_Stream0->CR |= DMA_SxCR_MSIZE_0 | DMA_SxCR_PSIZE_0 | DMA_SxCR_MINC |  DMA_SxCR_TCIE;    
    //set addr for periph
    DMA2_Stream0->PAR |= (uint32_t)(&(ADC1->DR));  
    //количество выборок
    DMA2_Stream0-> NDTR = 2048; 
    //set addr memory for buff1
    DMA2_Stream0->M0AR = (uint32_t)(&ADC_buffer1[0]);
    //set addr memory for buff2
    //DMA2_Stream0->M1AR = (uint32_t)(&ADC_buffer2[0]);   
   
    
    //Stream0 enable for ADC1  
   // NVIC_SetPriority (DMA2_Stream0_IRQn, 1);
    NVIC_EnableIRQ(DMA2_Stream0_IRQn);
    DMA2_Stream0->CR |= DMA_SxCR_EN;   
}


void ADC_Initialization(void)
{
   GPIO_InitTypeDef GPIO_InitStructure;
   GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AN;  
   GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1;  
   //GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL ;
   GPIO_Init(GPIOC, &GPIO_InitStructure);   
  
   //включаем тактирование АЦП
   //RCC->APB2ENR &= ~RCC_APB2ENR_ADC1EN;  
   RCC->APB2ENR |= RCC_APB2ENR_ADC1EN;  
   //Максимальный предделитель тактирования АЦП
   ADC->CCR |= ADC_CCR_ADCPRE;   
   //количество преобразований = 1
   ADC1->SQR1 |= (1<<20); 
   //номер канала для преобразования
   ADC1->SQR3 |= 11; 
   //длительность преобразования = 3 cycles
   ADC1->SMPR1 |= 0;
   
   // ADC вкл, постоянное преобразование   
   ADC1->CR2 |= ADC_CR2_ADON | ADC_CR2_CONT | ADC_CR2_DMA; 
   delay(1000);
   ADC1->CR2 |= ADC_CR2_SWSTART; 
}


void DMA2_Stream0_IRQHandler(void)
{ 
	//DMA2_RESET_FLAG, сброс флагов ДМА
        DMA2->LIFCR |= DMA_LIFCR_CTCIF0 | DMA_LIFCR_CHTIF0 | DMA_LIFCR_CTEIF0 | DMA_LIFCR_CDMEIF0 | DMA_LIFCR_CFEIF0;  
      	DMA2_Stream0->CR |= DMA_SxCR_EN; 
}

