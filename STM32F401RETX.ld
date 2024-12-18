ENTRY(Reset_Handler)

_estack = ORIGIN(RAM) + LENGTH(RAM);

_Min_Heap_Size = 0x200;
_Min_Stack_Size = 0x400;

MEMORY
{
	RAM (xrw) : ORIGIN = 0x20000000, LENGTH = 96K
	FLASH(rx) : ORIGIN = 0x80000000, LENGTH = 512K
}

SECTIONS
{
	.isr_vector:
	{
		. = ALIGN(4);
		KEEP(*(.isr_vector))
		. = ALIGN(4);
	} >FLASH

	.text:
	{
		. = ALIGN(4);
		*(.text)
		*(.text*)
		. = ALIGN(4);
		_etext = .;
	} >FLASH

	.rodata:
	{
		. = ALIGN(4);
		*(.rodata)
		*(.rodata*)
		. = ALIGN(4);
	} >FLASH
}
