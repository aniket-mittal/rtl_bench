module origen_077554 #(
    parameter FIFO_WIDTH = 14,
    parameter FIFO_DEPTH = 64
) (
    input wire clk,
    input wire rst_n,
    input wire wr_en,
    input wire [FIFO_WIDTH-1:0] wr_data,
    input wire rd_en,
    output reg fifo_full,
    output reg [$clog2(FIFO_DEPTH):0] fifo_count,
    output reg [FIFO_WIDTH-1:0] rd_data,
    output reg fifo_empty,
    output reg fifo_almst_empty
);

    // Local parameters
    localparam ADDR_WIDTH = $clog2(FIFO_DEPTH);

    // Internal signals
    reg [ADDR_WIDTH-1:0] wr_ptr, rd_ptr;
    reg [FIFO_WIDTH-1:0] fifo_mem [0:FIFO_DEPTH-1];

    // FIFO control logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            fifo_count <= 0;
            fifo_full <= 0;
            fifo_empty <= 1;
            fifo_almst_empty <= 1;
        end else begin
            // Write operation
            if (wr_en && !fifo_full) begin
                fifo_mem[wr_ptr] <= wr_data;
                wr_ptr <= (wr_ptr == FIFO_DEPTH-1) ? 0 : wr_ptr + 1;
                fifo_count <= fifo_count + 1;
            end

            // Read operation
            if (rd_en && !fifo_empty) begin
                rd_data <= fifo_mem[rd_ptr];
                rd_ptr <= (rd_ptr == FIFO_DEPTH-1) ? 0 : rd_ptr + 1;
                fifo_count <= fifo_count - 1;
            end

            // Update status flags
            fifo_full <= (fifo_count == FIFO_DEPTH);
            fifo_empty <= (fifo_count == 0);
            fifo_almst_empty <= (fifo_count < FIFO_DEPTH/2);
        end
    end

endmodule