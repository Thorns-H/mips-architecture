`timescale 1ns/1ns

module UnidadDeControl(
    input [5:0]op,
    output reg MemToReg,
    output reg MemToWrite,
    output reg [2:0]AluOp,
    output reg RegWrite,
    output reg RegDst,
    output reg Branch,
    output reg MemRead,
    output reg AluSrc
);

always @* 
begin
    case(op)
      6'b000000:
      begin
        RegDst = 1;
        Branch = 1;
        MemRead = 0;
        MemToReg = 0;
        AluOp = 3'b001;
        MemToWrite = 0;
        AluSrc = 0;
        RegWrite = 1;
      end
    endcase
end

endmodule
