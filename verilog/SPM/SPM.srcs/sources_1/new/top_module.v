module SignedMultiplierDisplayTop (
    input clk,
    input reset,
    input [15:0] SW,      // SW[7:0] = multiplier, SW[15:8] = multiplicand
    input BTNC,           // start multiplication
    input BTNL,           // scroll left
    input BTNR,           // scroll right
    output [6:0] SEG,     // 7-segment segments (active low)
    output [3:0] AN       // 7-segment anodes
);

    // Internal registers and wires
    reg [15:0] a, b;
    reg signed [15:0] product;
    reg calc_done;

    wire [3:0] bcd_0, bcd_1, bcd_2, bcd_3, bcd_4;
    wire [6:0] sign_seg;
    wire [6:0] seg0, seg1, seg2, seg3;

    // Edge detector for BTNC
    reg btcn_prev;
    wire btcn_rising = BTNC && ~btcn_prev;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            a <= 0;
            b <= 0;
            product <= 0;
            calc_done <= 0;
            btcn_prev <= 0;
        end else begin
            btcn_prev <= BTNC;

            if (btcn_rising) begin
                a <= SW[7:0];
                b <= SW[15:8];
                product <= $signed(SW[15:8]) * $signed(SW[7:0]);  // signed multiplication
                calc_done <= 1;
            end
        end
    end

    // Binary to BCD with sign segment
    BinaryToBCDWithSignSeg bcd_conv (
        .binary_in(product),
        .sign_seg(sign_seg),
        .bcd_0(bcd_0),
        .bcd_1(bcd_1),
        .bcd_2(bcd_2),
        .bcd_3(bcd_3),
        .bcd_4(bcd_4)
    );

    // Display scrolling controller
    display_controller disp_ctrl (
        .clk(clk),
        .reset(reset),
        .btn_left(BTNL),
        .btn_right(BTNR),
        .bcd_4(bcd_4),
        .bcd_3(bcd_3),
        .bcd_2(bcd_2),
        .bcd_1(bcd_1),
        .bcd_0(bcd_0),
        .sign_seg(sign_seg),
        .seg0(seg0),
        .seg1(seg1),
        .seg2(seg2),
        .seg3(seg3)
    );

    // Refresh logic for multiplexed 7-segment display
    reg [15:0] refresh_counter = 0;
    reg [1:0] digit_select = 0;

    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
        digit_select <= refresh_counter[15:14];
    end

    assign SEG = (digit_select == 2'd0) ? seg0 :
                 (digit_select == 2'd1) ? seg1 :
                 (digit_select == 2'd2) ? seg2 :
                 seg3;

    assign AN = (digit_select == 2'd0) ? 4'b1110 :
                (digit_select == 2'd1) ? 4'b1101 :
                (digit_select == 2'd2) ? 4'b1011 :
                4'b0111;

endmodule
