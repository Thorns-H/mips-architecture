`timescale 1ns/1ns
//Faltan más entradas (Unidad de Control)
module ID_EX (
    input [31:00] B_in,
    input [31:00] Rd1_in,
    input [31:00] Rd2_in,
    input [31:00] SE_in,
    input [31:00] Offset_in,
    input [4:0] Reg_in,
    //Tipo R: Registro Fuente 2. Tipo I: Registro Destino
    input [4:0] Regd_in,
    //Tipo R: Registro destino.
    input clk,
    output reg [31:00] B_out,
    output reg [31:00] Rd1_out,
    output reg [31:00] Rd2_out,
    output reg [31:00] SE_out,
    output reg [31:00] Offset_out,
    output reg [4:0] Reg_out,
    //Tipo R: Registro Fuente 2. Tipo I: Registro Destino
    output reg [4:0] Regd_out
    //Registro destino
);

initial 
begin
  B_out = 0;
  Rd1_out = 0;
  Rd2_out = 0;
  SE_out = 0;
  Offset_out = 0;
  Reg_out = 0;
  Regd_out = 0;
end

always @(posedge clk)
begin
  B_out = (B_in) ? B_in : 32'b0;
  Rd1_out = (Rd1_in) ? Rd1_in : 32'b0;
  Rd2_out = (Rd2_in) ? Rd2_in : 32'b0;
  SE_out = (SE_in) ? SE_in : 32'b0;
  Offset_out = (Offset_in) ? Offset_in :32'b0;
  Reg_out = (Reg_in) ? Reg_in : 5'b0;
  Regd_out = (Regd_in) ? Regd_in : 5'b0;
end

endmodule