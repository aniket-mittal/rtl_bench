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

always @(posedge CLK) begin
    if (reset) begin
        current_state <= state_reset;
        seconds_lower <= 8'd59;
        seconds_upper <= 8'd59;
        minutes_lower <= 8'd59;
        minutes_upper <= 8'd0;
        counter <= 32'd0;
    end
    else begin
        case (current_state)
            state_none: begin
                if (counter == 32'd100_000) begin
                    current_state <= state_sub_seconds_lower;
                    counter <= 32'd0;
                end
                else begin
                    counter <= counter + 32'd1;
                end
            end
            state_sub_seconds_lower: begin
                if (seconds_lower == 8'd0) begin
                    seconds_lower <= 8'd59;
                    current_state <= state_sub_seconds_upper;
                end
                else begin
                    seconds_lower <= seconds_lower - 8'd1;
                end
            end
            state_sub_seconds_upper: begin
                if (seconds_upper == 8'd0) begin
                    seconds_upper <= 8'd59;
                    current_state <= state_sub_minutes_lower;
                end
                else begin
                    seconds_upper <= seconds_upper - 8'd1;
                end
            end
            state_sub_minutes_lower: begin
                if (minutes_lower == 8'd0) begin
                    minutes_lower <= 8'd59;
                    current_state <= state_sub_minutes_upper;
                end
                else begin
                    minutes_lower <= minutes_lower - 8'd1;
                end
            end
            state_sub_minutes_upper: begin
                if (minutes_upper == 8'd0) begin
                    current_state <= state_done;
                end
                else begin
                    minutes_upper <= minutes_upper - 8'd1;
                end
            end
            state_reset: begin
                if (start) begin
                    current_state <= state_none;
                end
            end
            state_done: begin
                if (reset) begin
                    current_state <= state_reset;
                end
            end
        endcase
    end
end

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