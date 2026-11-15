module origen_157686(
    input   clk_20M,
    input   fifo_1_full,
    input   fifo_1_empty,
    input   fifo_2_empty,
    input   [1:0] gather_set,
    input   trigger_activation,
    output  reg fifo_1_wr,
    output  reg fifo_1_rd,
    output  reg fifo_2_wr,
    output  reg fifo_2_rd,
    output  reg fifo_full_rst
);

reg [11:0] cnt;
reg flag;

always @(posedge clk_20M) begin
    if (gather_set == 2'b00) begin
        fifo_full_rst <= 1;
        flag <= 0;
    end
    else if (gather_set == 2'b01) begin
        if (cnt == 0 && trigger_activation && fifo_2_empty) begin
            fifo_1_wr <= 1;
            fifo_1_rd <= 0;
            fifo_2_wr <= 0;
            fifo_full_rst <= 0;
        end
        else if (cnt == 11'b01000000000) begin
            fifo_1_wr <= 1;
            fifo_1_rd <= 1;
            fifo_2_wr <= 1;
        end
        else if (cnt == 11'b10000000000) begin
            fifo_1_wr <= 0;
            fifo_1_rd <= 1;
            fifo_2_wr <= 1;
        end
        else if (fifo_1_empty && !fifo_2_empty) begin
            fifo_1_wr <= 0;
            fifo_1_rd <= 0;
            fifo_2_wr <= 0;
        end
        else begin
            fifo_1_wr <= 0;
            fifo_1_rd <= 0;
            fifo_2_wr <= 0;
        end
        if (cnt == 11'b10000000000) begin
            cnt <= 0;
        end
        else begin
            cnt <= cnt + 1;
        end
    end
    else if (gather_set == 2'b10) begin
        if (cnt == 0 && trigger_activation && fifo_1_empty) begin
            fifo_1_wr <= 0;
            fifo_1_rd <= 1;
            fifo_2_wr <= 1;
        end
        else if (cnt == 11'b01000000000) begin
            fifo_1_wr <= 1;
            fifo_1_rd <= 1;
            fifo_2_wr <= 1;
        end
        else if (cnt == 11'b10000000000) begin
            fifo_1_wr <= 1;
            fifo_1_rd <= 0;
            fifo_2_wr <= 0;
        end
        else if (fifo_1_empty && !fifo_2_empty) begin
            fifo_1_wr <= 0;
            fifo_1_rd <= 0;
            fifo_2_wr <= 0;
        end
        else begin
            fifo_1_wr <= 0;
            fifo_1_rd <= 0;
            fifo_2_wr <= 0;
        end
        if (cnt == 11'b10000000000) begin
            cnt <= 0;
        end
        else begin
            cnt <= cnt + 1;
        end
    end
    else if (gather_set == 2'b11) begin
        fifo_1_wr <= 0;
        fifo_1_rd <= 0;
        fifo_2_wr <= 0;
    end
end

always @(*) begin
    if (fifo_2_empty) begin
        fifo_2_rd <= 0;
    end
    else begin
        fifo_2_rd <= 1;
    end
end

endmodule