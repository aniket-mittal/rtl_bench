module origen_084081 #(
    parameter FREQ_OF_CLK_IN = 100,
    parameter MAX_CNT_WIDTH_DIVIDER = 32
) (
    input wire reset,
    input wire [1:0] btn,
    input wire clk,
    output wire and_out,
    output wire [3:0] cnt_val,
    output wire null_port,
    output wire high_port
);

    // Clock divider
    reg [MAX_CNT_WIDTH_DIVIDER-1:0] div_cnt_val;
    reg clk_div_buf;
    wire [MAX_CNT_WIDTH_DIVIDER-1:0] div_counted_1s_val;

    assign div_counted_1s_val = FREQ_OF_CLK_IN * 1000000 - 1;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            div_cnt_val <= 0;
            clk_div_buf <= 0;
        end else begin
            if (div_cnt_val == div_counted_1s_val) begin
                div_cnt_val <= 0;
                clk_div_buf <= 1;
            end else begin
                div_cnt_val <= div_cnt_val + 1;
                clk_div_buf <= 0;
            end
        end
    end

    // LED Counter
    reg [3:0] cnt_buf;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            cnt_buf <= 4'b0000;
        end else begin
            if (cnt_buf == 4'b1001) begin
                cnt_buf <= 4'b0000;
            end else begin
                cnt_buf <= cnt_buf + 1;
            end
        end
    end

    // Output assignments
    assign and_out = btn[1] & btn[0];
    assign cnt_val = cnt_buf;
    assign null_port = 1'b0;
    assign high_port = 1'b1;

endmodule