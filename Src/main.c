#include <stdio.h>
#include <stdint.h>
#include "UART.h"
#include "SYSTICK.h"

int main()
{
	UART2_Init();

	while(1)
	{
		printf("Hello World. \n\r");
		delay_ms(1000);
	}
}
