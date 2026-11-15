module origen_160550 #(
    parameter N_REGS     = 2,
    parameter N_REG_BITS = $clog2(N_REGS)
)(
    input  clk,
    input  rst_n,

    input  [31:0] hwlp_start_data_i,
    input  [31:0] hwlp_end_data_i,
    input  [31:0] hwlp_cnt_data_i,
    input   [2:0] hwlp_we_i,
    input [N_REG_BITS-1:0] hwlp_regid_i,
    input         valid_i,
    input        [N_REGS-1:0] hwlp_dec_cnt_i,

    output [31:0] hwlp_start_addr_o,
    output [31:0] hwlp_end_addr_o,
    output [31:0] hwlp_counter_o
);

    reg [31:0] hwlp_start_q [N_REGS-1:0];
    reg [31:0] hwlp_end_q   [N_REGS-1:0];
    reg [31:0] hwlp_counter_q [N_REGS-1:0];

    [MASKED]

    assign hwlp_start_addr_o = hwlp_start_q[hwlp_regid_i];
    assign hwlp_end_addr_o   = hwlp_end_q[hwlp_regid_i];
    assign hwlp_counter_o    = hwlp_counter_q[hwlp_regid_i];

endmodule