`timescale 1ns/1ns

module ALU_Memory(
    input main_Ewr,
    input [4:0]main_Dir,
    input [2:0]main_Sel,
    input [31:0]main_Op1,
    input [31:0]main_Op2,
    output [31:0]main_Mout,
    output main_Zeroflag
);

wire [31:0]C1;

ALU A1(
    .op1(main_Op1),
    .op2(main_Op2),
    .sel(main_Sel),
    .rel(C1),
    .zeroflag(main_Zeroflag)
);

Memory M1(
    .Din(C1),
    .Dir(main_Dir),
    .Ewr(main_Ewr),
    .Mout(main_Mout)
);

endmodule