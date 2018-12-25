#include "init_periph.h"
#include "stm32f10x_gpio.h"
#include "stm32f10x_rcc.h"
#include "math.h"

#define TIM_FREQ 128000000/17
#define SIN_SIZE 16384
#define SIN_SIZE_M1 SIN_SIZE-1

//Частоту можно рассчитать так Fреал=F1*TIM_FREQ/SIN_SIZE
#define F1 48
#define F2 49
#define F3 50
#define F4 51
#define F5 52
#define F6 53
#define F7 54
#define F8 55

#define ADDR_FLASH 0x0805FFF0

uint8_t asdf[SIN_SIZE];

void cycle(uint32_t* porta,uint32_t* portb,uint32_t* portc,uint32_t* portd);
void flash_erase_page(uint32_t FLASH_ADDR_1);

int main()
{
  __disable_irq();
  init_gpio();
  
  uint16_t* FLASH_ADDR = (uint16_t*)ADDR_FLASH; 
  
          /* очищение Flash */
        uint32_t FLASH_ADDR_1 = ADDR_FLASH;
        for(int i=0; i<65; i++)
        {        
            
            flash_erase_page(FLASH_ADDR_1);
            FLASH_ADDR_1 += 0x00000800;
            //FLASH_ADDR_1 ++;
        }
        
        FLASH->CR |= FLASH_CR_PG; //Разрешаем программирование флеша
  
  for(uint16_t i=0;i<SIN_SIZE;i++)
  {
    uint8_t temp;
    uint16_t tempa=0,tempb=0,tempc=0,tempd=0;
    
    float angle = (float)6.283185307179586476925286766559*(float)i*(float)F1/(float)SIN_SIZE;
    //temp=(uint8_t)(sinf(angle)*15.9)+16;
    temp=(uint8_t)(sinf(6.283185307179586476925286766559*(float)i*(float)F5/(float)SIN_SIZE)*15.9)+16;
    asdf[i]=temp;
    
    if(temp&(1<<4)) tempa|=A4_PIN;
    if(temp&(1<<3)) tempa|=A3_PIN;
    if(temp&(1<<2)) tempa|=A2_PIN;
    if(temp&(1<<1)) tempc|=A1_PIN;
    if(temp&(1<<0)) tempc|=A0_PIN;
    
    temp=(uint8_t)(sinf(6.283185307179586476925286766559*(float)i*(float)F6/(float)SIN_SIZE)*15.9)+16;
    if(temp&(1<<4)) tempa|=B4_PIN;
    if(temp&(1<<3)) tempa|=B3_PIN;
    if(temp&(1<<2)) tempa|=B2_PIN;
    if(temp&(1<<1)) tempa|=B1_PIN;
    if(temp&(1<<0)) tempa|=B0_PIN;
    
    temp=(uint8_t)(sinf(6.283185307179586476925286766559*(float)i*(float)F7/(float)SIN_SIZE)*15.9)+16;
    if(temp&(1<<4)) tempc|=C4_PIN;
    if(temp&(1<<3)) tempc|=C3_PIN;
    if(temp&(1<<2)) tempc|=C2_PIN;
    if(temp&(1<<1)) tempc|=C1_PIN;
    if(temp&(1<<0)) tempc|=C0_PIN;
    
    temp=(uint8_t)(sinf(6.283185307179586476925286766559*(float)i*(float)F8/(float)SIN_SIZE)*15.9)+16;
    if(temp&(1<<4)) tempb|=D4_PIN;
    if(temp&(1<<3)) tempb|=D3_PIN;
    if(temp&(1<<2)) tempb|=D2_PIN;
    if(temp&(1<<1)) tempb|=D1_PIN;
    if(temp&(1<<0)) tempb|=D0_PIN;
    
    temp=(uint8_t)(sinf(6.283185307179586476925286766559*(float)i*(float)F3/(float)SIN_SIZE)*15.9)+16;
    if(temp&(1<<4)) tempb|=E4_PIN;
    if(temp&(1<<3)) tempb|=E3_PIN;
    if(temp&(1<<2)) tempb|=E2_PIN;
    if(temp&(1<<1)) tempc|=E1_PIN;
    if(temp&(1<<0)) tempc|=E0_PIN;
    
    temp=(uint8_t)(sinf(6.283185307179586476925286766559*(float)i*(float)F4/(float)SIN_SIZE)*15.9)+16;
    if(temp&(1<<4)) tempb|=F4_PIN;
    if(temp&(1<<3)) tempb|=F3_PIN;
    if(temp&(1<<2)) tempb|=F2_PIN; 
    if(temp&(1<<1)) tempb|=F1_PIN;
    if(temp&(1<<0)) tempb|=F0_PIN;
    
    temp=(uint8_t)(sinf(6.283185307179586476925286766559*(float)i*(float)F2/(float)SIN_SIZE)*15.9)+16;
    if(temp&(1<<4)) tempa|=G4_PIN;
    if(temp&(1<<3)) tempa|=G3_PIN;
    if(temp&(1<<2)) tempa|=G2_PIN;
    if(temp&(1<<1)) tempa|=G1_PIN;
    if(temp&(1<<0)) tempa|=G0_PIN;
    
    temp=(uint8_t)(sinf(6.283185307179586476925286766559*(float)i*(float)F1/(float)SIN_SIZE)*15.9)+16;
    if(temp&(1<<4)) tempc|=H4_PIN;
    if(temp&(1<<3)) tempc|=H3_PIN;
    if(temp&(1<<2)) tempc|=H2_PIN;
    if(temp&(1<<1)) tempc|=H1_PIN;
    if(temp&(1<<0)) tempb|=H0_PIN;
            
            uint16_t temp2=tempc;
            tempc=(tempc>>8)+(temp2<<8);
            temp2=tempd;
            tempd=(tempd>>8)+(temp2<<8);
    
                /*запись*/  
            FLASH->KEYR=0x45670123;
            FLASH->KEYR=0xCDEF89AB;
           
            FLASH->CR |= FLASH_CR_PG;
            while((FLASH->SR & FLASH_SR_BSY) != 0){;}
            *FLASH_ADDR=tempa;
            while((FLASH->SR & FLASH_SR_BSY) != 0){;}
            FLASH_ADDR++;
            *FLASH_ADDR=tempc;
            while((FLASH->SR & FLASH_SR_BSY) != 0){;}
            FLASH_ADDR++;
            *FLASH_ADDR=tempb;
            while((FLASH->SR & FLASH_SR_BSY) != 0){;}
            FLASH_ADDR++;
            *FLASH_ADDR=tempd;
            while((FLASH->SR & FLASH_SR_BSY) != 0){;}
            FLASH_ADDR++;
  }
    
  FLASH->CR &= ~(FLASH_CR_PG);
  FLASH->CR |= FLASH_CR_LOCK;
          
  
  cycle((uint32_t*)&(GPIOA->ODR),(uint32_t*)&(GPIOB->ODR),(uint32_t*)&(GPIOC->ODR),(uint32_t*)&(GPIOD->ODR));

    asm("mov r4, #0x08000000"); 
    asm("add r4, r4, #4096*95"); //В r4 адрес первого элемента массива 
    asm("mov r5, #4096*4");// в r5 количество данных 
    asm("sub r5, r5, #1");//Вычитаем из r5 единицу и получаем маску (0x3FFF) 
    asm("mov r6, r4"); //r6 - указатель на текущий элемент 

    while(1) 
    { 
        asm("ldmfd r6!,{r7-r8}"); 
        asm("strh r7, [r0]"); 
        asm("strh r8, [r1]"); 
        asm("rev.w r7, r7"); 
        asm("rev.w r8, r8"); 
        asm("strh r7, [r2]"); 
        asm("strh r8, [r3]"); 
        asm("sub r6, r6,r4");//вычитаем из r6 начало таблицы 
        asm("and r6, r6,r5");//Накладываем маску 
        asm("add r6, r6,r4"); //Прибавляем назад 
    } 
}

void cycle(uint32_t* porta,uint32_t* portb,uint32_t* portc,uint32_t* portd)
{}

void flash_erase_page(uint32_t FLASH_ADDR_1)
{
	//unlock flash
	FLASH->KEYR=0x45670123;
	FLASH->KEYR=0xCDEF89AB;
	//set erase
	FLASH->CR |= FLASH_CR_PER;
	//set adress page
	FLASH->AR = FLASH_ADDR_1;
	//start erase
	FLASH->CR|= FLASH_CR_STRT;
	//wait while erase end
	while ((FLASH->SR & FLASH_SR_BSY) != 0){;}
        //erase end
	FLASH->CR &= ~FLASH_CR_PER;
	//lock flash
	FLASH->CR |= FLASH_CR_LOCK;
}
