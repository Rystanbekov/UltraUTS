#include "median_filter.h"

inline void push_m_filter(medianFilterStruct* filter, uint16_t data)
{
  filter->average+=data;
  filter->average-=filter->array[filter->array_ptr];
  filter->array[filter->array_ptr]=data;
  filter->array_ptr++;
  filter->array_ptr&=~M_FILTER_LENGHT;
}

float get_m_filter(medianFilterStruct* filter)
{
  float temp = (float)filter->average/(float)(M_FILTER_LENGHT);
  return temp;
  
}
