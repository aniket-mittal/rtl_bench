module origen_147379 (
    input wire s_axi_aclk,
    input wire s_axi_aresetn,
    input wire [8:0] s_axi_awaddr,
    input wire s_axi_awvalid,
    output reg s_axi_awready,
    input wire [31:0] s_axi_wdata,
    input wire [3:0] s_axi_wstrb,
    input wire s_axi_wvalid,
    output reg s_axi_wready,
    output reg [1:0] s_axi_bresp,
    output reg s_axi_bvalid,
    input wire s_axi_bready,
    input wire [8:0] s_axi_araddr,
    input wire s_axi_arvalid,
    output reg s_axi_arready,
    output reg [31:0] s_axi_rdata,
    output reg [1:0] s_axi_rresp,
    output reg s_axi_rvalid,
    input wire s_axi_rready,
    input wire [3:0] gpio_io_i,
    output reg [3:0] gpio_io_o,
    output reg [3:0] gpio_io_t,
    input wire [11:0] gpio2_io_i,
    output reg [11:0] gpio2_io_o,
    output reg [11:0] gpio2_io_t
);

    // Internal registers
    reg [3:0] gpio_data;
    reg [11:0] gpio2_data;
    reg [3:0] gpio_tri;
    reg [11:0] gpio2_tri;

    // AXI write transaction
    always @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (!s_axi_aresetn) begin
            s_axi_awready <= 1'b0;
            s_axi_wready <= 1'b0;
            s_axi_bvalid <= 1'b0;
            s_axi_bresp <= 2'b00;
        end else begin
            if (s_axi_awvalid && s_axi_wvalid && !s_axi_bvalid) begin
                s_axi_awready <= 1'b1;
                s_axi_wready <= 1'b1;
                case (s_axi_awaddr[8:2])
                    7'h00: gpio_data <= s_axi_wdata[3:0];
                    7'h01: gpio_tri <= s_axi_wdata[3:0];
                    7'h08: gpio2_data <= s_axi_wdata[11:0];
                    7'h09: gpio2_tri <= s_axi_wdata[11:0];
                endcase
                s_axi_bvalid <= 1'b1;
                s_axi_bresp <= 2'b00;
            end else if (s_axi_bready && s_axi_bvalid) begin
                s_axi_awready <= 1'b0;
                s_axi_wready <= 1'b0;
                s_axi_bvalid <= 1'b0;
            end
        end
    end

    // AXI read transaction
    always @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (!s_axi_aresetn) begin
            s_axi_arready <= 1'b0;
            s_axi_rvalid <= 1'b0;
            s_axi_rresp <= 2'b00;
            s_axi_rdata <= 32'h00000000;
        end else begin
            if (s_axi_arvalid && !s_axi_rvalid) begin
                s_axi_arready <= 1'b1;
                s_axi_rvalid <= 1'b1;
                s_axi_rresp <= 2'b00;
                case (s_axi_araddr[8:2])
                    7'h00: s_axi_rdata <= {28'h0000000, gpio_data};
                    7'h01: s_axi_rdata <= {28'h0000000, gpio_tri};
                    7'h08: s_axi_rdata <= {20'h00000, gpio2_data};
                    7'h09: s_axi_rdata <= {20'h00000, gpio2_tri};
                    default: s_axi_rdata <= 32'h00000000;
                endcase
            end else if (s_axi_rready && s_axi_rvalid) begin
                s_axi_arready <= 1'b0;
                s_axi_rvalid <= 1'b0;
            end
        end
    end

    // GPIO output and tri-state control
    always @(posedge s_axi_aclk) begin
        gpio_io_o <= gpio_data;
        gpio_io_t <= gpio_tri;
        gpio2_io_o <= gpio2_data;
        gpio2_io_t <= gpio2_tri;
    end

    // GPIO input
    always @(posedge s_axi_aclk) begin
        gpio_data <= gpio_io_i;
        gpio2_data <= gpio2_io_i;
    end

endmodule