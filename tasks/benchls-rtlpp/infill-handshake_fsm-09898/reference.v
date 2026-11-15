module rtlpp_09898 (clock, reset,  i_v, i_b,  o_v, o_b,  stateo,
		    f_start_i_eq_0, f_zeros_i_eq_0, f_zeros_t_cnt_eq_127);

   input  clock, reset;
   input  i_v;
   output i_b;
   output o_v;
   input  o_b;
   output [3:0] stateo;				
   input  f_start_i_eq_0,
          f_zeros_i_eq_0,
          f_zeros_t_cnt_eq_127;
   
   parameter state_start    = 4'd0;
   parameter state_start_t  = 4'd1;
   parameter state_start_e  = 4'd2;
   parameter state_zeros    = 4'd3;
   parameter state_zeros_t  = 4'd4;
   parameter state_zeros_t_t= 4'd5;
   parameter state_zeros_t_e= 4'd6;
   parameter state_zeros_e  = 4'd7;
   parameter state_pending  = 4'd8;

   reg [3:0] state, next_state;
   reg        i_b_, o_v_;

   assign    stateo = state;
   assign    i_b    = i_b_;
   assign    o_v    = o_v_;
   
   always @(posedge clock or negedge reset)
     if (!reset)
        state <= state_start;
     else        
        state <= next_state;
   
   always @(*) begin
      case (state)
	state_start:	
        if (i_v) begin
           i_b_ <= 0;
           o_v_ <= 0;
           if (f_start_i_eq_0)
              next_state<=state_start_t;
           else
              next_state<=state_start_e;
        end else begin
           i_b_<=1;
           o_v_<=0;
           next_state<=state;
        end
	  
	state_start_t:	
    begin
	   i_b_<=1;
	   o_v_<=0;
	   next_state<=state_zeros;
	end

	state_start_e:	
    if (!o_b) begin
	   i_b_<=1;
	   o_v_<=1;
	   next_state<=state_start;
	end else begin
	   i_b_<=1;
	   o_v_<=0;
	   next_state<=state;
	end

	state_zeros:	
    if (i_v) begin
	   i_b_<=0;
	   o_v_<=0;
	   if (f_zeros_i_eq_0)
	      next_state<=state_zeros_t;
	   else
	      next_state<=state_zeros_e;
	end else begin
	   i_b_<=1;
	   o_v_<=0;
	   next_state<=state;
	end

	state_zeros_t:	
    begin
	   i_b_<=1;
	   o_v_<=0;
	   if (f_zeros_t_cnt_eq_127)
	      next_state<=state_zeros_t_t;
	   else
	      next_state<=state_zeros_t_e;
	end

	state_zeros_t_t:	
    if (!o_b) begin
	   i_b_<=1;
	   o_v_<=1;
	   next_state<=state_zeros;
	end else begin
	   i_b_<=1;
	   o_v_<=0;
	   next_state<=state;
	end

	state_zeros_t_e:	
    begin
	   i_b_<=1;
	   o_v_<=0;
	   next_state<=state_zeros;
	end

	state_zeros_e:	
    if (!o_b) begin
	   i_b_<=1;
	   o_v_<=1;
	   next_state<=state_pending;
	end else begin
	   i_b_<=1;
	   o_v_<=0;
	   next_state<=state;
	end

	state_pending:	
    if (!o_b) begin
	   i_b_<=1;
	   o_v_<=1;
	   next_state<=state_start;
	end else begin
	   i_b_<=1;
	   o_v_<=0;
	   next_state<=state;
	end

	default:	
    begin
	   i_b_<=1;
	   o_v_<=0;
	   next_state<=4'bx;
	end

      endcase 
   end 
   
endmodule