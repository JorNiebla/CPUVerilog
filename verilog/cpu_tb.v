`timescale 1 ns / 10 ps

module cpu_tb;


reg clk, reset;
reg [15:0] p0, p1, p2, p3;

wire [15:0] salida;


// generación de reloj clk
always //siempre activo, no hay condición de activación
begin
  clk = 1'b1;
  #30;
  clk = 1'b0;
  #30;
end

// instanciación del procesador
cpu micpu(clk, reset, p0, p1, p2, p3, salida);

initial
begin
  $dumpfile("cpu_tb.vcd");
  $dumpvars;
  reset = 1;  //a partir del flanco de subida del reset empieza el funcionamiento normal
  #10;
  reset = 0;  //bajamos el reset 
end

initial
begin

  #(9*60);  //Esperamos 9 ciclos o 9 instrucciones
  $finish;
end

endmodule