`timescale 1ns/1ns

module Mem(
    input MemWrite,
    input MemRead,
    input [31:0]Adress,
    input [31:0]WriteD,
    output reg[31:0]Rdata

);

reg [31:0] Memoria [0:31];

initial
begin
  $readmemb ("Mem.mem",Memoria);
end

always @* begin
  case (MemRead)
    1'b1:
    begin
      Memoria[Adress] = WriteD;
    end
    default:
    begin
    end
  endcase
  case (MemWrite)
    1'b1:
    begin
      Rdata = Memoria[Adress];
    end
    default:
    begin
    end
  endcase
end
/*if (MemRead == 1) 
    begin
      T[Adress] = WriteD;
      Rdata = 32'bx;
    end
    
    
if (MemWrite == 1) 
  begin
    Rdata = T[Adress]; 
  end

end*/

endmodule

