module cpu(input wire clk, reset, input wire [15:0] p0, p1, p2 ,p3);
//Procesador sin memoria de datos de un solo ciclo
wire z, carry, s_inc, s_inm, we3, wez, push, pop, s_ent;
wire [15:0] opcode;
wire [2:0] op_alu;
wire [1:0] port;

uc unidadcontrol(opcode, z, carry, s_inc, push, pop, s_inm, we3, wez, s_ent, port, op_alu);
cd camino(clk, reset, s_inc, s_inm, we3, wez, push, pop, s_ent, port, op_alu, p0, p1, p2, p3, z, carry, opcode);

endmodule
