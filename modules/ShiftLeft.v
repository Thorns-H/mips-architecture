`timescale 1ns/1ns

module ShiftLeft(
    input [31:0]shift1_in,
    output [31:0]shift1_out
);

assign shift1_out = shift1_in<<2;

endmodule