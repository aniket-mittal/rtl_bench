module origen_142084 (
    input wire s_axi_aclk,
    input wire s_axi_aresetn,
    input wire s_axi_awvalid,
    input wire [31:0] s_axi_awaddr,
    input wire s_axi_wvalid,
    input wire [31:0] s_axi_wdata,
    input wire [3:0] s_axi_wstrb,
    input wire s_axi_bready,
    input wire s_axi_arvalid,
    input wire [31:0] s_axi_araddr,
    input wire s_axi_rready,
    input wire [31:0] gpio_io_t,
    input wire gpio_xferAck_Reg,
    
    output reg s_axi_awready,
    output reg s_axi_wready,
    output reg s_axi_bvalid,
    output reg [1:0] s_axi_bresp,
    output reg s_axi_arready,
    output reg s_axi_rvalid,
    output reg [31:0] s_axi_rdata,
    output reg [31:0] gpio2_io_t,
    output reg gpio_xferAck_Reg_out
);

    // Internal registers
    reg [31:0] gpio_data;
    reg write_transaction;
    reg read_transaction;

    // AXI write transaction
    always @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (!s_axi_aresetn) begin
            s_axi_awready <= 1'b0;
            s_axi_wready <= 1'b0;
            s_axi_bvalid <= 1'b0;
            s_axi_bresp <= 2'b00;
            write_transaction <= 1'b0;
            gpio2_io_t <= 32'h0;
        end else begin
            if (s_axi_awvalid && s_axi_wvalid && !write_transaction) begin
                s_axi_awready <= 1'b1;
                s_axi_wready <= 1'b1;
                write_transaction <= 1'b1;
                
                // Write data to GPIO output pins
                for (int i = 0; i < 4; i++) begin
                    if (s_axi_wstrb[i]) begin
                        gpio2_io_t[i*8 +: 8] <= s_axi_wdata[i*8 +: 8];
                    end
                end
            end else if (write_transaction) begin
                s_axi_awready <= 1'b0;
                s_axi_wready <= 1'b0;
                s_axi_bvalid <= 1'b1;
                s_axi_bresp <= 2'b00; // OKAY response
                
                if (s_axi_bready) begin
                    s_axi_bvalid <= 1'b0;
                    write_transaction <= 1'b0;
                end
            end
        end
    end

    // AXI read transaction
    always @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (!s_axi_aresetn) begin
            s_axi_arready <= 1'b0;
            s_axi_rvalid <= 1'b0;
            s_axi_rdata <= 32'h0;
            read_transaction <= 1'b0;
        end else begin
            if (s_axi_arvalid && !read_transaction) begin
                s_axi_arready <= 1'b1;
                read_transaction <= 1'b1;
                
                // Read data from GPIO input pins
                s_axi_rdata <= gpio_io_t;
            end else if (read_transaction) begin
                s_axi_arready <= 1'b0;
                s_axi_rvalid <= 1'b1;
                
                if (s_axi_rready) begin
                    s_axi_rvalid <= 1'b0;
                    read_transaction <= 1'b0;
                end
            end
        end
    end

    // GPIO transfer acknowledge
    always @(posedge s_axi_aclk or negedge s_axi_aresetn) begin
        if (!s_axi_aresetn) begin
            gpio_xferAck_Reg_out <= 1'b0;
        end else begin
            gpio_xferAck_Reg_out <= gpio_xferAck_Reg;
        end
    end

endmodule