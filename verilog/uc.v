module uc(input wire [15:0] opcode, input wire z, carry, output reg s_inc, push, pop, s_ent, s_sal, output wire s_inm, we3, wez, output wire [1:0] port, output wire [2:0] op_alu);

  assign op_alu = opcode[10:8];
  assign s_inm = opcode[12];
  assign wez = opcode[11];
  assign we3 = opcode[11];
  assign port = opcode[1:0];

  always @(opcode) begin
    casez (opcode)
      // 16'b????1???????????: begin // Cualquier operación que use la alu
      //   s_inc = 1'b1;
      //   push = 1'b0;
      //   pop = 1'b0;
      //   s_ent = 1'b0;
      // end
      16'b0000000000000000: begin // J
        s_inc = 1'b0;
        push = 1'b0;
        pop = 1'b0;
        s_ent = 1'b0;
      end
      16'b0000000000000001: begin // JZ
        s_inc = ~z;
        push = 1'b0;
        pop = 1'b0;
        s_ent = 1'b0;
      end
      16'b0000000000000010: begin // JNZ
        s_inc = z;
        push = 1'b0;
        pop = 1'b0;
        s_ent = 1'b0;
      end
      16'b0000000000000011: begin // JA
        s_inc = z;
        push = 1'b0;
        pop = 1'b0;
        s_ent = 1'b0;
      end
      16'b0000000000000100: begin // JAE
        s_inc = z;
        push = 1'b0;
        pop = 1'b0;
        s_ent = 1'b0;
      end
      16'b0000000000000101: begin // JB
        s_inc = z;
        push = 1'b0;
        pop = 1'b0;
        s_ent = 1'b0;
      end
      16'b0000000000000110: begin // CALL
        s_inc =1'b0;
        push = 1'b1;
        pop = 1'b0;
        s_ent = 1'b0;
      end
      16'b0000000000000111: begin // RET
        s_inc = 1'b0;
        push = 1'b0;
        pop = 1'b1;
        s_ent = 1'b0;
      end
      16'b00111000000000??: begin // IN
        s_inc = 1'b1;
        push = 1'b0;
        pop = 1'b0;
        s_ent = 1'b1;
      end
      16'b001?0000????????: begin // OUT y OUTI
        s_inc = 1'b1;
        push = 1'b0;
        pop = 1'b0;
        s_ent = 1'b0;
        s_sal = 1'b1;
      end
      
      default: begin //CUALQUIERA DE ALU
        s_inc = 1'b1;
        push = 1'b0;
        pop = 1'b0;
        s_ent = 1'b0;
      end
    endcase
  end

endmodule