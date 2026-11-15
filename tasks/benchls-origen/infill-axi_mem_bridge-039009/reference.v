module origen_039009 (
    input wire g_clk,
    input wire g_resetn,

    // AXI Write Address Channel
    output reg mem_axi_awvalid,
    input wire mem_axi_awready,
    output reg [31:0] mem_axi_awaddr,
    output wire [2:0] mem_axi_awprot,

    // AXI Write Data Channel
    output reg mem_axi_wvalid,
    input wire mem_axi_wready,
    output reg [31:0] mem_axi_wdata,
    output reg [3:0] mem_axi_wstrb,

    // AXI Write Response Channel
    input wire mem_axi_bvalid,
    output wire mem_axi_bready,

    // AXI Read Address Channel
    output reg mem_axi_arvalid,
    input wire mem_axi_arready,
    output reg [31:0] mem_axi_araddr,
    output reg [2:0] mem_axi_arprot,

    // AXI Read Data Channel
    input wire mem_axi_rvalid,
    output wire mem_axi_rready,
    input wire [31:0] mem_axi_rdata,

    // Simple Memory Interface
    input wire mem_instr,
    input wire mem_cen,
    output wire mem_stall,
    output wire mem_error,
    input wire [31:0] mem_addr,
    input wire [31:0] mem_wdata,
    input wire [3:0] mem_wstrb,
    output wire [31:0] mem_rdata
);

    reg ack_awvalid;
    reg ack_arvalid;
    reg ack_wvalid;
    reg xfer_done;

    assign mem_axi_awprot = 3'b000;
    assign mem_axi_bready = 1'b1;
    assign mem_axi_rready = 1'b1;
    assign mem_error = 1'b0;
    assign mem_rdata = mem_axi_rdata;
    assign mem_stall = mem_cen && !xfer_done;

    always @(posedge g_clk or negedge g_resetn) begin
        if (!g_resetn) begin
            mem_axi_awvalid <= 1'b0;
            mem_axi_wvalid <= 1'b0;
            mem_axi_arvalid <= 1'b0;
            ack_awvalid <= 1'b0;
            ack_arvalid <= 1'b0;
            ack_wvalid <= 1'b0;
            xfer_done <= 1'b0;
        end else begin
            xfer_done <= mem_cen && (mem_axi_bvalid || mem_axi_rvalid);
            if (xfer_done || !mem_cen) begin
                mem_axi_awvalid <= 1'b0;
                mem_axi_wvalid <= 1'b0;
                mem_axi_arvalid <= 1'b0;
                ack_awvalid <= 1'b0;
                ack_arvalid <= 1'b0;
                ack_wvalid <= 1'b0;
            end else begin
                if (mem_cen && |mem_wstrb && !ack_awvalid && !ack_arvalid) begin
                    mem_axi_awvalid <= 1'b1;
                    mem_axi_awaddr <= mem_addr;
                end
                if (mem_cen && |mem_wstrb && !ack_wvalid && !ack_arvalid) begin
                    mem_axi_wvalid <= 1'b1;
                    mem_axi_wdata <= mem_wdata;
                    mem_axi_wstrb <= mem_wstrb;
                end
                if (mem_cen && !mem_wstrb && !ack_awvalid && !ack_arvalid) begin
                    mem_axi_arvalid <= 1'b1;
                    mem_axi_araddr <= mem_addr;
                    mem_axi_arprot <= {2'b00, mem_instr};
                end
                if (mem_axi_awready && mem_axi_awvalid)
                    ack_awvalid <= 1'b1;
                if (mem_axi_arready && mem_axi_arvalid)
                    ack_arvalid <= 1'b1;
                if (mem_axi_wready && mem_axi_wvalid)
                    ack_wvalid <= 1'b1;
                if (ack_awvalid)
                    mem_axi_awvalid <= 1'b0;
                if (ack_arvalid)
                    mem_axi_arvalid <= 1'b0;
                if (ack_wvalid)
                    mem_axi_wvalid <= 1'b0;
            end
        end
    end

endmodule