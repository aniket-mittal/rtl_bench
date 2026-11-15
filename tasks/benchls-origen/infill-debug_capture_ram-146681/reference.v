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

    always @(posedge measure_clk or negedge reset_measure_clk_n) begin
        if (!reset_measure_clk_n) begin
            ram_wr_address <= 0;
            debug_data <= 8'h00;
            pll_step_count <= 0;
            capturing_debug_data <= 0;
            prev_mimic_recapture_debug_data <= 0;
            debug_ram_data <= 8'h00;
        end else begin
            prev_mimic_recapture_debug_data <= mimic_recapture_debug_data;

            if (mimic_recapture_debug_data && !prev_mimic_recapture_debug_data) begin
                capturing_debug_data <= 1;
                ram_wr_address <= 0;
                pll_step_count <= 0;
            end

            if (capturing_debug_data) begin
                if (mmc_seq_done) begin
                    debug_data <= mmc_seq_value;
                    debug_ram_data <= debug_data;
                    ram_wr_address <= ram_wr_address + 1;

                    if (pll_step_count == PLL_STEPS_PER_CYCLE - 1) begin
                        pll_step_count <= 0;
                    end else begin
                        pll_step_count <= pll_step_count + 1;
                    end

                    if (ram_wr_address == NUM_DEBUG_SAMPLES_TO_STORE - 1) begin
                        capturing_debug_data <= 0;
                    end
                end
            end
        end
    end

endmodule