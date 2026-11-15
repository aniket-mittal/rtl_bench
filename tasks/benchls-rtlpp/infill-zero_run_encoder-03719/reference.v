module rtlpp_03719  (
  input  clock, 
  input  reset,
  input  [2:0] i_d,				
  output [3:0] o_d,				
  input  [1:0] state,				
  input        fire,				
  output       f_start_i_eq_0,
  output       f_zeros_i_eq_0,
  output       f_zeros_cnt_eq_15
  );

  parameter state_start  = 2'd0;
  parameter state_zeros  = 2'd1;
  parameter state_pending = 2'd2;

  reg [3:0] cnt, next_cnt;
  reg [2:0] i_at_0, i_at_0_;			
  reg [3:0] o_d_;				

  assign o_d = o_d_;
  assign f_start_i_eq_0    = (i_d == 0);
  assign f_zeros_i_eq_0    = (i_d == 0);
  assign f_zeros_cnt_eq_15 = (cnt == 15);

  always @(posedge clock or negedge reset) begin
     if (!reset) begin	
       cnt <= 0;	
       i_at_0 <= 3'b000;   
     end else begin	
       cnt <= next_cnt;	
       i_at_0 <= i_at_0_;  
     end
  end

  always @(*) begin
    next_cnt = cnt;
    i_at_0_ = i_at_0;
    o_d_ = 4'b0000;
    
    case (state)
      state_start: 
        if (fire) begin
          i_at_0_ = i_d;
          if (f_start_i_eq_0) begin
            next_cnt = 1;
          end else begin
            o_d_ = i_d;
          end
        end

      state_zeros: 
        if (fire) begin
          i_at_0_ = i_d;
          if (f_zeros_i_eq_0) begin
            if (f_zeros_cnt_eq_15) begin
              o_d_ = 16 | cnt;
              next_cnt = 0;
            end else begin
              next_cnt = cnt + 1;
            end
          end
        end

      state_pending: 
        if (fire) begin
          o_d_ = i_at_0;
        end

      default: begin
        next_cnt = 4'b0000;
        i_at_0_ = 3'b000;
        o_d_ = 4'b0000;
      end
    endcase 
  end 

endmodule