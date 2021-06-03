`timescale 1ns/1ns

module IF_ID (
    input [31:00] Add_in,
    input [31:00] Mem_Inst_in,
    input clk,
    output reg [31:00] Add_out,
    output reg [31:00] Mem_Inst_out
);

initial
begin
  Add_out = 0;
  Mem_Inst_out = 0;
end

always @(posedge clk)
begin
  Add_out = (Add_in) ? Add_in : 32'b0;
  Mem_Inst_out = (Mem_Inst_in) ? Mem_Inst_in : 32'b0;
end

endmodule