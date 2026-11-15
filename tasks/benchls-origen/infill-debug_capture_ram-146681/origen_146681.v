module origen_146681 #(
    parameter NUM_DEBUG_SAMPLES_TO_STORE = 4096,
    parameter PLL_STEPS_PER_CYCLE = 16,
    parameter RAM_WR_ADDRESS_WIDTH = 12
) (
    input wire measure_clk,
    input wire reset_measure_clk_n,
    input wire mimic_recapture_debug_data,
    input wire mmc_seq_done,
    input wire [7:0] mmc_seq_value,
    output reg [7:0] debug_ram_data
);

    reg [RAM_WR_ADDRESS_WIDTH-1:0] ram_wr_address;
    reg [7:0] debug_data;
    reg [5:0] pll_step_count;
    reg capturing_debug_data;
    reg prev_mimic_recapture_debug_data;

    [MASKED]

endmodule