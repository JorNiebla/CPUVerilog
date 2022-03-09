module stack(input wire [9:0] stackIn, input wire reset, push, pop, clk, output reg [9:0] stackOut);
//Pila

  reg [9:0] pila[0:31];
  reg [0:31] sp;
  
  initial 
  begin
    sp = 5'b00000;
  end
  
  always @(posedge clk, posedge push) 
  begin
    pila[sp] = stackIn;
    sp = sp + 5'b00001;
  end
  
  always @(posedge clk, posedge pop) 
  begin
    stackOut = pila[sp];
    sp = sp - 5'b00001;
  end
  
  always @(posedge clk, posedge reset) 
  begin
    sp = 5'b00000;
  end

endmodule 
