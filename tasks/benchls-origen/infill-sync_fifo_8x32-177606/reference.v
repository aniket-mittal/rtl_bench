module origen_177606 #(
    parameter DATA_WIDTH = 32,
    parameter FIFO_DEPTH = 8
)
(
    output [DATA_WIDTH-1:0] fifo_rd_data,
    output fifo_full,
    output fifo_empty,
    output reg fifo_rd_err,
    output reg fifo_wr_err,
    input [DATA_WIDTH-1:0] fifo_wr_data,
    input fifo_wr_en,
    input fifo_rd_en,
    input clk,
    input rst_n
);

    reg [DATA_WIDTH-1:0] fifo_mem [FIFO_DEPTH-1:0];
    reg [3:0] fifo_wr_addr;
    reg [3:0] fifo_rd_addr;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            fifo_wr_addr <= 4'b0;
            fifo_rd_addr <= 4'b0;
            fifo_rd_err <= 1'b0;
            fifo_wr_err <= 1'b0;
        end
        else begin
            // Write operation
            if (fifo_wr_en && !fifo_full) begin
                fifo_mem[fifo_wr_addr[2:0]] <= fifo_wr_data;
                fifo_wr_addr <= fifo_wr_addr + 1'b1;
                fifo_wr_err <= 1'b0;
            end
            else if (fifo_wr_en && fifo_full) begin
                fifo_wr_err <= 1'b1;
            end

            // Read operation
            if (fifo_rd_en && !fifo_empty) begin
                fifo_rd_addr <= fifo_rd_addr + 1'b1;
                fifo_rd_err <= 1'b0;
            end
            else if (fifo_rd_en && fifo_empty) begin
                fifo_rd_err <= 1'b1;
            end
        end
    end

    assign fifo_rd_data = fifo_mem[fifo_rd_addr[2:0]];
    assign fifo_full = (fifo_wr_addr[2:0] == fifo_rd_addr[2:0]) && (fifo_wr_addr[3] ^ fifo_rd_addr[3]);
    assign fifo_empty = (fifo_wr_addr == fifo_rd_addr);

endmodule