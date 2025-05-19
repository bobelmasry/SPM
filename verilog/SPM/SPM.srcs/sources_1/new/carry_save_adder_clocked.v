`timescale 1ns / 1ps

module carry_save_adder_clocked (
    input  wire clk,
    input  wire rst,    // Active-high reset
    input  wire a,
    input  wire b,
    output reg  sum,
    output reg  carry_out
);

    reg carry_in;  // Internal carry (feedback register)

    wire next_sum;
    wire next_carry;

    // Combinational logic
    assign next_sum   = a ^ b ^ carry_in;
    assign next_carry = (a & b) | (b & carry_in) | (a & carry_in);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            carry_in  <= 0;
            sum       <= 0;
            carry_out <= 0;
        end else begin
            sum       <= next_sum;
            carry_out <= next_carry;
            carry_in  <= next_carry;  // Feedback for next cycle
        end
    end

endmodule
