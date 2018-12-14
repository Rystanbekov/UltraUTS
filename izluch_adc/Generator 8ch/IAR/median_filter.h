#ifndef _MEDIAN_FILTER_H
#define _MEDIAN_FILTER_H

#define M_FILTER_LENGHT 32

#include "stm32f10x.h"

typedef struct 
{
  uint16_t array[M_FILTER_LENGHT];
  uint16_t array_ptr;
  uint32_t average;
}medianFilterStruct;

inline void push_m_filter(medianFilterStruct* filter, uint16_t data);

float get_m_filter(medianFilterStruct* filter);

#endif