module origen_091453 #(
    parameter JTAG_SEL = 1
) (
    input wire clk,
    input wire test_logic_reset,
    input wire update_dr_clk,
    input wire shiftcapture_dr_clk,
    input wire shift_dr,
    input wire capture_dr,
    input wire tdi,
    input wire [JTAG_SEL-1:0] select,
    input wire [JTAG_SEL-1:0] syn_tdo_i,
    
    output wire syn_clk,
    output reg syn_reset,
    output reg syn_shift_dr,
    output reg syn_capture_dr,
    output reg syn_update_dr,
    output reg syn_tdi,
    output reg [JTAG_SEL-1:0] syn_select,
    output wire [JTAG_SEL-1:0] tdo
);

    // Reset synchronization
    reg [1:0] reset_sync;
    always @(posedge clk or posedge test_logic_reset) begin
        if (test_logic_reset)
            reset_sync <= 2'b11;
        else
            reset_sync <= {reset_sync[0], 1'b0};
    end
    
    always @(posedge clk)
        syn_reset <= reset_sync[1];

    // JTAG state synchronization
    reg [1:0] shift_dr_sync, capture_dr_sync;
    always @(negedge shiftcapture_dr_clk or posedge syn_reset) begin
        if (syn_reset) begin
            shift_dr_sync <= 2'b00;
            capture_dr_sync <= 2'b00;
        end else begin
            shift_dr_sync <= {shift_dr_sync[0], shift_dr};
            capture_dr_sync <= {capture_dr_sync[0], capture_dr};
        end
    end

    // Clock edge detection
    reg [1:0] shiftcapture_dr_clk_edge, update_dr_clk_edge;
    always @(posedge clk or posedge syn_reset) begin
        if (syn_reset) begin
            shiftcapture_dr_clk_edge <= 2'b00;
            update_dr_clk_edge <= 2'b00;
        end else begin
            shiftcapture_dr_clk_edge <= {shiftcapture_dr_clk_edge[0], shiftcapture_dr_clk};
            update_dr_clk_edge <= {update_dr_clk_edge[0], update_dr_clk};
        end
    end

    wire shiftcapture_dr_clk_posedge = (shiftcapture_dr_clk_edge == 2'b01);
    wire update_dr_clk_posedge = (update_dr_clk_edge == 2'b01);

    // Signal generation
    always @(posedge clk or posedge syn_reset) begin
        if (syn_reset) begin
            syn_shift_dr <= 1'b0;
            syn_capture_dr <= 1'b0;
            syn_update_dr <= 1'b0;
        end else begin
            if (shiftcapture_dr_clk_posedge) begin
                syn_shift_dr <= shift_dr_sync[1];
                syn_capture_dr <= capture_dr_sync[1];
            end
            if (update_dr_clk_posedge)
                syn_update_dr <= 1'b1;
            else
                syn_update_dr <= 1'b0;
        end
    end

    // TDI synchronization
    always @(posedge clk or posedge syn_reset) begin
        if (syn_reset)
            syn_tdi <= 1'b0;
        else if (syn_shift_dr || syn_capture_dr)
            syn_tdi <= tdi;
    end

    // Select signal synchronization
    always @(posedge clk or posedge syn_reset) begin
        if (syn_reset)
            syn_select <= {JTAG_SEL{1'b0}};
        else if (update_dr_clk_posedge || shiftcapture_dr_clk_posedge)
            syn_select <= select;
    end

    // Clock and TDO passthrough
    assign syn_clk = clk;
    assign tdo = syn_tdo_i;

endmodule