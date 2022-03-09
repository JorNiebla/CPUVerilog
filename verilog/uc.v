module uc(input wire [15:0] opcode, input wire z, carry, output reg s_inc, s_inm, we3, wez, push, pop, output reg [2:0] op_alu);

  always @(opcode)
  begin
    s_inm = 1'b0;
    s_inc = 1'b1;
    wez = 1'b0;
    we3 = 1'b0;
    casez (opcode)
      16'b101?????????????: begin
        s_inm = 1'b1;
        op_alu = opcode[30:28];
        wez = 1'b1;
        we3 = 1'b1;
      end
      16'b100?????????????: begin
        s_inm = 1'b1;
        op_alu = opcode[30:28];
        we3 = 1'b1;
      end
      16'b11??????????????: begin
        s_inm = 1'b1;
        op_alu = opcode[30:28];
        we3 = 1'b1;
      end
      16'b01???????????01?: begin
        op_alu = opcode[18:16];
        wez = 1'b1;
        we3 = 1'b1;
      end
      16'b01???????????00?: begin
        op_alu = opcode[18:16];
        we3 = 1'b1;
      end
      16'b01???????????1??: begin
        op_alu = opcode[18:16];
        we3 = 1'b1;
      end
      16'b001?????????????: begin
        
      end
    endcase
  end

endmodule