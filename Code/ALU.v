`timescale 1ns/1ns

module ALU(
    input [31:0]op1,
    input [31:0]op2,
    input [2:0]sel,
    output reg [31:0]rel,
    output reg zeroflag
);

always @*
begin
    case(sel)
    3'b111:
    begin
        rel=op1+op2;  
    end
    3'b110:
    begin
        rel=op1-op2;
    end
    3'b100:
    begin
        rel=op1*op2;
    end
    3'b000:
    begin
        rel=op1/op2;
    end
    3'b011:
    begin
        rel=op1&op2;
    end
    3'b001:
    begin
        rel=op1|op2;
    end
    3'b010:
    begin
        rel=op1<<op2;
    end
    3'b101:
    begin
        rel=op1^op2;
    end
    endcase
if(rel==1)
begin
    zeroflag=0;
end
else begin
    zeroflag=1;
end
end
endmodule