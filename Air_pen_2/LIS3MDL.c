#include "LIS3MDL.h"

void LIS3MDL_Initialization(void)
{
   //SPI1 CLK enable
   //RCC->APB2ENR |= RCC_APB2ENR_SPI1EN;  
   
   //GPIO CLK Init   
   //RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN | RCC_AHB1ENR_GPIOBEN | RCC_AHB1ENR_GPIOCEN;      
   
  
   //ремап пинов SPI1 на нужные GPIO    
   //GPIOA->AFR[0] |= (GPIO_AF_SPI1<<20) | (GPIO_AF_SPI1<<24) | (GPIO_AF_SPI1<<28); 
   
   //Кoнфиграция для SPIx   
   //SPIx->CR1 |= SPI_CR1_BR_1 | SPI_CR1_SSI | SPI_CR1_SSM | SPI_CR1_SPE | SPI_CR1_MSTR;   
    
 
   //data_rate = 80Hz
   LIS3MDL_write_byte(CTRL_REG1 ,0x1C);
   //power on
   LIS3MDL_write_byte(CTRL_REG3 ,0x00);   
}

uint8_t LIS3MDL_read_byte(uint8_t addr)
{
  uint8_t tmp;
  
  MAG_CS_PIN_OFF;
  SPIx->DR = 0x80 | addr;
  while(!(SPIx->SR & SPI_SR_TXE)){;}
  SPIx->DR = 0;
  while(!(SPIx->SR & SPI_SR_RXNE)){;}
  tmp=(uint8_t)SPIx->DR;
  while(!(SPIx->SR & SPI_SR_RXNE)){;}
  tmp=(uint8_t)SPIx->DR; 
  MAG_CS_PIN_ON;
  delay(25);
  
  return tmp; 
}

uint16_t LIS3MDL_read_word(uint8_t addr)
{
  uint16_t tmp;
  
  MAG_CS_PIN_OFF;
  SPIx->DR = 0xC0 | addr;
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
  MAG_CS_PIN_ON;
  delay(25);
  
  return tmp; 
}

void LIS3MDL_write_byte(uint8_t addr, uint8_t data)
{
  uint8_t tmp;
  
  MAG_CS_PIN_OFF;
  SPIx->DR = addr;
  while(!(SPIx->SR & SPI_SR_TXE)){;}
  SPIx->DR = data;  
  while(!(SPIx->SR & SPI_SR_RXNE)){;}
  tmp=(uint8_t)SPIx->DR;
  while(!(SPIx->SR & SPI_SR_RXNE)){;}
  tmp=(uint8_t)SPIx->DR;
  delay(20);
  MAG_CS_PIN_ON; 
  delay(25);
}

void LIS3MDL_set_rst_bits(uint8_t addr, uint8_t set, uint8_t data)
{
  uint8_t tmp=0;
  
  tmp=LIS3MDL_read_byte(addr);  
  if(set) tmp|=data; else tmp&=~data; 
  LIS3MDL_write_byte(addr,tmp);  
}