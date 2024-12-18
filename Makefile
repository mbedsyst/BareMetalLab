# Compiler and Tools
CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy

# Project Files
SRCS = main.c startup_stm32f401xe.s
OBJS = $(SRCS: .c= .o)

# Include Paths
CFLAGS += -IHeaders/CMSIS/Include
CFLAGS += -IHeaders/CMSIS/Device/ST/STM32F4xx/Include

# MCU Specific Flags
CFLAGS += -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard

# Linker Flags
LDFLAGS = -TSTM32F401RETX.ld

# Rules
all: project.elf

project.elf: $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.s
	$(AS) $(ASFLAGS) -c $< -o $@

clean:
	rm -f *.o *.elf
