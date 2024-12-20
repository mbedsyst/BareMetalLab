/* Entry Point */
ENTRY(Reset_Handler)

/* End of User Mode Stack */
_estack = ORIGIN(RAM) + LENGTH(RAM);

/* Minimum Required Heap & Stack */
_Min_Heap_Size = 0x200;
_Min_Stack_Size = 0x400;

/* Memory Definition */
MEMORY
{
	RAM (xrw) : ORIGIN = 0x20000000, LENGTH = 96K
	FLASH(rx) : ORIGIN = 0x80000000, LENGTH = 512K
}

/* Section Definitions */
SECTIONS
{	
	/* Vector Table into start of the Flash */
	.isr_vector:
	{
		. = ALIGN(4);
		KEEP(*(.isr_vector))
		. = ALIGN(4);
	} >FLASH

	/* Program Code into Flash */
	.text:
	{
		. = ALIGN(4);
		*(.text)
		*(.text*)
		. = ALIGN(4);
		_etext = .;
	} >FLASH

	/* Constant Data into Flash */
	.rodata:
	{
		. = ALIGN(4);
		*(.rodata)
		*(.rodata*)
		. = ALIGN(4);
	} >FLASH
	
	/* To Initialize Data section */
	_sidata = LOADADDR(.data);
	
	/* Initialized Data section into RAM */
	.data:
	{
		. = ALIGN(4);
		_sdata = .;
		*(.data)
		*(.data*)
		. = ALIGN(4);
		_edata = .;
	} >RAM AT> FLASH
	
	/* Adjusting the Word alignment */
	. = ALIGN(4);
	
	/* Uninitialized BSS section into RAM */
	.bss:
	{
		_sbss = .;
		__bss_start__ = _sbss;
		*(.bss)
		*(.bss*)
		*(COMMON)
		. = ALIGN(4);
		_ebss = .;
		__bss_end__ = _ebss;
	} >RAM
	
	/* User Heap Stack section to check if enough memory is available */
	.user_heap_stack:
	{
		. = ALIGN(8);
		PROVIDE( end = . );
		PROVIDE( _end = . );
		. = . + _Min_Heap_Size;
		. = . + _Min_Stack_Size;
		. = ALIGN(8);
	} > RAM
	
	/* Removing information from compiler libraries */
	/DISCARD/:
	{
		libc.a ( * )
		libm.a ( * )
		libgcc.a ( * )
	}
	
	.ARM.attributes 0 : { *(.ARM.attributes) }
}




























