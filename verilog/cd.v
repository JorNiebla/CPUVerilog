module cd(input wire clk, reset, s_inc, s_inm, we3, wez, push, pop, input wire [2:0] op_alu, output wire z, carry, output wire [15:0] opcode);
//Camino de datos de instrucciones de un solo ciclo

    wire [31:0] INST;
    wire [9:0] counter, outMUXDIR, DIR_SALTO, outSUMDIR, outMUXSTACK, outSTACK;
    wire [15:0] INM, WD3, RD1, RD2, outMUXINM;
    wire [3:0] RA1, RA2, WA3;
    wire zALU, cALU;

    assign RA1 = INST[11:8];
    assign RA2 = INST[7:4];
    assign WA3 = INST[3:0];

    assign INM = INST[23:8];
    assign DIR_SALTO = INST[15:6];

    assign opcode = INST[31:16];

    registro #(10) PC(clk, reset, outMUXSTACK, counter);
    memprog MemProg(clk,counter,INST);
    sum SUMDIR(10'b1,counter,outSUMDIR);
    mux2 #(10) MUXDIR(DIR_SALTO,outSUMDIR,s_inc,outMUXDIR);
    
    mux2 #(16) MUXINM(RD1,INM[27:12],s_inm,outMUXINM);
    regfile BANCO(clk,we3,RA1,RA2,WA3,WD3,RD1,RD2);
    alu ALU(outMUXINM,RD2,op_alu,WD3,zALU, cALU);
    ffd FFZ(clk,reset,zALU,wez,z);
    ffd FFC(clk,reset,cALU,wez,carry);
    //mux2 #(16) MUXALU(outALU,INM,s_inm,WD3);
    
    stack PILA(outSUMDIR, reset, push, pop, clk, outSTACK);
    mux2 #(10) MUXSTACK(outMUXDIR, outSTACK, pop, outMUXSTACK);

endmodule
