#include "LSM6DS3.h"

int32_t Gx_ofset, Gy_ofset, Gz_ofset; 


void LSM6DS3_Initialization(void)
{
   //SPI1 CLK enable
   RCC->APB2ENR |= RCC_APB2ENR_SPI1EN;   
   
   //GPIO CLK Init   
   //RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN | RCC_AHB1ENR_GPIOBEN | RCC_AHB1ENR_GPIOCEN;    
   
    //ремап пинов SPI1 на нужные GPIO    
   GPIOA->AFR[0] |= (GPIO_AF_SPI1<<20) | (GPIO_AF_SPI1<<24) | (GPIO_AF_SPI1<<28); 
   
   //Кoнфиграция для SPIx   
   SPIx->CR1 |= SPI_CR1_BR_0 | SPI_CR1_SSI | SPI_CR1_SSM | SPI_CR1_SPE | SPI_CR1_MSTR;
   
   //настройка PB8 на прерывание
   /*EXTI->IMR |= 1<<8;
   EXTI->RTSR |= 1<<8;  
   RCC->APB2ENR |= RCC_APB2ENR_SYSCFGEN;
   SYSCFG->EXTICR[2] |= 1;
   NVIC_EnableIRQ(EXTI9_5_IRQn);*/ 
   
   /* LSM6DS3 Init */
   //wait after power ON   
   delay(9990);   
   
   //set BDU mode 0X40
   LSM6DS3_write_byte(CTRL3_C ,0x44);
   
   //настраиваем акселерометр(ODR_XL=0110, XL_HM_MODE = 0) частота == 104 Hz 
   LSM6DS3_write_byte(CTRL1_XL ,0x40);
   //настраиваем гироскоп(ODR_G=0110, G_HM_MODE = 0) частота == 104 Hz 
   LSM6DS3_write_byte(CTRL2_G ,0x40);
   //INT2 out enable
   //LSM6DS3_write_byte(INT2_CTRL ,0x01);
   
   
   delay(9990);   
   
   //calibrate gyro    
   Gx_ofset=0;
   Gy_ofset=0;
   Gz_ofset=0;   
   
   for(uint8_t i=0; i<255; i++)
   {
     while(!(LSM6DS3_read_byte(STATUS_REG) & 0x02)){delay(200);}
     Gx_ofset+=(int16_t)LSM6DS3_read_word(OUTX_L_G);
     Gy_ofset+=(int16_t)LSM6DS3_read_word(OUTY_L_G);
     Gz_ofset+=(int16_t)LSM6DS3_read_word(OUTZ_L_G);     
   }
   
    Gx_ofset/=255;
    Gy_ofset/=255;
    Gz_ofset/=255;
}

uint8_t LSM6DS3_read_byte(uint8_t addr)
{
  uint8_t tmp;
  
  ACCEL_CS_PIN_OFF;
  SPIx->DR = 0x80 | addr;
  while(!(SPIx->SR & SPI_SR_TXE)){;}
  SPIx->DR = 0;
  while(!(SPIx->SR & SPI_SR_RXNE)){;}
  tmp=(uint8_t)SPIx->DR;
  while(!(SPIx->SR & SPI_SR_RXNE)){;}
  tmp=(uint8_t)SPIx->DR; 
  ACCEL_CS_PIN_ON;
  delay(25);
  
  return tmp; 
}

uint16_t LSM6DS3_read_word(uint8_t addr)
{
  uint16_t tmp;
  
  ACCEL_CS_PIN_OFF;
  SPIx->DR = 0x80 | addr;
  while(!(SPIx->SR & SPI_SR_TXE)){;}
  SPIx->DR = 0;  
  while(!(SPIx->SR & SPI_SR_RXNE)){;}
  tmp=SPIx->DR;
  while(!(SPIx->SR & SPI_SR_TXE)){;}
  SPIx->DR = 0;
  while(!(SPIx->SR & SPI_SR_RXNE)){;}
  tmp=SPIx->DR;  
  while(!(SPIx->SR & SPI_SR_RXNE)){;}
  tmp|=(SPIx->DR)<<8;  
  ACCEL_CS_PIN_ON;
  delay(25);
  
  return tmp; 
}

void LSM6DS3_write_byte(uint8_t addr, uint8_t data)
{
  uint8_t tmp;
  
  ACCEL_CS_PIN_OFF;
  SPIx->DR = addr;
  while(!(SPIx->SR & SPI_SR_TXE)){;}
  SPIx->DR = data;  
  while(!(SPIx->SR & SPI_SR_RXNE)){;}
  tmp=(uint8_t)SPIx->DR;
  while(!(SPIx->SR & SPI_SR_RXNE)){;}
  tmp=(uint8_t)SPIx->DR;
  delay(20);
  ACCEL_CS_PIN_ON; 
  delay(25);
}

void LSM6DS3_set_rst_bits(uint8_t addr, uint8_t set, uint8_t data)
{
  uint8_t tmp=0;
  
  tmp=LSM6DS3_read_byte(addr);  
  if(set) tmp|=data; else tmp&=~data; 
  LSM6DS3_write_byte(addr,tmp);  
}