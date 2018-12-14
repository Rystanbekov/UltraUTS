#include "macro.h"

void motor(uint8_t n, uint8_t state, uint8_t direction)
{
  if(state==enable)
  {
    if(n==1)
    {
      MOTOR_1_OFF;
      if(direction==right)
      {
        MOTOR_1_RIGHT;        
      }
      else if(direction==left)
      {
        MOTOR_1_LEFT;
      }
    }
    else if(n==2)
    {
      MOTOR_2_OFF;
      if(direction==right)
      {
        MOTOR_2_RIGHT;        
      }
      else if(direction==left)
      {
        MOTOR_2_LEFT;
      }
    }
  }
  else if(state==disable)
  {
    if(n==1)
    {
      MOTOR_1_OFF;
    }
    else if(n==2)
    {
      MOTOR_2_OFF;
    }
  }
}

uint8_t Get_endswitch_status(uint8_t n)
{
  uint8_t code_switch=0;
  
  switch(n)
  {
    case 1:
      if(ENDSWITCH_1_ON){code_switch=1;}else{code_switch=0;}
    break;
    
    case 2:
      if(ENDSWITCH_2_ON){code_switch=2;}else{code_switch=0;}
    break;
    
    case 3:
      if(ENDSWITCH_3_ON){code_switch=3;}else{code_switch=0;}
    break;
    
    case 4:
      if(ENDSWITCH_4_ON){code_switch=4;}else{code_switch=0;}
    break;
    
    case 5:
      if(ENDSWITCH_5_ON){code_switch=5;}else{code_switch=0;}
    break;
  }  
  return code_switch;
}

void OD_out(uint8_t n, uint8_t state)
{
  if(state==enable)
  {
    switch(n)
    {
      case 1:
        OD_1_ON;
      break;
      
      case 2:
        OD_2_ON;
      break;
      
      case 3:
        OD_3_ON;
      break;      
    }
  }
  else if(state==disable)
  {
    switch(n)
    {
      case 1:
        OD_1_OFF;
      break;
      
      case 2:
        OD_2_OFF;
      break;
      
      case 3:
        OD_3_OFF;
      break;      
    }
  }
}

uint8_t Read_ADDR_switch(void)
{
  uint8_t addr_code=0;
  
  if(!(ADDR_KEY_1_GPIO->IDR & ADDR_KEY_1_PIN))
  {
    addr_code|=1;
  }
  if(!(ADDR_KEY_2_GPIO->IDR & ADDR_KEY_2_PIN))
  {
    addr_code|=2;
  }
  if(!(ADDR_KEY_3_GPIO->IDR & ADDR_KEY_3_PIN))
  {
    addr_code|=4;
  }
  if(!(ADDR_KEY_4_GPIO->IDR & ADDR_KEY_4_PIN))
  {
    addr_code|=8;
  }
  
  return addr_code;  
}
