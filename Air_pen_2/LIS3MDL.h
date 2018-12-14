#ifndef _LIS3MDL_H
#define _LIS3MDL_H

#include "stm32f4xx.h"
#include "stm32f4xx_gpio.h"

//LIS3MDL_SPIn selection
#define SPIx SPI1

//LIS3MDL pins
#define SCK_PORT GPIOA
#define SCK_PIN GPIO_Pin_5
#define MISO_PORT GPIOA
#define MISO_PIN GPIO_Pin_6
#define MOSI_PORT GPIOA
#define MOSI_PIN GPIO_Pin_7
#define MAG_CS_PORT GPIOC
#define MAG_CS_PIN GPIO_Pin_5
#define DRDY_PORT GPIOB
#define DRDY_PIN GPIO_Pin_1

//pins action macro
#define MAG_CS_PIN_ON   MAG_CS_PORT->BSRR = MAG_CS_PIN
#define MAG_CS_PIN_OFF  MAG_CS_PORT->BSRR = MAG_CS_PIN<<16
#define MAG_DATA_READY  DRDY_PORT->IDR & DRDY_PIN


       /* registers ADDRs */	   
//WHO_AM_I
#define WHO_AM_I                   0x0F

//Accelerometer and gyroscope control
#define CTRL_REG1                  0x20
#define CTRL_REG2                  0x21
#define CTRL_REG3                  0x22
#define CTRL_REG4                  0x23
#define CTRL_REG5                  0x24

//status register
#define STATUS                     0x27

//data registers
#define OUTX_X_L                   0x28
#define OUTX_X_H                   0x29
#define OUTY_X_L                   0x2A
#define OUTY_X_H                   0x2B
#define OUTZ_X_L                   0x2C
#define OUTZ_X_H                   0x2D

//temperature register
#define TEMP_OUT_L                 0x2E
#define TEMP_OUT_H                 0x2F

//interrupt configuration register
#define INT_CFG                    0x30
//interrupt source configuration register
#define INT_SRC                    0x31

//interrupt threshold register
#define INT_THS_L                  0x32
#define INT_THS_H                  0x33

   
//functions prototypes
void LIS3MDL_Initialization(void);
extern void delay(volatile uint32_t delay);

uint8_t LIS3MDL_read_byte(uint8_t addr);
uint16_t LIS3MDL_read_word(uint8_t addr);
void LIS3MDL_write_byte(uint8_t addr, uint8_t data);

void LIS3MDL_set_rst_bits(uint8_t addr, uint8_t set, uint8_t data);

#endif
