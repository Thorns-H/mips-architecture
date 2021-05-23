`timescale 1ns/1ns

module PC(
    input [31:0]PC_in,
    input clk,
    output reg[31:0]PC_out
);

always @(posedge clk)
begin
    PC_out<=PC_in;
end

endmodule