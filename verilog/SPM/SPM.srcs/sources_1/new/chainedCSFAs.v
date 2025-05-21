//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 05/20/2025 05:24:28 PM
//// Design Name: 
//// Module Name: chainedCSFAs
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////


module chainedCSFAs(
input clk,
input y,
input [7:0]x,
input rst,
output shiftRightBit    
);

wire [7:0] out;
tcmp tcmp7(.clk(clk), .rst(rst), .a(x[7] & y), .s(out[7]));
carrySaveAdder csf6(.clk(clk), .rst(rst), .a(x[6] & y), .b(out[7]), .sum(out[6]));
carrySaveAdder csf5(.clk(clk), .rst(rst), .a(x[5] & y), .b(out[6]), .sum(out[5]));
carrySaveAdder csf4(.clk(clk), .rst(rst), .a(x[4] & y), .b(out[5]), .sum(out[4]));
carrySaveAdder csf3(.clk(clk), .rst(rst), .a(x[3] & y), .b(out[4]), .sum(out[3]));
carrySaveAdder csf2(.clk(clk), .rst(rst), .a(x[2] & y), .b(out[3]), .sum(out[2]));
carrySaveAdder csf1(.clk(clk), .rst(rst), .a(x[1] & y), .b(out[2]), .sum(out[1]));
carrySaveAdder csf0(.clk(clk), .rst(rst), .a(x[0] & y), .b(out[1]), .sum(out[0]));

assign shiftRightBit = out[0];
    

endmodule

//module chainedCSFAs(
//    input clk,
//    input rst,
//    input [7:0] inp,
//    output shiftRightBit,
//    output [7:0] outter
//);

//wire [7:0] sum;
//wire [7:0] carry;

//carrySaveAdder csf1(.clk(clk), .reset(rst), .a(inp[7]), .b(1'b0), .sum(sum[7]));
//carrySaveAdder csf2(.clk(clk), .reset(rst), .a(inp[6]), .b(carry[7]), .sum(sum[6]));
//carrySaveAdder csf3(.clk(clk), .reset(rst), .a(inp[5]), .b(carry[6]), .sum(sum[5]));
//carrySaveAdder csf4(.clk(clk), .reset(rst), .a(inp[4]), .b(carry[5]), .sum(sum[4]));
//carrySaveAdder csf5(.clk(clk), .reset(rst), .a(inp[3]), .b(carry[4]), .sum(sum[3]));
//carrySaveAdder csf6(.clk(clk), .reset(rst), .a(inp[2]), .b(carry[3]), .sum(sum[2]));
//carrySaveAdder csf7(.clk(clk), .reset(rst), .a(inp[1]), .b(carry[2]), .sum(sum[1]));
//carrySaveAdder csf8(.clk(clk), .reset(rst), .a(inp[0]), .b(carry[1]), .sum(sum[0]));

//assign outter = sum;
//assign shiftRightBit = sum[0];

//endmodule
