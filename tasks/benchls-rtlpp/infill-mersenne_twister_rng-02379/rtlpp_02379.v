module rtlpp_02379
(
    input wire         clk,
    input wire         rst,
    output wire [63:0] output_axis_tdata,
    output wire        output_axis_tvalid,
    input wire         output_axis_tready,
    output wire        busy,
    input wire [63:0]  seed_val,
    input wire         seed_start
);

localparam [1:0]
    STATE_IDLE = 2'd0,
    STATE_SEED = 2'd1;

reg [1:0] state_reg = STATE_IDLE, state_next;

reg [63:0] mt [311:0];
reg [63:0] mt_save_reg = 0, mt_save_next;
reg [9:0] mti_reg = 313, mti_next;

reg [63:0] y1, y2, y3, y4, y5;

reg [9:0] mt_wr_ptr;
reg [63:0] mt_wr_data;
reg mt_wr_en;

reg [9:0] mt_rd_a_ptr_reg = 0, mt_rd_a_ptr_next;
reg [63:0] mt_rd_a_data = 0;

reg [9:0] mt_rd_b_ptr_reg = 0, mt_rd_b_ptr_next;
reg [63:0] mt_rd_b_data = 0;

reg [63:0] product_reg = 0, product_next;
reg [63:0] factor1_reg = 0, factor1_next;
reg [63:0] factor2_reg = 0, factor2_next;
reg [5:0] mul_cnt_reg = 0, mul_cnt_next;

reg [63:0] output_axis_tdata_reg = 0, output_axis_tdata_next;
reg output_axis_tvalid_reg = 0, output_axis_tvalid_next;

reg busy_reg = 0;

assign output_axis_tdata = output_axis_tdata_reg;
assign output_axis_tvalid = output_axis_tvalid_reg;

assign busy = busy_reg;

[MASKED]

always @(posedge clk) begin
    if (rst) begin
        state_reg <= STATE_IDLE;
        mti_reg <= 313;
        mt_rd_a_ptr_reg <= 0;
        mt_rd_b_ptr_reg <= 0;
        product_reg <= 0;
        factor1_reg <= 0;
        factor2_reg <= 0;
        mul_cnt_reg <= 0;
        output_axis_tdata_reg <= 0;
        output_axis_tvalid_reg <= 0;
        busy_reg <= 0;
    end else begin
        state_reg <= state_next;

        mt_save_reg <= mt_save_next;
        mti_reg <= mti_next;

        mt_rd_a_ptr_reg <= mt_rd_a_ptr_next;
        mt_rd_b_ptr_reg <= mt_rd_b_ptr_next;

        product_reg <= product_next;
        factor1_reg <= factor1_next;
        factor2_reg <= factor2_next;
        mul_cnt_reg <= mul_cnt_next;

        output_axis_tdata_reg <= output_axis_tdata_next;
        output_axis_tvalid_reg <= output_axis_tvalid_next;

        busy_reg <= state_next != STATE_IDLE;

        if (mt_wr_en) begin
            mt[mt_wr_ptr] <= mt_wr_data;
        end

        mt_rd_a_data <= mt[mt_rd_a_ptr_next];
        mt_rd_b_data <= mt[mt_rd_b_ptr_next];
    end
end

endmodule