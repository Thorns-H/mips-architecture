`timescale 1ns/1ns
//Le faltan entradas (Unidad de control)
module Mem_WB (
    input [31:00] ReadData_in,
    input [31:00] B3Dir_in,
    input [4:0] B3Mux_in,
    input clk,
    output reg [31:00] ReadData_out,
    output reg [31:00] B3Dir_out,
    output reg [4:0] B3Mux_out
);

initial
begin
    ReadData_out = 0;
    B3Dir_out = 0;
    B3Mux_out = 0;
end

always @(posedge clk)
begin
  ReadData_out = (ReadData_in) ? ReadData_in : 32'b0;
  B3Dir_out = (B3Dir_in) ? B3Dir_in : 32'b0;
  B3Mux_out = (B3Mux_in) ? B3Mux_in : 5'b0;
end

endmodule