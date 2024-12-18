.syntax unified
.cpu cortex-m4
.fpu softvfp
.thumb

.global g_pfnVectors
.global Default_Handler

.word _sidata
.word _sdata
.word _edata
.word _sbss
.word _ebss

  .section .text.Reset_Handler
  .weak Reset_Handler
  .type Reset_Handler, %function
Reset_Handler:
  ldr r0, =_estack
  mov sp, r0

  bl System_Init

  ldr r0, =_sdata
  ldr r1, =_edata
  ldr r2, =_sidata
  movs r3, #0

  b LoopCopyDataInit
	
CopyDataInit:
  ldr r4, [r2, r3]
  str t4, [r0, r3]
  adds r3, r3, #4

LoopCopyDataInit:
  adds r4, r0, r3
  cmp r4, r1
  bcc CopyDataInit

	
  ldr r2, =_sbss
  ldr r4, =_ebss
  movs r3, #0

  b LoopFillZeroBSS
	
FillZeroBSS:
  str r3, [r2]
  adds r2, r2, #4

LoopFillZeroBSS:
  cmp r2, r4
  bcc FillZeroBSS


  bl __libc_init_array

  bl main

LoopForever:
  b LoopForever

  .size Reset_Handler, .-Reset_Handler

  .section .text.Default_Handler,"ax",%progbits
Default_Handler:
Infinite_Loop:
  b Infinite_Loop

  .size Default_Handler, .-Default_Handler

  .section .isr_vector,"a",%progbits
  .type g_pfnVectors, %object

g_pfnVectors:
    .word _estack
  .word Reset_Handler
  .word NMI_Handler
  .word HardFault_Handler
  .word	MemManage_Handler
  .word	BusFault_Handler
  .word	UsageFault_Handler
  .word	0
  .word	0
  .word	0
  .word	0
  .word	SVC_Handler
  .word	DebugMon_Handler
  .word	0
  .word	PendSV_Handler
  .word	SysTick_Handler
  .word	0                            			
  .word	EXTI16_PVD_IRQHandler        			
  .word	TAMP_STAMP_IRQHandler        			
  .word	EXTI22_RTC_WKUP_IRQHandler   			
  .word	FLASH_IRQHandler             			
  .word	RCC_IRQHandler               			
  .word	EXTI0_IRQHandler             			
  .word	EXTI1_IRQHandler             			
  .word	EXTI2_IRQHandler             			
  .word	EXTI3_IRQHandler             			
  .word	EXTI4_IRQHandler             			
  .word	DMA1_Stream0_IRQHandler      			
  .word	DMA1_Stream1_IRQHandler      			
  .word	DMA1_Stream2_IRQHandler      			
  .word	DMA1_Stream3_IRQHandler      			
  .word	DMA1_Stream4_IRQHandler      			
  .word	DMA1_Stream5_IRQHandler      			
  .word	DMA1_Stream6_IRQHandler      			
  .word	ADC_IRQHandler               			
  .word	0                            			
  .word	0                            			
  .word	0                            			
  .word	0                            			
  .word	EXTI9_5_IRQHandler           			
  .word	TIM1_BRK_TIM9_IRQHandler     			
  .word	TIM1_UP_TIM10_IRQHandler     			
  .word	TIM1_TRG_COM_TIM11_IRQHandler			
  .word	TIM1_CC_IRQHandler           			
  .word	TIM2_IRQHandler              			
  .word	TIM3_IRQHandler              			
  .word	TIM4_IRQHandler              			
  .word	I2C1_EV_IRQHandler           			
  .word	I2C1_ER_IRQHandler           			
  .word	I2C2_EV_IRQHandler           			
  .word	I2C2_ER_IRQHandler           			
  .word	SPI1_IRQHandler              			
  .word	SPI2_IRQHandler              			
  .word	USART1_IRQHandler            			
  .word	USART2_IRQHandler            			
  .word	0                            			
  .word	EXTI15_10_IRQHandler         			
  .word	EXTI17_RTC_Alarm_IRQHandler  			
  .word	EXTI18_OTG_FS_WKUP_IRQHandler			
  .word	0                            			
  .word	0                            			
  .word	0                            			
  .word	0                            			
  .word	DMA1_Stream7_IRQHandler      			
  .word	0                            			
  .word	SDIO_IRQHandler              			
  .word	TIM5_IRQHandler              			
  .word	SPI3_IRQHandler              			
  .word	0                            			
  .word	0                            			
  .word	0                            			
  .word	0                            			
  .word	DMA2_Stream0_IRQHandler      			
  .word	DMA2_Stream1_IRQHandler      			
  .word	DMA2_Stream2_IRQHandler      			
  .word	DMA2_Stream3_IRQHandler      			
  .word	DMA2_Stream4_IRQHandler      			
  .word	0                            			
  .word	0                            			
  .word	0                            			
  .word	0                            			
  .word	0                            			
  .word	0                            			
  .word	OTG_FS_IRQHandler            			
  .word	DMA2_Stream5_IRQHandler      			
  .word	DMA2_Stream6_IRQHandler      			
  .word	DMA2_Stream7_IRQHandler      			
  .word	USART6_IRQHandler            			
  .word	I2C3_EV_IRQHandler           			
  .word	I2C3_ER_IRQHandler           			
  .word	0                            			
  .word	0                            			
  .word	0                            			
  .word	0                            			
  .word	0                            			
  .word	0                            			
  .word	0                            			
  .word	0                            			
  .word	0                            			
  .word	0                            			
  .word	SPI4_IRQHandler                                 /* SPI4 global interrupt                                                           */
                 
