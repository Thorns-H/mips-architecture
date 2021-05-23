`timescale 1ns/1ns

module TB_DPTR();

    reg [31:0]TB_TRint;
    wire TB_TRZflag;
/////////////////////

DPTR A1(
    .TRint(TB_TRint),
    .TRZflag(TB_TRZflag)
    
);

initial begin
    //1suma
    TB_TRint[31:26] = 6'b000000;
    TB_TRint[25:21] = 6'b000000;
    TB_TRint[20:16] = 6'b000001;
    TB_TRint[15:11] = 6'b001111;
    TB_TRint[10:6] = 6'b000000;
    TB_TRint[5:0] = 6'b100000;
    #100;
    //2suma
    TB_TRint[31:26] = 6'b000000;
    TB_TRint[25:21] = 6'b000001;
    TB_TRint[20:16] = 6'b000010;
    TB_TRint[15:11] = 6'b010000;
    TB_TRint[10:6] = 6'b000000;
    TB_TRint[5:0] = 6'b100000;
    #100;
    //3resta
    TB_TRint[31:26] = 6'b000000;
    TB_TRint[25:21] = 6'b000001;
    TB_TRint[20:16] = 6'b000011;
    TB_TRint[15:11] = 6'b010001;
    TB_TRint[10:6] = 6'b000000;
    TB_TRint[5:0] = 6'b100010;
    #100;
    //4resta
    TB_TRint[31:26] = 6'b000000;
    TB_TRint[25:21] = 6'b000011;
    TB_TRint[20:16] = 6'b000100;
    TB_TRint[15:11] = 6'b010010;
    TB_TRint[10:6] = 6'b000000;
    TB_TRint[5:0] = 6'b100010;
    #100;
    //5and
    TB_TRint[31:26] = 6'b000000;
    TB_TRint[25:21] = 6'b000100;
    TB_TRint[20:16] = 6'b001000;
    TB_TRint[15:11] = 6'b010011;
    TB_TRint[10:6] = 6'b000000;
    TB_TRint[5:0] = 6'b100100;
    #100;
    //6and
    TB_TRint[31:26] = 6'b000000;
    TB_TRint[25:21] = 6'b001001;
    TB_TRint[20:16] = 6'b000110;
    TB_TRint[15:11] = 6'b010100;
    TB_TRint[10:6] = 6'b000000;
    TB_TRint[5:0] = 6'b100100;
    #100;
    //7slt
    TB_TRint[31:26] = 6'b000000;
    TB_TRint[25:21] = 6'b000010;
    TB_TRint[20:16] = 6'b000100;
    TB_TRint[15:11] = 6'b010101;
    TB_TRint[10:6] = 6'b000000;
    TB_TRint[5:0] = 6'b101010;
    #100;
    //8slt
    TB_TRint[31:26] = 6'b000000;
    TB_TRint[25:21] = 6'b000100;
    TB_TRint[20:16] = 6'b001010;
    TB_TRint[15:11] = 6'b010110;
    TB_TRint[10:6] = 6'b000000;
    TB_TRint[5:0] = 6'b101010;
    #100;
    //9or
    TB_TRint[31:26] = 6'b000000;
    TB_TRint[25:21] = 6'b000110;
    TB_TRint[20:16] = 6'b000111;
    TB_TRint[15:11] = 6'b010111;
    TB_TRint[10:6] = 6'b000000;
    TB_TRint[5:0] = 6'b100101;
    #100;
    //10or
    TB_TRint[31:26] = 6'b000000;
    TB_TRint[25:21] = 6'b001110;
    TB_TRint[20:16] = 6'b000001;
    TB_TRint[15:11] = 6'b011000;
    TB_TRint[10:6] = 6'b000000;
    TB_TRint[5:0] = 6'b100101;
    #100;


    $stop;

end


endmodule

