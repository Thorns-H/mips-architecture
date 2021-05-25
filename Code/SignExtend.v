`timescale 1ns/1ns

module SignExtend(
    input [15:0]extend_in,
    output reg[31:0]extend_out
);

always @*
begin
    extend_out[31:0]<=$signed(extend_in);
end

endmodule

