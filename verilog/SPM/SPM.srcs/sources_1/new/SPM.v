`timescale 1ns / 1ps

//module bitwiseAnd(input inp, input [7:0] arr, output [7:0] out);
//assign out = arr & {8{inp}};
//endmodule

module SPM(input clk, input btnc, input rst, input [7:0] multiplier, input [7:0] multiplicand, output [15:0] product);

//wire signMult = multiplier[7];
//wire signMcnd = multiplicand[7];
//wire changeSign = signMult ^ signMcnd;

reg [1:0] multCtrl = 2'b11; wire QminMult, QmaxMult, QrelMult; wire [7:0] rMultContent;
reg [1:0] mcndCtrl = 2'b11; wire QminMcnd, QmaxMcnd, QrelMcnd; wire [7:0] rMcndContent;


//module UniversalReg(clk, rst, ctrl, sinl, sinr, D, Q0, Q7, Q);
UniversalReg rMult(.clk(clk), .rst(rst), .sinl(1'b0), .sinr(1'b0), .ctrl(multCtrl), .D(multiplier), .Q0(QminMult), .Q7(QmaxMult), .Qrel(QrelMult), .Q(rMultContent));
UniversalReg rMcnd(.clk(clk), .rst(rst), .sinl(1'b0), .sinr(1'b0), .ctrl(mcndCtrl), .D(multiplicand), .Q0(QminMcnd), .Q7(QmaxMcnd), .Qrel(QrelMcnd), .Q(rMcndContent));


reg [1:0] initialVal = 2'b11;

//the problem is here

always @ (posedge clk)
begin
    if(initialVal == 2'b00)
    begin
        multCtrl <= 2'b01;
    end
    
    else
    begin
        multCtrl <= 2'b11;
        mcndCtrl <= 2'b11;
        initialVal <= initialVal - 2'b01;
    end
end



wire opShiftRightBit;
chainedCSFAs cfas(clk, QrelMult, rMcndContent, rst, opShiftRightBit); 

wire Q0, Q15;
SixteenBitShiftRightReg sx(.clk(clk), .rst(rst), .ld(btnc), .bitIn(opShiftRightBit), .Q0(Q0), .Q15(Q15), .Q(product));


endmodule