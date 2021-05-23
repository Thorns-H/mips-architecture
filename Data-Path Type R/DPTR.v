`timescale 1ns/1ns

module DPTR(
    input [31:0]TRint,
    output TRZflag
        
);

/////////////////////

wire [31:0]c1,c2,c3,c5,c10;
wire c8,c7,c9;
wire [2:0]c6;
wire [3:0]c4;
//////////////////////

BancoReg T1(
    .RA1(TRint[25:21]),
    .RA2(TRint[20:16]),
    .AW(TRint[15:11]),
    .RegWrite(c9),
    .WriteData(c10),
    .DR1(c1),
    .DR2(c2)
      
);

Alu T2(
    .Sel(c4),
    .i_op1(c1),
    .i_op2(c2),
    .Zflag(TRZflag),
    .r_out(c3)
);

Mem T3(
    .Ewr(c7),
    .Adress(c3),
    .WriteD(c2),
    .Rdata(c5)
);

AluControl T4(
    .Func(TRint[5:0]),
    .Aop(c6),
    .AluS(c4)
);

UnidadDeControl T5(
    .op(TRint[31:26]),
    .MemToReg(c8),
    .MemToWrite(c7),
    .AluOp(c6),
    .RegWrite(c9)
);

mux2_1_32 T6(
    .in1(c5),
    .in2(c3),
    .s(c8),
    .out(c10)
);

/////////////////////////////

endmodule



