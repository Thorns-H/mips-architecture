`timescale 1ns/1ns
module tb_ALU;

    reg [31:0]op1;
    reg [31:0]op2;
    reg [2:0]sel;
    wire [31:0]rel;
    wire zeroflag;

    ALU duv(op1,op2,sel,rel,zeroflag);

    initial begin
        #100;op1=32'd10;op2=32'd10;sel=3'b111;
        #100;op1=32'd10;op2=32'd10;sel=3'b110;
        #100;op1=32'd10;op2=32'd10;sel=3'b100;
        #100;op1=32'd10;op2=32'd10;sel=3'b000;
        #100;op1=32'd10;op2=32'd10;sel=3'b011;
        #100;op1=32'd10;op2=32'd10;sel=3'b001;
        #100;op1=32'd10;op2=32'd10;sel=3'b010;
        #100;op1=32'd10;op2=32'd10;sel=3'b101;
        #100;$stop;
    end

endmodule