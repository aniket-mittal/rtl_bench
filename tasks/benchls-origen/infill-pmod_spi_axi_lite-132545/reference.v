module origen_132545 (
    output wire Pmod_out_pin1, Pmod_out_pin2, Pmod_out_pin3, Pmod_out_pin4,
    output wire Pmod_out_pin5, Pmod_out_pin6, Pmod_out_pin7, Pmod_out_pin8,
    output wire Pmod_out_pin9, Pmod_out_pin10,
    input wire ext_spi_clk,
    input wire s_axi_aclk,
    input wire s_axi_aresetn,
    input wire [6:0] AXI_LITE_SPI_araddr,
    input wire AXI_LITE_SPI_arvalid,
    input wire [6:0] AXI_LITE_SPI_awaddr,
    input wire AXI_LITE_SPI_awvalid,
    input wire AXI_LITE_SPI_bready,
    input wire AXI_LITE_SPI_rready,
    input wire [31:0] AXI_LITE_SPI_wdata,
    input wire [3:0] AXI_LITE_SPI_wstrb,
    input wire AXI_LITE_SPI_wvalid,
    output reg AXI_LITE_SPI_arready,
    output reg AXI_LITE_SPI_awready,
    output reg [1:0] AXI_LITE_SPI_bresp,
    output reg AXI_LITE_SPI_bvalid,
    output reg [31:0] AXI_LITE_SPI_rdata,
    output reg [1:0] AXI_LITE_SPI_rresp,
    output reg AXI_LITE_SPI_rvalid,
    output reg AXI_LITE_SPI_wready
);

    reg [7:0] pmod_data;
    reg [6:0] spi_addr;
    reg write_enable, read_enable;

    always @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (!s_axi_aresetn) begin
            AXI_LITE_SPI_arready <= 1'b0;
            AXI_LITE_SPI_awready <= 1'b0;
            AXI_LITE_SPI_bresp <= 2'b00;
            AXI_LITE_SPI_bvalid <= 1'b0;
            AXI_LITE_SPI_rdata <= 32'h0;
            AXI_LITE_SPI_rresp <= 2'b00;
            AXI_LITE_SPI_rvalid <= 1'b0;
            AXI_LITE_SPI_wready <= 1'b0;
            pmod_data <= 8'h0;
            spi_addr <= 7'h0;
            write_enable <= 1'b0;
            read_enable <= 1'b0;
        end else begin
            // Handle write address
            if (AXI_LITE_SPI_awvalid && !AXI_LITE_SPI_awready) begin
                AXI_LITE_SPI_awready <= 1'b1;
                spi_addr <= AXI_LITE_SPI_awaddr;
            end else begin
                AXI_LITE_SPI_awready <= 1'b0;
            end

            // Handle write data
            if (AXI_LITE_SPI_wvalid && !AXI_LITE_SPI_wready) begin
                AXI_LITE_SPI_wready <= 1'b1;
                write_enable <= 1'b1;
                pmod_data <= AXI_LITE_SPI_wdata[7:0];
            end else begin
                AXI_LITE_SPI_wready <= 1'b0;
                write_enable <= 1'b0;
            end

            // Handle write response
            if (write_enable && !AXI_LITE_SPI_bvalid) begin
                AXI_LITE_SPI_bvalid <= 1'b1;
                AXI_LITE_SPI_bresp <= 2'b00; // OKAY
            end else if (AXI_LITE_SPI_bready && AXI_LITE_SPI_bvalid) begin
                AXI_LITE_SPI_bvalid <= 1'b0;
            end

            // Handle read address
            if (AXI_LITE_SPI_arvalid && !AXI_LITE_SPI_arready) begin
                AXI_LITE_SPI_arready <= 1'b1;
                spi_addr <= AXI_LITE_SPI_araddr;
                read_enable <= 1'b1;
            end else begin
                AXI_LITE_SPI_arready <= 1'b0;
            end

            // Handle read data
            if (read_enable && !AXI_LITE_SPI_rvalid) begin
                AXI_LITE_SPI_rvalid <= 1'b1;
                AXI_LITE_SPI_rdata <= {24'h0, pmod_data};
                AXI_LITE_SPI_rresp <= 2'b00; // OKAY
                read_enable <= 1'b0;
            end else if (AXI_LITE_SPI_rready && AXI_LITE_SPI_rvalid) begin
                AXI_LITE_SPI_rvalid <= 1'b0;
            end
        end
    end

    // Update Pmod output pins
    assign Pmod_out_pin1 = pmod_data[0];
    assign Pmod_out_pin2 = pmod_data[1];
    assign Pmod_out_pin3 = pmod_data[2];
    assign Pmod_out_pin4 = pmod_data[3];
    assign Pmod_out_pin5 = pmod_data[4];
    assign Pmod_out_pin6 = pmod_data[5];
    assign Pmod_out_pin7 = pmod_data[6];
    assign Pmod_out_pin8 = pmod_data[7];
    assign Pmod_out_pin9 = 1'b0; // Not used
    assign Pmod_out_pin10 = 1'b0; // Not used

endmodule