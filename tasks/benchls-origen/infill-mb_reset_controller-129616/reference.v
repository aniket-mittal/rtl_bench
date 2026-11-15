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
    always @(posedge slowest_sync_clk or posedge ext_reset_in) begin
        if (ext_reset_in) begin
            reset_active <= 1'b1;
            reset_counter <= 4'b0000;
        end else if (aux_reset_in || mb_debug_sys_rst || !dcm_locked) begin
            reset_active <= 1'b1;
            reset_counter <= 4'b0000;
        end else if (reset_active) begin
            if (reset_counter == RESET_DELAY) begin
                reset_active <= 1'b0;
            end else begin
                reset_counter <= reset_counter + 1'b1;
            end
        end
    end

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