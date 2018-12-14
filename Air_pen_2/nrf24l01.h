#ifndef __NRF24L01_REGS_H
#define __NRF24L01_REGS_H

#include "stm32f4xx.h"
#include "stm32f4xx_gpio.h"

/* SPI для работы с NRF24L01 */
#define NRF24_SPIx SPI3

/* Выводы для работы с NRF24L01 */
#define NRF24_SCK_PORT GPIOC
#define NRF24_SCK_PIN GPIO_Pin_10
#define NRF24_MISO_PORT GPIOC
#define NRF24_MISO_PIN GPIO_Pin_11
#define NRF24_MOSI_PORT GPIOC
#define NRF24_MOSI_PIN GPIO_Pin_12
#define NRF24_CSN_PORT GPIOA
#define NRF24_CSN_PIN GPIO_Pin_15
#define NRF24_CE_PORT GPIOB
#define NRF24_CE_PIN GPIO_Pin_6
#define NRF24_IRQ_PORT GPIOB
#define NRF24_IRQ_PIN GPIO_Pin_9

/* Макро */
#define CSN_PIN_SET          NRF24_CSN_PORT->BSRR = (uint32_t)NRF24_CSN_PIN
#define CSN_PIN_RESET        NRF24_CSN_PORT->BSRR = (uint32_t)NRF24_CSN_PIN<<16
#define CE_PIN_SET           NRF24_CE_PORT->BSRR = (uint32_t)NRF24_CE_PIN
#define CE_PIN_RESET         NRF24_CE_PORT->BSRR = (uint32_t)NRF24_CE_PIN<<16
#define NRF24_IRQn_PIN       NRF24_IRQ_PORT->IDR & NRF24_IRQ_PIN

// SPI Commands code
#define R_REGISTER     0x00
#define W_REGISTER     0x20
#define R_REGISTER_WID 0x61
#define R_RX_PL_WID    0x60
#define R_RX_PAYLOAD   0x61
#define W_TX_PAYLOAD   0xA0
#define FLUSH_TX       0xE1
#define FLUSH_RX       0xE2
#define REUSE_TX_PL    0xE3
#define NOP            0xFF

// Register definitions
#define CONFIG         0x00
#define EN_AA          0x01
#define EN_RXADDR      0x02
#define SETUP_AW       0x03
#define SETUP_RETR     0x04
#define RF_CH          0x05
#define RF_SETUP       0x06
#define NRF_STATUS     0x07
#define OBSERVE_TX     0x08
#define RPD            0x09
#define RX_ADDR_P0     0x0A
#define RX_ADDR_P1     0x0B
#define RX_ADDR_P2     0x0C
#define RX_ADDR_P3     0x0D
#define RX_ADDR_P4     0x0E
#define RX_ADDR_P5     0x0F
#define TX_ADDR        0x10
#define RX_PW_P0       0x11
#define RX_PW_P1       0x12
#define RX_PW_P2       0x13
#define RX_PW_P3       0x14
#define RX_PW_P4       0x15
#define RX_PW_P5       0x16
#define FIFO_STATUS    0x17
#define DYNPD          0x1C
#define FEATURE        0x1D
 
//CONFIG register bitwise definitions
#define CONFIG_RESERVED    0x80
#define CONFIG_MASK_RX_DR  0x40
#define CONFIG_MASK_TX_DS  0x20
#define CONFIG_MASK_MAX_RT 0x10
#define CONFIG_EN_CRC      0x08
#define CONFIG_CRCO        0x04
#define CONFIG_PWR_UP      0x02
#define CONFIG_PRIM_RX     0x01
 
//EN_AA register bitwise definitions
#define EN_AA_RESERVED     0xC0
#define EN_AA_ENAA_ALL     0x3F
#define EN_AA_ENAA_P5      0x20
#define EN_AA_ENAA_P4      0x10
#define EN_AA_ENAA_P3      0x08
#define EN_AA_ENAA_P2      0x04
#define EN_AA_ENAA_P1      0x02
#define EN_AA_ENAA_P0      0x01
#define EN_AA_ENAA_NONE    0x00
 
//EN_RXADDR register bitwise definitions
#define EN_RXADDR_RESERVED 0xC0
#define EN_RXADDR_ERX_ALL  0x3F
#define EN_RXADDR_ERX_P5   0x20
#define EN_RXADDR_ERX_P4   0x10
#define EN_RXADDR_ERX_P3   0x08
#define EN_RXADDR_ERX_P2   0x04
#define EN_RXADDR_ERX_P1   0x02
#define EN_RXADDR_ERX_P0   0x01
#define EN_RXADDR_ERX_NONE 0x00
 
//SETUP_AW register bitwise definitions
#define nrf24l01_SETUP_AW_RESERVED  0xFC
#define nrf24l01_SETUP_AW           0x03
#define nrf24l01_SETUP_AW_5BYTES    0x03
#define nrf24l01_SETUP_AW_4BYTES    0x02
#define nrf24l01_SETUP_AW_3BYTES    0x01
#define nrf24l01_SETUP_AW_ILLEGAL   0x00

