`timescale 1ns / 1ps

module spm_tb(

    );
    
   //module SPM(input clk, input btnc, input rst, input [7:0] multiplier, input [7:0] multiplicand, output [15:0] product);

    reg clk;
    initial begin
        clk = 1;
        forever #25 clk = ~clk;
    end
    
    wire btnc = 1'b1;
    wire rst = 1'b0;
    wire [7:0] mult = 8'b01110011;
    wire [7:0] mcnd = 8'b01010011;
    wire [15:0] product;
    
    SPM s(clk, btnc, rst, mult, mcnd, product);
    
endmodule
