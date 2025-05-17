`timescale 1ns / 1ps

module DFF(
input clk,
input rst,
input ld,
input D,
output reg Q,
output Qb
    );
    
    always @(posedge clk, posedge rst)begin
    if(rst == 1'b0)begin
        if(ld == 1'b1)
            Q <= D;
    end
    else
        Q <= 1'b0;
    end

assign Qb = ~Q;

endmodule
