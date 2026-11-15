module origen_152075 (
    input clk,
    input reset,
    input sensor_entrance,
    input sensor_exit,
    input card_valid,
    output reg GREEN_LED,
    output reg RED_LED,
    output reg door_status
);

    parameter IDLE = 3'b000, WAIT_CARD = 3'b001, WRONG_CARD = 3'b010, RIGHT_CARD = 3'b011, ENTER_FIRST = 3'b100;
    reg [2:0] state, next_state;
    reg [7:0] counter_wait;

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            counter_wait <= 0;
            GREEN_LED <= 0;
            RED_LED <= 0;
            door_status <= 0;
        end
        else begin
            state <= next_state;
            case (state)
                IDLE: begin
                    counter_wait <= 0;
                    GREEN_LED <= 0;
                    RED_LED <= 0;
                    door_status <= 0;
                end
                WAIT_CARD: begin
                    if (counter_wait == 8'd255) begin
                        next_state <= WRONG_CARD;
                    end
                    else begin
                        counter_wait <= counter_wait + 1;
                    end
                end
                WRONG_CARD: begin
                    RED_LED <= ~RED_LED;
                    door_status <= 0;
                end
                RIGHT_CARD: begin
                    GREEN_LED <= 1;
                    door_status <= 1;
                end
                ENTER_FIRST: begin
                    RED_LED <= ~RED_LED;
                    door_status <= 0;
                end
            endcase
        end
    end

    // Next state logic
    [MASKED]

endmodule