module origen_131700 (
    input  wire slowest_sync_clk,
    input  wire ext_reset_in,
    input  wire aux_reset_in,
    input  wire mb_debug_sys_rst,
    input  wire dcm_locked,
    output wire mb_reset,
    output wire [0:0] bus_struct_reset,
    output wire [0:0] peripheral_reset,
    output wire [0:0] interconnect_aresetn,
    output wire [0:0] peripheral_aresetn
);

    // Internal signals
    reg [3:0] seq_cnt = 4'h0;
    reg seq_cnt_en = 1'b0;
    wire lpf_reset;
    reg mb_reset_int = 1'b1;
    reg [0:0] bus_struct_reset_int = 1'b1;
    reg [0:0] peripheral_reset_int = 1'b1;
    reg [0:0] interconnect_aresetn_int = 1'b0;
    reg [0:0] peripheral_aresetn_int = 1'b0;

    // Low-pass filter for reset signals
    reg [2:0] ext_reset_shift = 3'b111;
    reg [2:0] aux_reset_shift = 3'b111;
    reg [2:0] mb_debug_sys_rst_shift = 3'b000;

    always @(posedge slowest_sync_clk) begin
        ext_reset_shift <= {ext_reset_shift[1:0], ext_reset_in};
        aux_reset_shift <= {aux_reset_shift[1:0], aux_reset_in};
        mb_debug_sys_rst_shift <= {mb_debug_sys_rst_shift[1:0], mb_debug_sys_rst};
    end

    assign lpf_reset = (|ext_reset_shift) | (|aux_reset_shift) | (|mb_debug_sys_rst_shift) | ~dcm_locked;

    // Sequencer
    always @(posedge slowest_sync_clk) begin
        if (lpf_reset) begin
            seq_cnt <= 4'h0;
            seq_cnt_en <= 1'b0;
        end else begin
            if (seq_cnt_en) begin
                if (seq_cnt == 4'hF) begin
                    seq_cnt_en <= 1'b0;
                end else begin
                    seq_cnt <= seq_cnt + 1'b1;
                end
            end else if (seq_cnt == 4'h0) begin
                seq_cnt_en <= 1'b1;
            end
        end
    end

    // Reset generation
    always @(posedge slowest_sync_clk) begin
        if (lpf_reset) begin
            mb_reset_int <= 1'b1;
            bus_struct_reset_int <= 1'b1;
            peripheral_reset_int <= 1'b1;
            interconnect_aresetn_int <= 1'b0;
            peripheral_aresetn_int <= 1'b0;
        end else begin
            case (seq_cnt)
                4'h8: begin
                    mb_reset_int <= 1'b0;
                end
                4'h9: begin
                    bus_struct_reset_int <= 1'b0;
                end
                4'hA: begin
                    peripheral_reset_int <= 1'b0;
                end
                4'hB: begin
                    interconnect_aresetn_int <= 1'b1;
                end
                4'hC: begin
                    peripheral_aresetn_int <= 1'b1;
                end
                default: begin
                    // Do nothing
                end
            endcase
        end
    end

    // Output assignments
    assign mb_reset = mb_reset_int;
    assign bus_struct_reset = bus_struct_reset_int;
    assign peripheral_reset = peripheral_reset_int;
    assign interconnect_aresetn = interconnect_aresetn_int;
    assign peripheral_aresetn = peripheral_aresetn_int;

endmodule