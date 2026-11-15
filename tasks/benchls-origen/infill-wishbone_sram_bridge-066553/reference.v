module origen_066553 #(
    parameter ADDR_BITS = 22,
    parameter HIGH_ADDR = 10'h000
) (
    input wire wbs_clk_i,
    input wire wbs_rst_i,
    input wire wbs_cyc_i,
    input wire wbs_stb_i,
    input wire [29:0] wbs_addr_i,
    input wire [3:0] wbs_sel_i,
    input wire wbs_we_i,
    input wire [31:0] wbs_data_i,
    output reg [31:0] wbs_data_o,
    output reg wbs_ack_o,

    output wire sram_ce_n,
    output wire sram_oe_n,
    output wire sram_we_n,
    output wire [ADDR_BITS-1:0] sram_addr,
    input wire [47:0] sram_din,
    output wire [47:0] sram_dout
);

    wire cs;
    reg ack_delay;

    // Chip select generation
    assign cs = wbs_cyc_i && wbs_stb_i && (wbs_addr_i[29:20] == HIGH_ADDR);

    // SRAM control signals
    assign sram_ce_n = ~cs;
    assign sram_oe_n = wbs_we_i;
    assign sram_we_n = ~wbs_we_i;
    assign sram_addr = wbs_addr_i[ADDR_BITS-1:0];

    // Data handling
    assign sram_dout = {16'b0, wbs_data_i};

    always @(posedge wbs_clk_i) begin
        if (wbs_rst_i) begin
            wbs_data_o <= 32'b0;
        end else if (cs && !wbs_we_i) begin
            wbs_data_o <= sram_din[31:0];
        end
    end

    // Wishbone acknowledgment
    always @(posedge wbs_clk_i) begin
        if (wbs_rst_i) begin
            ack_delay <= 1'b0;
            wbs_ack_o <= 1'b0;
        end else begin
            ack_delay <= cs;
            wbs_ack_o <= ack_delay && cs;
        end
    end

endmodule