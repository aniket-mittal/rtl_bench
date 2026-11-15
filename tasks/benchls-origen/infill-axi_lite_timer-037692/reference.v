module origen_037692 (
    input wire clk,
    input wire rst_n,
    
    // AXI4-Lite interface
    input wire [31:0] s_axil_awaddr,
    input wire [2:0] s_axil_awprot,
    input wire s_axil_awvalid,
    output reg s_axil_awready,
    input wire [31:0] s_axil_wdata,
    input wire [3:0] s_axil_wstrb,
    input wire s_axil_wvalid,
    output reg s_axil_wready,
    output reg [1:0] s_axil_bresp,
    output reg s_axil_bvalid,
    input wire s_axil_bready,
    input wire [31:0] s_axil_araddr,
    input wire [2:0] s_axil_arprot,
    input wire s_axil_arvalid,
    output reg s_axil_arready,
    output reg [31:0] s_axil_rdata,
    output reg [1:0] s_axil_rresp,
    output reg s_axil_rvalid,
    input wire s_axil_rready,
    
    // Interrupt output
    output wire time_intr
);

    // Internal registers
    reg [63:0] mtime;
    reg [63:0] mtimecmp;

    // AXI state
    reg [31:0] read_addr;
    reg [31:0] write_addr;
    reg write_valid;
    reg [3:0] write_strb;
    reg [31:0] write_data;

    // Interrupt generation
    assign time_intr = (mtime >= mtimecmp);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mtime <= 64'h0;
            mtimecmp <= 64'hFFFFFFFFFFFFFFFF;
            s_axil_awready <= 1'b0;
            s_axil_wready <= 1'b0;
            s_axil_bvalid <= 1'b0;
            s_axil_arready <= 1'b0;
            s_axil_rvalid <= 1'b0;
            read_addr <= 32'h0;
            write_addr <= 32'h0;
            write_valid <= 1'b0;
            write_strb <= 4'h0;
            write_data <= 32'h0;
        end else begin
            // Increment mtime
            mtime <= mtime + 1;

            // AXI write address channel
            if (s_axil_awvalid && !s_axil_awready) begin
                s_axil_awready <= 1'b1;
                write_addr <= s_axil_awaddr;
            end else begin
                s_axil_awready <= 1'b0;
            end

            // AXI write data channel
            if (s_axil_wvalid && !s_axil_wready) begin
                s_axil_wready <= 1'b1;
                write_valid <= 1'b1;
                write_strb <= s_axil_wstrb;
                write_data <= s_axil_wdata;
            end else begin
                s_axil_wready <= 1'b0;
            end

            // AXI write response channel
            if (write_valid && !s_axil_bvalid) begin
                s_axil_bvalid <= 1'b1;
                write_valid <= 1'b0;
                
                if (write_addr == 32'h4000) begin
                    if (write_strb[0]) mtimecmp[7:0] <= write_data[7:0];
                    if (write_strb[1]) mtimecmp[15:8] <= write_data[15:8];
                    if (write_strb[2]) mtimecmp[23:16] <= write_data[23:16];
                    if (write_strb[3]) mtimecmp[31:24] <= write_data[31:24];
                    s_axil_bresp <= 2'b00; // OKAY
                end else if (write_addr == 32'h4004) begin
                    if (write_strb[0]) mtimecmp[39:32] <= write_data[7:0];
                    if (write_strb[1]) mtimecmp[47:40] <= write_data[15:8];
                    if (write_strb[2]) mtimecmp[55:48] <= write_data[23:16];
                    if (write_strb[3]) mtimecmp[63:56] <= write_data[31:24];
                    s_axil_bresp <= 2'b00; // OKAY
                end else begin
                    s_axil_bresp <= 2'b10; // SLVERR
                end
            end else if (s_axil_bready && s_axil_bvalid) begin
                s_axil_bvalid <= 1'b0;
            end

            // AXI read address channel
            if (s_axil_arvalid && !s_axil_arready) begin
                s_axil_arready <= 1'b1;
                read_addr <= s_axil_araddr;
            end else begin
                s_axil_arready <= 1'b0;
            end

            // AXI read data channel
            if (!s_axil_rvalid && s_axil_arready) begin
                s_axil_rvalid <= 1'b1;
                case (read_addr)
                    32'hBFF8: begin
                        s_axil_rdata <= mtime[31:0];
                        s_axil_rresp <= 2'b00; // OKAY
                    end
                    32'hBFFC: begin
                        s_axil_rdata <= mtime[63:32];
                        s_axil_rresp <= 2'b00; // OKAY
                    end
                    32'h4000: begin
                        s_axil_rdata <= mtimecmp[31:0];
                        s_axil_rresp <= 2'b00; // OKAY
                    end
                    32'h4004: begin
                        s_axil_rdata <= mtimecmp[63:32];
                        s_axil_rresp <= 2'b00; // OKAY
                    end
                    default: begin
                        s_axil_rdata <= 32'h0;
                        s_axil_rresp <= 2'b10; // SLVERR
                    end
                endcase
            end else if (s_axil_rready && s_axil_rvalid) begin
                s_axil_rvalid <= 1'b0;
            end
        end
    end

endmodule