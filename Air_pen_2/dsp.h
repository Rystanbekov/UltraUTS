#ifndef _DSP_H
#define _DSP_H

#include "math.h"
#include "stdint.h"
#include "stdbool.h"


//Константы
#define PI (float)3.1415926535897932384626433832795
#define PImul2 (float)PI*(float)2

//Настройки
#define SAMPLE_SIZE 256               //Размер семпла сигнала
#define LOG_2_SAMPLE_SIZE 8          //Log2(SAMPLE_SIZE)

//флаг активного буфера

extern uint16_t ADC_buf1[SAMPLE_SIZE], ADC_buf2[SAMPLE_SIZE];
typedef struct
{
	float re;
	float im;
}complex_f;

//Структура БПФ
typedef struct 
{
  complex_f wlen_pw[SAMPLE_SIZE/2];
  uint16_t invBitTable[SAMPLE_SIZE];     //Таблица с битовой инверсией своего индекса
  complex_f signal[SAMPLE_SIZE];
}FFT_StructTypeDef;

typedef enum
{
  RECTANGLE,
  BLACKMAN_NUTTAL,
  FLAT_TOP,
  SINUS,
}WindosFuncType_EnumTypeDef;


/*Ф-ия добавляет к указанному массиву синус
  array - массив к которому добавляется,
  size - размер массива,
  freq - частота синуса. 1Гц полностью уложится в массив,
  phase - фаза синуса,
  amplituda - амплитуда синуса
*/
void addArrayFloatWithSine(float* array, 
                            uint32_t size, 
                            float freq, 
                            float phase, 
                            float amplituda);

/*Функция заполняет массив float из
другого массива uint16_t с приведением типов
u16_arr - указатель на массив uint16_t
float_arr - указатель на массив float
size_arr - размер массивов
*/
void uint16ArrToFloatArr(uint16_t* u16_arr, 
                         float* float_arr, 
                         uint32_t size_arr);

/*Ф-ия заполняет массив с оконной функцией
  fft - структура БПФ
  win_type - перечисление - тип оконной функции
*/
void windowFuncCalc(FFT_StructTypeDef* fft,WindosFuncType_EnumTypeDef win_type);

/*Функция рассчитывает таблицу с битовым реверсированием
  fft - структура БПФ
*/
void revBitTableCalc(FFT_StructTypeDef* fft);

/*Ф-ия рассчета коэффициентов для БПФ
  fft - структура БПФ
*/
void FFTCoefCalc(FFT_StructTypeDef* fft);

/*Ф-ия применяет оконную функцию к данным
*/
void applyWinFunc(FFT_StructTypeDef* fft);

/*Ф-ия переставляет биты сигнала в соответвии
с таблицей реверсирования
*/
void fillSignRe_winFunc_transpData_clearSignIm(FFT_StructTypeDef* fft, uint16_t* in);

/*Функция производит БПФ
*/
void fft(FFT_StructTypeDef* fft, uint16_t* data);

/*Функция рассчитывает сумму квадратов
реальной и мнимой части спектра
*/
void amplCalc(FFT_StructTypeDef* fft);

#endif