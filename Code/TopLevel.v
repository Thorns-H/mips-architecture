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
    .op(C_InsOut[31:26]),
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
    .RegWrite(C_RegWrite),
    .RA1(C_InsOut[25:21]),
    .RA2(C_InsOut[20:16]),
    .WriteData(C_mux_out),
    .AW(C2_mux_out),
    .DR1(C_i_op1),
    .DR2(C_mux_i_op2)
);
SignExtend SE(
    .extend_in(C_InsOut[15:0]),
    .extend_out(C_extend_out)
);
ShiftLeft SL(
    .shift_in(C_extend_out),
    .shift_out(C_shift_out)
);
AluControl AC(
    .Aop(C_AluOp),
    .Func(C_InsOut[5:0]),
    .AluS(C_AluS)
);
Alu ALU1(
    .i_op1(C_i_op1),
    .i_op2(C_i_op2),
    .Sel(C_AluS),
    .Zflag(C_Zflag),
    .r_out(C_r_out)
);
Mem Mem1(
    .MemWrite(C_MemToWrite),
    .MemRead(C_MemRead),
    .Adress(C_r_out),
    .WriteD(C_mux_i_op2),
    .Rdata(C_Rdata)
);
Sumador4 S1(
    .sum_in1(C_PC_out),
    .suma_out(C_suma_out)
);
Sumador S2(
    .sum_in1(C_suma_out),
    .sum_in2(C_shift_out),
    .suma_out(C2_suma_out)
);
Branch B1(
    .branch(C_Branch),
    .zeroflag(C_Zflag),
    .branch_out(C_branch_out)
);
Mux2_1_32 BRAA(
    .mux_in1(C_mux_i_op2),
    .mux_in2(C_extend_out),
    .mux_s(C_AluSrc),
    .mux_out(C_i_op2)
);
Mux2_1_32 M2(
    .mux_in1(C_suma_out),
    .mux_in2(C2_suma_out),
    .mux_s(C_branch_out),
    .mux_out(C_PC_in)
);
Mux2_1_32 M3(
    .mux_in1(C_r_out),
    .mux_in2(C_Rdata),
    .mux_s(C_MemToReg),
    .mux_out(C_mux_out)
);
Mux2_1_5 M4(
    .mux_in1(C_InsOut[20:16]),
    .mux_in2(C_InsOut[15:11]),
    .mux_s(C_RegDst),
    .mux_out(C2_mux_out)
);

endmodule