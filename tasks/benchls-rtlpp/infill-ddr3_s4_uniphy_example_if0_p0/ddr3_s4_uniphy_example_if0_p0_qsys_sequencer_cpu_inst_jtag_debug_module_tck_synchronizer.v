module ddr3_s4_uniphy_example_if0_p0_qsys_sequencer_cpu_inst_jtag_debug_module_tck_synchronizer (
    clk,
    din,
    dout,
    reset_n
);

parameter depth = 2;

input clk, din, reset_n;
output dout;

reg [depth-1:0] sync_reg;

[MASKED]

assign dout = sync_reg[depth-1];

endmodule