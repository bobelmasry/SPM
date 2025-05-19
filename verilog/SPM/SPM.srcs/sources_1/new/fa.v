`timescale 1ns / 1ps

module fa(
    //input  wire clk,
    input  wire ld,
    input  wire a,
    input  wire b,
    input  wire cin,
    output sum,
    output carry
);


   assign sum = a^b^cin;
   assign carry = (a&b) | (a&cin) | (b&cin);
        
//    always @(posedge clk) begin
//        if(ld == 1'b1) begin
//        sum = a^b^cin;
//        carry = (a&b) | (a&cin) | (b&cin);
//        end     
//    end

endmodule
