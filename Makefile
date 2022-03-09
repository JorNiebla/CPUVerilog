CC := gcc
CFLAGS := 
VERI := verilog
ASM := ensamblador

all: asm verilog test

asm: $(ASM)/asm.cpp
	cd $(ASM) ; $(CC) $(CFLAGS) -o asm asm.cpp

test:


.PHONY : verilog
verilog: $(VERI)/*.v
	iverilog $(VERI)/*.v -o $(VERI)/cpu
	cd $(VERI) ; vvp cpu

.PHONY: clean
clean: 
	rm -f $(VERI)/cpu $(VERI)/cpu_tb.vcd $(ASM)/asm