`timescale 1ns / 1ps

module origen_216378 #(
    parameter DATA_WIDTH = 8,
    parameter FIFO_DEPTH = 8
)
(
    input  wire                  i_clk,
    input  wire                  i_rts_n,
    input  wire [DATA_WIDTH-1:0] i_data,
    input  wire                  i_push,
    input  wire                  i_pop,
    output wire [DATA_WIDTH-1:0] o_data,
    output wire                  o_empty,
    output wire                  o_full
);

localparam FIFO_WIDTH = clogb2(FIFO_DEPTH-1);

reg [FIFO_WIDTH-1:0] head;
reg [FIFO_WIDTH-1:0] tail;
reg [FIFO_WIDTH:0]   counter;

reg [DATA_WIDTH-1:0] data [FIFO_DEPTH-1:0];

assign o_data = data[tail];
assign o_empty = (counter == 0);
assign o_full = (counter == FIFO_DEPTH);

[MASKED]

function integer clogb2;
    input [31:0] value;
    begin
        value = value - 1;
        for (clogb2 = 0; value > 0; clogb2 = clogb2 + 1)
            value = value >> 1;
    end
endfunction

endmodule