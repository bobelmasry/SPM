`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2025 05:54:19 PM
// Design Name: 
// Module Name: csfa_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module csfa_tb(

    );
    
    reg clk;
initial begin
    clk = 1;
    forever #25 clk = ~clk; 
end

//module EightBitReg(input clk, input [1:0] ctrl, input sinl, input sinr, input [7:0] D, output Q0, output Q7, output reg [7:0] Q);

reg inpA, inpB;
wire ld = 1'b1;
wire cin = 1'b0;
wire sum;
//wire [7:0] totalSum;
wire carr;

csfa carry_save_full_adder(clk, 1'b0, ld, inpA, inpB, cin, sum, carr); 

reg [7:0] pattern1 = 8'b10111100;
reg [7:0] pattern2 = 8'b11111111;
reg [7:0] sumTotal = 8'b0000_0000;
integer i;
initial begin
    
    for(i = 0; i < 8; i = i + 1)begin
        #50
        inpA = pattern1[i];
        inpB = pattern2[i];
        sumTotal[i] = sum;
    end
    
end



endmodule
