`timescale 1ns / 1ps

module origen_191230 #(
    parameter WIDTH = 32,
    parameter DEPTH = 7
)
(
    output reg [WIDTH-1:0] data_out,
    input [WIDTH-1:0] data_in,
    output reg [(DEPTH+1):0] wr_ptr_wr,
    output reg [(DEPTH+1):0] rd_ptr_rd,
    input clk_in,
    input clk_out,
    input insert,
    input remove,
    input flush,
    input reset
);

localparam pointer_limit = (1 << DEPTH);
reg [WIDTH-1:0] fifo [(pointer_limit-1):0];

[MASKED]

always @(posedge clk_out or posedge reset) begin
    if (reset) begin
        rd_ptr_rd <= 0;
    end
    else if (flush) begin
        rd_ptr_rd <= 0;
    end
    else if (remove) begin
        data_out <= fifo[rd_ptr_rd[DEPTH-1:0]];
        rd_ptr_rd <= rd_ptr_rd + 1;
    end
end

endmodule