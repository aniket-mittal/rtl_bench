module origen_168275 (
    input clk_in,
    input rst_in,
    input [15:0] cpumc_a_in,
    input [7:0] cpumc_din_in,
    output [7:0] cpumc_dout_in,
    input cpu_r_nw_in,
    output active_out,
    output [15:0] cpumc_a_out,
    output [7:0] cpumc_d_out,
    output cpumc_r_nw_out
);

    reg [15:0] q_addr;
    reg [7:0] q_data;
    reg [1:0] state;
    parameter S_READY = 2'b00, S_ACTIVE = 2'b01, S_COOLDOWN = 2'b10;

    assign active_out = (state == S_ACTIVE);
    assign cpumc_a_out = q_addr;
    assign cpumc_d_out = q_data;
    assign cpumc_r_nw_out = (state == S_ACTIVE) ? 1'b0 : cpu_r_nw_in;

    [MASKED]

endmodule