`timescale 1ns/1ns

module BR_ALU_Mem(
    input bamEwr,
    input [4:0]bamDir,
    input [2:0]bamSel,
    input [4:0]bamRA1,
    input [4:0]bamRA2,
    input [31:0]bamDi,
    input [4:0]bamDirr,
    input bamRegWrite,
    output bamZF,
    output [31:0]bamDout
);

wire [31:0]C1;
wire [31:0]C2;
wire [31:0]C3;

BR B1(
    .RA1(bamRA1),
    .RA2(bamRA2),
    .Di(bamDi),
    .Dir(bamDirr),
    .Regw(bamRegWrite),
    .DR1(C1),
    .DR2(C2)
);

ALU A1(
    .op1(C1),
    .op2(C2),
    .sel(bamSel),
    .rel(C3),
    .zeroflag(bamZF)
);

Memory M1(
    .Din(C3),
    .Ewr(bamEwr),
    .Dir(bamDir),
    .Mout(bamDout)
);

endmodule