module CarrySaveFullAdder (
    input  wire clk,
    input  wire ld,
    input  wire a,
    input  wire b,
    input  wire cin,
    output reg sum,
    output reg carry
);

    always @(posedge clk) begin
        if(ld == 1'b1) begin
        sum = a^b^cin;
        carry = (a&b) | (a&cin) | (b&cin);
        end     
    end

endmodule
