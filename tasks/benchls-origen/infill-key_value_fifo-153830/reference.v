module origen_153830 #(
    parameter KEY_WIDTH = 8,
    parameter DATA_WIDTH = 32,
    parameter DEPTH = 16
) (
    input rst,
    input clk,
    input pu_en,
    input [KEY_WIDTH + DATA_WIDTH - 1:0] pu_data,
    input po_en,
    input sr_en,
    input [KEY_WIDTH - 1:0] sr_key,
    input wr_en,
    input [KEY_WIDTH + DATA_WIDTH - 1:0] wr_data,
    input wr_invalidate,
    output ready,
    output full,
    output empty,
    output [DATA_WIDTH - 1:0] po_data,
    output po_vld,
    output [DATA_WIDTH - 1:0] sr_data,
    output sr_vld,
    output sr_mhe
);

    localparam LG_DEPTH = $clog2(DEPTH);

    reg [KEY_WIDTH + DATA_WIDTH - 1:0] fifo[DEPTH - 1:0];
    reg [LG_DEPTH - 1:0] head, tail;
    reg [LG_DEPTH:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            head <= 0;
            tail <= 0;
            count <= 0;
        end else begin
            if (pu_en && !full) begin
                fifo[tail] <= pu_data;
                tail <= (tail == DEPTH - 1) ? 0 : tail + 1;
                count <= count + 1;
            end
            if (po_en && !empty) begin
                head <= (head == DEPTH - 1) ? 0 : head + 1;
                count <= count - 1;
            end
            if (wr_en) begin
                for (int i = 0; i < DEPTH; i++) begin
                    if (fifo[i][KEY_WIDTH - 1:0] == wr_data[KEY_WIDTH - 1:0]) begin
                        if (wr_invalidate) begin
                            fifo[i][DATA_WIDTH + KEY_WIDTH - 1:KEY_WIDTH] <= 0;
                        end else begin
                            fifo[i] <= wr_data;
                        end
                    end
                end
            end
        end
    end

    assign ready = 1'b1;
    assign full = (count == DEPTH);
    assign empty = (count == 0);
    assign po_data = fifo[head][DATA_WIDTH - 1:0];
    assign po_vld = !empty;

    reg [DATA_WIDTH - 1:0] search_result;
    reg search_valid;
    reg search_multiple_hits;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            search_result <= 0;
            search_valid <= 0;
            search_multiple_hits <= 0;
        end else if (sr_en) begin
            search_result <= 0;
            search_valid <= 0;
            search_multiple_hits <= 0;
            for (int i = 0; i < DEPTH; i++) begin
                if (fifo[i][KEY_WIDTH - 1:0] == sr_key) begin
                    if (search_valid) begin
                        search_multiple_hits <= 1;
                    end else begin
                        search_result <= fifo[i][DATA_WIDTH + KEY_WIDTH - 1:KEY_WIDTH];
                        search_valid <= 1;
                    end
                end
            end
        end
    end

    assign sr_data = search_result;
    assign sr_vld = search_valid;
    assign sr_mhe = search_multiple_hits;

endmodule