module origen_217926(
    input clk_100,
    input one_pulse_s,
    input one_pulse_f,
    input rst,
    output reg freeze_en,
    output reg rst_f,
    output reg count_en
);

reg [1:0] state, next_state;

always @(posedge clk_100 or posedge rst) begin
    if (rst) begin
        state <= 2'b00;
    end
    else begin
        state <= next_state;
    end
end

always @(*) begin
    case (state)
        2'b00: begin // Starting state
            if (one_pulse_s) begin
                next_state = 2'b01;
                freeze_en = 0;
                rst_f = 0;
                count_en = 1;
            end
            else if (one_pulse_f) begin
                next_state = 2'b11;
                freeze_en = 0;
                rst_f = 0;
                count_en = 1;
            end
            else begin
                next_state = 2'b00;
                freeze_en = 0;
                rst_f = 0;
                count_en = 0;
            end
        end
        2'b01: begin // Slow state
            if (one_pulse_f) begin
                next_state = 2'b11;
                freeze_en = 0;
                rst_f = 0;
                count_en = 1;
            end
            else if (one_pulse_s) begin
                next_state = 2'b00;
                freeze_en = 0;
                rst_f = 0;
                count_en = 0;
            end
            else begin
                next_state = 2'b01;
                freeze_en = 0;
                rst_f = 0;
                count_en = 1;
            end
        end
        2'b10: begin // Freeze state
            if (one_pulse_f) begin
                next_state = 2'b11;
                freeze_en = 0;
                rst_f = 0;
                count_en = 1;
            end
            else if (one_pulse_s) begin
                next_state = 2'b00;
                freeze_en = 0;
                rst_f = 0;
                count_en = 0;
            end
            else begin
                next_state = 2'b10;
                freeze_en = 1;
                rst_f = 0;
                count_en = 0;
            end
        end
        2'b11: begin // Fast state
            if (one_pulse_s) begin
                next_state = 2'b01;
                freeze_en = 0;
                rst_f = 0;
                count_en = 1;
            end
            else if (one_pulse_f) begin
                next_state = 2'b00;
                freeze_en = 0;
                rst_f = 1;
                count_en = 0;
            end
            else begin
                next_state = 2'b11;
                freeze_en = 0;
                rst_f = 0;
                count_en = 1;
            end
        end
        default: begin
            next_state = 2'b00;
            freeze_en = 0;
            rst_f = 0;
            count_en = 0;
        end
    endcase
end

endmodule