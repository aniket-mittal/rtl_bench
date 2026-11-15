module origen_116438 #
(
    parameter integer C_S00_AXI_DATA_WIDTH = 32,
    parameter integer C_S00_AXI_ADDR_WIDTH = 10
)
(
    input wire s00_axi_aclk,
    input wire s00_axi_aresetn,
    
    // Write address channel
    input wire [C_S00_AXI_ADDR_WIDTH-1:0] s00_axi_awaddr,
    input wire s00_axi_awvalid,
    output reg s00_axi_awready,
    
    // Write data channel
    input wire [C_S00_AXI_DATA_WIDTH-1:0] s00_axi_wdata,
    input wire [(C_S00_AXI_DATA_WIDTH/8)-1:0] s00_axi_wstrb,
    input wire s00_axi_wvalid,
    output reg s00_axi_wready,
    
    // Write response channel
    output reg [1:0] s00_axi_bresp,
    output reg s00_axi_bvalid,
    input wire s00_axi_bready,
    
    // Read address channel
    input wire [C_S00_AXI_ADDR_WIDTH-1:0] s00_axi_araddr,
    input wire s00_axi_arvalid,
    output reg s00_axi_arready,
    
    // Read data channel
    output reg [C_S00_AXI_DATA_WIDTH-1:0] s00_axi_rdata,
    output reg [1:0] s00_axi_rresp,
    output reg s00_axi_rvalid,
    input wire s00_axi_rready
);

    reg [31:0] rd_data;
    reg [31:0] wr_word;
    reg [3:0] rd_addr;
    reg read_state;

    // Initialize registers
    initial begin
        rd_data = 32'hABCD0000;
        wr_word = 32'h0;
        rd_addr = 4'h0;
        read_state = 1'b0;
    end

    // Write operation
    always @(posedge s00_axi_aclk) begin
        if (!s00_axi_aresetn) begin
            s00_axi_awready <= 1'b0;
            s00_axi_wready <= 1'b0;
            s00_axi_bvalid <= 1'b0;
            wr_word <= 32'h0;
        end else begin
            if (s00_axi_awvalid && s00_axi_wvalid && s00_axi_bready && !s00_axi_bvalid) begin
                s00_axi_awready <= 1'b1;
                s00_axi_wready <= 1'b1;
                wr_word <= s00_axi_wdata;
                s00_axi_bvalid <= 1'b1;
                s00_axi_bresp <= 2'b00;
            end else begin
                s00_axi_awready <= 1'b0;
                s00_axi_wready <= 1'b0;
                if (s00_axi_bready && s00_axi_bvalid) begin
                    s00_axi_bvalid <= 1'b0;
                end
            end
        end
    end

    // Read operation
    always @(posedge s00_axi_aclk) begin
        if (!s00_axi_aresetn) begin
            s00_axi_arready <= 1'b0;
            s00_axi_rvalid <= 1'b0;
            s00_axi_rdata <= 32'h0;
            s00_axi_rresp <= 2'b00;
            rd_addr <= 4'h0;
            read_state <= 1'b0;
        end else begin
            case (read_state)
                1'b0: begin
                    if (s00_axi_arvalid && !s00_axi_rvalid) begin
                        s00_axi_arready <= 1'b1;
                        rd_addr <= s00_axi_araddr[3:0];
                        read_state <= 1'b1;
                    end
                end
                1'b1: begin
                    s00_axi_arready <= 1'b0;
                    s00_axi_rvalid <= 1'b1;
                    s00_axi_rresp <= 2'b00;
                    if (rd_addr == 4'h0) begin
                        rd_data <= rd_data + 1;
                        s00_axi_rdata <= rd_data;
                    end else begin
                        s00_axi_rdata <= wr_word;
                    end
                    if (s00_axi_rready && s00_axi_rvalid) begin
                        s00_axi_rvalid <= 1'b0;
                        read_state <= 1'b0;
                    end
                end
            endcase
        end
    end

endmodule