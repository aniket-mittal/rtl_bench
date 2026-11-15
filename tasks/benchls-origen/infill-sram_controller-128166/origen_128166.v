module origen_128166 #(
    parameter WIDTH = 32,
    parameter DEPTH = 19
)(
    input wire clk,
    input wire rst,
    input wire [WIDTH-1:0] RAM_D_pi,
    output reg [WIDTH-1:0] RAM_D_po,
    output reg RAM_D_poe,
    output reg [DEPTH-1:0] RAM_A,
    output reg RAM_WEn,
    output reg RAM_CENn,
    output reg RAM_LDn,
    output reg RAM_OEn,
    output reg RAM_CE1n,
    output reg correct
);

reg [18:0] write_count;
reg [18:0] read_count;
reg enable;
reg write;
reg write_cycle;
reg read_cycle;
reg enable_reads;
reg [DEPTH-1:0] address;
reg [WIDTH-1:0] data_out;
wire [WIDTH-1:0] data_in;
wire data_in_valid;
reg [WIDTH-1:0] check_data;
reg [WIDTH-1:0] check_data_old;
reg [WIDTH-1:0] check_data_old2;

assign data_in = RAM_D_pi;
assign data_in_valid = ~RAM_OEn & ~RAM_CENn;

[MASKED]

endmodule