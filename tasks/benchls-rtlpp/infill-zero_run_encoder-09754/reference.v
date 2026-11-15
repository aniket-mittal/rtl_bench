module rtlpp_09754 (
   input  clock, reset,
   input  i_v, output reg i_b,			
   output reg o_v, input  o_b,			
   output reg [3:0] stateo,				
   input  f_start_i_eq_0,
   input  f_zeros_i_eq_0,
   input  f_zeros_t_cnt_eq_15
);
   
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

   assign stateo = state;
   
   always @(posedge clock or negedge reset)
     if (!reset) state <= state_start;
     else        state <= next_state;
   
   always @(
     state or i_v or o_b or 
     f_start_i_eq_0 or f_zeros_i_eq_0 or f_zeros_t_cnt_eq_15) 
   begin
      i_b = 1;
      o_v = 0;
      next_state = state;

      case (state)
	      state_start:       
          if (i_v) begin
			       i_b = 0;
			       if (f_start_i_eq_0)
				      next_state = state_start_t;
			       else
				      next_state = state_start_e;
			     end
	  
	      state_start_t:      
            begin
			       next_state = state_zeros;
			     end

	      state_start_e:      
            if (!o_b) begin
			       o_v = 1;
			       next_state = state_start;
			     end

	      state_zeros:        
          if (i_v) begin
			       i_b = 0;
			       if (f_zeros_i_eq_0)
				      next_state = state_zeros_t;
			       else
				      next_state = state_zeros_e;
			     end

	      state_zeros_t:      
            begin
			       if (f_zeros_t_cnt_eq_15)
				      next_state = state_zeros_t_t;
			       else
				      next_state = state_zeros_t_e;
			     end

	      state_zeros_t_t:    
            if (!o_b) begin
			       o_v = 1;
			       next_state = state_zeros;
			     end

	      state_zeros_t_e:    
            begin
			       next_state = state_zeros;
			     end

	      state_zeros_e:      
            if (!o_b) begin
			       o_v = 1;
			       next_state = state_pending;
			     end

	      state_pending:      
            if (!o_b) begin
			       o_v = 1;
			       next_state = state_start;
			     end

	      default:            
            begin
			       next_state = 4'bx;
			     end
      endcase 
   end 
   
endmodule