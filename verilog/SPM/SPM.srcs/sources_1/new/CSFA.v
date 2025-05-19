//`timescale 1ns / 1ps


//module csfa(
//   input wire clk,
//   input wire ld,
//   input wire a,
//   input wire b,
//   input wire initialCin,
//   output sum,
//   output carry
//);

//reg initialStart = 1'b0;
//reg carryIn;
//wire carryOut; wire notCarryOut;

//always @ (posedge clk)
//begin
//    if(initialStart == 1'b0) begin carryIn <= initialCin; initialStart <= 1'b1; end
//    else carryIn <= carryOut;
//end

////problem here is with synchronization. You want to get the carryIn from the dflipflop BEFORE calculating the result

//DFF dflipflop(.clk(clk), .ld(ld), .rst(notLd), .D(carry), .Q(carryOut), .Qb(notCarryOut));
//fa fulladder( .ld(ld), .a(a), .b(b), .cin(carryIn), .sum(sum), .carry(carry));

`timescale 1ns / 1ps

module csfa(
    input wire clk,
    input wire rst,
    input wire ld,
    input wire a,
    input wire b,
    input wire initialCin,
    output reg sum,
    output reg carry
);

    
    reg carryIn;
    reg initialStart = 1'b0;
    wire nextCarry;
    wire nextSum;

      // Full adder combinational logic
    assign nextSum = a ^ b ^ carryIn;
    assign nextCarry = (a & b) | (a & carryIn) | (b & carryIn);

    always @(posedge clk) begin
//        if (rst) begin
//            carryIn <= 0;
//            initialStart <= 0;
//            sum <= 0;
//            carry <= 0;
        //end 
        if (ld) begin
            // Use initial carry only on first cycle
            if (initialStart == 0) begin
                carryIn <= initialCin;
                initialStart <= 1;
            end 
            else begin
                carryIn <= carry;
            end

            // Update outputs
            sum <= nextSum;
            carry <= nextCarry;
        end
    end
    
    
endmodule


//endmodule
