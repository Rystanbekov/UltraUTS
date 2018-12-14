#include "dsp.h"
#include "periphery_init.h"

void addArrayFloatWithSine(float* array, 
                           uint32_t size, 
                           float freq, 
                           float phase, 
                           float amplituda)
{
  for(uint16_t i=0;i<size;i++)
  {
    float angle = phase+PImul2*(float)i*(float)freq/(float)size;
    array[i]+=sinf(angle)*amplituda;
  }
}

void uint16ArrToFloatArr(uint16_t* u16_arr, float* float_arr, uint32_t size_arr)
{
  while(size_arr--)
  {
    *(float_arr++)=(float)*(u16_arr++);
  }
}

void FFTCoefCalc(FFT_StructTypeDef* fft)
{
   /* 
fft->wlen_pw_re[0]=1;
    fft->wlen_pw_im[0]=0;
    
    float angle = PImul2/(float)SAMPLE_SIZE;
    float temp_re=cosf(angle); 
    float temp_im=-sinf(angle);
    
    for (uint16_t i=1; i<SAMPLE_SIZE/2; ++i)
    {
      fft->wlen_pw_re[i]=fft->wlen_pw_re[i-1]*temp_re-fft->wlen_pw_im[i-1]*temp_im;
      fft->wlen_pw_im[i]=fft->wlen_pw_re[i-1]*temp_im+fft->wlen_pw_im[i-1]*temp_re;
    }
	*/
    for (uint16_t i=0; i<SAMPLE_SIZE/2; ++i)
    {
		float angle = PImul2*(float)i/(float)SAMPLE_SIZE;
		fft->wlen_pw[i].re=cosf(angle); 
		fft->wlen_pw[i].im=-sinf(angle);
	}
}

void revBitTableCalc(FFT_StructTypeDef* fft)
{
  for(uint16_t i=0;i<SAMPLE_SIZE;i++)
  {
    for(uint16_t j=0;j<LOG_2_SAMPLE_SIZE;j++)
    {
      if(i&(1<<j))
        fft->invBitTable[i]|=1<<LOG_2_SAMPLE_SIZE-1-j;
    }
  }
}

/*void windowFuncCalc(FFT_StructTypeDef* fft,WindosFuncType_EnumTypeDef win_type)
{ 
  float temp=(float)2*(float)3.1415926535897932384626433832795/(float)(SAMPLE_SIZE-1);
  
  for(uint32_t i=0;i<SAMPLE_SIZE;i++)
  {
    float angle = temp*(float)i;
    
    switch(win_type)
    {
    case RECTANGLE:
      {
        fft->win_table[i] = 1.0;
        break;
      }
    case BLACKMAN_NUTTAL:
      {
        float c0=(float)0.3635819;
        float c1=(float)-0.4891775*cosf(angle);
        float c2=(float)0.1365995*cosf(2*angle);
        float c3=(float)-0.0106411*cosf(3*angle);
        fft->win_table[i] = c0+c1+c2+c3;
        break;
      }
    case FLAT_TOP:
      {
        float c0 = (float)1.0;
        float c1 = (float)-1.93*cosf(angle);
        float c2 = (float)1.29*cosf(2*angle);
        float c3 = (float)-0.388*cosf(3*angle);
        float c4 = (float)0.032*cosf(4*angle);
        fft->win_table[i] = c0+c1+c2+c3+c4;
        break;
      }
    case SINUS:
      {
        fft->win_table[i] = sinf(angle/2);
        break;
      }
    }
  }
}*/

/*void applyWinFunc(FFT_StructTypeDef* fft)
{
  for(uint32_t i=0;i<SAMPLE_SIZE;i++)
  {
    fft->signal_re[i]*=fft->win_table[i];
  }
}*/

void fillSignRe_winFunc_transpData_clearSignIm(FFT_StructTypeDef* fft, uint16_t* in)
{
  uint32_t i = SAMPLE_SIZE;
  uint16_t* buff=in;  
  uint16_t* invTable = fft->invBitTable;
  complex_f* signal = fft->signal;
  while(i--)
  {
    (signal+*invTable)->re=(float)(*buff);
    (signal+*invTable)->im=0;
    invTable++;
    buff++;
  }
}

