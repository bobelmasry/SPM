`timescale 1ns / 1ps

//Universal 8-Bit Register
/*
Here is a description of all paramteters:
clk: the clock on which changes occur (at positive edge)
rst: asynchronous reset
ctrl: 00 no change
      01 right shift
      10 left shift
      11 parallel load

sinl: shift input left
sinr: shift input right
D: parallel input
Q0: least significant bit
Q7: most significant  bit
Qrel: the bit that is lost in the shifts
Q: parallel output of register
*/
module UniversalReg(clk, rst, ctrl, sinl, sinr, D, Q0, Q7, Qrel, Q);
    input clk;
    input rst;
    input sinl, sinr; 
    input[1:0] ctrl; 
    input[7:0] D; 
    output Q0, Q7;
    output reg Qrel;
    output[7:0] Q; 
    reg[7:0] Q;

    
    always @(posedge clk, posedge rst) begin
        if (rst) begin
                Q <= 8'b00000000;
            end else begin
                case(ctrl)
                    2'b01: begin Qrel = Q[0]; Q <= {sinr, Q[7:1]}; end
                    2'b10: begin Qrel = Q[7]; Q <= {Q[6:0], sinl}; end 
                    2'b11: Q <= D;
                endcase
            end
    end
    
    assign Q0 = Q[0];
    assign Q7 = Q[7];
endmodule
