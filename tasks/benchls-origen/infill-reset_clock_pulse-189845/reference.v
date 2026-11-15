module origen_189845 #(
    parameter led_on_time = 62_500_000 // 62.5 ms at 1 MHz clock
) (
    input  wire        i_clk,
    input  wire        i_rst_n,
    output reg         o_reset_clk_pulse
);

    reg                r_reset_test;
    reg                r_reset_valid_flag;
    reg [31:0]         rv_time_cnt;

    localparam RESET_CHECK_S  = 1'b0;
    localparam CLOCK_CHECK_S  = 1'b1;
    reg                state;

    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            r_reset_test        <= 1'b0;
            r_reset_valid_flag  <= 1'b0;
            rv_time_cnt         <= 'd0;
            state               <= RESET_CHECK_S;
            o_reset_clk_pulse   <= 1'b1;
        end
        else begin
            case (state)
                RESET_CHECK_S: begin
                    // Check if reset is valid
                    r_reset_test <= ~i_rst_n;
                    if (r_reset_test && ~i_rst_n) begin
                        r_reset_valid_flag <= 1'b1;
                        state <= CLOCK_CHECK_S;
                        o_reset_clk_pulse <= 1'b0;
                    end
                end
                CLOCK_CHECK_S: begin
                    // Generate reset clock pulse
                    if (rv_time_cnt == led_on_time) begin
                        o_reset_clk_pulse <= ~o_reset_clk_pulse;
                        rv_time_cnt <= 'd0;
                    end
                    else begin
                        rv_time_cnt <= rv_time_cnt + 1'b1;
                    end
                end
                default: begin
                    state <= RESET_CHECK_S;
                end
            endcase
        end
    end

endmodule