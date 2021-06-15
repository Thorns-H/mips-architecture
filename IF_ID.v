`timescale 1ns/1ns

module IF_ID (
    input [31:00] PC_Adder_in,
    input [31:00] Mem_Inst_in,
    input clk,
    output reg [31:00] PC_Adder_out,
    output reg [31:00] Mem_Inst_out
);

initial
begin
  PC_Adder_out = 0;
  Mem_Inst_out = 0;
end

always @(posedge clk)
begin
  PC_Adder_out = PC_Adder_in;
  Mem_Inst_out = Mem_Inst_in;
end

endmodule