`timescale 1ns/1ps

module tcmp
     (
    input x,
    input clk,
    input reset,
    output reg y
    );

    always @(posedge clk) begin
        if (reset) begin
            y <= 1'b0;
        end else begin
            y <= ~x;
        end
    end

    
endmodule