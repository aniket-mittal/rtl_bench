module origen_129512 (
    input wire s_axi_aclk,
    input wire s_axi_aresetn,
    
    // AXI-Lite Write Address Channel
    input wire [31:0] s_axi_awaddr,
    input wire s_axi_awvalid,
    output reg s_axi_awready,
    
    // AXI-Lite Write Data Channel
    input wire [31:0] s_axi_wdata,
    input wire [3:0] s_axi_wstrb,
    input wire s_axi_wvalid,
    output reg s_axi_wready,
    
    // AXI-Lite Write Response Channel
    output reg [1:0] s_axi_bresp,
    output reg s_axi_bvalid,
    input wire s_axi_bready,
    
    // AXI-Lite Read Address Channel
    input wire [31:0] s_axi_araddr,
    input wire s_axi_arvalid,
    output reg s_axi_arready,
    
    // AXI-Lite Read Data Channel
    output reg [31:0] s_axi_rdata,
    output reg [1:0] s_axi_rresp,
    output reg s_axi_rvalid,
    input wire s_axi_rready,
    
    // GPIO Output
    output reg [7:0] gpio_out
);

    // Internal registers
    reg [31:0] gpio_data;
    
    // AXI-Lite write transaction
    always @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (!s_axi_aresetn) begin
            s_axi_awready <= 1'b0;
            s_axi_wready <= 1'b0;
            s_axi_bvalid <= 1'b0;
            s_axi_bresp <= 2'b00;
            gpio_data <= 32'h0;
            gpio_out <= 8'h0;
        end else begin
            // Write address channel
            if (s_axi_awvalid && !s_axi_awready) begin
                s_axi_awready <= 1'b1;
            end else begin
                s_axi_awready <= 1'b0;
            end
            
            // Write data channel
            if (s_axi_wvalid && !s_axi_wready) begin
                s_axi_wready <= 1'b1;
                gpio_data <= s_axi_wdata;
                gpio_out <= s_axi_wdata[7:0];
            end else begin
                s_axi_wready <= 1'b0;
            end
            
            // Write response channel
            if (s_axi_bready && s_axi_bvalid) begin
                s_axi_bvalid <= 1'b0;
            end else if (s_axi_awready && s_axi_wready) begin
                s_axi_bvalid <= 1'b1;
                s_axi_bresp <= 2'b00; // OKAY response
            end
        end
    end
    
    // AXI-Lite read transaction
    always @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (!s_axi_aresetn) begin
            s_axi_arready <= 1'b0;
            s_axi_rvalid <= 1'b0;
            s_axi_rresp <= 2'b00;
            s_axi_rdata <= 32'h0;
        end else begin
            // Read address channel
            if (s_axi_arvalid && !s_axi_arready) begin
                s_axi_arready <= 1'b1;
            end else begin
                s_axi_arready <= 1'b0;
            end
            
            // Read data channel
            if (s_axi_rready && s_axi_rvalid) begin
                s_axi_rvalid <= 1'b0;
            end else if (s_axi_arready) begin
                s_axi_rvalid <= 1'b1;
                s_axi_rresp <= 2'b00; // OKAY response
                s_axi_rdata <= {24'h0, gpio_out}; // Return current state of GPIO
            end
        end
    end

endmodule