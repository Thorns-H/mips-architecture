`timescale 1ns/1ns

module ShiftLeft(
    input [31:0]shift_in,
    output [31:0]shift_out
);

assign shift_out=shift_in<<2;

endmodule