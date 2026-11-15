module origen_110873 (
    input wire [6:0] opcode,
    input wire [2:0] funct3,
    input wire [4:0] rd,
    input wire [31:0] mem_addr,
    input wire [31:0] rs2_data,
    input wire mem_valid,
    input wire data_rvalid,
    input wire [31:0] data_rdata_in,
    
    output reg data_req_o,
    output reg data_we_o,
    output reg [3:0] data_be_o,
    output reg [31:0] data_addr_o,
    output reg [31:0] data_wdata_o,
    output reg [31:0] mem_data_out,
    output reg [4:0] rd_out_lsu,
    output reg rd_write
);

    wire [1:0] add;
    assign add = mem_addr[1:0];

    [MASKED]

endmodule