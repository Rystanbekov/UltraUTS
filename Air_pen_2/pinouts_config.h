#ifndef _pinouts_config_H
#define _pinouts_config_H

//вход ADC1_CH10
#define ADC1_CH10_PORT GPIOC
#define ADC1_CH10_PIN  GPIO_Pin_0
 
//выводы мультиплексора
#define MUX_PORT  GPIOB
#define A0_PORT   GPIOB
#define A0_PIN    GPIO_Pin_12
#define A1_PORT   GPIOB
#define A1_PIN    GPIO_Pin_13
#define A2_PORT   GPIOB
#define A2_PIN    GPIO_Pin_14

//выводы SPI1
#define SPI_SCK_PORT  GPIOA
#define SPI_SCK_PIN   GPIO_Pin_5
#define SPI_MOSI_PORT GPIOA
#define SPI_MOSI_PIN  GPIO_Pin_7
#define SPI_MISO_PORT GPIOA
#define SPI_MISO_PIN  GPIO_Pin_6

//управление трансивером ADM485
#define TX_EN_PORT GPIOA
#define TX_EN_PIN  GPIO_Pin_4

#endif
