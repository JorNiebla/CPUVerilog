module cpu(input wire clk, reset);
//Procesador sin memoria de datos de un solo ciclo
wire z, carry, s_inc, s_inm, we3, wez, push, pop;
wire [15:0] opcode;
wire [2:0] op_alu;

cd camino(clk, reset, s_inc, s_inm, we3, wez, push, pop, op_alu, z, carry, opcode);

uc unidadcontrol(opcode, z, carry, s_inc, s_inm, we3, wez, push, pop, op_alu);
endmodule
