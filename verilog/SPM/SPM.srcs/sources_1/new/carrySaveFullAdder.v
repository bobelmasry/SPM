//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 05/20/2025 07:20:46 PM
//// Design Name: 
//// Module Name: carrySaveFullAdder
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


//module carrySaveFullAdder(
//input clk,
//    input rst,
//    input a,
//    input b, 
//    output reg sum
//    );
    
//    reg carry = 1'b0;
//    reg carryIn;
    
//    always @ (posedge clk)
//    begin
//        if(rst == 1'b1)begin
//            carryIn <= 1'b0;
//            sum <= 0; 
//            carry <= 0;
//        end
//        else
//            begin
////            if(b == 1'b0)
////            begin
////                sum <= a ^ carryIn;
////                carry <= a & carryIn;
////            end
        
////            else
////            begin
//                sum <= (a) ^ b ^ carryIn;
//                carry <= (a)&carryIn | a&b | b&carryIn;
//                carryIn <= carry;
        
//            //end
//        end
//    end
    
    
//endmodule

//module carrySaveFullAdder(
//    input clk,
//    input rst,
//    input a,
//    input b,
//    input carryIn,
//    output reg sum,
//    output reg carryOut
//);

//    always @(posedge clk) begin
//        if (rst) begin
//            sum <= 1'b0;
//            carryOut <= 1'b0;
//        end else begin
//            sum <= a ^ b ^ carryIn;
//            carryOut <= (a & b) | (a & carryIn) | (b & carryIn);
//        end
//    end

//endmodule

module halfAdder(
    input x, y, output sum, carry
    );
    assign sum = x ^ y;
    assign carry = x & y;
endmodule


module carrySaveAdder(
    input clk, rst, a, b,
    output sum
    );
    wire SC, CAR1, CAR2, HSUM1;
    
    DFF SCflipflop(clk, rst, CAR1 ^ CAR2, SC);
    halfAdder HA1(b, SC, HSUM1, CAR1);
    DFF SUMflipflop(clk, rst, a ^ HSUM1, sum);
    
    assign CAR2 = a & HSUM1;

endmodule