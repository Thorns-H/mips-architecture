`timescale 1ns/1ns

module Mux2_1_32(
    input [31:0]mux_in1,
    input [31:0]mux_in2,
    input mux_s,
    output reg[31:0]mux_out

);

always @* mux_out = (!mux_s) ? mux_in1 : mux_in2;

endmodule