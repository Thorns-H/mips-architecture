`timescale 1ns/1ns

module UnidadDeControl(
    input [5:0]op,
    output reg MemToReg,
    output reg jump,
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
      //Instrucción de tipo R
      6'b000000:
      begin
        jump = 0;
        RegDst = 1;
        Branch = 0;
        MemRead = 0;
        MemToReg = 0;
        AluOp = 3'b001;
        MemToWrite = 0;
        AluSrc = 0;
        RegWrite = 1;
      end
      //Addi
      6'b001000:
      begin
        jump = 0;
        RegDst = 0;
        Branch = 0;
        MemRead = 0;
        MemToReg = 0;
        AluOp = 3'b110;
        MemToWrite = 0;
        AluSrc = 1;
        RegWrite = 1;
      end
      //Andi
      6'b001100:
      begin
        jump = 0;
        RegDst = 0;
        Branch = 0;
        MemRead = 0;
        MemToReg = 0;
        AluOp = 3'b011;
        MemToWrite = 0;
        AluSrc = 1;
        RegWrite = 1;
      end
      //Ori
      6'b001101:
      begin
        jump = 0;
        RegDst = 0;
        Branch = 0;
        MemRead = 0;
        MemToReg = 0;
        AluOp = 3'b100;
        MemToWrite = 0;
        AluSrc = 1;
        RegWrite = 1;
      end
      //Slti
      6'b001010:
      begin
        jump = 0;
        RegDst = 0;
        Branch = 0;
        MemRead = 0;
        MemToReg = 0;
        AluOp = 3'b010;
        MemToWrite = 0;
        AluSrc = 1;
        RegWrite = 1;
      end
      //lw
      6'b100011:
      begin
        jump = 0;
        RegDst = 0;
        Branch = 0;
        MemRead = 0;
        MemToReg = 1;
        AluOp = 3'b110;
        MemToWrite = 1;
        AluSrc = 1;
        RegWrite = 1;
      end
      //Sw
      6'b101011:
      begin
        jump = 0;
        //RegDst = 1'bx;
        Branch = 0;
        MemRead = 1;
        //MemToReg = 1'bx;
        AluOp = 3'b110;
        MemToWrite = 0;
        AluSrc = 1;
        RegWrite = 0;
      end
      //Beq
      6'b000100:
      begin
        jump = 0;
        //RegDst = 1'bx;
        Branch = 1;
        MemRead = 0;
        //MemToReg = 1'bx;
        AluOp = 3'b101;
        MemToWrite = 0;
        AluSrc = 0;
        RegWrite = 1;
      end
      //Jump
      6'b000010:
      begin
        jump = 1;
        //RegDst = 0;
        //Branch = 0;
        //MemRead = 0;
        //MemToReg = 0;
        //AluOp = 0;
        //MemToWrite = 0;
        //AluSrc = 0;
        //RegWrite = 0;
      end
    endcase
end

endmodule
