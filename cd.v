module cd(input wire clk, reset, s_inc, s_inm, we3, wez, input wire [2:0] op_alu, output wire z, output wire [5:0] opcode);
//Camino de datos de instrucciones de un solo ciclo

    wire [15:0] INST;
    wire [9:0] counter, outMUXDIR, DIR_SALTO;
    wire [7:0] INM, WD3, outALU, RD1, RD2;
    wire [3:0] RA1, RA2, WA3;

    assign RA1 = INST[11:8];
    assign RA2 = INST[7:4];
    assign WA3 = INST[3:0];

    assign INM = INST[11:4];
    assign DIR_SALTO = INST[9:0];

    assign opcode = INST[15:10];

    registro #(WIDTH = 10) PC(clk, reset, outMUXDIR, counter);
    memprog MemProg(clk,counter,inst);
    sum SUMDIR(10'b1,counter,outSUMDIR);
    regfile BANCO(clk,we3,RA1,RA2,WA3,WD3,RD1,RD2);
    

endmodule
