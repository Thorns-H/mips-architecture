`timescale 1ns/1ns

module Concatenacion(
    input [27:0]A1,
    input [31:0]A2,
    output [31:0]nadd
);

assign nadd = {A2[31:28],A1[27:0]};

endmodule

