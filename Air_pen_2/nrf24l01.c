#include "nrf24l01.h"

void nrf24_Initialization(void)
{
   GPIO_InitTypeDef GPIO_InitStructure;
   //SPI3 GPIO  
   GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
   GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
   GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
   GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_NOPULL;
   
   GPIO_InitStructure.GPIO_Pin = NRF24_SCK_PIN;  
   GPIO_Init(NRF24_SCK_PORT, &GPIO_InitStructure);  
   GPIO_InitStructure.GPIO_Pin = NRF24_MISO_PIN;  
   GPIO_Init(NRF24_MISO_PORT, &GPIO_InitStructure);  
   GPIO_InitStructure.GPIO_Pin = NRF24_MOSI_PIN;  
   GPIO_Init(NRF24_MOSI_PORT, &GPIO_InitStructure); 
   
   //Остальные GPIO(CE и CSN)
   GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
   
   GPIO_InitStructure.GPIO_Pin = NRF24_CSN_PIN;  
   GPIO_Init(NRF24_CSN_PORT, &GPIO_InitStructure); 
   GPIO_InitStructure.GPIO_Pin = NRF24_CE_PIN;  
   GPIO_Init(NRF24_CE_PORT, &GPIO_InitStructure); 
   CSN_PIN_SET;       
   
   //Настройка SPIx (Fsck = 1.5 МГц))  
   RCC->APB1ENR |= RCC_APB1ENR_SPI3EN;   
   NRF24_SPIx->CR1 |= SPI_CR1_BR_1 | SPI_CR1_BR_0 | SPI_CR1_SPE | SPI_CR1_SSI | SPI_CR1_SSM | SPI_CR1_MSTR;    
   
   /*ремап пинов SPI3*/
   GPIOC->AFR[1] |=(GPIO_AF_SPI3<<8)   //PC10_to_SPI3_SCK
                 | (GPIO_AF_SPI3<<12)  //PC11_to_SPI3_MISO
                 | (GPIO_AF_SPI3<<16); //PC12_to_SPI3_MOSI    
   
   /* Настройка NRF24L01 */   
   //ждём 10мс после подачи питания
   delay(100000);
   
   //сбрасываем регистр GONFIG
   nrf24_write_byte(CONFIG, 0); 
   nrf24_write_byte(CONFIG, CONFIG_PWR_UP | CONFIG_EN_CRC | CONFIG_MASK_RX_DR | CONFIG_MASK_MAX_RT);
   delay(120000); 
   //выключаем подтверждение
   nrf24_write_byte(EN_AA, 0);
   //количество байт в посылкке = 1
   nrf24_write_byte(RX_PW_P0, 1);
   CE_PIN_SET;
   delay(5000);
   CE_PIN_RESET;  
}

void nrf24_write_byte(uint8_t addr, uint8_t data)
{   
    uint8_t tmp;	
  
    delay(5);
    CSN_PIN_RESET;
    
    NRF24_SPIx->DR = W_REGISTER |  addr;    
    while(!(NRF24_SPIx->SR & SPI_SR_TXE)){;}   
    
    NRF24_SPIx->DR = data;    
    
    while(NRF24_SPIx->SR & SPI_SR_BSY){;}    
    tmp = NRF24_SPIx->DR;    
    
    delay(10);
    CSN_PIN_SET;    
}

uint8_t nrf24_read_byte(uint8_t addr)
{   
    uint8_t tmp;
  
    delay(5);
    CSN_PIN_RESET;
    
    NRF24_SPIx->DR = R_REGISTER |  addr;    
    while(!(NRF24_SPIx->SR & SPI_SR_TXE)){;}
    
    NRF24_SPIx->DR = NOP;
    while(!(NRF24_SPIx->SR & SPI_SR_RXNE)){;}
    tmp = NRF24_SPIx->DR;
    
    while(NRF24_SPIx->SR & SPI_SR_BSY){;}    
    
    delay(10);
    CSN_PIN_SET;    
    
    return (uint8_t)(NRF24_SPIx->DR); 
}

void nrf24_send_RF_byte(uint8_t data)
{
   uint8_t tmp;	
    
   delay(5);
   CSN_PIN_RESET;
  
   NRF24_SPIx->DR = W_TX_PAYLOAD;
   while(!(NRF24_SPIx->SR & SPI_SR_TXE)){;}
  
   NRF24_SPIx->DR = data;    
  
   while(NRF24_SPIx->SR & SPI_SR_BSY){;}
   tmp = NRF24_SPIx->DR; 
   
   delay(10);
   CSN_PIN_SET;
   
   delay(15);
   CE_PIN_SET;
   delay(300);
   CE_PIN_RESET;
}

uint8_t nrf24_get_RF_byte(void)
{   
   delay(5);
   CSN_PIN_RESET;
  
   NRF24_SPIx->DR = R_RX_PAYLOAD;
   while(!(NRF24_SPIx->SR & SPI_SR_TXE)){;}
   
   NRF24_SPIx->DR = NOP;   
   while(NRF24_SPIx->SR & SPI_SR_BSY){;}    
   
   delay(5);
   CSN_PIN_SET;   
   
   return (uint8_t)(NRF24_SPIx->DR);
}

uint8_t nrf24_read_status(void)
{   
  delay(5);
  CSN_PIN_RESET;
  
  NRF24_SPIx->DR = NOP; 
  while(!(NRF24_SPIx->SR & SPI_SR_TXE)){;}
  while(NRF24_SPIx->SR & SPI_SR_BSY){;}    
  
  delay(10);
  CSN_PIN_SET;  
  
  return (uint8_t)(NRF24_SPIx->DR); 
}