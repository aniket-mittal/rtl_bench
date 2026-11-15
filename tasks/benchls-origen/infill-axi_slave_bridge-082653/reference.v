module origen_082653 (
    input wire ACLK,
    input wire ARESETN,
    
    // Write Address Channel
    input wire [31:0] M_AXI_AWADDR,
    input wire [7:0] M_AXI_AWLEN,
    input wire [2:0] M_AXI_AWSIZE,
    input wire [1:0] M_AXI_AWBURST,
    input wire M_AXI_AWVALID,
    output wire M_AXI_AWREADY,
    
    // Write Data Channel
    input wire [31:0] M_AXI_WDATA,
    input wire [3:0] M_AXI_WSTRB,
    input wire M_AXI_WLAST,
    input wire M_AXI_WVALID,
    output wire M_AXI_WREADY,
    
    // Write Response Channel
    output reg [1:0] M_AXI_BRESP,
    output reg M_AXI_BVALID,
    input wire M_AXI_BREADY,
    
    // Read Address Channel
    input wire [31:0] M_AXI_ARADDR,
    input wire [7:0] M_AXI_ARLEN,
    input wire [2:0] M_AXI_ARSIZE,
    input wire [1:0] M_AXI_ARBURST,
    input wire M_AXI_ARVALID,
    output wire M_AXI_ARREADY,
    
    // Read Data Channel
    output reg [31:0] M_AXI_RDATA,
    output reg [1:0] M_AXI_RRESP,
    output reg M_AXI_RLAST,
    output reg M_AXI_RVALID,
    input wire M_AXI_RREADY
);

    reg axi_rena;
    reg [7:0] count, rcount;
    reg axi_wvalid;

    // Initialize signals
    initial begin
        M_AXI_RVALID = 1'b0;
        M_AXI_RLAST = 1'b0;
        M_AXI_BVALID = 1'b0;
        M_AXI_BRESP = 2'b00;
        M_AXI_RRESP = 2'b00;
        axi_rena = 1'b0;
        axi_wvalid = 1'b0;
        count = 8'd0;
        rcount = 8'd0;
    end

    // Always accept transactions
    assign M_AXI_AWREADY = 1'b1;
    assign M_AXI_ARREADY = 1'b1;
    assign M_AXI_WREADY = 1'b1;

    // Read transaction handling
    always @(posedge ACLK or negedge ARESETN) begin
        if (!ARESETN) begin
            axi_rena <= 1'b0;
            count <= 8'd0;
            rcount <= 8'd0;
            M_AXI_RVALID <= 1'b0;
            M_AXI_RLAST <= 1'b0;
        end else begin
            if (M_AXI_ARVALID && M_AXI_ARREADY) begin
                axi_rena <= 1'b1;
                count <= M_AXI_ARLEN;
            end

            if (axi_rena) begin
                M_AXI_RVALID <= 1'b1;
                M_AXI_RDATA <= rcount;
                rcount <= rcount + 1;

                if (count == 0) begin
                    M_AXI_RLAST <= 1'b1;
                    axi_rena <= 1'b0;
                end else begin
                    count <= count - 1;
                end
            end

            if (M_AXI_RVALID && M_AXI_RREADY) begin
                if (M_AXI_RLAST) begin
                    M_AXI_RVALID <= 1'b0;
                    M_AXI_RLAST <= 1'b0;
                end
            end
        end
    end

    // Write transaction handling
    always @(posedge ACLK or negedge ARESETN) begin
        if (!ARESETN) begin
            axi_wvalid <= 1'b0;
            M_AXI_BVALID <= 1'b0;
        end else begin
            if (M_AXI_WVALID && M_AXI_WREADY) begin
                axi_wvalid <= 1'b1;
            end

            if (M_AXI_WLAST && axi_wvalid) begin
                M_AXI_BVALID <= 1'b1;
                axi_wvalid <= 1'b0;
            end

            if (M_AXI_BVALID && M_AXI_BREADY) begin
                M_AXI_BVALID <= 1'b0;
            end
        end
    end

endmodule