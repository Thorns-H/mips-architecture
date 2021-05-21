`timescale 1ns/1ns

module BR(
    input [4:0]RA1,
    input [4:0]RA2,
    input [31:0]Di,
    input [4:0]Dir,
    input Regw,
    output reg[31:0]DR1,
    output reg[31:0]DR2
);

reg [31:0]BR [0:31];

initial begin
    $readmemb("data.mem",BR);   
end

always @*
begin
    DR1=BR[RA1];
    DR2=BR[RA2];
    if(Regw==1)
    begin
    BR[Dir]<=Di;
    end
end
endmodule