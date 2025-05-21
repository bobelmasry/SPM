`timescale 1ns/1ps


module tcmp(
    input clk, rst, a, output s
    );
    wire Z;
    DFF f1(clk, rst, a ^ Z, s);
    DFF f2(clk, rst, a | Z, Z);
endmodule


