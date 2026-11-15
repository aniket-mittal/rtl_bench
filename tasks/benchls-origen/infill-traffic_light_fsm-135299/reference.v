module origen_135299 (
    input wire clk,
    input wire reset,
    input wire button_a,
    input wire button_b,
    output reg [1:0] light_a,
    output reg [1:0] light_b
);

    // State encoding
    localparam [2:0] 
        S_BOTH_RED = 3'b000,
        S_A_GREEN = 3'b001,
        S_A_YELLOW = 3'b010,
        S_B_GREEN = 3'b011,
        S_B_YELLOW = 3'b100;

    // Light color encoding
    localparam [1:0]
        RED = 2'b00,
        YELLOW = 2'b01,
        GREEN = 2'b10;

    reg [2:0] state, next_state;
    reg [2:0] counter;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S_BOTH_RED;
            counter <= 0;
        end else begin
            state <= next_state;
            if (state == S_A_GREEN || state == S_B_GREEN) begin
                if (counter < 5) begin
                    counter <= counter + 1;
                end else begin
                    counter <= 0;
                end
            end else begin
                counter <= 0;
            end
        end
    end

    always @(*) begin
        case (state)
            S_BOTH_RED: begin
                if (button_a && !button_b) next_state = S_A_GREEN;
                else if (!button_a && button_b) next_state = S_B_GREEN;
                else next_state = S_BOTH_RED;
            end
            S_A_GREEN: begin
                if (counter == 5) next_state = S_A_YELLOW;
                else next_state = S_A_GREEN;
            end
            S_A_YELLOW: next_state = S_BOTH_RED;
            S_B_GREEN: begin
                if (counter == 5) next_state = S_B_YELLOW;
                else next_state = S_B_GREEN;
            end
            S_B_YELLOW: next_state = S_BOTH_RED;
            default: next_state = S_BOTH_RED;
        endcase
    end

    always @(*) begin
        case (state)
            S_BOTH_RED: begin
                light_a = RED;
                light_b = RED;
            end
            S_A_GREEN: begin
                light_a = GREEN;
                light_b = RED;
            end
            S_A_YELLOW: begin
                light_a = YELLOW;
                light_b = RED;
            end
            S_B_GREEN: begin
                light_a = RED;
                light_b = GREEN;
            end
            S_B_YELLOW: begin
                light_a = RED;
                light_b = YELLOW;
            end
            default: begin
                light_a = RED;
                light_b = RED;
            end
        endcase
    end

endmodule