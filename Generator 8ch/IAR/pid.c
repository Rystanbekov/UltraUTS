#include "pid.h"

float pid_float_process(pidFloatStruct* pid)
{
  pid->error=*(pid->setpoint)-*(pid->actual_point);
  
  pid->p_member=(pid->p_gain)*pid->error;
  pid->i_member=(pid->i_state);
  float output = pid->p_member+pid->i_member;
  if(output<(pid->min_output))
  {
    output=(pid->min_output);
    if(pid->error>0)
      (pid->i_state)+=(pid->i_gain)*pid->error;
  }
  else if(output>(pid->max_output))
  {
    output=(pid->max_output);
    if(pid->error<0)
    {
      (pid->i_state)+=(pid->i_gain)*pid->error;
    }
  }
  else
  {
    (pid->i_state)+=(pid->i_gain)*pid->error;
  }
  
  (pid->old_point)=*(pid->actual_point);
  pid->output=output;
  return output;
}
