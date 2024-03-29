`timescale 1ns/1ns
module ID_EX (
    //Entrada de la señal de reloj
    input clk,
    //Entradas y salidas de otros modulos
    input [31:00] Read_D1_in,
    input [31:00] Read_D2_in,
    input [31:00] Sign_Extend_in,
    input [31:00] PC_adder_in,
    input [31:00] shift_left_in,
    input [4:0] Ins_2016_in,
    input [4:0] Ins_1511_in,
    //Entradas y salidas de la Unidad de control
    input IDEX_jump_in,
    input IDEX_MemToReg_in,
    input IDEX_MemToWrite_in,
    input [2:0] IDEX_AluOp_in,
    input IDEX_RegWrite_in,
    input IDEX_RegDst_in,
    input IDEX_Branch_in,
    input IDEX_MemRead_in,
    input IDEX_Alusrc_in,
    //Salidas de la Unidad de control que van directo hacia módulos
    output reg IDEX_Alusrc_out,
    output reg [2:0] IDEX_AluOp_out,
    output reg IDEX_RegDst_out,
    //Salidas de la unidad de control que van a los demás búfers
    output reg IDEX_jump_out,
    output reg IDEX_Branch_out,
    output reg IDEX_MemRead_out,
    output reg IDEX_MemToReg_out,
    output reg IDEX_MemToWrite_out,
    output reg IDEX_RegWrite_out,
    //salidas de otros modulos
    output reg [31:00] shift_left_out,
    output reg [31:00] Read_D1_out,
    output reg [31:00] Read_D2_out,
    output reg [31:00] Sign_Extend_out,
    output reg [31:00] PC_adder_out,
    output reg [4:0] Ins_2016_out,
    output reg [4:0] Ins_1511_out
);

initial 
begin
  //Unidad De Control
  IDEX_jump_out = 0;
  IDEX_Alusrc_out = 0;
  IDEX_AluOp_out = 0;
  IDEX_RegDst_out = 0;
  IDEX_Branch_out = 0;
  IDEX_MemRead_out = 0;
  IDEX_MemToReg_out = 0;
  IDEX_MemToWrite_out = 0;
  IDEX_RegWrite_out = 0;
  //Otros Modulos
  shift_left_out = 0;
  Read_D1_out = 0;
  Read_D2_out = 0;
  Sign_Extend_out = 0;
  PC_adder_out = 0;
  Ins_2016_out = 0;
  Ins_1511_out = 0;
end

always @(posedge clk)
begin
  //Unidad de Control
  IDEX_jump_out = IDEX_jump_in;
  IDEX_AluOp_out = IDEX_AluOp_in;
  IDEX_Alusrc_out = IDEX_Alusrc_in;
  IDEX_RegDst_out = IDEX_RegDst_in;
  IDEX_Branch_out = IDEX_Branch_in;
  IDEX_MemRead_out = IDEX_MemRead_in;
  IDEX_MemToReg_out = IDEX_MemToReg_in;
  IDEX_MemToWrite_out = IDEX_MemToWrite_in;
  IDEX_RegWrite_out = IDEX_RegWrite_in;
  //Resto de modulos
  shift_left_out = shift_left_in;
  Read_D1_out = Read_D1_in;
  Read_D2_out = Read_D2_in;
  Sign_Extend_out = Sign_Extend_in;
  PC_adder_out = PC_adder_in;
  Ins_2016_out = Ins_2016_in;
  Ins_1511_out = Ins_1511_in;
end
endmodule