module origen_153390(
    input CLK,
    input reset,
    input start,
    output reg [6:0] seg,
    output reg [3:0] AN
);

reg [31:0] counter;
reg [7:0] seconds_lower;
reg [7:0] seconds_upper;
reg [7:0] minutes_lower;
reg [7:0] minutes_upper;

localparam state_none = 3'b000;
localparam state_sub_seconds_lower = 3'b001;
localparam state_sub_seconds_upper = 3'b010;
localparam state_sub_minutes_lower = 3'b011;
localparam state_sub_minutes_upper = 3'b100;
localparam state_reset = 3'b101;
localparam state_done = 3'b110;

reg [2:0] current_state;

[MASKED]

always @(*) begin
    case (current_state)
        state_none: begin
            seg = 7'b1111111;
            AN = 4'b1111;
        end
        state_sub_seconds_lower, state_sub_seconds_upper: begin
            seg = (seconds_lower % 10 == 0) ? 7'b0111111 : (7'b1111001);
            AN = 4'b1110;
        end
        state_sub_minutes_lower: begin
            seg = (minutes_lower % 10 == 0) ? 7'b0111111 : (7'b1111001);
            AN = 4'b1101;
        end
        state_sub_minutes_upper: begin
            seg = (minutes_upper % 10 == 0) ? 7'b0111111 : (7'b1111001);
            AN = 4'b1011;
        end
        state_reset, state_done: begin
            seg = 7'b0000000;
            AN = 4'b0000;
        end
    endcase
end

endmodule