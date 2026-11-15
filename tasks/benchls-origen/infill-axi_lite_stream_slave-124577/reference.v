module origen_124577 (
    // AXI Slave Bus Interface
    input wire s00_axi_aclk,
    input wire s00_axi_aresetn,
    input wire [3:0] s00_axi_awaddr,
    input wire [2:0] s00_axi_awprot,
    input wire s00_axi_awvalid,
    input wire [31:0] s00_axi_wdata,
    input wire [3:0] s00_axi_wstrb,
    input wire s00_axi_wvalid,
    input wire s00_axi_bready,
    input wire [3:0] s00_axi_araddr,
    input wire [2:0] s00_axi_arprot,
    input wire s00_axi_arvalid,
    input wire s00_axi_rready,
    output reg s00_axi_awready,
    output reg s00_axi_wready,
    output reg [1:0] s00_axi_bresp,
    output reg s00_axi_bvalid,
    output reg s00_axi_arready,
    output reg [31:0] s00_axi_rdata,
    output reg [1:0] s00_axi_rresp,
    output reg s00_axi_rvalid,

    // AXI Master Bus Interface
    input wire m00_axis_aclk,
    input wire m00_axis_aresetn,
    input wire m00_axis_tready,
    output reg m00_axis_tvalid,
    output reg [31:0] m00_axis_tdata,
    output reg m00_axis_tlast
);

    reg [31:0] id_counter;
    reg [31:0] stream_counter;
    reg En, Finish;

    always @(posedge s00_axi_aclk or negedge s00_axi_aresetn) begin
        if (!s00_axi_aresetn) begin
            id_counter <= 0;
            stream_counter <= 0;
            En <= 0;
            Finish <= 0;
        end else begin
            if (s00_axi_awvalid && s00_axi_wvalid) begin
                En <= 1;
            end
            if (s00_axi_wdata[31]) begin
                Finish <= 1;
            end
            if (Finish) begin
                id_counter <= id_counter + 1;
                stream_counter <= stream_counter + 1;
                En <= 0;
                Finish <= 0;
            end
        end
    end

    always @(posedge m00_axis_aclk or negedge m00_axis_aresetn) begin
        if (!m00_axis_aresetn) begin
            m00_axis_tvalid <= 0;
            m00_axis_tdata <= 0;
            m00_axis_tlast <= 0;
        end else begin
            if (En && m00_axis_tready) begin
                m00_axis_tvalid <= 1;
                m00_axis_tdata <= {id_counter, s00_axi_wdata[30:0]};
                m00_axis_tlast <= Finish;
            end else begin
                m00_axis_tvalid <= 0;
            end
        end
    end

    always @(posedge s00_axi_aclk or negedge s00_axi_aresetn) begin
        if (!s00_axi_aresetn) begin
            s00_axi_awready <= 0;
            s00_axi_wready <= 0;
            s00_axi_bresp <= 0;
            s00_axi_bvalid <= 0;
            s00_axi_arready <= 0;
            s00_axi_rdata <= 0;
            s00_axi_rresp <= 0;
            s00_axi_rvalid <= 0;
        end else begin
            // Write response
            if (s00_axi_awvalid && s00_axi_wvalid) begin
                s00_axi_awready <= 1;
                s00_axi_wready <= 1;
                s00_axi_bresp <= 2'b00;
                s00_axi_bvalid <= 1;
            end else begin
                s00_axi_awready <= 0;
                s00_axi_wready <= 0;
                s00_axi_bvalid <= 0;
            end

            // Read response
            if (s00_axi_arvalid) begin
                s00_axi_arready <= 1;
                s00_axi_rdata <= stream_counter;
                s00_axi_rresp <= 2'b00;
                s00_axi_rvalid <= 1;
            end else begin
                s00_axi_arready <= 0;
                s00_axi_rvalid <= 0;
            end
        end
    end

endmodule