`timescale 1ns/1ns
/*Las salidas/salidas de la unidad de control que 
se ecuentran aquí vienen todas del bufer "Ex_Mem" */
module Mem_WB (
  //Entrada de la señal de reloj
  input clk,
  //Entradas de otros modulos
  input [31:00] ReadData_in,
  input [31:00] B3Dir_in,
  input [4:0] B3Mux_in,
  //Entradas de la Unidad de control
  input MemWB_RegWrite_in,
  input MemWB_MemToReg_in,
  //salidas de la unidad de control
  output reg MemWB_RegWrite_out,
  output reg MemWB_MemToReg_out,
  //Salidas de otros modulos
  output reg [31:00] ReadData_out,
  output reg [31:00] B3Dir_out,
  output reg [4:0] B3Mux_out
);

initial
begin
    ReadData_out = 0;
    B3Dir_out = 0;
    B3Mux_out = 0;
    MemWB_MemToReg_out = 0;
    MemWB_RegWrite_out = 0;
end

always @(posedge clk)
begin
  ReadData_out = (ReadData_in) ? ReadData_in : 32'b0;
  B3Dir_out = (B3Dir_in) ? B3Dir_in : 32'b0;
  B3Mux_out = (B3Mux_in) ? B3Mux_in : 5'b0;
  MemWB_RegWrite_out = (MemWB_RegWrite_in) ? MemWB_RegWrite_in : 1'b0; 
  MemWB_MemToReg_out = (MemWB_MemToReg_in) ? MemWB_MemToReg_in : 1'b0;
end

endmodule