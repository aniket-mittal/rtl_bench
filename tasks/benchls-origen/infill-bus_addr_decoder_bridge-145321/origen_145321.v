module origen_145321 #(
    parameter ADDR_MASK = 22'h3FFFFF,
    parameter ADDR_BASE = 22'h000000
) (
    input wire rst,
    input wire clk,
    input wire [68:0] rcn_in,
    output reg [68:0] rcn_out,
    output reg cs,
    output reg wr,
    output reg [7:0] mask,
    output reg [21:0] addr,
    output reg [31:0] wdata,
    input wire [31:0] rdata
);

    wire [21:0] rcn_addr;
    wire [31:0] rcn_data;
    wire [7:0] rcn_mask;
    wire rcn_valid, rcn_write;

    assign rcn_valid = rcn_in[68] & rcn_in[67];
    assign rcn_write = rcn_in[66];
    assign rcn_addr = rcn_in[55:34];
    assign rcn_mask = rcn_in[33:26];
    assign rcn_data = rcn_in[31:0];

    wire addr_match;
    assign addr_match = ((rcn_addr & ADDR_MASK) == (ADDR_BASE & ADDR_MASK));

    [MASKED]

endmodule