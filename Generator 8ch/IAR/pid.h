#ifndef _PID_H
#define _PID_H

#include "stdint.h"

typedef struct
{
  float p_gain;
  float i_gain;
  float p_member;
  float i_member;
  float i_state;
  float *setpoint;
  float *actual_point;
  float old_point;
  float max_output;
  float min_output;
  float output;
  float error;
}pidFloatStruct;

float pid_float_process(pidFloatStruct* );
//int32_t pid_process_integer(pidStructInteger* );
#endif