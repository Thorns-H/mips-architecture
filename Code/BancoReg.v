`timescale 1ns/1ns

module BancoReg(
    input RegWrite,
    input [4:0]RA1,
    input [4:0]RA2,
    input [31:0]WriteData,
    input [4:0]AW,
    output reg[31:0]DR1,
    output reg[31:0]DR2
);

reg [31:0] Reg [0:31];

initial begin
    $readmemb("BancoRegTxT",Reg);
    #100;
end

always @* begin 

   if (RegWrite == 1) 
    begin
      Reg[AW] <= WriteData; 
    end 
  
  DR1 <= Reg[RA1];
  DR2 <= Reg[RA2];
  

end


endmodule

