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

    [MASKED]

endmodule