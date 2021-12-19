`timescale 1ns/1ns

module MemIns(
    input [31:0]InsDir,
    output reg[31:0]InsOut
);

reg [7:0] MemIns [0:399];

initial begin
    $readmemb("insMemlw.mem",MemIns);
end

always @* begin 
    InsOut={MemIns[InsDir],MemIns[InsDir+1],MemIns[InsDir+2],MemIns[InsDir+3]};
end

endmodule