`timescale 1ns/1ns
module tb_BR;

    reg [4:0]RA1;
    reg [4:0]RA2;
    reg [31:0]Di;
    reg [4:0]Dir;
    reg Regw;
    wire [31:0]DR1;
    wire [31:0]DR2;

    BR duv(RA1,RA2,Di,Dir,Regw,DR1,DR2);

    initial begin
        #10;RA1=5'd0;RA2=5'd15;Di=32'd255;Dir=5'd1;Regw=1'b1;
        #10;RA1=5'd1;RA2=5'd16;Di=32'd356;Dir=5'd2;Regw=1'b1;
        #10;RA1=5'd2;RA2=5'd17;Di=32'd646;Dir=5'd3;Regw=1'b1;
        #10;RA1=5'd3;RA2=5'd18;Di=32'd149;Dir=5'd1;Regw=1'b0;
        #10;RA1=5'd4;RA2=5'd19;Di=32'd506;Dir=5'd1;Regw=1'b0;
        #10;RA1=5'd5;RA2=5'd20;Di=32'd105;Dir=5'd1;Regw=1'b0;
        #10;RA1=5'd6;RA2=5'd21;Di=32'd10;Dir=5'd1;Regw=1'b0;
        #10;RA1=5'd7;RA2=5'd22;Di=32'd856;Dir=5'd1;Regw=1'b0;
        #10;RA1=5'd8;RA2=5'd23;Di=32'd256;Dir=5'd1;Regw=1'b0;
        #10;RA1=5'd9;RA2=5'd24;Di=32'd205;Dir=5'd1;Regw=1'b0;
        #10;$stop;
    end

endmodule