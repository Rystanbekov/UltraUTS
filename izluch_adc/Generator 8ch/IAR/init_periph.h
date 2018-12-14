#ifndef INIT_PERIPH_H
#define INIT_PERIPH_H

//A
#define A0_PIN GPIO_Pin_2
#define A1_PIN GPIO_Pin_3
#define A2_PIN GPIO_Pin_0
#define A3_PIN GPIO_Pin_1
#define A4_PIN GPIO_Pin_2

//B
#define B0_PIN GPIO_Pin_3
#define B1_PIN GPIO_Pin_4
#define B2_PIN GPIO_Pin_5
#define B3_PIN GPIO_Pin_6
#define B4_PIN GPIO_Pin_7

//C
#define C0_PIN GPIO_Pin_13
#define C1_PIN GPIO_Pin_14
#define C2_PIN GPIO_Pin_15
#define C3_PIN GPIO_Pin_0
#define C4_PIN GPIO_Pin_1

//D
#define D0_PIN GPIO_Pin_5
#define D1_PIN GPIO_Pin_6
#define D2_PIN GPIO_Pin_7
#define D3_PIN GPIO_Pin_8
#define D4_PIN GPIO_Pin_9

//E
#define E0_PIN GPIO_Pin_4
#define E1_PIN GPIO_Pin_5
#define E2_PIN GPIO_Pin_0
#define E3_PIN GPIO_Pin_1
#define E4_PIN GPIO_Pin_2

//F
#define F0_PIN GPIO_Pin_10
#define F1_PIN GPIO_Pin_11
#define F2_PIN GPIO_Pin_12
#define F3_PIN GPIO_Pin_13
#define F4_PIN GPIO_Pin_14

//G
#define G0_PIN GPIO_Pin_8
#define G1_PIN GPIO_Pin_9
#define G2_PIN GPIO_Pin_10
#define G3_PIN GPIO_Pin_11
#define G4_PIN GPIO_Pin_12

//H
#define H0_PIN GPIO_Pin_15
#define H1_PIN GPIO_Pin_6
#define H2_PIN GPIO_Pin_7
#define H3_PIN GPIO_Pin_8
#define H4_PIN GPIO_Pin_9

void init_tim4(void);

void init_gpio();

void init_nvic();

#endif