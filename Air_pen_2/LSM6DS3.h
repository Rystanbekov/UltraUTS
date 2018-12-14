#ifndef _LSM6DS3_H
#define _LSM6DS3_H

#include "stm32f4xx.h"
#include "stm32f4xx_gpio.h"

//LSM6DS3_SPIn selection
#define SPIx SPI1

//defines for pins
#define SPI1_SCK_PORT GPIOA
#define SPI1_SCK_PIN GPIO_Pin_5
#define SPI1_MISO_PORT GPIOA
#define SPI1_MISO_PIN GPIO_Pin_6
#define SPI1_MOSI_PORT GPIOA
#define SPI1_MOSI_PIN GPIO_Pin_7
#define ACCEL_CS_PORT GPIOC
#define ACCEL_CS_PIN GPIO_Pin_4


//pins action macro for CS pin
#define ACCEL_CS_PIN_ON   ACCEL_CS_PORT->BSRR = ACCEL_CS_PIN
#define ACCEL_CS_PIN_OFF ACCEL_CS_PORT->BSRR = ACCEL_CS_PIN<<16

       /* ADDRs for registers*/
//Embedded functions configuration
#define FUNC_CFG_ACCESS            0x01

//Sensor sync configuration
#define SENSOR_SYNC_TIME_FRAME     0x04

//FIFO configuration
#define FIFO_CTRL1                 0x06
#define FIFO_CTRL2                 0x07
#define FIFO_CTRL3                 0x08
#define FIFO_CTRL4                 0x09
#define FIFO_CTRL5                 0x0A

//INT1_INT2 PINs control 
#define INT1_CTRL                  0x0D
#define INT2_CTRL                  0x0E

//WHO_AM_I
#define WHO_AM_I                   0x0F

//Accelerometer and gyroscope control
#define CTRL1_XL                   0x10
#define CTRL2_G                    0x11
#define CTRL3_C                    0x12
#define CTRL4_C                    0x13
#define CTRL5_C                    0x14
#define CTRL6_C                    0x15
#define CTRL7_G                    0x16
#define CTRL8_XL                   0x17
#define CTRL9_XL                   0x18
#define CTRL10_C                   0x19

//I2C master configuration register
#define MASTER_CONFIG              0x1A

//Interrupts registers
#define WAKE_UP_SRC                0x1B
#define TAP_SRC                    0x1C
#define D6D_SRC                    0x1D

#define FUNC_SRC                   0x53
#define TAP_CFG                    0x58
#define TAP_THS_6D                 0x59
#define INT_DUR2                   0x5A
#define WAKE_UP_THS                0x5B
#define WAKE_UP_DUR                0x5C
#define FREE_FALL                  0x5D
#define MD1_CFG                    0x5E
#define MD2_CFG                    0x5F

//Status data register
#define STATUS_REG                 0x1E

//Temperature output data register
#define OUT_TEMP_L                 0x20
#define OUT_TEMP_H                 0x21

//Gyroscope output register
#define OUTX_L_G                   0x22
#define OUTX_H_G                   0x23

#define OUTY_L_G                   0x24
#define OUTY_H_G                   0x25

#define OUTZ_L_G                   0x26
#define OUTZ_H_G                   0x27

//Accelerometer output register
#define OUTX_L_XL                  0x28
#define OUTX_H_XL                  0x29

#define OUTY_L_XL                  0x2A
#define OUTY_H_XL                  0x2B

#define OUTZ_L_XL                  0x2C
#define OUTZ_H_XL                  0x2D

//Sensor hub output registers
#define SENSORHUB1_REG             0x2E
#define SENSORHUB2_REG             0x2F
#define SENSORHUB3_REG             0x30
#define SENSORHUB4_REG             0x31
#define SENSORHUB5_REG             0x32
#define SENSORHUB6_REG             0x33
#define SENSORHUB7_REG             0x34
#define SENSORHUB8_REG             0x35
#define SENSORHUB9_REG             0x36
#define SENSORHUB10_REG            0x37
#define SENSORHUB11_REG            0x38
#define SENSORHUB12_REG            0x39

#define SENSORHUB13_REG            0x4D
#define SENSORHUB14_REG            0x4E
#define SENSORHUB15_REG            0x4F
#define SENSORHUB16_REG            0x50
#define SENSORHUB17_REG            0x51
#define SENSORHUB18_REG            0x52

//FIFO status registers
#define FIFO_STATUS1               0x3A
#define FIFO_STATUS2               0x3B
#define FIFO_STATUS3               0x3C
#define FIFO_STATUS4               0x3D

//FIFO data output registers
#define FIFO_DATA_OUT_L            0x3E
#define FIFO_DATA_OUT_H            0x3F

//Timestamp output registers
#define TIMESTAMP0_REG             0x40
#define TIMESTAMP1_REG             0x40
#define TIMESTAMP2_REG             0x40

//Step counter output registers
#define STEP_TIMESTAMP_L           0x49
#define STEP_TIMESTAMP_H           0x4A

//Step counter output registers
#define STEP_COUNTER_L             0x4B
#define STEP_COUNTER_H             0x4C

//External magnetometer raw data output registers
#define OUT_MAG_RAW_X_L            0x66
#define OUT_MAG_RAW_X_H            0x67
#define OUT_MAG_RAW_Y_L            0x68
#define OUT_MAG_RAW_Y_H            0x69
#define OUT_MAG_RAW_Z_L            0x6A
#define OUT_MAG_RAW_Z_H            0x6B   


extern int32_t Gx_ofset, Gy_ofset, Gz_ofset;   

//functions prototypes
void LSM6DS3_Initialization(void);
extern void delay(volatile uint32_t delay);

uint8_t LSM6DS3_read_byte(uint8_t addr);
uint16_t LSM6DS3_read_word(uint8_t addr);
void LSM6DS3_write_byte(uint8_t addr, uint8_t data);

void LSM6DS3_set_rst_bits(uint8_t addr, uint8_t set, uint8_t data);

#endif
