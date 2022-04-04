module uc(input wire [15:0] opcode, input wire z, carry, output reg s_inc, we3, push, pop, output wire s_inm, wez, output wire [2:0] op_alu);

  assign op_alu = opcode[10:8];
  assign s_inm = opcode[12];
  assign wez = opcode[11];

  always @(opcode) begin
    casez (opcode)
      16'b000?1???????????: begin // Cualquier operación que use la alu
        we3 = 1'b1;
        s_inc = 1'b1;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000000: begin // J
        we3 = 1'b0;
        s_inc = 1'b0;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000001: begin // JZ
        we3 = 1'b0;
        s_inc = ~z;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000010: begin // JNZ
        we3 = 1'b0;
        s_inc = z;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000011: begin // JA
        we3 = 1'b0;
        s_inc = z;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000100: begin // JAE
        we3 = 1'b0;
        s_inc = z;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000101: begin // JB
        we3 = 1'b0;
        s_inc = z;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000110: begin // CALL
        we3 = 1'b0;
        s_inc =1'b0;
        push = 1'b1;
        pop = 1'b0;
      end
      16'b0000000000000111: begin // RET
        we3 = 1'b0;
        s_inc = 1'b0;
        push = 1'b0;
        pop = 1'b1;
      end
      default: begin
        we3 = 1'b0;
        s_inc = 1'b1;
        push = 1'b0;
        pop = 1'b0;
      end
    endcase
  end

endmodule