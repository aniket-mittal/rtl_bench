module origen_129616 (
    input wire slowest_sync_clk,
    input wire ext_reset_in,
    input wire aux_reset_in,
    input wire mb_debug_sys_rst,
    input wire dcm_locked,
    output reg mb_reset,
    output reg [0:0] bus_struct_reset,
    output reg [0:0] peripheral_reset,
    output reg [0:0] interconnect_aresetn,
    output reg [0:0] peripheral_aresetn
);

    // Internal signals
    reg [3:0] reset_counter;
    reg reset_active;

    // Constants
    localparam RESET_DELAY = 4'b1111;

    // Reset logic
    [MASKED]

    // Output logic
    always @(posedge slowest_sync_clk) begin
        if (reset_active) begin
            mb_reset <= 1'b1;
            bus_struct_reset <= 1'b1;
            peripheral_reset <= 1'b1;
            interconnect_aresetn <= 1'b0;
            peripheral_aresetn <= 1'b0;
        end else begin
            mb_reset <= 1'b0;
            bus_struct_reset <= 1'b0;
            peripheral_reset <= 1'b0;
            interconnect_aresetn <= 1'b1;
            peripheral_aresetn <= 1'b1;
        end
    end

endmodule