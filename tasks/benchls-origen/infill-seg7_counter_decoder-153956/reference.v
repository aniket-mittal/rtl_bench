module origen_153956(
    input clk,
    input rst,
    output reg [6:0] out
);

    reg [3:0] pre_state, nx_state;

    // State parameters
    localparam ZERO = 4'd0, ONE = 4'd1, TWO = 4'd2, THREE = 4'd3, FOUR = 4'd4,
              FIVE = 4'd5, SIX = 4'd6, SEVEN = 4'd7, EIGHT = 4'd8, NINE = 4'd9;

    // Seven-segment display patterns for digits 0-9
    reg [6:0] seg0 = 7'b1000000, seg1 = 7'b1111001, seg2 = 7'b0100100,
              seg3 = 7'b0110000, seg4 = 7'b0011001, seg5 = 7'b0010010,
              seg6 = 7'b0000010, seg7 = 7'b1111000, seg8 = 7'b0000000,
              seg9 = 7'b0010000;

    always @(posedge clk) begin
        if (rst) begin
            pre_state <= ZERO;
        end else begin
            pre_state <= nx_state;
        end
    end

    always @(*) begin
        case (pre_state)
            ZERO: nx_state = ONE;
            ONE: nx_state = TWO;
            TWO: nx_state = THREE;
            THREE: nx_state = FOUR;
            FOUR: nx_state = FIVE;
            FIVE: nx_state = SIX;
            SIX: nx_state = SEVEN;
            SEVEN: nx_state = EIGHT;
            EIGHT: nx_state = NINE;
            NINE: nx_state = ZERO;
            default: nx_state = ZERO;
        endcase

        case (pre_state)
            ZERO: out = seg0;
            ONE: out = seg1;
            TWO: out = seg2;
            THREE: out = seg3;
            FOUR: out = seg4;
            FIVE: out = seg5;
            SIX: out = seg6;
            SEVEN: out = seg7;
            EIGHT: out = seg8;
            NINE: out = seg9;
            default: out = seg0;
        endcase
    end

endmodule