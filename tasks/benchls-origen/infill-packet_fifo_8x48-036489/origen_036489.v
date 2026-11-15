module origen_036489 (
    input wire clk,
    input wire rstp,
    input wire [7:0] src_in,
    input wire [7:0] dst_in,
    input wire [31:0] data_in,
    input wire writep,
    input wire readp,
    output reg [7:0] src_out,
    output reg [7:0] dst_out,
    output reg [31:0] data_out,
    output reg emptyp,
    output reg fullp
);

    parameter DEPTH = 2;
    parameter FULL = 8;
    parameter EMPTY = 8;

    reg [47:0] fifomem [0:7];
    reg [2:0] head, tail;
    reg [3:0] count;

    [MASKED]

endmodule