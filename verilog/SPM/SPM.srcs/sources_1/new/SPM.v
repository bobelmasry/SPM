`timescale 1ns / 1ps

module bitwiseAnd(input inp, input [7:0] arr, output reg [7:0] out);
assign out = arr & {8{inp}};
endmodule

module SPM(input clk, input btnc, input rst, input [7:0] multiplier, input [7:0] multiplicand, output [15:0] product);

wire signMult = multiplier[7];
wire signMcnd = multiplicand[7];
wire changeSign = signMult ^ signMcnd;

wire multCtrl; wire QminMult, QmaxMult, QrelMult; wire [7:0] rMultContent;
wire mcndCtrl; wire QminMcnd, QmaxMcnd, QrelMcnd; wire [7:0] rMcndContent;

//module UniversalReg(clk, rst, ctrl, sinl, sinr, D, Q0, Q7, Q);
UniversalReg rMult(.clk(clk), .rst(rst), .ctrl(multCtrl), .sinl(1'b0), .sinr(1'b0), .D(multiplier), .Q0(QminMult), .Q7(QmaxMult), .Qrel(QrelMult), .Q(rMultContent));
UniversalReg rMcnd(.clk(clk), .rst(rst), .ctrl(mcndCtrl), .sinl(1'b0), .sinr(1'b0), .D(multiplicand), .Q0(QminMcnd), .Q7(QmaxMcnd), .Qrel(QrelMcnd), .Q(rMcndContent));

//module CarrySaveFullAdder (
//    input  wire clk,
//    input  wire ld,
//    input  wire a,
//    input  wire b,
//    input  wire cin,
//    output reg sum,
//    output reg carry
//);

//DFF csfa1Dff(.clk(clk), .rst(rst), .ld(btnc), .D();
//CarrySaveFullAdder csfa1(.clk(clk), .ld(btnc), .a(changeSign), .b(QrelMult), .cin(djda), .sum(

always @(posedge clk)
begin



end

endmodule