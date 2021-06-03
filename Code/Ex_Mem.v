`timescale 1ns/1ns
//Le faltan entradas (Unidad de control)
module Ex_Mem (
    input [31:00] Add_in,
    input [31:00] ALU_in,
    input [31:00] B2_in,
    input [4:0] Mux_in,
    input ZF_in,
    input clk,
    output reg [31:00] Add_out,
    output reg [31:00] ALU_out,
    output reg [31:00] B2_out,
    output reg [4:0] Mux_out,
    output reg ZF_out
);

initial
begin
  Add_out = 0;
  ALU_out = 0;
  B2_out = 0;
  Mux_out = 0;
  ZF_out = 0;
end

always @(posedge clk)
begin
  Add_out = (Add_in) ? Add_in : 32'b00;
  ALU_out = (ALU_in) ? ALU_in : 32'b00;
  B2_out = (B2_out) ? B2_in : 32'b00;
  Mux_out = (Mux_in) ? Mux_in : 5'b00;
  ZF_out = (ZF_in) ? ZF_in : 1'b0;
end

endmodule