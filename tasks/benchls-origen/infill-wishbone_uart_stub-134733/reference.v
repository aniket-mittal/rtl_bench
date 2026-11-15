module origen_134733 (
    // Wishbone signals
    input wire        wb_clk_i,
    input wire        wb_rst_i,
    input wire [31:0] wb_adr_i,
    input wire [31:0] wb_dat_i,
    output reg [31:0] wb_dat_o,
    input wire        wb_we_i,
    input wire        wb_stb_i,
    input wire        wb_cyc_i,
    input wire [3:0]  wb_sel_i,
    output reg        wb_ack_o,
    output reg        int_o,

    // UART signals
    input wire        srx_pad_i,
    output wire       stx_pad_o,

    // Debug interface signals
    output wire [3:0] state,
    output wire [15:0] debug
);

    // UART registers
    reg [7:0] uart_data_reg;
    reg [7:0] uart_control_reg;
    reg [7:0] uart_status_reg;

    // UART control signals
    wire tx_enable;
    wire rx_enable;
    wire tx_ready;
    wire rx_ready;

    // UART instantiation
    // Note: The uart_core module is not provided, so we'll use direct assignments instead
    assign stx_pad_o = uart_data_reg[0] & tx_enable;
    assign rx_ready = srx_pad_i & rx_enable;
    assign tx_ready = ~tx_enable; // Assume transmitter is ready when not enabled

    // Wishbone write operation
    always @(posedge wb_clk_i) begin
        if (wb_rst_i) begin
            uart_data_reg <= 8'h00;
            uart_control_reg <= 8'h00;
        end else if (wb_we_i && wb_stb_i && wb_cyc_i) begin
            case (wb_adr_i[3:2])
                2'b00: begin // Data register
                    if (wb_sel_i[0]) uart_data_reg[7:0] <= wb_dat_i[7:0];
                end
                2'b01: begin // Control register
                    if (wb_sel_i[0]) uart_control_reg <= wb_dat_i[7:0];
                end
                default: begin
                    // Do nothing
                end
            endcase
        end
    end

    // Wishbone read operation
    always @(*) begin
        case (wb_adr_i[3:2])
            2'b00: begin // Data register
                wb_dat_o = {24'h000000, uart_data_reg};
            end
            2'b01: begin // Control register
                wb_dat_o = {24'h000000, uart_control_reg};
            end
            2'b10: begin // Status register
                wb_dat_o = {24'h000000, uart_status_reg};
            end
            default: begin
                wb_dat_o = 32'h00000000;
            end
        endcase
    end

    // Wishbone acknowledge
    always @(posedge wb_clk_i) begin
        if (wb_rst_i) begin
            wb_ack_o <= 1'b0;
        end else begin
            wb_ack_o <= wb_stb_i && wb_cyc_i;
        end
    end

    // UART control signals
    assign tx_enable = uart_control_reg[0];
    assign rx_enable = uart_control_reg[1];

    // UART status register
    always @(posedge wb_clk_i) begin
        if (wb_rst_i) begin
            uart_status_reg <= 8'h00;
        end else begin
            uart_status_reg <= {4'h0, rx_ready, tx_ready, rx_enable, tx_enable};
        end
    end

    // Interrupt generation
    always @(posedge wb_clk_i) begin
        if (wb_rst_i) begin
            int_o <= 1'b0;
        end else begin
            int_o <= (rx_ready && uart_control_reg[2]) || (tx_ready && uart_control_reg[3]);
        end
    end

    // Debug interface
    assign state = wb_adr_i[3:0];
    assign debug = {uart_status_reg, uart_control_reg};

endmodule