void fft(FFT_StructTypeDef* fft,uint16_t* data)
{
  complex_f v;
  complex_f u;
  
  for(uint32_t i=0; i < SAMPLE_SIZE; i+=1)
  {
	  uint16_t temp0=data[fft->invBitTable[i]];
	  fft->signal[i].re=(float)(temp0);
	  fft->signal[i].im=0;
  }
  
 /* for(uint32_t i=0; i < SAMPLE_SIZE; i+=2)
  {
	  uint16_t temp0=data[fft->invBitTable[i]];
	  uint16_t temp1=data[fft->invBitTable[i+1]];
	  fft->signal[i].re=(float)(temp0+temp1);
	  fft->signal[i+1].re=(float)(temp0-temp1);
  }*/

  /*for(uint32_t i=0; i < SAMPLE_SIZE; i+=8)
  {
	  uint16_t temp000,temp001;
	  int16_t temp00,temp01,temp02,temp03,temp04,temp05,temp06,temp07;
	  
	  temp000=data[fft->invBitTable[i]];
	  temp001=data[fft->invBitTable[i+1]];
	  temp00=(temp000+temp001);
	  temp01=(temp000-temp001);
	  
	  temp000=data[fft->invBitTable[i+2]];
	  temp001=data[fft->invBitTable[i+3]];
	  temp02=(temp000+temp001);
	  temp03=(temp000-temp001);
	  
	  temp00=temp00+temp02;
	  temp02=temp00-2*temp02;

	  temp000=data[fft->invBitTable[i+4]];
	  temp001=data[fft->invBitTable[i+5]];
	  temp04=(temp000+temp001);
	  temp05=(temp000-temp001);

	  temp000=data[fft->invBitTable[i+6]];
	  temp001=data[fft->invBitTable[i+7]];
	  temp06=(temp000+temp001);
	  temp07=(temp000-temp001);
	  
	  temp04=temp04+temp06;
	  temp06=temp04-2*temp06;

	  
	  fft->signal[i].re=temp00;
	  fft->signal[i].im=0;
	  
	  fft->signal[i+1].re=temp01;
	  fft->signal[i+1].im=-temp03;
	  
	  fft->signal[i+2].re=temp02;
	  fft->signal[i+2].im=0;
	  
	  fft->signal[i+3].re=temp01;
	  fft->signal[i+3].im=temp03;

	  fft->signal[i+4].re=temp04;
	  fft->signal[i+4].im=0;
	  
	  fft->signal[i+5].re=temp05;
	  fft->signal[i+5].im=-temp07;
	  
	  fft->signal[i+6].re=temp06;
	  fft->signal[i+6].im=0;
	  
	  fft->signal[i+7].re=temp05;
	  fft->signal[i+7].im=temp07;
  }
  
  
  */
  for(uint32_t len=2,lend2=1,wleninc=SAMPLE_SIZE/2; len<=SAMPLE_SIZE; len<<=1,lend2<<=1,wleninc>>=1)
  {
    for(uint32_t i=0; i < SAMPLE_SIZE; i+=len)
    {
      complex_f* temp1=&(fft->signal[i+lend2]);
      complex_f* temp2=&(fft->wlen_pw[0]);
      complex_f* signal_ipj = &fft->signal[i];
      
      for(uint32_t j=0; j<lend2; j++)
      {
        u=*signal_ipj;
        
        v.re=(temp1->re)*(temp2->re)-(temp1->im)*(temp2->im);
        v.im=(temp1->re)*(temp2->im)+(temp2->re)*(temp1->im);
        
        temp1->re=u.re-v.re;
        temp1->im=u.im-v.im;
        
        signal_ipj->re=u.re+v.re;
        signal_ipj->im=u.im+v.im;
        
        signal_ipj++;
        temp1++;
        temp2+=wleninc;
      }
    }
  }
}

void amplCalc(FFT_StructTypeDef* fft)
{
  for(uint32_t i=0;i<SAMPLE_SIZE;i++)
  {
      fft->signal[i].re=sqrtf(fft->signal[i].re*fft->signal[i].re+fft->signal[i].im*fft->signal[i].im);
	  float atg=atanf(fft->signal[i].im/fft->signal[i].re);
	  if(fft->signal[i].re>0)
	  {
		  if(fft->signal[i].im>0)
		  {
			  fft->signal[i].im=atg;
		  }else
		  {
			  fft->signal[i].im=6.283185307179586476925286766559-atg;
		  }
	  }
	  else
	  {
		  if(fft->signal[i].im>0)
		  {
			  fft->signal[i].im=3.1415926535897932384626433832795-atg;
		  }else
		  {
			  fft->signal[i].im=3.1415926535897932384626433832795+atg;
		  }
	  }
	 
  }
  
}