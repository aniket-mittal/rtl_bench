module origen_135873 (
    input wire slowest_sync_clk,
    input wire dcm_locked,
    input wire ext_reset_in,
    input wire mb_debug_sys_rst,
    input wire aux_reset_in,
    output wire lpf_int
);

// Synchronization registers
reg [2:0] ext_reset_sync;
reg [2:0] mb_debug_sys_rst_sync;
reg [2:0] aux_reset_sync;
reg [2:0] dcm_locked_sync;

// Combined reset signal
wire combined_reset;

// Low-pass filter registers
reg [15:0] lpf_reg;
reg [15:0] lpf_next;

// Output synchronization registers
reg [2:0] lpf_sync;

// Constants for low-pass filter
localparam ALPHA = 16'h7FFF; // Approximately 0.9999 in fixed-point
localparam BETA = 16'h0001; // 1 - ALPHA

// Synchronize input signals
always @(posedge slowest_sync_clk) begin
    ext_reset_sync <= {ext_reset_sync[1:0], ext_reset_in};
    mb_debug_sys_rst_sync <= {mb_debug_sys_rst_sync[1:0], mb_debug_sys_rst};
    aux_reset_sync <= {aux_reset_sync[1:0], aux_reset_in};
    dcm_locked_sync <= {dcm_locked_sync[1:0], dcm_locked};
end

// Combine reset signals
assign combined_reset = ext_reset_sync[2] | mb_debug_sys_rst_sync[2] | aux_reset_sync[2];

// Low-pass filter implementation
always @(posedge slowest_sync_clk) begin
    if (combined_reset) begin
        lpf_reg <= 16'h0000;
    end else begin
        lpf_reg <= lpf_next;
    end
end

always @(*) begin
    lpf_next = ((lpf_reg * ALPHA) + (dcm_locked_sync[2] ? 16'hFFFF : 16'h0000) * BETA) >> 16;
end

// Synchronize output signal
always @(posedge slowest_sync_clk) begin
    lpf_sync <= {lpf_sync[1:0], lpf_reg[15]};
end

// Assign output
assign lpf_int = lpf_sync[2];

endmodule