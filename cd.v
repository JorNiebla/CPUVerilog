module cd(input wire clk, reset, s_inc, s_inm, we3, wez, input wire [2:0] op_alu, output wire z, output wire [5:0] opcode);
//Camino de datos de instrucciones de un solo ciclo

    wire [31:0] INST;
    wire [9:0] counter, outMUXDIR, DIR_SALTO, outSUMDIR;
    wire [15:0] INM, WD3, outALU, RD1, RD2;
    wire [3:0] RA1, RA2, WA3;
    wire zALU;

    assign RA1 = INST[11:8];
    assign RA2 = INST[7:4];
    assign WA3 = INST[3:0];

    assign INM = INST[11:4];
    assign DIR_SALTO = INST[9:0];

    assign opcode = INST[15:10];

    registro #(10) PC(clk, reset, outMUXDIR, counter);
    memprog MemProg(clk,counter,INST);
    sum SUMDIR(10'b1,counter,outSUMDIR);
    mux2 #(10) MUXDIR(DIR_SALTO,outSUMDIR,s_inc,outMUXDIR);
    
    regfile BANCO(clk,we3,RA1,RA2,WA3,WD3,RD1,RD2);
    alu ALU(RD1,RD2,op_alu,outALU,zALU);
    ffd FFZ(clk,reset,zALU,wez,z);
    mux2 #(16) MUXALU(outALU,INM,s_inm,WD3);
    

endmodule
