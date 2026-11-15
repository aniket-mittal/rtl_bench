module origen_222717(
    input clk,
    input reset,
    input mi_access,
    input mi_write,
    input [19:0] mi_addr,
    input [31:0] mi_data_in,
    input erx_rdfifo_access,
    input erx_rdfifo_wait,
    input erx_wrfifo_access,
    input erx_wrfifo_wait,
    input erx_wbfifo_access,
    input erx_wbfifo_wait,
    input etx_rdfifo_access,
    input etx_rdfifo_wait,
    input etx_wrfifo_access,
    input etx_wrfifo_wait,
    input etx_wbfifo_access,
    input etx_wbfifo_wait,
    output reg [31:0] mi_data_out,
    output reg [5:0] emon_zero_flag
);

reg [31:0] emon_regs [0:63];
reg [5:0] emon_zero_cnt;

[MASKED]

endmodule