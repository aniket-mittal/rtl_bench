module origen_136184 (
    input wire ARESETN,
    input wire ACLK,
    input wire [31:0] S_AXI_AWADDR,
    input wire [3:0] S_AXI_AWCACHE,
    input wire [2:0] S_AXI_AWPROT,
    input wire S_AXI_AWVALID,
    output reg S_AXI_AWREADY,
    input wire [31:0] S_AXI_WDATA,
    input wire [3:0] S_AXI_WSTRB,
    input wire S_AXI_WVALID,
    output reg S_AXI_WREADY,
    output reg S_AXI_BVALID,
    input wire S_AXI_BREADY,
    output reg [1:0] S_AXI_BRESP,
    input wire [31:0] S_AXI_ARADDR,
    input wire [3:0] S_AXI_ARCACHE,
    input wire [2:0] S_AXI_ARPROT,
    input wire S_AXI_ARVALID,
    output reg S_AXI_ARREADY,
    output reg [31:0] S_AXI_RDATA,
    output reg [1:0] S_AXI_RRESP,
    output reg S_AXI_RVALID,
    input wire S_AXI_RREADY,

    input wire LOCAL_CLK,
    output reg LOCAL_CS,
    output reg LOCAL_RNW,
    input wire LOCAL_ACK,
    output reg [31:0] LOCAL_ADDR,
    output reg [3:0] LOCAL_BE,
    output reg [31:0] LOCAL_WDATA,
    input wire [31:0] LOCAL_RDATA
);

    localparam S_IDLE = 2'b00;
    localparam S_WRITE = 2'b01;
    localparam S_WRITE2 = 2'b10;
    localparam S_READ = 2'b11;

    reg [1:0] state;
    reg [31:0] addr_reg;
    reg [31:0] data_reg;
    reg [3:0] be_reg;

    [MASKED]

endmodule