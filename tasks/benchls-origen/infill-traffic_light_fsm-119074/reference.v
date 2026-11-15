module origen_119074 (
    input wire clk,
    input wire reset_n,
    input wire ew_sensor,
    input wire emgcy_sensor,
    output reg [2:0] ns_light,
    output reg [2:0] ew_light
);

    localparam [2:0] OFF = 3'b000,
                     RED = 3'b001,
                     YELLOW = 3'b010,
                     GREEN = 3'b100,
                     PRE_GREEN = 3'b110;

    reg [2:0] ns_state, ns_next_state;
    reg [2:0] ew_state, ew_next_state;
    
    reg [3:0] ns_green_timer, ew_green_timer;
    parameter MAX_GREEN_TIME = 4'd11;

    // Timer logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            ns_green_timer <= 4'd0;
            ew_green_timer <= 4'd0;
        end else begin
            if (ns_state == GREEN)
                ns_green_timer <= (ns_green_timer == MAX_GREEN_TIME) ? 4'd0 : ns_green_timer + 1;
            else
                ns_green_timer <= 4'd0;

            if (ew_state == GREEN)
                ew_green_timer <= (ew_green_timer == MAX_GREEN_TIME) ? 4'd0 : ew_green_timer + 1;
            else
                ew_green_timer <= 4'd0;
        end
    end

    // State transition logic
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            ns_state <= RED;
            ew_state <= RED;
        end else begin
            ns_state <= ns_next_state;
            ew_state <= ew_next_state;
        end
    end

    // Next state logic
    always @(*) begin
        // NS direction
        case (ns_state)
            RED: ns_next_state = (ew_state == RED && ns_green_timer == MAX_GREEN_TIME) ? GREEN : RED;
            GREEN: ns_next_state = (emgcy_sensor || (ew_sensor && ns_green_timer == MAX_GREEN_TIME)) ? YELLOW : GREEN;
            YELLOW: ns_next_state = RED;
            default: ns_next_state = RED;
        endcase

        // EW direction
        case (ew_state)
            RED: ew_next_state = (ew_sensor && ns_green_timer == MAX_GREEN_TIME) ? PRE_GREEN : RED;
            PRE_GREEN: ew_next_state = GREEN;
            GREEN: ew_next_state = (emgcy_sensor || ew_green_timer == MAX_GREEN_TIME) ? YELLOW : GREEN;
            YELLOW: ew_next_state = RED;
            default: ew_next_state = RED;
        endcase
    end

    // Output logic
    always @(*) begin
        ns_light = ns_state;
        ew_light = ew_state;
    end

endmodule

