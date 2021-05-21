`timescale 1ns/1ns
module tb_BR_ALU_Mem;

    reg bamEwr;
    reg [4:0]bamDir;
    reg [2:0]bamSel;
    reg [4:0]bamRA1;
    reg [4:0]bamRA2;
    reg [31:0]bamDi;
    reg [4:0]bamDirr;
    reg bamRegWrite;
    wire bamZF;
    wire bamDout;

    BR_ALU_Mem duv(bamEwr,bamDir,bamSel,bamRA1,bamRA2,bamDi,bamDirr,bamRegWrite,bamZF,bamDout);

    initial begin
        // Operaciones Aritmeticas 
        // Suma
        #10;bamEwr=1'b1;bamDir=5'd4;bamSel=3'b111;bamRA1=5'd1;bamRA2=5'd32;bamDi=32'd150;bamDirr=5'd2;bamRegWrite=1'b1;
        #10;bamEwr=1'b1;bamDir=5'd5;bamSel=3'b111;bamRA1=5'd2;bamRA2=5'd31;bamDi=32'd250;bamDirr=5'd2;bamRegWrite=1'b0;
        #10;bamEwr=1'b1;bamDir=5'd6;bamSel=3'b111;bamRA1=5'd3;bamRA2=5'd30;bamDi=32'd350;bamDirr=5'd3;bamRegWrite=1'b1;
        #10;bamEwr=1'b1;bamDir=5'd7;bamSel=3'b111;bamRA1=5'd4;bamRA2=5'd29;bamDi=32'd450;bamDirr=5'd2;bamRegWrite=1'b0;
        // Resta
        #10;bamEwr=1'b1;bamDir=5'd8;bamSel=3'b110;bamRA1=5'd5;bamRA2=5'd28;bamDi=32'd550;bamDirr=5'd4;bamRegWrite=1'b1;
        #10;bamEwr=1'b1;bamDir=5'd9;bamSel=3'b110;bamRA1=5'd6;bamRA2=5'd27;bamDi=32'd650;bamDirr=5'd2;bamRegWrite=1'b0;
        #10;bamEwr=1'b1;bamDir=5'd10;bamSel=3'b110;bamRA1=5'd7;bamRA2=5'd26;bamDi=32'd750;bamDirr=5'd5;bamRegWrite=1'b1;
        #10;bamEwr=1'b1;bamDir=5'd11;bamSel=3'b110;bamRA1=5'd8;bamRA2=5'd25;bamDi=32'd850;bamDirr=5'd2;bamRegWrite=1'b0;
        // Multiplicación
        #10;bamEwr=1'b1;bamDir=5'd12;bamSel=3'b100;bamRA1=5'd9;bamRA2=5'd24;bamDi=32'd950;bamDirr=5'd6;bamRegWrite=1'b1;
        #10;bamEwr=1'b1;bamDir=5'd13;bamSel=3'b100;bamRA1=5'd10;bamRA2=5'd23;bamDi=32'd1050;bamDirr=5'd2;bamRegWrite=1'b0;
        #10;bamEwr=1'b1;bamDir=5'd14;bamSel=3'b100;bamRA1=5'd11;bamRA2=5'd22;bamDi=32'd1150;bamDirr=5'd7;bamRegWrite=1'b1;
        #10;bamEwr=1'b1;bamDir=5'd15;bamSel=3'b100;bamRA1=5'd12;bamRA2=5'd21;bamDi=32'd1250;bamDirr=5'd2;bamRegWrite=1'b0;
        // División
        #10;bamEwr=1'b1;bamDir=5'd16;bamSel=3'b000;bamRA1=5'd13;bamRA2=5'd20;bamDi=32'd1350;bamDirr=5'd8;bamRegWrite=1'b1;
        #10;bamEwr=1'b1;bamDir=5'd17;bamSel=3'b000;bamRA1=5'd14;bamRA2=5'd19;bamDi=32'd1450;bamDirr=5'd2;bamRegWrite=1'b0;
        #10;bamEwr=1'b1;bamDir=5'd18;bamSel=3'b000;bamRA1=5'd15;bamRA2=5'd18;bamDi=32'd1550;bamDirr=5'd9;bamRegWrite=1'b1;
        // Operaciones Lógicas
        #10;bamEwr=1'b1;bamDir=5'd0;bamSel=3'b011;bamRA1=5'd9;bamRA2=5'd24;bamDi=32'd950;bamDirr=5'd6;bamRegWrite=1'b0;
        #10;bamEwr=1'b1;bamDir=5'd1;bamSel=3'b011;bamRA1=5'd10;bamRA2=5'd23;bamDi=32'd1050;bamDirr=5'd2;bamRegWrite=1'b0;
        #10;bamEwr=1'b1;bamDir=5'd2;bamSel=3'b011;bamRA1=5'd11;bamRA2=5'd22;bamDi=32'd1150;bamDirr=5'd7;bamRegWrite=1'b0;
        #10;bamEwr=1'b1;bamDir=5'd3;bamSel=3'b001;bamRA1=5'd12;bamRA2=5'd21;bamDi=32'd1250;bamDirr=5'd2;bamRegWrite=1'b0;
        #10;bamEwr=1'b1;bamDir=5'd25;bamSel=3'b001;bamRA1=5'd13;bamRA2=5'd20;bamDi=32'd950;bamDirr=5'd6;bamRegWrite=1'b0;
        #10;bamEwr=1'b1;bamDir=5'd26;bamSel=3'b001;bamRA1=5'd14;bamRA2=5'd19;bamDi=32'd1050;bamDirr=5'd2;bamRegWrite=1'b0;
        #10;bamEwr=1'b1;bamDir=5'd27;bamSel=3'b010;bamRA1=5'd15;bamRA2=5'd18;bamDi=32'd1150;bamDirr=5'd7;bamRegWrite=1'b0;
        #10;bamEwr=1'b1;bamDir=5'd28;bamSel=3'b010;bamRA1=5'd16;bamRA2=5'd17;bamDi=32'd1250;bamDirr=5'd2;bamRegWrite=1'b0;
        #10;bamEwr=1'b1;bamDir=5'd29;bamSel=3'b101;bamRA1=5'd17;bamRA2=5'd16;bamDi=32'd1150;bamDirr=5'd7;bamRegWrite=1'b0;
        #10;bamEwr=1'b1;bamDir=5'd30;bamSel=3'b101;bamRA1=5'd18;bamRA2=5'd15;bamDi=32'd1250;bamDirr=5'd2;bamRegWrite=1'b0;
        #10;$stop;
    end
endmodule