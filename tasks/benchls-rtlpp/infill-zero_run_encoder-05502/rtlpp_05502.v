module rtlpp_05502 (
    input clock,
    input reset,
    input [6:0] i_d,
    output reg [7:0] o_d,
    input [1:0] state,
    input fire,
    output f_start_i_eq_0,
    output f_zeros_i_eq_0,
    output f_zeros_cnt_eq_127
);

    parameter state_start = 2'd0;
    parameter state_zeros = 2'd1;
    parameter state_pending = 2'd2;

    reg [7:0] cnt, next_cnt;
    reg [6:0] i_at_0, i_at_0_;

    assign f_start_i_eq_0 = (i_d == 0);
    assign f_zeros_i_eq_0 = (i_d == 0);
    assign f_zeros_cnt_eq_127 = (cnt == 127);

    always @(posedge clock or negedge reset) begin
        if (!reset) begin
            cnt <= 0;
            i_at_0 <= 7'bx;
        end else begin
            cnt <= next_cnt;
            i_at_0 <= i_at_0_;
        end
    end

    [MASKED]

endmodule