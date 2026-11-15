module origen_197387 (
    input clk,
    input rst_n,
    input sig_in,
    input [31:0] pinlv,
    output reg [15:0] duty,
    output reg [31:0] cnt_high,
    output reg [31:0] cnt_low,
    output reg high_pulse,
    output reg low_pulse,
    output reg [31:0] duty_alter
);

reg sig_in_buffer, sig_in_buffer1;
reg fstart, fgate;
reg [31:0] cnt_1s;

reg [1:0] state_high, state_low;
reg [31:0] cnt_high_temp, cnt_low_temp;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        sig_in_buffer <= 1'b0;
        sig_in_buffer1 <= 1'b0;
        fstart <= 1'b0;
        fgate <= 1'b0;
        cnt_1s <= 32'b0;
        state_high <= 2'b0;
        state_low <= 2'b0;
        cnt_high_temp <= 32'b0;
        cnt_low_temp <= 32'b0;
        duty <= 16'b0;
        cnt_high <= 32'b0;
        cnt_low <= 32'b0;
        high_pulse <= 1'b0;
        low_pulse <= 1'b0;
        duty_alter <= 32'b0;
    end
    else begin
        sig_in_buffer <= sig_in;
        sig_in_buffer1 <= sig_in_buffer;

        if (sig_in_buffer && ~sig_in_buffer1) begin
            high_pulse <= 1'b1;
            low_pulse <= 1'b0;
        end
        else if (~sig_in_buffer && sig_in_buffer1) begin
            high_pulse <= 1'b0;
            low_pulse <= 1'b1;
        end
        else begin
            high_pulse <= 1'b0;
            low_pulse <= 1'b0;
        end

        if (cnt_1s == 32'd99_999_999) begin
            cnt_1s <= 32'b0;
            fgate <= 1'b1;
        end
        else begin
            cnt_1s <= cnt_1s + 1;
            fgate <= 1'b0;
        end

        if (fgate) begin
            fstart <= 1'b1;
        end
        else begin
            fstart <= 1'b0;
        end

        if (fstart) begin
            case (state_high)
                2'b00: begin
                    if (high_pulse) begin
                        state_high <= 2'b01;
                        cnt_high_temp <= 32'b0;
                    end
                    else begin
                        state_high <= 2'b00;
                    end
                end
                2'b01: begin
                    if (high_pulse) begin
                        cnt_high_temp <= cnt_high_temp + 1;
                    end
                    else begin
                        state_high <= 2'b10;
                    end
                end
                2'b10: begin
                    state_high <= 2'b00;
                    cnt_high <= cnt_high_temp;
                end
                default: state_high <= 2'b00;
            endcase

            case (state_low)
                2'b00: begin
                    if (low_pulse) begin
                        state_low <= 2'b01;
                        cnt_low_temp <= 32'b0;
                    end
                    else begin
                        state_low <= 2'b00;
                    end
                end
                2'b01: begin
                    if (low_pulse) begin
                        cnt_low_temp <= cnt_low_temp + 1;
                    end
                    else begin
                        state_low <= 2'b10;
                    end
                end
                2'b10: begin
                    state_low <= 2'b00;
                    cnt_low <= cnt_low_temp;
                end
                default: state_low <= 2'b00;
            endcase

            duty <= (cnt_high_temp * 16'd65535) / (cnt_high_temp + cnt_low_temp);
            duty_alter <= {pinlv[30:0], 1'b0};
            cnt_high <= cnt_high_temp + duty_alter;
            cnt_low <= cnt_low_temp - duty_alter;
        end
    end
end

endmodule