`timescale 1ns/1ns

module TB_ALU();

reg [15:0]i_op1_tb; 
reg [15:0]i_op2_tb;
reg [1:0]s_tb;
wire r_out_tb;
wire Zflag_tb;

ALUP A1(
    .i_op1(i_op1_tb),
    .i_op2(i_op2_tb),
    .s(s_tb),
    .r_out(r_out_tb),
    .Zflag(Zflag_tb)
    
);


initial begin

    s_tb = 2'b00;
    i_op1_tb = 16'b1010; 
    i_op2_tb = 16'b0111;
    #100;

    s_tb = 2'b01;
    i_op1_tb = 16'b1010; 
    i_op2_tb = 16'b0111;
    #100;

    s_tb = 2'b10;
    i_op1_tb = 16'b1010; 
    i_op2_tb = 16'b0111;
    #100;

    $stop;

end


endmodule
