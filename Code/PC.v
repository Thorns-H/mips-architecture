`timescale 1ns/1ns

module PC(
    input [31:0]PC_in,
    input clk,
    output reg[31:0]PC_out
);

initial begin
    PC_out = 0;
end

always @(posedge clk)
    begin
        PC_out = (PC_in) ? PC_in : 32'b0;
    end
    
endmodule