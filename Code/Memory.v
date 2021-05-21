`timescale 1ns/1ns

module Memory(
    input [31:0]Din,
    input Ewr,
    input [4:0]Dir,
    output reg[31:0]Mout 
);

reg [31:0]M [0:31];

always @*
begin
    if(Ewr==1)
    begin
    M[Dir]<=Din;
    end   
    else
    Mout<=M[Dir];
end

endmodule