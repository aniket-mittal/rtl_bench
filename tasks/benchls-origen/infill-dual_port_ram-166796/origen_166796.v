module origen_166796 #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 10,
    parameter RAM_TYPE = "BLOCK"
)(
    input clk,
    input reset,
    input s_read_req,
    input [ADDR_WIDTH-1:0] s_read_addr,
    input s_write_req,
    input [ADDR_WIDTH-1:0] s_write_addr,
    input [DATA_WIDTH-1:0] s_write_data,
    output reg [DATA_WIDTH-1:0] s_read_data
);

    reg [DATA_WIDTH-1:0] memory [2**ADDR_WIDTH-1:0];
    reg [ADDR_WIDTH-1:0] rd_addr;
    reg [ADDR_WIDTH-1:0] wr_addr;
    reg [DATA_WIDTH-1:0] wr_data;
    reg rd_addr_v, wr_addr_v;

    [MASKED]

endmodule