module origen_154229 #(
    parameter CLK_FREQUENCY = 100_000_000,
    parameter PWM_PERIOD    = 1000
)
(
    input  wire        in_rst,
    input  wire        in_clk,
    input  wire [15:0] pwm_thres,
    output reg         pwm_out,
    output wire        out_reg_period_start
);

localparam TIMER_1US_CONTER  = CLK_FREQUENCY / 1_000_000;
localparam PWM_PERIOD_CONTER = (CLK_FREQUENCY * PWM_PERIOD) / 1_000_000_000;

reg  [7:0] timer_cnter;
reg        timer_1us;
reg [15:0] count;

assign out_reg_period_start = (count == 16'h0000) && (timer_cnter == 8'h00) && timer_1us;

always @(posedge in_clk or posedge in_rst) begin
    if (in_rst) begin
        timer_cnter <= 8'h00;
        timer_1us   <= 1'b0;
        count       <= 16'h0000;
        pwm_out     <= 1'b0;
    end
    else begin
        if (timer_cnter == TIMER_1US_CONTER - 1) begin
            timer_cnter <= 8'h00;
            timer_1us   <= ~timer_1us;
        end
        else begin
            timer_cnter <= timer_cnter + 1'b1;
        end

        if (timer_1us) begin
            if (count == PWM_PERIOD_CONTER - 1) begin
                count <= 16'h0000;
            end
            else begin
                count <= count + 1'b1;
            end

            if (count < pwm_thres) begin
                pwm_out <= 1'b1;
            end
            else begin
                pwm_out <= 1'b0;
            end
        end
    end
end

endmodule