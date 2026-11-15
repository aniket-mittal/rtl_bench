module origen_126740 (
    input wire wb_clk_i,
    input wire wb_rst_i,
    input wire [15:0] wb_adr_i,
    input wire [15:0] wb_dat_i,
    input wire [1:0] wb_sel_i,
    input wire wb_we_i,
    input wire wb_stb_i,
    input wire wb_cyc_i,
    output reg [15:0] wb_dat_o,
    output reg wb_ack_o,
    output reg [7:0] leds_,
    input wire [7:0] sw_
);

    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            leds_ <= 8'b0;
            wb_ack_o <= 1'b0;
            wb_dat_o <= 16'b0;
        end else begin
            wb_ack_o <= wb_cyc_i && wb_stb_i;
            
            if (wb_cyc_i && wb_stb_i) begin
                if (wb_adr_i != 16'b0) begin
                    wb_dat_o <= {8'b0, leds_};
                    if (wb_we_i) begin
                        leds_ <= wb_dat_i[7:0];
                    end
                end else begin
                    wb_dat_o <= {8'b0, sw_};
                end
            end
        end
    end

endmodule

// Testbench
