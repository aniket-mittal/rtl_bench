module rtlpp_03361(
    input aclk,
    input aresetn,
    input [31:0] s_axi_awaddr,
    input [2:0] s_axi_awprot,
    input [0:0] s_axi_awvalid,
    output reg [0:0] s_axi_awready,
    input [31:0] s_axi_wdata,
    input [3:0] s_axi_wstrb,
    input [0:0] s_axi_wvalid,
    output reg [0:0] s_axi_wready,
    output reg [1:0] s_axi_bresp,
    output reg [0:0] s_axi_bvalid,
    input [0:0] s_axi_bready,
    input [31:0] s_axi_araddr,
    input [2:0] s_axi_arprot,
    input [0:0] s_axi_arvalid,
    output reg [0:0] s_axi_arready,
    output reg [31:0] s_axi_rdata,
    output reg [1:0] s_axi_rresp,
    output reg [0:0] s_axi_rvalid,
    input [0:0] s_axi_rready,
    output reg [127:0] m_axi_awaddr,
    output reg [11:0] m_axi_awprot,
    output reg [3:0] m_axi_awvalid,
    input [3:0] m_axi_awready,
    output reg [127:0] m_axi_wdata,
    output reg [15:0] m_axi_wstrb,
    output reg [3:0] m_axi_wvalid,
    input [3:0] m_axi_wready,
    input [7:0] m_axi_bresp,
    input [3:0] m_axi_bvalid,
    output reg [3:0] m_axi_bready,
    output reg [127:0] m_axi_araddr,
    output reg [11:0] m_axi_arprot,
    output reg [3:0] m_axi_arvalid,
    input [3:0] m_axi_arready,
    input [127:0] m_axi_rdata,
    input [7:0] m_axi_rresp,
    input [3:0] m_axi_rvalid,
    output reg [3:0] m_axi_rready
);

always @(posedge aclk) begin
    if (!aresetn) begin
        s_axi_awready <= 0;
        s_axi_wready <= 0;
        s_axi_bresp <= 0;
        s_axi_bvalid <= 0;
        s_axi_arready <= 0;
        s_axi_rdata <= 0;
        s_axi_rresp <= 0;
        s_axi_rvalid <= 0;
        m_axi_awaddr <= 0;
        m_axi_awprot <= 0;
        m_axi_awvalid <= 0;
        m_axi_wdata <= 0;
        m_axi_wstrb <= 0;
        m_axi_wvalid <= 0;
        m_axi_bready <= 0;
        m_axi_araddr <= 0;
        m_axi_arprot <= 0;
        m_axi_arvalid <= 0;
        m_axi_rready <= 0;
    end else begin
        // Logic for AXI write address channel
        if (s_axi_awvalid && !s_axi_awready) begin
            m_axi_awaddr <= {4{s_axi_awaddr}};
            m_axi_awprot <= {4{s_axi_awprot}};
            m_axi_awvalid <= 4'b1111;
            s_axi_awready <= 1'b1;
        end else if (m_axi_awready == 4'b1111) begin
            m_axi_awvalid <= 4'b0000;
            s_axi_awready <= 1'b0;
        end

        // Logic for AXI write data channel
        if (s_axi_wvalid && !s_axi_wready) begin
            m_axi_wdata <= {4{s_axi_wdata}};
            m_axi_wstrb <= {4{s_axi_wstrb}};
            m_axi_wvalid <= 4'b1111;
            s_axi_wready <= 1'b1;
        end else if (m_axi_wready == 4'b1111) begin
            m_axi_wvalid <= 4'b0000;
            s_axi_wready <= 1'b0;
        end

        // Logic for AXI write response channel
        if (m_axi_bvalid == 4'b1111 && !s_axi_bready) begin
            s_axi_bresp <= m_axi_bresp[1:0];
            s_axi_bvalid <= 1'b1;
        end else if (s_axi_bready) begin
            s_axi_bvalid <= 1'b0;
        end

        // Logic for AXI read address channel
        if (s_axi_arvalid && !s_axi_arready) begin
            m_axi_araddr <= {4{s_axi_araddr}};
            m_axi_arprot <= {4{s_axi_arprot}};
            m_axi_arvalid <= 4'b1111;
            s_axi_arready <= 1'b1;
        end else if (m_axi_arready == 4'b1111) begin
            m_axi_arvalid <= 4'b0000;
            s_axi_arready <= 1'b0;
        end

        // Logic for AXI read data channel
        if (m_axi_rvalid == 4'b1111 && !s_axi_rready) begin
            s_axi_rdata <= m_axi_rdata[31:0];
            s_axi_rresp <= m_axi_rresp[1:0];
            s_axi_rvalid <= 1'b1;
        end else if (s_axi_rready) begin
            s_axi_rvalid <= 1'b0;
        end

        // Logic for AXI read ready signal
        if (m_axi_rvalid == 4'b1111) begin
            m_axi_rready <= 4'b1111;
        end else begin
            m_axi_rready <= 4'b0000;
        end
    end
end

endmodule