module origen_215945 #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 64
) (
    input ACLK,
    input ARESETN,
    input CONFIG_VALID,
    input [ADDR_WIDTH-1:0] CONFIG_START_ADDR,
    input [31:0] CONFIG_NBYTES,
    input [DATA_WIDTH-1:0] DATA,
    input DATA_VALID,
    output reg [ADDR_WIDTH-1:0] M_AXI_AWADDR,
    output M_AXI_AWREADY,
    output reg M_AXI_AWVALID,
    output reg [DATA_WIDTH-1:0] M_AXI_WDATA,
    output reg [7:0] M_AXI_WSTRB,
    output M_AXI_WREADY,
    output reg M_AXI_WVALID,
    output reg M_AXI_WLAST,
    input [1:0] M_AXI_BRESP,
    input M_AXI_BVALID,
    output reg M_AXI_BREADY,
    output reg [3:0] M_AXI_AWLEN,
    output reg [2:0] M_AXI_AWSIZE,
    output reg [1:0] M_AXI_AWBURST,
    output reg CONFIG_READY,
    output reg DATA_READY
);

    reg [1:0] state;
    parameter IDLE = 2'b00, RWAIT = 2'b01;

    reg [ADDR_WIDTH-1:0] a_addr;
    reg [31:0] a_count;
    reg [31:0] b_count;

    [MASKED]

    assign M_AXI_AWREADY = 1'b1;
    assign M_AXI_WREADY = 1'b1;

endmodule