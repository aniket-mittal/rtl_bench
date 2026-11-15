module origen_150751(
    input clk,
    input rst_n,
    input sig_in,
    output reg [31:0] pinlv
);

    parameter F_1S = 50000000; // Assume 50MHz clock

    reg sig_in_buffer, sig_in_buffer1;
    reg start_cnt_neg;
    reg [31:0] fgate_cnt;
    reg fgate;
    reg start_cnt;
    reg [31:0] fx_cnt_temp;

    [MASKED]

endmodule