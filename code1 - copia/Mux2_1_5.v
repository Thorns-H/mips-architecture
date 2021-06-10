`timescale 1ns/1ns

module Mux2_1_5(
    input [4:0]mux_in0,
    input [4:0]mux_in1,
    input mux_s,
    output reg[4:0]mux_out

);

always @* mux_out = (!mux_s) ? mux_in0 : mux_in1;

endmodule