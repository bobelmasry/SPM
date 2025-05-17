module BinaryToBCDWithSignSeg (
    input  signed [15:0] binary_in,
    output [6:0] sign_seg,   // active-low 7-segment display
    output [3:0] bcd_0,
    output [3:0] bcd_1,
    output [3:0] bcd_2,
    output [3:0] bcd_3,
    output [3:0] bcd_4
);

    reg [15:0] abs_value;
    reg [35:0] shift_reg;
    integer i;
    wire sign;

    assign sign = binary_in[15];  // 1 = negative

    // '-' = g only = 7'b111_1110
    // blank = nothing lit = 7'b111_1111
    assign sign_seg = (sign) ? 7'b111_1110 : 7'b111_1111;

    always @(*) begin
        if (sign)
            abs_value = -binary_in;
        else
            abs_value = binary_in;

        // initialize shift register: 16 bits + 5 BCD digits = 36 bits
        shift_reg = 36'd0;
        shift_reg[15:0] = abs_value;

        // Double Dabble: Binary to BCD
        for (i = 0; i < 16; i = i + 1) begin
            if (shift_reg[19:16] >= 5)
                shift_reg[19:16] = shift_reg[19:16] + 3;
            if (shift_reg[23:20] >= 5)
                shift_reg[23:20] = shift_reg[23:20] + 3;
            if (shift_reg[27:24] >= 5)
                shift_reg[27:24] = shift_reg[27:24] + 3;
            if (shift_reg[31:28] >= 5)
                shift_reg[31:28] = shift_reg[31:28] + 3;
            if (shift_reg[35:32] >= 5)
                shift_reg[35:32] = shift_reg[35:32] + 3;

            shift_reg = shift_reg << 1;
        end
    end

    // get BCD digits
    assign bcd_4 = shift_reg[35:32];
    assign bcd_3 = shift_reg[31:28];
    assign bcd_2 = shift_reg[27:24];
    assign bcd_1 = shift_reg[23:20];
    assign bcd_0 = shift_reg[19:16];

endmodule
