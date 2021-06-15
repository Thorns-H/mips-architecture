`timescale 1ns/1ns

module TopLevel(
     input clk
);

// Unidad de Control
wire C_MemToReg,C_MemToWrite,C_RegWrite,C_RegDst,C_Branch,C_MemRead,C_AluSrc;
wire [31:0]C_shift_out;
wire[2:0]C_AluOp;
// ALU
wire [31:0]C_i_op1,C_i_op2,C_mux_i_op2,C_r_out,C_Rdata,C_mux_out;
wire [3:0]C_AluS;
wire C_Zflag;
// Ciclo Fetch
wire [31:0]C_PC_in,C_PC_out,C_suma_out,C2_suma_out,C_extend_out;
wire C_branch_out;
// Memoria de Instrucciones
wire [31:0]C_InsOut;
wire [4:0]C2_mux_out;
//cables IF_ID
wire [31:0]C_PC_Adder_out,C_Mem_Inst_out;
//cables IDEX
wire C_IDEX_Alusrc_out,C_IDEX_RegDst_out;
wire C_IDEX_Branch_out,C_IDEX_MemRead_out,C_IDEX_MemToReg_out;
wire C_IDEX_MemToWrite_out,C_IDEX_RegWrite_out;
wire [2:0]C_IDEX_AluOp_out;
wire [4:0]C_Ins_2016_out,C_Ins_1511_out;
wire [31:0]C_Read_D1_out,C_Read_D2_out,C_Sign_Extend_out,C2_PC_adder_out;
//CABLES EXMEM
wire C_ExMem_Branch_out,C_ExMem_MemToWrite_out,C_ExMem_MemRead_out;
wire C_ExMem_Regwrite_out,C_ExMem_MemToReg_out,C_ZF_out;
wire [4:0]C_Mux_out;
wire [31:0]C_B2_out,C_ALU_out,C_Add_out;
//cables Mem_WB
wire C_MemWB_RegWrite_out,C_MemWB_MemToReg_out;
wire [31:0]C_ReadData_out,C_B3Dir_out;
wire [4:0]C_B3Mux_out;
//cable multiplexor final
wire [31:0]C_F_mux_out;


PC PC1(
    .PC_in(C_suma_out),
    .clk(clk),
    .PC_out(C_PC_out)
);
MemIns MI1(
    .InsDir(C_PC_out),
    .InsOut(C_InsOut)
);
UnidadDeControl UDC(
    .op(C_Mem_Inst_out[31:26]),
    .MemToReg(C_MemToReg),
    .MemToWrite(C_MemToWrite),
    .AluOp(C_AluOp),
    .RegWrite(C_RegWrite),
    .RegDst(C_RegDst),
    .Branch(C_Branch),
    .MemRead(C_MemRead),
    .AluSrc(C_AluSrc)
);
BancoReg BR(
    .RegWrite(C_MemWB_RegWrite_out),
    .RA1(C_Mem_Inst_out[25:21]),
    .RA2(C_Mem_Inst_out[20:16]),
    .WriteData(C_F_mux_out),
    .AW(C_B3Mux_out),
    .DR1(C_i_op1),
    .DR2(C_mux_i_op2)
);
SignExtend SE(
    .extend_in(C_Mem_Inst_out[15:0]),
    .extend_out(C_extend_out)
);
ShiftLeft SL(
    .shift_in(C_Sign_Extend_out),
    .shift_out(C_shift_out)
);
AluControl AC(
    .Aop(C_IDEX_AluOp_out),
    .Func(C_Sign_Extend_out[5:0]),
    .AluS(C_AluS)
);
Alu ALU1(
    .i_op1(C_Read_D1_out),
    .i_op2(C_i_op2),
    .Sel(C_AluS),
    .Zflag(C_Zflag),
    .r_out(C_r_out)
);
Mem Mem1(
    .MemWrite(C_ExMem_MemToWrite_out),
    .MemRead(C_ExMem_MemRead_out),
    .Adress(C_ALU_out),
    .WriteD(C_B2_out),
    .Rdata(C_Rdata)
);
Sumador4 S1(
    .sum_in1(C_PC_out),
    .suma_out(C_suma_out)
);
Sumador S2(
    .sum_in1(C2_PC_adder_out),
    .sum_in2(C_shift_out),
    .suma_out(C2_suma_out)
);
Branch B0(
    .branch(C_Branch),
    .zeroflag(C_Zflag),
    .branch_out(C_branch_out)
);
Mux2_1_32 ALU(
    .mux_in0(C_Read_D2_out),
    .mux_in1(C_Sign_Extend_out),
    .mux_s(C_AluSrc),
    .mux_out(C_i_op2)
);
//sumador
Mux2_1_32 M2(
    .mux_in0(C_suma_out),
    .mux_in1(C2_suma_out),
    .mux_s(C_branch_out),
    .mux_out(C_PC_in)
);
//memoria
Mux2_1_32 M3(
    .mux_in0(C_B3Dir_out),
    .mux_in1(C_ReadData_out),
    .mux_s(C_MemWB_MemToReg_out),
    .mux_out(C_F_mux_out)
);
Mux2_1_5 M4(
    .mux_in0(C_Ins_2016_out),
    .mux_in1(C_Ins_1511_out),
    .mux_s(C_RegDst),
    .mux_out(C2_mux_out)
);

IF_ID B1(
    //entadas
    .PC_Adder_in(C_suma_out),
    .Mem_Inst_in(C_InsOut),
    .clk(clk),
    .PC_Adder_out(C_PC_Adder_out),
    .Mem_Inst_out(C_Mem_Inst_out)
);

ID_EX B2(
    .clk(clk),
    .Read_D1_in(C_i_op1),
    .Read_D2_in(C_mux_i_op2),
    .Sign_Extend_in(C_extend_out),
    .PC_adder_in(C_PC_Adder_out),
    .Ins_2016_in(C_Mem_Inst_out[20:16]),
    .Ins_1511_in(C_Mem_Inst_out[15:11]),
    .IDEX_MemToReg_in(C_MemToReg),
    .IDEX_MemToWrite_in(C_MemToWrite),
    .IDEX_AluOp_in(C_AluOp),
    .IDEX_RegWrite_in(C_RegWrite),
    .IDEX_RegDst_in(C_RegDst),
    .IDEX_Branch_in(C_Branch),
    .IDEX_MemRead_in(C_MemRead),
    .IDEX_Alusrc_in(C_AluSrc),
    //
    .IDEX_Alusrc_out(C_IDEX_Alusrc_out),
    .IDEX_AluOp_out(C_IDEX_AluOp_out),
    .IDEX_RegDst_out(C_IDEX_RegDst_out),
    .IDEX_Branch_out(C_IDEX_Branch_out),
    .IDEX_MemRead_out(C_IDEX_MemRead_out),
    .IDEX_MemToReg_out(C_IDEX_MemToReg_out),
    .IDEX_MemToWrite_out(C_IDEX_MemToWrite_out),
    .IDEX_RegWrite_out(C_IDEX_RegWrite_out),
    .Read_D1_out(C_Read_D1_out),
    .Read_D2_out(C_Read_D2_out),
    .Sign_Extend_out(C_Sign_Extend_out),
    .PC_adder_out(C2_PC_adder_out),
    .Ins_2016_out(C_Ins_2016_out),
    .Ins_1511_out(C_Ins_1511_out)
);

Ex_Mem B3(
    .clk(clk),
    .Add_in(C2_suma_out),
    .ALU_in(C_r_out),
    .B2_in(C_Read_D2_out),
    .Mux_in(C2_mux_out),
    .ZF_in(C_Zflag),
    .ExMem_Branch_in(C_IDEX_Branch_out),
    .ExMem_MemToWrite_in(C_IDEX_MemToWrite_out),
    .ExMem_MemRead_in(C_IDEX_MemRead_out),
    .ExMem_Regwrite_in(C_IDEX_RegWrite_out),
    .ExMem_MemToReg_in(C_IDEX_MemToReg_out),
    //
    .ExMem_Branch_out(C_ExMem_Branch_out),
    .ExMem_MemToWrite_out(C_ExMem_MemToWrite_out),
    .ExMem_MemRead_out(C_ExMem_MemRead_out),
    .ExMem_Regwrite_out(C_ExMem_Regwrite_out),
    .ExMem_MemToReg_out(C_ExMem_MemToReg_out),
    .Add_out(C_Add_out),
    .ALU_out(C_ALU_out),
    .B2_out(C_B2_out),
    .Mux_out(C_Mux_out),
    .ZF_out(C_ZF_out)
);

Mem_WB B4(
    .clk(clk),
    .ReadData_in(C_Rdata),
    .B3Dir_in(C_ALU_out),
    .B3Mux_in(C_Mux_out),
    .MemWB_RegWrite_in(C_ExMem_Regwrite_out),
    .MemWB_MemToReg_in(C_ExMem_MemToReg_out),
    //
    .MemWB_RegWrite_out(C_MemWB_RegWrite_out),
    .MemWB_MemToReg_out(C_MemWB_MemToReg_out),
    .ReadData_out(C_ReadData_out),
    .B3Dir_out(C_B3Dir_out),
    .B3Mux_out(C_B3Mux_out)
);

endmodule