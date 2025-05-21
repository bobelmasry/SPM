`timescale 1ns / 1ps


module csfa(
   input wire clk,
   input wire rst,
   input wire ld,
   input wire a,
   input wire b,
   input wire initialCin,
   output sum,
   output carry
);

wire sc;
wire hsum1; wire car1;
fa half_adder(.ld(ld), .a(b), .b(sc), .cin(0), .sum(hsum1), .carry(car1));


wire inpDff1 = a | adderSum;
wire car2 = a & adderSum;
DFF dff1(.clk(clk), .rst(rst), .ld(ld), .D(inpDff1), .Q(sum));

wire inpDff2 = car1 | car2;
wire carry = car2 & car1; //im not sure of this

DFF dff2(.clk(clk), .rst(rst), .ld(ld), .D(inpDff2), .Q(sc));


//reg initialStart = 1'b0;
//reg carryIn;
//wire carryOut; wire notCarryOut;

//always @ (posedge clk)
//begin
//    if(initialStart == 1'b0) begin carryIn <= initialCin; initialStart <= 1'b1; end
//    else carryIn <= carryOut;
//end

////problem here is with synchronization. You want to get the carryIn from the dflipflop BEFORE calculating the result

//DFF dflipflop(.clk(clk), .rst(notLd), .ld(ld), .D(carry), .Q(carryOut), .Qb(notCarryOut));
//fa fulladder( .clk(clk), .ld(ld), .a(a), .b(b), .cin(carryIn), .sum(sum), .carry(carry));

//`timescale 1ns / 1ps

//module csfa(
//    input wire clk,
//    input wire rst,
//    input wire ld,
//    input wire a,
//    input wire b,
//    input wire initialCin,
//    output reg sum,
//    output reg carry
//);

    
//    reg carryIn = 1'b0;
//    reg initialStart = 1'b0;
//    wire nextCarry;
//    wire nextSum;

//      // Full adder combinational logic
//    assign nextSum = a ^ b ^ carryIn;
//    assign nextCarry = (a & b) | (a & carryIn) | (b & carryIn);

//    always @(posedge clk) begin
////        if (rst) begin
////            carryIn <= 0;
////            initialStart <= 0;
////            sum <= 0;
////            carry <= 0;
//        //end 
//        if (ld) begin
//            // Use initial carry only on first cycle
//            if (initialStart == 0) begin
//                carryIn <= initialCin;
//                initialStart <= 1;
//            end 
//            else begin
//                carryIn <= carry;
//            end

//            // Update outputs
//            sum <= nextSum;
//            carry <= nextCarry;
//        end
//    end
    
    
//endmodule


endmodule
