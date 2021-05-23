`timescale 1ns/1ns

module TB_BancoReg();

    reg TB_RegWrite;
    reg [4:0]TB_RA1;
    reg [4:0]TB_RA2;
    reg [31:0]TB_Di;
    reg [4:0]TB_AW;
    wire[31:0]TB_DR1;
    wire[31:0]TB_DR2;
/////////////////////

BancoReg A1(
    .RegWrite(TB_RegWrite),
    .RA1(TB_RA1),
    .RA2(TB_RA2),
    .Di(TB_Di),
    .AW(TB_AW),
    .DR1(TB_DR1),
    .DR2(TB_DR2)
    
);

initial begin

    TB_RegWrite = 1'b0;
    TB_RA1 = 5'd1;
    TB_RA2 = 5'd2;
    #100;

    TB_RegWrite = 1'b0;
    TB_RA1 = 5'd3;
    TB_RA2 = 5'd4;
    #100;

    TB_RegWrite = 1'b0;
    TB_RA1 = 5'd5;
    TB_RA2 = 5'd6;
    #100;

    TB_RegWrite = 1'b0;
    TB_RA1 = 5'd7;
    TB_RA2 = 5'd8;
    #100;

    TB_RegWrite = 1'b0;
    TB_RA1 = 5'd9;
    TB_RA2 = 5'd10;
    #100;

    TB_RegWrite = 1'b0;
    TB_RA1 = 5'd11;
    TB_RA2 = 5'd12;
    #100;

    TB_RegWrite = 1'b0;
    TB_RA1 = 5'd13;
    TB_RA2 = 5'd14;
    #100;

    TB_RegWrite = 1'b0;
    TB_RA1 = 5'd15;
    TB_RA2 = 5'd16;
    #100;

    TB_RegWrite = 1'b0;
    TB_RA1 = 5'd17;
    TB_RA2 = 5'd18;
    #100;

    TB_RegWrite = 1'b0;
    TB_RA1 = 5'd19;
    TB_RA2 = 5'd20;
    #100;

    TB_RegWrite = 1'b1;
    TB_AW = 5'd21;
    TB_Di = 32'd25;
    #100;

    TB_RegWrite = 1'b1;
    TB_AW = 5'd22;
    TB_Di = 32'd35;
    #100;

    TB_RegWrite = 1'b1;
    TB_AW = 5'd23;
    TB_Di = 32'd45;
    #100;

    $stop;

end


endmodule
