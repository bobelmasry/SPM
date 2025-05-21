`timescale 1ns / 1ps

module fa(
    input  wire ld,
    input  wire a,
    input  wire b,
    input  wire cin,
    output reg sum,
    output reg carry
);


   assign sum = a^b^cin;
   assign carry = (a&b) | (a&cin) | (b&cin);
        

endmodule
