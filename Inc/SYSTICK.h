#ifndef SYSTICK_H_
#define SYSTICK_H_

#include "stm32f4xx.h"

/**
 * @brief Function to block execution in units of milliseconds
 *
 * @param ms Number of milliseconds to block
 */
void delay_ms(uint32_t ms);

#endif
