#include "init_periph.h"
#include "stm32f10x_gpio.h"
#include "stm32f10x_rcc.h"
#include "math.h"

#define TIM_FREQ 128000000/17
#define SIGNAL_SIZE 4096
#define OUTPUT_SIZE SIGNAL_SIZE*8
#define PImul2 6.283185307179586476925286766559
#define SHIFT 4000

float period;
float angle;
float sinys;
float ample;
float OUT[SIGNAL_SIZE];

uint8_t temp;
uint8_t temp1;

//Частоту можно рассчитать так Fреал=F1*TIM_FREQ/SIN_SIZE
#define t1 2       //коэффицент деления
#define t2 3
#define n1 6     //кол-во периодов
#define n2 6
#define a1 1      //амплитуда
#define a2 2


#define ADDR_FLASH 0x08010000

void cycle(uint32_t* porta,uint32_t* portb,uint32_t* portc,uint32_t* portd);
void flash_erase_page(uint32_t FLASH_ADDR_1);
void delay(uint32_t t);

uint16_t n=0;
uint16_t i=0;
uint16_t tempa=0,tempb=0,tempc=0,tempd=0;
//
int main()
{
  __disable_irq();
  init_gpio();
  
  //Флэш
  uint16_t* FLASH_ADDR = (uint16_t*)ADDR_FLASH; 
  
  /* очищение Flash */
  uint32_t FLASH_ADDR_1 = ADDR_FLASH;
  for(int i=0; i<200; i++)
  {    
    flash_erase_page(FLASH_ADDR_1);
    FLASH_ADDR_1 += 0x00000800;
    //FLASH_ADDR_1 ++;
  }
  FLASH->CR |= FLASH_CR_PG; //Разрешаем программирование флеша
  
  //расчет синуса
  
  for(n=0;n<(SIGNAL_SIZE); n++)
   {
       period=(float)n*(float)37/(float)SIGNAL_SIZE;
       angle=period*PImul2;
       sinys=sinf(angle);
           if (period < n1)
           {
                   ample=(15-a1)*expf(-((float)period/t1))+a1; 
                   OUT[n]=sinys*ample+16;
           }
           else if(period<n1+n2)
           {
                   ample=(15-a2)*expf(-((float)(period-n1)/t2))+a2; 
                   OUT[n]=(sinys*ample)+16;
           }                 
           else OUT[n]=16;   
   }
  
  for(i=0; i<OUTPUT_SIZE; i++)
  {
      tempa=0;
      tempb=0;
      tempc=0;
      tempd=0;
      
      /////////////////////////////////// 1 canal
      if(i<SIGNAL_SIZE)
        temp=(uint8_t)(OUT[i]);
      else
        temp=16;
      
      if(temp&(1<<4)) tempa|=G4_PIN;
      if(temp&(1<<3)) tempa|=G3_PIN;
      if(temp&(1<<2)) tempa|=G2_PIN;
      if(temp&(1<<1)) tempa|=G1_PIN;
      if(temp&(1<<0)) tempa|=G0_PIN;
      
      if(i<SIGNAL_SIZE)
        temp=(uint8_t)(32.0-temp);
      else
        temp=16;
      
      if(temp&(1<<4)) tempc|=C4_PIN;
      if(temp&(1<<3)) tempc|=C3_PIN;
      if(temp&(1<<2)) tempc|=C2_PIN;
      if(temp&(1<<1)) tempc|=C1_PIN;
      if(temp&(1<<0)) tempc|=C0_PIN;
      
      
      ///////////////////////////////////// 2 canal
      
      if(i>=SHIFT & i<SHIFT+SIGNAL_SIZE)
        temp=(uint8_t)OUT[i-(SHIFT)];
      else
        temp=(uint8_t)16;
          
      if(temp&(1<<4)) tempb|=F4_PIN;
      if(temp&(1<<3)) tempb|=F3_PIN;
      if(temp&(1<<2)) tempb|=F2_PIN; 
      if(temp&(1<<1)) tempb|=F1_PIN;
      if(temp&(1<<0)) tempb|=F0_PIN;
      
      if(i>=SHIFT & i<SHIFT+SIGNAL_SIZE)
        temp=(uint8_t)32.0-temp;
      else
        temp=(uint8_t)16;
    
      if(temp&(1<<4)) tempb|=E4_PIN;
      if(temp&(1<<3)) tempb|=E3_PIN;
      if(temp&(1<<2)) tempb|=E2_PIN;
      if(temp&(1<<1)) tempc|=E1_PIN;
      if(temp&(1<<0)) tempc|=E0_PIN;
      
      ////////////////////////////////// 3 canal
     
      if(i>=SHIFT*2 & i<SHIFT*2+SIGNAL_SIZE)
        temp=(uint8_t)OUT[i-(SHIFT*2)];
      else
        temp=(uint8_t)16;
      
      if(temp&(1<<4)) tempa|=B4_PIN;
      if(temp&(1<<3)) tempa|=B3_PIN;
      if(temp&(1<<2)) tempa|=B2_PIN;
      if(temp&(1<<1)) tempa|=B1_PIN;
      if(temp&(1<<0)) tempa|=B0_PIN;
      
      if(i>SHIFT*2)
        temp=(uint8_t)32.0-temp;
      else
        temp=(uint8_t)16;
      
      if(temp&(1<<4)) A4_GPIO|=A4_PIN;
      if(temp&(1<<3)) A3_GPIO|=A3_PIN;
      if(temp&(1<<2)) A2_GPIO|=A2_PIN;
      if(temp&(1<<1)) A1_GPIO|=A1_PIN;
      if(temp&(1<<0)) A0_GPIO|=A0_PIN;
      
      //////////////////////////////// 4 canal
      
      if(i>=SHIFT*3 & i<SHIFT*3+SIGNAL_SIZE)
        temp=(uint8_t)OUT[i-(SHIFT*3)];
      else
        temp=(uint8_t)16;
      
      if(temp&(1<<4)) tempb|=D4_PIN;
      if(temp&(1<<3)) tempb|=D3_PIN;
      if(temp&(1<<2)) tempb|=D2_PIN;
      if(temp&(1<<1)) tempb|=D1_PIN;
      if(temp&(1<<0)) tempb|=D0_PIN;
      
      if(i>SHIFT*3)
        temp=(uint8_t)32.0-temp;
      else
        temp=(uint8_t)16;
      
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
  
   
  
  
  
   
  //Запрещаем программирование флеша
  FLASH->CR &= ~(FLASH_CR_PG);
  FLASH->CR |= FLASH_CR_LOCK;
  
  cycle((uint32_t*)&(GPIOA->ODR),(uint32_t*)&(GPIOB->ODR),(uint32_t*)&(GPIOC->ODR),(uint32_t*)&(GPIOD->ODR));
  
  asm("mov r4, #0x08000000"); 
  asm("add r4, r4, #0x10000"); //В r4 адрес первого элемента массива 
  asm("mov r5, #4096*8*8");// в r5 количество данных 
  asm("sub r5, r5, #1");//Вычитаем из r5 единицу и получаем маску (0x3FFF) 
  asm("mov r6, r4"); //r6 - указатель на текущий элемент 
  asm("mov r9, #0"); //r6 - указатель на текущий элемент 
  while(1) 
  { 
    asm("loop1: \n"
        "ldmfd r6!,{r7-r8}\n"//загружаем из флеша данные в r7,r8, при этом значение r6 увеличивается на 4, 
// то есть указывает на следующие данные 
          "strh r7, [r0]\n" //выставляем данные в регистр порта А 
            "strh r8, [r1]\n"//и в порт В
              "rev.w r7, r7\n"  //меняем слова в регистрах r7,r8 местами 
                "rev.w r8, r8\n"  //меняем слова в регистрах r7,r8 местами  
                  "strh r7, [r2]\n"  //выставляем данные на оставшиеся порты  
                    "strh r8, [r3]\n"    
                      "sub r6, r6,r4\n" //вычитаем из r6 начало таблицы 
                        "and r6, r6,r5\n" //Накладываем маску 
                          "cmp r6, r9\n" 
                            "add r6, r6,r4\n" //Прибавляем назад
                              );       
  }
}

void cycle(uint32_t* porta,uint32_t* portb,uint32_t* portc,uint32_t* portd)
{}

void flash_erase_page(uint32_t first_address_page)
{
    //unlock flash
    FLASH->KEYR=0x45670123;
    FLASH->KEYR=0xCDEF89AB;
    //set erase
    FLASH->CR |= FLASH_CR_PER;
    //set adress page
    FLASH->AR = first_address_page;
    //start erase
    FLASH->CR|= FLASH_CR_STRT;
    //wait while erase end
    while ((FLASH->SR & FLASH_SR_BSY) != 0){;}
    //erase end
    FLASH->CR &= ~FLASH_CR_PER;
    //lock flash
    //FLASH->CR |= FLASH_CR_LOCK;
}

void delay(uint32_t t)
{	
    uint32_t i;
    for(i=0;i<t;i++)
      {
      
      }
}