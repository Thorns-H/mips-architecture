`timescale 1ns/1ns

module Alu(
    input [31:0]i_op1,
    input [31:0]i_op2,
    input [3:0]Sel,
    output reg Zflag,
    output reg [31:0]r_out

);

always @* 
begin
    case(Sel)
      4'b0000:
      begin
        r_out = i_op1 & i_op2;
      end
      4'b0001:
      begin
        r_out = i_op1 | i_op2;
      end
      4'b0010:
      begin
        r_out = i_op1 + i_op2;
      end
      4'b0110:
      begin
        r_out = i_op1 - i_op2;
      end
      4'b0111:
      begin
        r_out = (i_op1 < i_op2) ? 1:0;
      end
      4'b0011:
      begin
        r_out = i_op1 * i_op2;
      end
      4'b0000:
      begin
        r_out = i_op1<<0;
      end      
    endcase
    Zflag <= (!r_out) ? 0 : 1;
end

endmodule