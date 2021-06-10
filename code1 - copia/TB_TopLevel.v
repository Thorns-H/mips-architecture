`timescale 1ns/1ns
module TB_TopLevel;
    
    reg clk;     
      
    TopLevel duv(clk);     
    always #100 clk = ~clk;      
    initial begin
        #50;  
        clk <= 1;         
        #1600 $stop;
    end

endmodule