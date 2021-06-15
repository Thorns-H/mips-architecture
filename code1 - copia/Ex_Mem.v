`timescale 1ns/1ns
/*Las salidas/salidas de la unidad de control que 
se ecuentran aquí vienen todas del bufer "ID_EX" */
module Ex_Mem (
    //entradad de la señal de reloj
    input clk,
    //Entradas de otros modulos
    input [31:00] Add_in,
    input [31:00] ALU_in,
    input [31:00] B2_in,
    input [4:0] Mux_in,
    input ZF_in,
    //Entradas unidad de control
    input ExMem_Branch_in,
    input ExMem_MemToWrite_in,
    input ExMem_MemRead_in,
    input ExMem_Regwrite_in,
    input ExMem_MemToReg_in,
    //Salidas de la unidad de control
    output reg ExMem_Branch_out,
    output reg ExMem_MemToWrite_out,
    output reg ExMem_MemRead_out,
    output reg ExMem_Regwrite_out,
    output reg ExMem_MemToReg_out,
    //Salidas de otros modulos
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
  ExMem_Branch_out = 0;
  ExMem_MemToWrite_out = 0;
  ExMem_MemRead_out = 0;
  ExMem_Regwrite_out = 0;
  ExMem_MemToReg_out = 0;
end

always @(posedge clk)
begin
  Add_out = (Add_in) ? Add_in : 32'b00;
  ALU_out = (ALU_in) ? ALU_in : 32'b00;
  B2_out = (B2_in) ? B2_in : 32'b00;
  Mux_out = (Mux_in) ? Mux_in : 5'b00;
  ZF_out = (ZF_in) ? ZF_in : 1'b0;
  ExMem_MemRead_out = (ExMem_MemRead_in) ? ExMem_MemRead_in : 1'b0;
  ExMem_Branch_out = (ExMem_Branch_in) ? ExMem_Branch_in : 1'b0;
  ExMem_MemToWrite_out = (ExMem_MemToWrite_in) ? ExMem_MemToWrite_in : 1'b0;
  ExMem_Regwrite_out = (ExMem_Regwrite_in) ? ExMem_Regwrite_in : 1'b0;
  ExMem_MemToReg_out = (ExMem_MemToReg_in) ? ExMem_MemToReg_in : 1'b0;
end

endmodule