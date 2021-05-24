`timescale 1ns/1ns

module Sumador(
    input [31:0]sum_in1,sum_in2,
    output [31:0]suma_out
);

assign suma_out=sum_in1+sum_in2;

endmodule
