module origen_152760 (
    input HCLK,
    input HRESETn,
    input HSEL,
    input [31:0] HADDR,
    input [1:0] HTRANS,
    input [2:0] HSIZE,
    input [3:0] HPROT,
    input HWRITE,
    input [31:0] HWDATA,
    input HREADY,
    input SLEEPing,
    output reg HREADYOUT,
    output reg [31:0] HRDATA,
    output reg [1:0] HRESP,
    output reg DMAstart,
    output reg [31:0] DMAsrc,
    output reg [31:0] DMAdst,
    output reg [1:0] DMAsize,
    output reg [31:0] DMAlen
);

    reg dma;
    reg [31:0] dma_src_addr;
    reg [31:0] dma_dst_addr;
    reg [1:0] dma_size;
    reg [31:0] dma_len;

    always @(posedge HCLK or negedge HRESETn) begin
        if (!HRESETn) begin
            dma <= 1'b0;
            dma_src_addr <= 32'h0;
            dma_dst_addr <= 32'h0;
            dma_size <= 2'b0;
            dma_len <= 32'h0;
            HREADYOUT <= 1'b1;
            HRDATA <= 32'h0;
            HRESP <= 2'b0;
            DMAstart <= 1'b0;
        end
        else begin
            HREADYOUT <= 1'b1;
            HRESP <= 2'b0;
            DMAstart <= 1'b0;

            if (HSEL) begin
                if (HWRITE) begin
                    case (HADDR[7:0])
                        8'h00: begin
                            dma_src_addr <= HWDATA;
                            dma <= 1'b1;
                        end
                        8'h04: begin
                            dma_dst_addr <= HWDATA;
                            dma <= 1'b1;
                        end
                        8'h08: begin
                            dma_size <= HWDATA[1:0];
                            dma <= 1'b1;
                        end
                        8'h0C: begin
                            dma_len <= HWDATA;
                            dma <= 1'b1;
                        end
                        default: begin
                            dma <= dma;
                        end
                    endcase
                end
                else begin
                    case (HADDR[7:0])
                        8'h00: HRDATA <= dma_src_addr;
                        8'h04: HRDATA <= dma_dst_addr;
                        8'h08: HRDATA <= {30'b0, dma_size};
                        8'h0C: HRDATA <= dma_len;
                        default: HRDATA <= 32'h0;
                    endcase
                end
            end

            if (dma && SLEEPing) begin
                DMAstart <= 1'b1;
                DMAsrc <= dma_src_addr;
                DMAdst <= dma_dst_addr;
                DMAsize <= dma_size;
                DMAlen <= dma_len;
                dma <= 1'b0;
            end
        end
    end

endmodule