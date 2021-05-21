`timescale 1ns/1ns

module tb_Memory;

    reg [31:0]Din;
    reg Ewr;
    reg [4:0]Dir;
    wire Mout;

    Memory DUV(Din,Ewr,Dir,Mout);

    initial begin
        #100;Din=32'd1050;Ewr=1;Dir=5'b00001;
        #100;Din=32'd1050;Ewr=0;Dir=5'b00001;
        #100;Din=32'd2100;Ewr=1;Dir=5'b01111;
        #100;Din=32'd2100;Ewr=0;Dir=5'b01111;
        #100;Din=32'd3150;Ewr=1;Dir=5'b11111;
        #100;Din=32'd3150;Ewr=0;Dir=5'b11111;
        #100;$stop;
    end

endmodule