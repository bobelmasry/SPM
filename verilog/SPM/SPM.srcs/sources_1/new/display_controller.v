module display_controller (
    input clk,
    input reset,
    input btn_left,
    input btn_right,
    input [3:0] bcd_4,
    input [3:0] bcd_3,
    input [3:0] bcd_2,
    input [3:0] bcd_1,
    input [3:0] bcd_0,
    input [6:0] sign_seg, // active-low

    output reg [6:0] seg0, // rightmost
    output reg [6:0] seg1,
    output reg [6:0] seg2,
    output reg [6:0] seg3  // leftmost (sign)
);

    reg [1:0] scroll_index;
    wire [3:0] digits [4:0];

    assign digits[0] = bcd_0;
    assign digits[1] = bcd_1;
    assign digits[2] = bcd_2;
    assign digits[3] = bcd_3;
    assign digits[4] = bcd_4;

    // assume buttons are debounced externally

    // scroll state update
    always @(posedge clk or posedge reset) begin
        if (reset)
            scroll_index <= 0;
        else begin
            if (btn_left && scroll_index < 2)
                scroll_index <= scroll_index + 1;
            else if (btn_right && scroll_index > 0)
                scroll_index <= scroll_index - 1;
        end
    end

    // BCD to 7-segment decoder
    function [6:0] bcd_to_7seg;
        input [3:0] bcd;
        case (bcd)
            4'd0: bcd_to_7seg = 7'b1000000;
            4'd1: bcd_to_7seg = 7'b1111001;
            4'd2: bcd_to_7seg = 7'b0100100;
            4'd3: bcd_to_7seg = 7'b0110000;
            4'd4: bcd_to_7seg = 7'b0011001;
            4'd5: bcd_to_7seg = 7'b0010010;
            4'd6: bcd_to_7seg = 7'b0000010;
            4'd7: bcd_to_7seg = 7'b1111000;
            4'd8: bcd_to_7seg = 7'b0000000;
            4'd9: bcd_to_7seg = 7'b0010000;
            default: bcd_to_7seg = 7'b1111111; // Blank
        endcase
    endfunction

    // update display
    always @(*) begin
        seg3 = sign_seg;

        seg2 = bcd_to_7seg(digits[scroll_index + 2]);
        seg1 = bcd_to_7seg(digits[scroll_index + 1]);
        seg0 = bcd_to_7seg(digits[scroll_index + 0]);
    end

endmodule
