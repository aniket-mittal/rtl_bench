module origen_190366(
    input wr,
    input rd,
    input fifo_we,
    input fifo_rd,
    input [4:0] wptr,
    input [4:0] rptr,
    input clk,
    input rst_n,
    output reg fifo_full,
    output reg fifo_empty,
    output reg fifo_threshold,
    output reg fifo_overflow,
    output reg fifo_underflow
);

    wire fbit_comp;
    wire pointer_equal;
    reg [4:0] pointer_result;

    assign fbit_comp = wptr[4] ^ rptr[4];
    assign pointer_equal = (wptr == rptr);

    always @(*) begin
        pointer_result = wptr - rptr;
    end

    [MASKED]

endmodule