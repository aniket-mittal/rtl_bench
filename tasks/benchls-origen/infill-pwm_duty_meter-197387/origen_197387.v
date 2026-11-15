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

[MASKED]

endmodule