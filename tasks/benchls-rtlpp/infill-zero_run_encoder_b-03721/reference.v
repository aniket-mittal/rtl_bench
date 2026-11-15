module rtlpp_03721  (clock, reset, i_d, o_d, sel_o_d, sel_cnt, i_b, sel_f, f);
   
   input  clock, reset;
   input  [2:0] i_d;				
   output [3:0] o_d;				
   input        sel_o_d;			
   input  [1:0] sel_cnt;			
   input        i_b;				
   input        sel_f;				
   output       f;				

   parameter sel_o_d_start_e = 1'd0;
   parameter sel_o_d_zeros_t_t = 1'd1;

   parameter sel_cnt_start = 2'd0;
   parameter sel_cnt_start_t = 2'd1;
   parameter sel_cnt_zeros_t_t = 2'd2;
   parameter sel_cnt_zeros_t_e = 2'd3;

   parameter sel_f_start = 1'd0;
   parameter sel_f_zeros_t = 1'd1;

   reg [3:0]  cnt, next_cnt;
   reg [2:0]  i_at_0, i_at_0_;			
   reg [3:0]  o_d_;				
   reg        f_;				

   wire       o_d_start_e, o_d_zeros_t_t;	
   wire [3:0] cnt_start, cnt_start_t, cnt_zeros_t_t, cnt_zeros_t_e;
   wire       i_at_0_consume, i_at_0_noconsume;
   wire       f_start_i_eq_0, f_zeros_t_cnt_eq_15;
   
   assign    o_d = o_d_;
   assign    f   = f_;

   assign o_d_start_e = {1'b0, i_d};
   assign o_d_zeros_t_t = 16 | cnt;
   
   assign cnt_start = cnt;
   assign cnt_start_t = 1;
   assign cnt_zeros_t_t = 0;
   assign cnt_zeros_t_e = cnt + 1;

   assign i_at_0_consume = i_d;
   assign i_at_0_noconsume = i_at_0;

   assign f_start_i_eq_0 = (i_at_0 == 0);
   assign f_zeros_t_cnt_eq_15 = (cnt == 15);

   always @(posedge clock or negedge reset) begin
     if (!reset) begin
       cnt <= 0;
       i_at_0 <= 3'bx;
     end else begin
       cnt <= next_cnt;
       i_at_0 <= i_at_0_;
     end
   end

   always @(sel_o_d or i_d or o_d_start_e or o_d_zeros_t_t) begin
      case (sel_o_d)
        sel_o_d_start_e: o_d_ <= o_d_start_e;
        sel_o_d_zeros_t_t: o_d_ <= o_d_zeros_t_t;
        default: o_d_ <= 4'bx;
      endcase 
   end

   always @(sel_cnt or cnt or cnt_start or cnt_start_t or cnt_zeros_t_t or cnt_zeros_t_e) begin
      case (sel_cnt)
        sel_cnt_start: next_cnt <= cnt_start;
        sel_cnt_start_t: next_cnt <= cnt_start_t;
        sel_cnt_zeros_t_t: next_cnt <= cnt_zeros_t_t;
        sel_cnt_zeros_t_e: next_cnt <= cnt_zeros_t_e;
        default: next_cnt <= cnt;
      endcase 
   end

   always @(sel_f or f_start_i_eq_0 or f_zeros_t_cnt_eq_15) begin
      case (sel_f)
        sel_f_start: f_ <= f_start_i_eq_0;
        sel_f_zeros_t: f_ <= f_zeros_t_cnt_eq_15;
      endcase 
   end

   always @(i_b or i_at_0_consume or i_at_0_noconsume) begin
      case (i_b)
        0: i_at_0_ <= i_at_0_consume;
        1: i_at_0_ <= i_at_0_noconsume;
      endcase 
   end
   
endmodule