module origen_155644(
    input throttle,
    input set,
    input accel,
    input coast,
    input cancel,
    input resume,
    input brake,
    input clock,
    input reset,
    output [7:0] speed,
    output [7:0] cruise_speed,
    output cruise_status
);

    reg [7:0] current_speed;
    reg [7:0] cruise_speed_reg;
    reg cruise_status_reg;
    reg resume_flag;

    parameter IDLE = 2'b00, DEFAULT_STATE = 2'b01, CRUISE = 2'b10, BRAKE = 2'b11;
    reg [1:0] state, next_state;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            current_speed <= 0;
            cruise_speed_reg <= 0;
            cruise_status_reg <= 0;
            resume_flag <= 0;
        end else begin
            state <= next_state;
            if (state == DEFAULT_STATE) begin
                if (throttle) begin
                    current_speed <= current_speed + 1;
                end else begin
                    current_speed <= current_speed - 1;
                end
            end else if (state == CRUISE) begin
                if (throttle) begin
                    current_speed <= current_speed + 1;
                end else begin
                    current_speed <= current_speed - 1;
                end
                cruise_speed_reg <= cruise_speed_reg;
            end else if (state == BRAKE) begin
                current_speed <= current_speed - 2;
            end
            cruise_status_reg <= (state == CRUISE);
        end
    end

    always @* begin
        next_state = state;
        case (state)
            IDLE: begin
                if (!reset) begin
                    next_state = DEFAULT_STATE;
                end
            end
            DEFAULT_STATE: begin
                if (set && current_speed >= 45) begin
                    next_state = CRUISE;
                end else if (resume && current_speed >= 0) begin
                    next_state = CRUISE;
                end else if (brake) begin
                    next_state = BRAKE;
                end
            end
            CRUISE: begin
                if (cancel) begin
                    next_state = DEFAULT_STATE;
                end else if (brake) begin
                    next_state = BRAKE;
                end
            end
            BRAKE: begin
                if (throttle) begin
                    next_state = DEFAULT_STATE;
                end else if (set && current_speed >= 45) begin
                    next_state = CRUISE;
                end else if (resume && current_speed >= 0) begin
                    next_state = CRUISE;
                end
            end
        endcase
    end

    always @* begin
        if (state == CRUISE) begin
            cruise_speed_reg = current_speed;
        end else if (resume) begin
            cruise_speed_reg = current_speed;
        end
    end

    assign speed = current_speed;
    assign cruise_speed = cruise_speed_reg;
    assign cruise_status = cruise_status_reg;

endmodule