module rtlpp_07234 (
    input clock,
    input reset,
    input i_v,
    output i_b,
    output o_v,
    input o_b,  
    output sel_o_d,
    output [1:0] sel_cnt,
    output sel_f,
    input f
);

    parameter state_start = 4'd0;
    parameter state_start_t = 4'd1;
    parameter state_start_e = 4'd2;
    parameter state_zeros = 4'd3;
    parameter state_zeros_t = 4'd4;
    parameter state_zeros_t_t = 4'd5;
    parameter state_zeros_t_e = 4'd6;
    parameter state_zeros_e = 4'd7;
    parameter state_pending = 4'd8;

    parameter sel_o_d_start_e = 1'd0;
    parameter sel_o_d_zeros_t_t = 1'd1;

    parameter sel_cnt_start = 2'd0;  
    parameter sel_cnt_start_t = 2'd1;
    parameter sel_cnt_zeros_t_t = 2'd2;
    parameter sel_cnt_zeros_t_e = 2'd3;

    parameter sel_f_start = 1'd0;
    parameter sel_f_zeros_t = 1'd1;
   
    reg [3:0] state, next_state;
    reg i_b_, o_v_;     
    reg sel_o_d_;
    reg [1:0] sel_cnt_;
    reg sel_f_;

    assign i_b = i_b_;
    assign o_v = o_v_;
    assign sel_o_d = sel_o_d_;
    assign sel_cnt = sel_cnt_;
    assign sel_f = sel_f_;

    always @(posedge clock or negedge reset)
        if (!reset) state <= state_start;
        else state <= next_state;
   
    [MASKED] 

endmodule