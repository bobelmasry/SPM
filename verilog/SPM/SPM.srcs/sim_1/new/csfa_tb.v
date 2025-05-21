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


reg inpA;
reg cin;
reg rst;
wire sum;
wire carr;

tcmp dut(clk, rst, inpA, cin, sum); 

reg [7:0] pattern1 = 8'b0100_1001;
//reg [7:0] pattern2 = 8'b11111111;
reg [7:0] sumTotal = 8'b0000_0000;

integer i;
initial begin
    cin = 1'b0;
    rst = 1'b1;
    #50;
    rst = 1'b0;
    for(i = 0; i < 8; i = i + 1)begin
        inpA = pattern1[i];
        #50;
        sumTotal[i] = sum;
    end
    
    #50
    sumTotal = 8'b0000_0000;
    
    cin = 1'b1;
    rst = 1'b1;
    #50;
    rst = 1'b0;
    for(i = 0; i < 8; i = i + 1)begin
        inpA = pattern1[i];
        //inpB = pattern2[i];
        #50;
        sumTotal[i] = sum;
    end
end



endmodule
