module origen_074437 #(
    parameter FIFO_WIDTH = 8,
    parameter FIFO_LENGTH = 16
) (
    input wire i_clk,
    input wire i_reset_n,
    input wire i_push,
    input wire i_pop,
    input wire i_enable,
    input wire [FIFO_WIDTH-1:0] i_data,
    output reg o_full,
    output reg o_empty,
    output reg [FIFO_WIDTH-1:0] o_data
);

    reg [FIFO_WIDTH-1:0] fifo_mem [0:FIFO_LENGTH-1];
    reg [$clog2(FIFO_LENGTH):0] r_counter;
    reg [$clog2(FIFO_LENGTH)-1:0] wr_pnt, rd_pnt;

    always @(posedge i_clk or negedge i_reset_n) begin
        if (!i_reset_n) begin
            r_counter <= 0;
            wr_pnt <= 0;
            rd_pnt <= 0;
            o_full <= 0;
            o_empty <= 1;
            o_data <= 0;
        end else if (i_enable) begin
            if (i_push && !i_pop && !o_full) begin
                fifo_mem[wr_pnt] <= i_data;
                wr_pnt <= (wr_pnt == FIFO_LENGTH-1) ? 0 : wr_pnt + 1;
                r_counter <= r_counter + 1;
            end else if (!i_push && i_pop && !o_empty) begin
                o_data <= fifo_mem[rd_pnt];
                rd_pnt <= (rd_pnt == FIFO_LENGTH-1) ? 0 : rd_pnt + 1;
                r_counter <= r_counter - 1;
            end else if (i_push && i_pop) begin
                if (!o_empty) begin
                    o_data <= fifo_mem[rd_pnt];
                    rd_pnt <= (rd_pnt == FIFO_LENGTH-1) ? 0 : rd_pnt + 1;
                end
                if (!o_full) begin
                    fifo_mem[wr_pnt] <= i_data;
                    wr_pnt <= (wr_pnt == FIFO_LENGTH-1) ? 0 : wr_pnt + 1;
                end
            end

            o_full <= (r_counter == FIFO_LENGTH);
            o_empty <= (r_counter == 0);
        end
    end

endmodule