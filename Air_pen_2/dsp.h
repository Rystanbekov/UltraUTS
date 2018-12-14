#ifndef _DSP_H
#define _DSP_H

#include "math.h"
#include "stdint.h"
#include "stdbool.h"


//���������
#define PI (float)3.1415926535897932384626433832795
#define PImul2 (float)PI*(float)2

//���������
#define SAMPLE_SIZE 256               //������ ������ �������
#define LOG_2_SAMPLE_SIZE 8          //Log2(SAMPLE_SIZE)

//���� ��������� ������

extern uint16_t ADC_buf1[SAMPLE_SIZE], ADC_buf2[SAMPLE_SIZE];
typedef struct
{
	float re;
	float im;
}complex_f;

//��������� ���
typedef struct 
{
  complex_f wlen_pw[SAMPLE_SIZE/2];
  uint16_t invBitTable[SAMPLE_SIZE];     //������� � ������� ��������� ������ �������
  complex_f signal[SAMPLE_SIZE];
}FFT_StructTypeDef;

typedef enum
{
  RECTANGLE,
  BLACKMAN_NUTTAL,
  FLAT_TOP,
  SINUS,
}WindosFuncType_EnumTypeDef;


/*�-�� ��������� � ���������� ������� �����
  array - ������ � �������� �����������,
  size - ������ �������,
  freq - ������� ������. 1�� ��������� �������� � ������,
  phase - ���� ������,
  amplituda - ��������� ������
*/
void addArrayFloatWithSine(float* array, 
                            uint32_t size, 
                            float freq, 
                            float phase, 
                            float amplituda);

/*������� ��������� ������ float ��
������� ������� uint16_t � ����������� �����
u16_arr - ��������� �� ������ uint16_t
float_arr - ��������� �� ������ float
size_arr - ������ ��������
*/
void uint16ArrToFloatArr(uint16_t* u16_arr, 
                         float* float_arr, 
                         uint32_t size_arr);

/*�-�� ��������� ������ � ������� ��������
  fft - ��������� ���
  win_type - ������������ - ��� ������� �������
*/
void windowFuncCalc(FFT_StructTypeDef* fft,WindosFuncType_EnumTypeDef win_type);

/*������� ������������ ������� � ������� ���������������
  fft - ��������� ���
*/
void revBitTableCalc(FFT_StructTypeDef* fft);

/*�-�� �������� ������������� ��� ���
  fft - ��������� ���
*/
void FFTCoefCalc(FFT_StructTypeDef* fft);

/*�-�� ��������� ������� ������� � ������
*/
void applyWinFunc(FFT_StructTypeDef* fft);

/*�-�� ������������ ���� ������� � ����������
� �������� ��������������
*/
void fillSignRe_winFunc_transpData_clearSignIm(FFT_StructTypeDef* fft, uint16_t* in);

/*������� ���������� ���
*/
void fft(FFT_StructTypeDef* fft, uint16_t* data);

/*������� ������������ ����� ���������
�������� � ������ ����� �������
*/
void amplCalc(FFT_StructTypeDef* fft);

#endif