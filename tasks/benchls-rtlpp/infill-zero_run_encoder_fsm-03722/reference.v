module rtlpp_03722  (clock, reset,  i_d,  o_d,  state,
                    f_start_i_eq_0, f_zeros_i_eq_0, f_zeros_t_cnt_eq_15);
   
   input  clock, reset;
   input  [2:0] i_d;                
   output [3:0] o_d;                
   input  [3:0] state;                
   output f_start_i_eq_0,
          f_zeros_i_eq_0,
          f_zeros_t_cnt_eq_15;            

   reg [3:0] cnt, next_cnt;
   reg [2:0] i_at_0, i_at_0_;            
   reg [3:0] o_d_;                

   assign    o_d = o_d_;
   assign    f_start_i_eq_0      = (i_d==0);
   assign    f_zeros_i_eq_0      = (i_d==0);
   assign    f_zeros_t_cnt_eq_15 = (cnt==15);

   parameter state_start = 4'd0,
             state_start_t = 4'd1,
             state_start_e = 4'd2,
             state_zeros = 4'd3,
             state_zeros_t = 4'd4,
             state_zeros_t_t = 4'd5,
             state_zeros_t_e = 4'd6,
             state_zeros_e = 4'd7,
             state_pending = 4'd8;

   always @(posedge clock or negedge reset)
     if (!reset) begin
         cnt <= 0;
         i_at_0 <= 3'bx; 
     end else begin
         cnt <= next_cnt;
         i_at_0 <= i_at_0_;  
     end
   
   always @(cnt or state or i_at_0 or i_d) begin
      case (state)
         state_start: begin
            i_at_0_ <= i_d;    
            o_d_ <= 4'bx;    
            next_cnt <= cnt;
         end
         state_start_t: begin
            i_at_0_ <= i_at_0;    
            o_d_ <= 4'bx;    
            next_cnt <= 1;
         end
         state_start_e: begin
            i_at_0_ <= i_at_0;    
            o_d_ <= i_at_0;    
            next_cnt <= cnt;
         end
         state_zeros: begin
            i_at_0_ <= i_d;    
            o_d_ <= 4'bx;    
            next_cnt <= cnt;
         end
         state_zeros_t: begin
            i_at_0_ <= i_at_0;    
            o_d_ <= 4'bx;    
            next_cnt <= cnt;
         end
         state_zeros_t_t: begin
            i_at_0_ <= i_at_0;    
            o_d_ <= {1'b1, cnt}; // Changed from 16|cnt to {1'b1, cnt} for 4-bit compatibility    
            next_cnt <= 0;
         end
         state_zeros_t_e: begin
            i_at_0_ <= i_at_0;    
            o_d_ <= 4'bx;    
            next_cnt <= cnt + 1;
         end
         state_zeros_e: begin
            i_at_0_ <= i_at_0;    
            o_d_ <= {1'b1, cnt}; // Changed from 16|cnt to {1'b1, cnt} for 4-bit compatibility
            next_cnt <= 0;
         end
         state_pending: begin
            i_at_0_ <= i_at_0;    
            o_d_ <= i_at_0;    
            next_cnt <= cnt;
         end
         default: begin
            i_at_0_ <= i_at_0;    
            o_d_ <= 4'bx;    
            next_cnt <= cnt;
         end
      endcase 
   end 

endmodule