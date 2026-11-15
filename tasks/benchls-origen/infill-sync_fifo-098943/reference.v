module origen_098943 #(
    parameter DATA_WIDTH = 8,
    parameter FIFO_DEPTH = 16
) (
    input wire clk,
    input wire nrst,
    input wire wr,
    input wire rd,
    input wire [DATA_WIDTH-1:0] data_in,
    output wire [DATA_WIDTH-1:0] data_out,
    output wire fifo_full,
    output wire fifo_empty
);

    localparam ADDR_WIDTH = $clog2(FIFO_DEPTH);

    reg [DATA_WIDTH-1:0] mem [0:FIFO_DEPTH-1];
    reg [ADDR_WIDTH:0] rd_ptr, wr_ptr;
    reg r_full, r_empty;
    reg r_wr_en, r_rd_en;
    reg [DATA_WIDTH-1:0] r_data_out;

    wire [ADDR_WIDTH:0] wr_ptr_next, rd_ptr_next;

    assign wr_ptr_next = wr_ptr + 1'b1;
    assign rd_ptr_next = rd_ptr + 1'b1;

    assign fifo_full = r_full;
    assign fifo_empty = r_empty;
    assign data_out = r_data_out;

    always @(posedge clk or negedge nrst) begin
        if (!nrst) begin
            rd_ptr <= 0;
            wr_ptr <= 0;
            r_full <= 1'b0;
            r_empty <= 1'b1;
            r_data_out <= {DATA_WIDTH{1'b0}};
        end else begin
            r_wr_en <= wr && !r_full;
            r_rd_en <= rd && !r_empty;

            if (r_wr_en) begin
                mem[wr_ptr[ADDR_WIDTH-1:0]] <= data_in;
                wr_ptr <= wr_ptr_next;
            end

            if (r_rd_en) begin
                r_data_out <= mem[rd_ptr[ADDR_WIDTH-1:0]];
                rd_ptr <= rd_ptr_next;
            end

            r_full <= (wr_ptr_next[ADDR_WIDTH] != rd_ptr[ADDR_WIDTH]) &&
                      (wr_ptr_next[ADDR_WIDTH-1:0] == rd_ptr[ADDR_WIDTH-1:0]);

            r_empty <= (wr_ptr == rd_ptr);
        end
    end

endmodule