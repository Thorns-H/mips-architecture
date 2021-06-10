`timescale 1ns/1ns

module TopLevel(
    input clk
);

// Unidad de Control
wire C_MemToReg,C_MemToWrite,C_RegWrite,C_RegDst,C_Branch,C_MemRead,C_AluSrc;
//Cables de salida del bufer ID_EX
wire C_IDEX_AluSrc,C_IDEX_MemToReg,C_IDEX_RegDst,C_IDEX_Branch,C_IDEX_MemRead,C_IDEX_MemToWrite,C_IDEX_RegWrite;
wire [31:0] C_IDEX_SumaOut,C_IDEX_iOp1,C_IDEX_muxiOp2,C_IDEX_extendOut;
wire[2:0]C_AluOp,C_IDEX_AluOp;
wire [4:0] C_IDEX_2016,C_IDEX_1511;
//Cables de salida del bufer EX_Mem
wire C_ExMem_Branch,C_ExMem_MemToWrite,C_ExMem_MemRead,C_ExMem_RegWrite,C_ExMem_MemToReg,C_ExMem_Zflag;
wire [31:00] C_ExMem_rout,C2_ExMem_suma_out,C_ExMem_WriteData,C_MemWB_ALUMux;
wire [4:0] C2_ExMem_muxOut;
//Cables de salida del bufer Mem_WB
wire C_MemWB_Regwrite,C_MemWB_MemToReg;
wire [31:00] C_MemWB_Rdata;
wire [4:0] C_MemWB_Wregister;
//Otros
wire [31:0]C_shift_out;
// ALU
wire [31:0]C_i_op1,C_i_op2,C_mux_i_op2,C_r_out,C_Rdata,C_mux_out;
wire [3:0]C_AluS;
wire C_Zflag;
// Ciclo Fetch
wire [31:0]C_PC_in,C_PC_out,C_suma_out,C_B_suma_out,C2_suma_out,C_extend_out;
wire C_branch_out;
// Memoria de Instrucciones
wire [31:0]C_InsOut,C_B_InsOut;
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
    .op(C_B_InsOut[31:26]),
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
    .RegWrite(C_MemWB_Regwrite),
    .RA1(C_B_InsOut[25:21]),
    .RA2(C_B_InsOut[20:16]),
    .WriteData(C_mux_out),
    .AW(C2_mux_out),
    .DR1(C_i_op1),
    .DR2(C_mux_i_op2)
);
SignExtend SE(
    .extend_in(C_B_InsOut[15:0]),
    .extend_out(C_extend_out)
);
ShiftLeft SL(
    .shift_in(C_IDEX_extendOut),
    .shift_out(C_shift_out)
);
AluControl AC(
    .Aop(C_IDEX_AluOp),
    .Func(C_IDEX_extendOut[5:0]),
    .AluS(C_AluS)
);
Alu ALU1(
    .i_op1(C_IDEX_iOp1),
    .i_op2(C_i_op2),
    .Sel(C_AluS),
    .Zflag(C_Zflag),
    .r_out(C_r_out)
);
//Memoria de datos
MemD Mem1(
    .MemWrite(C_ExMem_MemToWrite),
    .MemRead(C_ExMem_MemRead),
    .Adress(C_ExMem_rout),
    .WriteD(C_ExMem_WriteData),
    .Rdata(C_Rdata)
);
Sumador4 S1(
    .sum_in1(C_PC_out),
    .suma_out(C_suma_out)
);
Sumador S2(
    .sum_in1(C_IDEX_SumaOut),
    .sum_in2(C_shift_out),
    .suma_out(C2_suma_out)
);
Branch B1(
    .branch(C_ExMem_Branch),
    .zeroflag(C_ExMem_Zflag),
    .branch_out(C_branch_out)
);
//Multiplexor a ALU
Mux2_1_32 BRAA(
    .mux_in0(C_IDEX_muxiOp2),
    .mux_in1(C_IDEX_extendOut),
    .mux_s(C_IDEX_AluSrc),
    .mux_out(C_i_op2)
);
//Multiplexor a PC
Mux2_1_32 M2(
    .mux_in0(C_suma_out),
    .mux_in1(C2_ExMem_suma_out),
    .mux_s(C_branch_out),
    .mux_out(C_PC_in)
);
//Multiplexor a Write Data
Mux2_1_32 M3(
    .mux_in0(C_MemWB_ALUMux),
    .mux_in1(C_MemWB_Rdata),
    .mux_s(C_MemWB_MemToReg),
    .mux_out(C_mux_out)
);
//Multiplexor a Write Register
Mux2_1_5 M4(
    .mux_in0 (C_IDEX_2016),
    .mux_in1(C_IDEX_1511),
    .mux_s(C_IDEX_RegDst),
    .mux_out(C_MemWB_Wregister)
);

IF_ID B0 (
    //Señal de reloj
    .clk(clk),
    .PC_Adder_in(C_suma_out),
    .PC_Adder_out(C_B_suma_out),//
    .Mem_Inst_in(C_InsOut),
    .Mem_Inst_out(C_B_InsOut)//
);

ID_EX B2 (
    //Señal de reloj
    .clk(clk),
    //Unidad de control (Entradas)
    .IDEX_MemToReg_in(C_MemToReg),
    .IDEX_MemToWrite_in(C_MemToWrite),
    .IDEX_AluOp_in(C_AluOp),
    .IDEX_RegWrite_in(C_RegWrite),
    .IDEX_RegDst_in(C_RegDst),
    .IDEX_Branch_in(C_Branch),
    .IDEX_MemRead_in(C_MemRead),
    .IDEX_Alusrc_in(C_AluSrc),
    //Unidad de la unidad de control a modulos(Salidas)
    .IDEX_Alusrc_out(C_IDEX_AluSrc),//
    .IDEX_AluOp_out(C_IDEX_AluOp),//
    .IDEX_RegDst_out(C_IDEX_RegDst),//
    //Salidas de la undidad de control a los demás bufers
    .IDEX_Branch_out(C_IDEX_Branch),//
    .IDEX_MemRead_out(C_IDEX_MemRead),//
    .IDEX_MemToReg_out(C_IDEX_MemToReg),//
    .IDEX_MemToWrite_out(C_IDEX_MemToWrite),//
    .IDEX_RegWrite_out(C_IDEX_RegWrite),//
    //Entradas del resto de modulos
    .Read_D1_in(C_i_op1),
    .Read_D2_in(C_mux_i_op2),
    .Sign_Extend_in(C_extend_out),
    .Ins_2016_in(C_B_InsOut [20:16]),
    .Ins_1511_in(C_B_InsOut [15:11]),
    .PC_adder_in(C_B_suma_out),
    //salidas del resto de modulo
    .PC_adder_out(C_IDEX_SumaOut),//
    .Read_D1_out(C_IDEX_iOp1),//
    .Read_D2_out(C_IDEX_muxiOp2),//
    .Sign_Extend_out(C_IDEX_extendOut),//
    .Ins_2016_out(C_IDEX_2016),//
    .Ins_1511_out(C_IDEX_1511)//
);

Ex_Mem B3 (
    //Señal de reloj
    .clk(clk),
    //Entradas de unidad de control
    .ExMem_Branch_in(C_IDEX_Branch),
    .ExMem_MemToWrite_in(C_IDEX_MemToWrite),
    .ExMem_MemRead_in(C_IDEX_MemRead),
    .ExMem_Regwrite_in(C_IDEX_RegWrite),
    .ExMem_MemToReg_in(C_IDEX_MemToReg),
    //Salidas de la unidad de control
    .ExMem_Branch_out(C_ExMem_Branch),//
    .ExMem_MemToWrite_out(C_ExMem_MemToWrite),//
    .ExMem_MemRead_out(C_ExMem_MemRead),//
    //Van al siguiente bufer
    .ExMem_Regwrite_out(C_ExMem_RegWrite),//
    .ExMem_MemToReg_out(C_ExMem_MemToReg),//
    //Entradas de otros modulos
    .Add_in(C2_suma_out),
    .ALU_in(C_r_out),
    .B2_in(C_IDEX_muxiOp2),
    .Mux_in(C2_mux_out),
    .ZF_in(C_Zflag),
    //Salidas de otros modulos
    .Add_out(C2_ExMem_suma_out),//
    .ALU_out(C_ExMem_rout),//
    .B2_out(C_ExMem_WriteData),//
    .Mux_out(C2_ExMem_muxOut), //
    .ZF_out(C_ExMem_Zflag)//
);

Mem_WB B4 (
    //Señal de reloj
    .clk(clk),
    //Entradas de la unidad de control
    .MemWB_RegWrite_in(C_ExMem_RegWrite),
    .MemWB_MemToReg_in(C_ExMem_MemToReg),
    //Salidas de la unidad de control
    .MemWB_RegWrite_out(C_MemWB_Regwrite),//
    .MemWB_MemToReg_out(C_MemWB_MemToReg),//
    //Entradas de otros modulos
    .ReadData_in(C_Rdata),
    .B3Dir_in(C_ExMem_rout),
    .B3Mux_in(C2_ExMem_muxOut),
    //Salidas de otros modulos
    .ReadData_out(C_MemWB_Rdata),//
    .B3Dir_out(C_MemWB_ALUMux),//
    .B3Mux_out(C_MemWB_Wregister)
);

endmodule