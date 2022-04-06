module uc(input wire [15:0] opcode, input wire z, carry, output reg s_inc, push, pop, output wire s_inm, we3, wez, s_ent, output wire [1:0] port, output wire [2:0] op_alu);

  assign op_alu = opcode[10:8];
  assign s_inm = opcode[12];
  assign wez = opcode[11];
  assign s_ent = opcode[13];
  assign we3 = opcode[11];
  assign port = opcode[1:0];

  always @(opcode) begin
    casez (opcode)
      16'b????1???????????: begin // Cualquier operación que use la alu
        s_inc = 1'b1;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000000: begin // J
        s_inc = 1'b0;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000001: begin // JZ
        s_inc = ~z;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000010: begin // JNZ
        s_inc = z;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000011: begin // JA
        s_inc = z;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000100: begin // JAE
        s_inc = z;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000101: begin // JB
        s_inc = z;
        push = 1'b0;
        pop = 1'b0;
      end
      16'b0000000000000110: begin // CALL
        s_inc =1'b0;
        push = 1'b1;
        pop = 1'b0;
      end
      16'b0000000000000111: begin // RET
        s_inc = 1'b0;
        push = 1'b0;
        pop = 1'b1;
      end
      default: begin
        s_inc = 1'b1;
        push = 1'b0;
        pop = 1'b0;
      end
    endcase
  end

endmodule