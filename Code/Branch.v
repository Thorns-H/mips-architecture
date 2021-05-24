`timescale 1ns/1ns

module Branch(
    input branch,zeroflag,
    output branch_out
);

assign branch_out = branch & zeroflag;

endmodule