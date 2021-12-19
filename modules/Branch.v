`timescale 1ns/1ns

module Branch(
    input branch,zeroflag,
    output reg branch_out
);

always @* begin 
    branch_out = branch & zeroflag;
end

endmodule