//SETUP_RETR register bitwise definitions
#define SETUP_RETR_ARD         0xF0
#define SETUP_RETR_ARD_4000    0xF0
#define SETUP_RETR_ARD_3750    0xE0
#define SETUP_RETR_ARD_3500    0xD0
#define SETUP_RETR_ARD_3250    0xC0
#define SETUP_RETR_ARD_3000    0xB0
#define SETUP_RETR_ARD_2750    0xA0
#define SETUP_RETR_ARD_2500    0x90
#define SETUP_RETR_ARD_2250    0x80
#define SETUP_RETR_ARD_2000    0x70
#define SETUP_RETR_ARD_1750    0x60
#define SETUP_RETR_ARD_1500    0x50
#define SETUP_RETR_ARD_1250    0x40
#define SETUP_RETR_ARD_1000    0x30
#define SETUP_RETR_ARD_750     0x20
#define SETUP_RETR_ARD_500     0x10
#define SETUP_RETR_ARD_250     0x00
#define SETUP_RETR_ARC         0x0F
#define SETUP_RETR_ARC_15      0x0F
#define SETUP_RETR_ARC_14      0x0E
#define SETUP_RETR_ARC_13      0x0D
#define SETUP_RETR_ARC_12      0x0C
#define SETUP_RETR_ARC_11      0x0B
#define SETUP_RETR_ARC_10      0x0A
#define SETUP_RETR_ARC_9       0x09
#define SETUP_RETR_ARC_8       0x08
#define SETUP_RETR_ARC_7       0x07
#define SETUP_RETR_ARC_6       0x06
#define SETUP_RETR_ARC_5       0x05
#define SETUP_RETR_ARC_4       0x04
#define SETUP_RETR_ARC_3       0x03
#define SETUP_RETR_ARC_2       0x02
#define SETUP_RETR_ARC_1       0x01
#define SETUP_RETR_ARC_0       0x00
 
//RF_CH register bitwise definitions
#define RF_CH_RESERVED 0x80
 
//RF_SETUP register bitwise definitions
#define RD_SETUP_CONT_WAVE 0x80
#define RF_SETUP_RESERVED  0xE0
#define RF_SETUP_PLL_LOCK  0x10
#define RF_SETUP_RF_DR     0x08
#define RF_SETUP_RF_PWR    0x06
#define RF_SETUP_RF_PWR_0  0x06
#define RF_SETUP_RF_PWR_6  0x04
#define RF_SETUP_RF_PWR_12 0x02
#define RF_SETUP_RF_PWR_18 0x00
#define RF_SETUP_LNA_HCURR 0x01
 
//STATUS register bitwise definitions
#define STATUS_RESERVED                    0x80
#define STATUS_RX_DR                       0x40
#define STATUS_TX_DS                       0x20
#define STATUS_MAX_RT                      0x10
#define STATUS_RX_P_NO                     0x0E
#define STATUS_RX_P_NO_RX_FIFO_NOT_EMPTY   0x0E
#define STATUS_RX_P_NO_UNUSED              0x0C
#define STATUS_RX_P_NO_5                   0x0A
#define STATUS_RX_P_NO_4                   0x08
#define STATUS_RX_P_NO_3                   0x06
#define STATUS_RX_P_NO_2                   0x04
#define STATUS_RX_P_NO_1                   0x02
#define STATUS_RX_P_NO_0                   0x00
#define STATUS_TX_FULL                     0x01
 
//OBSERVE_TX register bitwise definitions
#define OBSERVE_TX_PLOS_CNT    0xF0
#define OBSERVE_TX_ARC_CNT     0x0F
 
//CD register bitwise definitions
#define CD_RESERVED    0xFE
#define CD_CD          0x01
 
//RX_PW_P0 register bitwise definitions
#define RX_PW_P0_RESERVED  0xC0

//RX_PW_P0 register bitwise definitions
#define RX_PW_P0_RESERVED  0xC0
 
//RX_PW_P1 register bitwise definitions
#define RX_PW_P1_RESERVED  0xC0
 
//RX_PW_P2 register bitwise definitions
#define RX_PW_P2_RESERVED  0xC0

//RX_PW_P3 register bitwise definitions
#define RX_PW_P3_RESERVED  0xC0

//RX_PW_P4 register bitwise definitions
#define RX_PW_P4_RESERVED  0xC0

//RX_PW_P5 register bitwise definitions
#define RX_PW_P5_RESERVED  0xC0

//FIFO_STATUS register bitwise definitions
#define FIFO_STATUS_RESERVED   0x8C
#define FIFO_STATUS_TX_REUSE   0x40
#define FIFO_STATUS_TX_FULL    0x20
#define FIFO_STATUS_TX_EMPTY   0x10
#define FIFO_STATUS_RX_FULL    0x02
#define FIFO_STATUS_RX_EMPTY   0x01

// RF power definitions
#define DR_LOW 0x20
#define DR_MED 0x00
#define DR_HIGH 0x08

extern void delay(volatile uint32_t delay);
void nrf24_Initialization(void);

void nrf24_write_byte(uint8_t addr, uint8_t data);
uint8_t nrf24_read_byte(uint8_t addr);
void nrf24_send_RF_byte(uint8_t data);
uint8_t nrf24_get_RF_byte(void);
uint8_t nrf24_read_status(void);

#endif 