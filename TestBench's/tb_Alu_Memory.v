`timescale 1ns/1ns

module tb_ALU_Memory;

    reg main_Ewr;
    reg [4:0]main_Dir;
    reg [2:0]main_Sel;
    reg [31:0]main_Op1;
    reg [31:0]main_Op2;
    wire [31:0]main_Mout;
    wire main_Zeroflag;

    ALU_Memory DUV(main_Ewr,main_Dir,main_Sel,main_Op1,main_Op2,main_Mout,main_Zeroflag);

    initial begin
        #100;main_Op1=32'd1050;main_Op2=32'd1150;main_Sel=3'b111;main_Dir=5'b00001;main_Ewr=1;
        #100;main_Op1=32'd1050;main_Op2=32'd1150;main_Sel=3'b111;main_Dir=5'b00001;main_Ewr=0;
        #100;main_Op1=32'd1050;main_Op2=32'd1150;main_Sel=3'b110;main_Dir=5'b01111;main_Ewr=1;
        #100;main_Op1=32'd1050;main_Op2=32'd1150;main_Sel=3'b110;main_Dir=5'b01111;main_Ewr=0;
        #100;main_Op1=32'd1050;main_Op2=32'd1150;main_Sel=3'b100;main_Dir=5'b11111;main_Ewr=1;
        #100;main_Op1=32'd1050;main_Op2=32'd1150;main_Sel=3'b100;main_Dir=5'b11111;main_Ewr=0;
        #100;$stop;
    end

endmodule