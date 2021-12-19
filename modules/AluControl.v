`timescale 1ns/1ns

module AluControl(
    input [2:0]Aop,
    input [5:0]Func,
    output reg [3:0]AluS
);

always @* 
begin
    case(Aop)
      3'b001:
      begin
        case (Func)
            6'b100000:
            begin
              AluS = 4'b0010;
            end
            6'b100010:
            begin
              AluS = 4'b0110;
            end
            6'b100100:
            begin
              AluS = 4'b0000;
            end
            6'b101010:
            begin
              AluS = 4'b0111;
            end
            6'b100101:
            begin
              AluS = 4'b0001;
            end
            6'b011000:
            begin
              AluS = 4'b0011;
            end
            6'b000000:
            begin
              AluS = 4'b0000;
            end
        endcase
      end
      //lw, Sw, Addi, beq
      3'b110:
      begin
        AluS = 4'b0010;
      end
      //slti
      3'b010:
      begin
        AluS = 4'b0111;
      end
      //andi
      3'b011:
      begin
        AluS = 4'b0000;
      end
      //ori
      3'b100:
      begin
        AluS = 4'b0001;
      end
      3'b101:
      begin
        AluS = 4'b0110;
      end
      default:
      begin
      end 
    endcase

end

endmodule
