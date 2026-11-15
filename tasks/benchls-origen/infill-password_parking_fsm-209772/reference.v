module origen_209772(
    input clock,
    input reset,
    input entry_sensor,
    input exit_sensor,
    input [1:0] password_1,
    input [1:0] password_2,
    output reg green_led,
    output reg red_led
);

parameter IDLE = 3'b000;
parameter ENT_PASSWORD = 3'b001;
parameter WRONG_PASSWORD = 3'b010;
parameter ENT_CAR = 3'b011;
parameter STOP = 3'b100;

reg [2:0] state, next_state;
reg [1:0] entered_password;

always @(posedge clock or posedge reset) begin
    if (reset) begin
        state <= IDLE;
        green_led <= 0;
        red_led <= 0;
        entered_password <= 0;
    end
    else begin
        state <= next_state;
    end
end

always @(*) begin
    case (state)
        IDLE: begin
            green_led = 0;
            red_led = 0;
            if (entry_sensor) begin
                next_state = ENT_PASSWORD;
            end
            else begin
                next_state = IDLE;
            end
        end
        ENT_PASSWORD: begin
            green_led = 0;
            red_led = 0;
            if (password_1 == 2'b01 || password_2 == 2'b10) begin
                next_state = ENT_CAR;
            end
            else begin
                next_state = WRONG_PASSWORD;
            end
        end
        WRONG_PASSWORD: begin
            green_led = 0;
            red_led = 1;
            if (entry_sensor && exit_sensor) begin
                next_state = STOP;
            end
            else if (password_1 == 2'b01 || password_2 == 2'b10) begin
                next_state = ENT_CAR;
            end
            else begin
                next_state = WRONG_PASSWORD;
            end
        end
        ENT_CAR: begin
            green_led = 1;
            red_led = 0;
            if (exit_sensor) begin
                next_state = IDLE;
            end
            else if (entry_sensor && exit_sensor) begin
                next_state = STOP;
            end
            else begin
                next_state = ENT_CAR;
            end
        end
        STOP: begin
            green_led = 1;
            red_led = 1;
            if (password_1 == 2'b01 || password_2 == 2'b10) begin
                next_state = ENT_CAR;
            end
            else begin
                next_state = STOP;
            end
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end

endmodule