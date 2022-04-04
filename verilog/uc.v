module uc(input wire [15:0] opcode, input wire z, carry, output reg s_inc, we3, wez, push, pop, output wire s_inm, output wire [2:0] op_alu);

  assign op_alu = opcode[26:24];
  assign s_inm = opcode[28];

  always @(opcode) begin
    casez (opcode)
      16'b000?1???????????: begin // Cualquier operación que use la alu
        wez = z;
        we3 = 1'b1;
        s_inc = 1'b1;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000000: begin // J
        wez = 1'b0;
        we3 = 1'b0;
        s_inc = 1'b0;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000001: begin // JZ
        wez = 1'b0;
        we3 = 1'b0;
        s_inc = ~z;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000010: begin // JNZ
        wez = 1'b0;
        we3 = 1'b0;
        s_inc = z;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000011: begin // JA
        wez = 1'b0;
        we3 = 1'b0;
        s_inc = z;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000100: begin // JAE
        wez = 1'b0;
        we3 = 1'b0;
        s_inc = z;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000101: begin // JB
        wez = 1'b0;
        we3 = 1'b0;
        s_inc = z;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000110: begin // CALL
        wez = 1'b0;
        we3 = 1'b0;
        s_inc = z;
        push = 1'b1;
        pop = 1'b0;
      end
      16'b0000000000000111: begin // RET
        wez = 1'b0;
        we3 = 1'b0;
        s_inc = z;
        push = 1'b0;
        pop = 1'b1;
      end
      default: begin
        wez = 1'b0;
        we3 = 1'b0;
        s_inc = 1'b1;
        push = 1'b0;
        pop = 1'b0;
      end
    endcase
  end

endmodule