#ifndef UART_H_
#define UART_H_

#include <stdint.h>
#include "stm32f4xx.h"

/** 
 * @brief Function to Initialize the UART2 Peripheral 
 */
void UART2_Init(void);

/**
 * @brief Function to transmit single character via UART2 Tx
 *
 * @param ch Byte of data to transmit
 */
void UART2_TxChar(char ch);

/**
 * @brief Function to transmit string of characters via UART2 Tx
 *
 * @param *str Pointer to string of characters
 */
void UART2_TxString(char *str);

/**
 * @brief Function to receive single character via UART2 Tx
 *
 * @return Byte of data received
 */
uint8_t UART2_RxChar(void);

#endif

