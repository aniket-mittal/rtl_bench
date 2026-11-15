module origen_155832 (
    input clk_in,
    input rst_n,
    output pwm_out
);

parameter DIV_FACTOR = 50;
parameter PWM_PERIOD = 500;

reg [15:0] clk_div_cnt;
reg [15:0] pwm_cnt;
reg [15:0] pwm_thrs;
reg clk_1khz;

always @(posedge clk_in or negedge rst_n) begin
    if (~rst_n) begin
        clk_div_cnt <= 0;
        clk_1khz <= 0;
    end
    else begin
        if (clk_div_cnt == (DIV_FACTOR - 1)) begin
            clk_div_cnt <= 0;
            clk_1khz <= ~clk_1khz;
        end
        else begin
            clk_div_cnt <= clk_div_cnt + 1;
        end
    end
end

always @(posedge clk_1khz or negedge rst_n) begin
    if (~rst_n) begin
        pwm_cnt <= 0;
        pwm_thrs <= 0;
    end
    else begin
        if (pwm_cnt == (PWM_PERIOD - 1)) begin
            pwm_cnt <= 0;
            if (pwm_thrs == (PWM_PERIOD - 1)) begin
                pwm_thrs <= 0;
            end
            else begin
                pwm_thrs <= pwm_thrs + 1;
            end
        end
        else begin
            pwm_cnt <= pwm_cnt + 1;
        end
    end
end

assign pwm_out = (pwm_cnt < pwm_thrs) ? 1'b1 : 1'b0;

endmodule