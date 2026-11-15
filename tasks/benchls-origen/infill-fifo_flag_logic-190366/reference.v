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

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            fifo_full <= 1'b0;
            fifo_empty <= 1'b1;
            fifo_threshold <= 1'b0;
            fifo_overflow <= 1'b0;
            fifo_underflow <= 1'b0;
        end
        else begin
            // Set fifo_full and fifo_empty flags
            fifo_full <= fbit_comp & pointer_equal;
            fifo_empty <= ~fbit_comp & pointer_equal;

            // Set fifo_threshold flag
            fifo_threshold <= (pointer_result >= 5'd3);

            // Detect and set fifo_overflow and fifo_underflow flags
            if (fifo_we & fifo_full)
                fifo_overflow <= 1'b1;
            else if (fifo_rd)
                fifo_overflow <= 1'b0;

            if (fifo_rd & fifo_empty)
                fifo_underflow <= 1'b1;
            else if (fifo_we)
                fifo_underflow <= 1'b0;
        end
    end

endmodule