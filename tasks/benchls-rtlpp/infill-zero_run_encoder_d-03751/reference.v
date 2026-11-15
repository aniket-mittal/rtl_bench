module rtlpp_03751  (
    clock, reset, i_d, o_d, 
    sel_o_d, sel_cnt, 
    f_start_i_eq_0, f_zeros_i_eq_0, f_zeros_t_cnt_eq_15
);

   input  clock, reset;
   input  [2:0] i_d;
   output [3:0] o_d;
   input        sel_o_d;
   input  [1:0] sel_cnt;
   output       f_start_i_eq_0, f_zeros_i_eq_0, f_zeros_t_cnt_eq_15;

   parameter sel_o_d_start_e   = 1'd0;
   parameter sel_o_d_zeros_t_t = 1'd1;
   parameter sel_cnt_start     = 2'd0;
   parameter sel_cnt_start_t   = 2'd1;
   parameter sel_cnt_zeros_t_t = 2'd2;
   parameter sel_cnt_zeros_t_e = 2'd3;

   reg  [3:0] cnt, next_cnt;
   reg  [3:0] o_d_;

   wire       o_d_start_e, o_d_zeros_t_t;
   wire [3:0] cnt_start, cnt_start_t, cnt_zeros_t_t, cnt_zeros_t_e;

   assign o_d = o_d_;
   assign f_start_i_eq_0      = (i_d == 0);
   assign f_zeros_i_eq_0      = (i_d == 0);
   assign f_zeros_t_cnt_eq_15 = (cnt == 15);

   assign o_d_start_e    = i_d;
   assign o_d_zeros_t_t  = 4'd16 | cnt;

   assign cnt_start      = cnt;
   assign cnt_start_t    = 4'd1;
   assign cnt_zeros_t_t  = 4'd0;
   assign cnt_zeros_t_e  = cnt + 4'd1;

   always @(posedge clock or negedge reset)
     if (!reset)
       cnt <= 4'd0;
     else
       cnt <= next_cnt;

   always @(sel_o_d or i_d or o_d_start_e or o_d_zeros_t_t) begin
      case (sel_o_d)
         sel_o_d_start_e:    o_d_ <= o_d_start_e;
         sel_o_d_zeros_t_t:  o_d_ <= o_d_zeros_t_t;
         default:            o_d_ <= 4'bx;
      endcase 
   end

   always @(sel_cnt or cnt or cnt_start or cnt_start_t or cnt_zeros_t_t or cnt_zeros_t_e) begin
      case (sel_cnt)
         sel_cnt_start:      next_cnt <= cnt_start;
         sel_cnt_start_t:    next_cnt <= cnt_start_t;
         sel_cnt_zeros_t_t:  next_cnt <= cnt_zeros_t_t;
         sel_cnt_zeros_t_e:  next_cnt <= cnt_zeros_t_e;
         default:            next_cnt <= cnt;
      endcase 
   end

endmodule