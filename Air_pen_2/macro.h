#ifndef _macro_H
#define _macro_H

#include "stm32f4xx.h"
#include "pinouts_config.h"

/* выбор усиления ОУ приемного фотодиода. атомарная запись */
#define set_rx_gain(gain) GAIN_PORT->BSRR = (((~gain)&7)<<24) | ((gain&7)<<8)                      
                                  
/* выбор номера измеряемого канала приема в сегменте 0...7. атомарная запись */                                  
#define set_rx_channel(channel) CHx_PORT->BSRR = (((~channel)&7)<<28) | ((channel&7)<<12)
                                  
/* выбор номера светодиода в сегменте 0...7. атомарная запись*/
/* включение_выключение выходов выбора сегмента */                                 
#define set_tx_channel(channel) SEL_LED_PORT->BSRR = (((~channel)&7)<<21) | ((channel&7)<<5)                            
#define tx_out_DISABLE       ON_OFF_SEL_PORT->BSRR = ON_OFF_SEL_PIN
#define tx_out_ENABLE        ON_OFF_SEL_PORT->BSRR = ON_OFF_SEL_PIN<<16                                 

/* выводы выбора сегмента фотодиодов */                                   
#define RX_SEG_DATA_PIN_ON   RX_SEG_DATA_PORT->BSRR = RX_SEG_DATA_PIN
#define RX_SEG_DATA_PIN_OFF  RX_SEG_DATA_PORT->BSRR = RX_SEG_DATA_PIN<<16
#define RX_SEG_CLK_PIN_ON    RX_SEG_CLK_PORT->BSRR = RX_SEG_CLK_PIN
#define RX_SEG_CLK_PIN_OFF   RX_SEG_CLK_PORT->BSRR = RX_SEG_CLK_PIN<<16 
                                  
/* выводы выбора сегмента светодиодов */                                  
#define TX_SEG_DATA_PIN_ON   TX_SEG_DATA_PORT->BSRR = TX_SEG_DATA_PIN
#define TX_SEG_DATA_PIN_OFF  TX_SEG_DATA_PORT->BSRR = TX_SEG_DATA_PIN<<16
#define TX_SEG_CLK_PIN_ON    TX_SEG_CLK_PORT->BSRR = TX_SEG_CLK_PIN
#define TX_SEG_CLK_PIN_OFF   TX_SEG_CLK_PORT->BSRR = TX_SEG_CLK_PIN<<16                                  
                                  
/* заряд_разряд конденсаторов */                                     
#define CHRG_PIN_ON    CHRG_PORT->BSRR = CHRG_PIN                                  
#define CHRG_PIN_OFF   CHRG_PORT->BSRR = CHRG_PIN<<16      
                                  
#endif 
