`timescale 1ns / 1ps

module reg_tb();

reg clk;
initial begin
    clk = 1;
    forever #25 clk = ~clk; 
end

//module EightBitReg(input clk, input [1:0] ctrl, input sinl, input sinr, input [7:0] D, output Q0, output Q7, output reg [7:0] Q);

reg inpLeft, inpRight;
reg rst;
reg [7:0] inpParallel;
reg [1:0] control;
wire Qout0, Qout7;
wire [7:0] Qout;

UniversalReg dut(.clk(clk), .rst(rst), .ctrl(control), .sinl(inpLeft), .sinr(inpRight), .D(inpParallel), .Q0(Qout0), .Q7(Qout7), .Q(Qout));

reg [0:7] pattern1 = 8'b10111100;
reg [0:7] pattern2 = 8'b10101001;

integer i;
integer j;
initial begin
    rst = 1'b0;
    control = 3;
    inpParallel = pattern2;
    #50
    for(i = 0; i <= 3; i = i + 1)begin
        control = i;
        rst = 1'b1;
        
        #50
        rst = 1'b0;
        //the challenge here is to properly time all changes to align with clock cycle, otherwise you will find some "unexpected" results
        //because some bits will change value earlier or later than clock cycle and will thus not function properly...
        for(j = 0; j <= 7; j = j + 1)begin
        inpLeft <= pattern1[j];
        inpRight <= pattern2[7-j];
        inpParallel <= pattern1;
        #50;
        end
    
    end
end

reg inp16;
reg rst2;
wire Q0, Q15;
wire [15:0] out;
reg ld;

reg [0:15] pattern16 = 16'b10100000001011111;

//input clk, input rst, input ld, input bitIn, output Q0, output Q15, output reg [15:0] Q
SixteenBitShiftRightReg dut16(clk, rst2, ld, inp16, Q0, Q15, out);

integer k;
initial begin
rst2 = 1'b0;
ld = 1'b1;
for(k = 0; k <= 15; k = k + 1)
    begin
    inp16 = pattern16[15-k];
    #50;
    end
    
ld = 1'b0;
end

endmodule
