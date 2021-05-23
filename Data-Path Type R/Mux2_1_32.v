`timescale 1ns/1ns

module mux2_1_32(
    input [31:0]in1,
    input [31:0]in2,
    input s,
    output reg[31:0]out

);

always @* 
begin
    case(s)
      1'b0:
      begin
        out <= in2;
      end
      1'b1:
      begin
        out <= in1;
      end
    endcase
end

endmodule
