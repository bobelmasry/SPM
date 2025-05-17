`timescale 1ns / 1ps


/*
Here is a description of all paramteters:
clk: the clock on which changes occur (at positive edge)
rst: asynchronous reset
ld: enables loading and editing of data, otherwise keeps same data (similar to control in UniversalReg)
bitIn: the input that is to be inserted as we right-shift
Q0: least significant bit
Q15: most significant  bit
Q: parallel output of register
*/
module SixteenBitShiftRightReg(
input clk, input rst, input ld, input bitIn, output Q0, output Q15, output reg [15:0] Q
    );
    
    always @(posedge clk, posedge rst)
    begin
        if(rst == 1'b0 ) begin if(ld == 1'b1) Q <= {bitIn,Q[15:1]}; end
        else Q <= 16'b0000_0000_0000_0000;
    end
    
    assign Q0 = Q[0];
    assign Q15 = Q[15];
endmodule

