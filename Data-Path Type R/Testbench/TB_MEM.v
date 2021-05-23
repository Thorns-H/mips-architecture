`timescale 1ns/1ns

module TB_MEM();

reg [31:0]Din_tb; 
reg Ewr_tb;
reg [4:0]Dir_tb;
wire [31:0]Dout_tb;

/////////////////////

MEM A1(
    .Din(Din_tb),
    .Ewr(Ewr_tb),
    .Dir(Dir_tb),
    .Dout(Dout_tb)
    
);

initial begin

    Dir_tb = 5'b00010;
    Din_tb = 32'd11;
    Ewr_tb = 1'd1;
    #100;

    Dir_tb = 5'b00001;
    Din_tb = 32'd13;
    Ewr_tb = 1'd1;
    #100;

    Dir_tb = 5'b00011;
    Din_tb = 32'd12;
    Ewr_tb = 1'd1;
    #100;

    Dir_tb = 5'b00110;
    Din_tb = 32'd120;
    Ewr_tb = 1'd1;
    #100;

    Dir_tb = 5'b00111;
    Din_tb = 32'd56;
    Ewr_tb = 1'd1;
    #100;


    $stop;

end


endmodule
