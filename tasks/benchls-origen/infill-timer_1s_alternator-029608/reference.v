module origen_029608 (
    input wire clk,
    input wire rst_n,
    input wire [7:0] DEVICE_SDCMT,
    input wire [7:0] DEVICE_SDCMH,
    output reg [7:0] DEVICE_SDCMD,
    output reg timer_1s_en
);

    // Parameters
    localparam TIMER_MAX = 24_999_999;  // 1 second at 25MHz
    localparam TIMER_HALF = 12_499_999; // 0.5 seconds at 25MHz

    // Internal signals
    reg [24:0] timer_cnt;
    reg opt_num;

    // Timer counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            timer_cnt <= 25'd0;
        end else if (timer_cnt == TIMER_MAX) begin
            timer_cnt <= 25'd0;
        end else begin
            timer_cnt <= timer_cnt + 1'b1;
        end
    end

    // 1-second enable signal
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            timer_1s_en <= 1'b0;
        end else begin
            timer_1s_en <= (timer_cnt == TIMER_MAX);
        end
    end

    // Output alternation control
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            opt_num <= 1'b0;
        end else if (timer_cnt == TIMER_HALF || timer_cnt == TIMER_MAX) begin
            opt_num <= ~opt_num;
        end
    end

    // Output selection
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            DEVICE_SDCMD <= 8'd0;
        end else begin
            DEVICE_SDCMD <= opt_num ? DEVICE_SDCMH : DEVICE_SDCMT;
        end
    end

endmodule