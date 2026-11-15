module rtlpp_07958 (
    input clock,
    input reset,
    input i_v,
    output reg i_b,
    output reg o_v,
    input o_b,
    output reg sel_o_d,
    output reg [1:0] sel_cnt,
    output reg sel_f,
    input f
);

   parameter state_start        = 4'd0;
   parameter state_start_t      = 4'd1;
   parameter state_start_e      = 4'd2;
   parameter state_zeros        = 4'd3;
   parameter state_zeros_t      = 4'd4;
   parameter state_zeros_t_t    = 4'd5;
   parameter state_zeros_t_e    = 4'd6;
   parameter state_zeros_e      = 4'd7;
   parameter state_pending      = 4'd8;

   parameter sel_o_d_start_e    = 1'd0;
   parameter sel_o_d_zeros_t_t  = 1'd1;

   parameter sel_cnt_start      = 2'd0;       
   parameter sel_cnt_start_t    = 2'd1;
   parameter sel_cnt_zeros_t_t  = 2'd2;
   parameter sel_cnt_zeros_t_e  = 2'd3;

   parameter sel_f_start        = 1'd0;
   parameter sel_f_zeros_t      = 1'd1;

   reg [3:0] state, next_state;

   always @(posedge clock or negedge reset)
      if (!reset) 
         state <= state_start;
      else        
         state <= next_state;
   
   always @(state or i_v or o_b or f) begin
      case (state)
        state_start: 
            if (i_v) begin
               i_b   <= 0;
               o_v   <= 0;
               sel_o_d <= 1'bx;
               sel_cnt <= sel_cnt_start;
               sel_f <= sel_f_start;
               if (f)
                  next_state <= state_start_t;
               else
                  next_state <= state_start_e;
            end
            else begin
               i_b   <= 1;
               o_v   <= 0;
               sel_o_d <= 1'bx;
               sel_cnt <= sel_cnt_start;
               sel_f <= 1'bx;
               next_state <= state;
            end
        state_start_t: begin
               i_b   <= 1;
               o_v   <= 0;
               sel_o_d <= 1'bx;
               sel_cnt <= sel_cnt_start_t;
               sel_f <= 1'bx;
               next_state <= state_zeros;
            end
        state_start_e: 
            if (!o_b) begin
               i_b   <= 1;
               o_v   <= 1;
               sel_o_d <= sel_o_d_start_e;
               sel_cnt <= sel_cnt_start;
               sel_f <= 1'bx;
               next_state <= state_start;
            end
            else begin
               i_b   <= 1;
               o_v   <= 0;
               sel_o_d <= 1'bx;
               sel_cnt <= sel_cnt_start;
               sel_f <= 1'bx;
               next_state <= state;
            end
        state_zeros: 
            if (i_v) begin
               i_b   <= 0;
               o_v   <= 0;
               sel_o_d <= 1'bx;
               sel_cnt <= sel_cnt_start;
               sel_f <= sel_f_start;
               if (f)
                  next_state <= state_zeros_t;
               else
                  next_state <= state_zeros_e;
            end
            else begin
               i_b   <= 1;
               o_v   <= 0;
               sel_o_d <= 1'bx;
               sel_cnt <= sel_cnt_start;
               sel_f <= 1'bx;
               next_state <= state;
            end
        state_zeros_t: begin
               i_b   <= 1;
               o_v   <= 0;
               sel_o_d <= 1'bx;
               sel_cnt <= sel_cnt_start;
               sel_f <= sel_f_zeros_t;
               if (f)
                  next_state <= state_zeros_t_t;
               else
                  next_state <= state_zeros_t_e;
            end
        state_zeros_t_t: 
            if (!o_b) begin
               i_b   <= 1;
               o_v   <= 1;
               sel_o_d <= sel_o_d_zeros_t_t;
               sel_cnt <= sel_cnt_zeros_t_t;
               sel_f <= 1'bx;
               next_state <= state_zeros;
            end
            else begin
               i_b   <= 1;
               o_v   <= 0;
               sel_o_d <= 1'bx;
               sel_cnt <= sel_cnt_start;
               sel_f <= 1'bx;
               next_state <= state;
            end
        state_zeros_t_e: begin
               i_b   <= 1;
               o_v   <= 0;
               sel_o_d <= 1'bx;
               sel_cnt <= sel_cnt_zeros_t_e;
               sel_f <= 1'bx;
               next_state <= state_zeros;
            end
        state_zeros_e: 
            if (!o_b) begin
               i_b   <= 1;
               o_v   <= 1;
               sel_o_d <= sel_o_d_zeros_t_t;
               sel_cnt <= sel_cnt_zeros_t_t;
               sel_f <= 1'bx;
               next_state <= state_pending;
            end
            else begin
               i_b   <= 1;
               o_v   <= 0;
               sel_o_d <= 1'bx;
               sel_cnt <= sel_cnt_start;
               sel_f <= 1'bx;
               next_state <= state;
            end
        state_pending: 
            if (!o_b) begin
               i_b   <= 1;
               o_v   <= 1;
               sel_o_d <= sel_o_d_start_e;
               sel_cnt <= sel_cnt_start;
               sel_f <= 1'bx;
               next_state <= state_start;
            end
            else begin
               i_b   <= 1;
               o_v   <= 0;
               sel_o_d <= 1'bx;
               sel_cnt <= sel_cnt_start;
               sel_f <= 1'bx;
               next_state <= state;
            end
        default: begin
               i_b   <= 1;
               o_v   <= 0;
               sel_o_d <= 1'bx;
               sel_cnt <= sel_cnt_start;
               sel_f <= 1'bx;
               next_state <= 4'bx;
            end
      endcase 
   end 
   
endmodule