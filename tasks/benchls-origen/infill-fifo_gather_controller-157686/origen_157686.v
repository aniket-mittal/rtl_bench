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

[MASKED]

always @(*) begin
    if (fifo_2_empty) begin
        fifo_2_rd <= 0;
    end
    else begin
        fifo_2_rd <= 1;
    end
end

endmodule