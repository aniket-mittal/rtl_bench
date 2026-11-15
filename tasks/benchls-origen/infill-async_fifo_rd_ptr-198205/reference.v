module origen_198205 #(
    parameter ADDR_WIDTH = 4
)(
    input  wire                 clk,
    input  wire                 reset,
    input  wire                 i_rd_en,
    input  wire [ADDR_WIDTH-1:0] iv_wr_addr_bin,
    output wire [ADDR_WIDTH-1:0] ov_rd_addr_bin,
    output wire [ADDR_WIDTH-2:0] ov_rd_addr_dpram,
    output wire                 o_rd_en,
    output wire                 o_fifo_empty
);

    reg [ADDR_WIDTH-1:0] rd_addr_cnt;
    reg [ADDR_WIDTH-1:0] rd_addr_cnt_next1;
    reg [ADDR_WIDTH-1:0] rd_addr_cnt_next2;
    reg                  fifo_empty_reg;

    wire valid_rd = i_rd_en & ~fifo_empty_reg;
    wire empty_equation = (rd_addr_cnt == iv_wr_addr_bin);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            fifo_empty_reg <= 1'b1;
            rd_addr_cnt <= {ADDR_WIDTH{1'b0}};
        end
        else begin
            fifo_empty_reg <= empty_equation;
            rd_addr_cnt <= rd_addr_cnt_next2;
        end
    end

    always @(*) begin
        if (valid_rd) begin
            rd_addr_cnt_next1 = rd_addr_cnt + 1'b1;
        end
        else begin
            rd_addr_cnt_next1 = rd_addr_cnt;
        end
    end

    always @(*) begin
        if (fifo_empty_reg) begin
            rd_addr_cnt_next2 = rd_addr_cnt_next1;
        end
        else begin
            rd_addr_cnt_next2 = rd_addr_cnt_next1;
        end
    end

    assign ov_rd_addr_bin = rd_addr_cnt;
    assign ov_rd_addr_dpram = rd_addr_cnt[ADDR_WIDTH-1:1];
    assign o_rd_en = valid_rd;
    assign o_fifo_empty = fifo_empty_reg;

endmodule