module origen_128450 (
    input wire clk,
    input wire srst,
    input wire [15:0] din,
    input wire wr_en,
    input wire rd_en,
    output reg [15:0] dout,
    output wire full,
    output wire empty,
    output wire prog_full
);

    // Parameters
    parameter DEPTH = 512;
    parameter WIDTH = 16;
    parameter PROG_FULL_THRESH = DEPTH - 32;

    // Internal signals
    reg [WIDTH-1:0] mem [0:DEPTH-1];
    reg [$clog2(DEPTH):0] wr_ptr, rd_ptr;
    wire [$clog2(DEPTH):0] count;

    // Write and read pointers
    always @(posedge clk) begin
        if (srst) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
        end else begin
            if (wr_en && !full)
                wr_ptr <= wr_ptr + 1;
            if (rd_en && !empty)
                rd_ptr <= rd_ptr + 1;
        end
    end

    // Memory write operation
    always @(posedge clk) begin
        if (wr_en && !full)
            mem[wr_ptr[($clog2(DEPTH)-1):0]] <= din;
    end

    // Memory read operation
    always @(posedge clk) begin
        if (srst)
            dout <= 0;
        else if (rd_en && !empty)
            dout <= mem[rd_ptr[($clog2(DEPTH)-1):0]];
    end

    // Count calculation
    assign count = wr_ptr - rd_ptr;

    // Flag generation
    assign full = (count == DEPTH);
    assign empty = (count == 0);
    assign prog_full = (count >= PROG_FULL_THRESH);

endmodule