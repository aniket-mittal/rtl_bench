module rtlpp_02013(
    input clk,
    input start,
    output outchan,
    input [3:0] n,
    input [7:0] c0,
    input [7:0] c1,
    input [7:0] c2,
    input [7:0] c3,
    input [7:0] c4,
    input [7:0] c5,
    input [7:0] c6,
    input [7:0] c7,
    input [7:0] c8,
    input [7:0] c9,
    input [7:0] c10,
    input [7:0] c11,
    output result,
    output result_ready
);

parameter st_loop_ready = 0;
parameter st_loop_inits = 1;
parameter st_loop_restarted = 3;
parameter st_loop_waiting = 2;

reg [1:0] loop_loop_state = st_loop_ready;
wire loop_loop_restarted = (st_loop_restarted == loop_loop_state);
wire loop_loop_waiting = (st_loop_waiting == loop_loop_state);
reg [3:0] n_2;
reg [7:0] c0_3;
reg [7:0] c1_4;
reg [7:0] c2_5;
reg [7:0] c3_6;
reg [7:0] c4_7;
reg [7:0] c5_8;
reg [7:0] c6_9;
reg [7:0] c7_10;
reg [7:0] c8_11;
reg [7:0] c9_12;
reg [7:0] c10_13;
reg [7:0] c11_14;
wire seqif_test_16 = (~| n_2);
reg seq2_18_started;
wire seq2_18_startable = (~| seqif_test_16);
reg seq2_18;
wire seq2_18_ready;
wire [3:0] minus_20 = (n_2 - 4'd1);
reg loop_loop_result_1;
wire loop_loop_result_1_ready = (loop_loop_state == st_loop_ready);

reg [7:0] outbyte_reg;
reg outbyte_ready;

[MASKED]

always @(posedge clk) begin
    if (loop_loop_waiting & seq2_18_startable & (~seq2_18_started)) begin
        outbyte_reg <= c0_3;
        outbyte_ready <= 1;
        seq2_18 <= 1;
    end else begin
        outbyte_ready <= 0;
        seq2_18 <= 0;
    end
end

assign outchan = outbyte_reg;
assign result = loop_loop_result_1;
assign result_ready = (loop_loop_result_1_ready & (~start));

endmodule