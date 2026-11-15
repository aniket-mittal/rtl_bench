module rtlpp_08931 
	    (
		 input 	clk,
		 input 	rst_n,
		 input 	start_token,
		 input 	end_token,
		 input 	trigger,
	    input   reStart,
		 output  enable_start_out,
	    output enable_end_out		
		 );

   parameter COUNTER_Width=6;    
   
   reg [COUNTER_Width:0] outstanding_c;
   reg [COUNTER_Width:0] outstanding_r; 
   reg [COUNTER_Width :0] outstanding_in;

   reg 			   enable_start;
   reg 			   enable_end;
   reg [1:0] 			       currentState, nextState;

   localparam Idle = 2'b00;
   localparam Reset = 2'b01;
   localparam Filter = 2'b10;
   localparam Bypass = 2'b11;
  

   always @ (posedge clk or negedge rst_n)
   begin
      	if (!rst_n) begin
	    outstanding_c <= 0;
	    outstanding_r <= 0;
	   end else begin
	    if (reStart) begin
	     outstanding_c <= 0;
	     outstanding_r <= 0;
	    end else begin
	     outstanding_r <= outstanding_in;
	     if (start_token && !end_token)
		   outstanding_c <= outstanding_c + 1;
	     else if (!start_token && end_token)
		   outstanding_c <= outstanding_c - 1;
	     else if (start_token && end_token)
		   outstanding_c <= outstanding_c;
	     else 
		   outstanding_c <= outstanding_c;
	    end
	   end
   end
   
   always @(*) begin
	   if (nextState == Reset || nextState == Bypass)
	     outstanding_in <= 0;
	   else if (nextState == Idle ) begin
	      if (start_token && !end_token)
		     outstanding_in <= outstanding_c + 1;
	      else if (!start_token && end_token)
		     outstanding_in <= outstanding_c - 1;
	      else if (start_token && end_token)
		     outstanding_in <= outstanding_c;
	      else 
		     outstanding_in <= outstanding_c;
	   end else if (nextState == Filter ) begin
	    if (end_token)
	     outstanding_in <= outstanding_r - 1;
	    else
	     outstanding_in <= outstanding_r;
	   end else
	     outstanding_in <= 0;
   end


   always @ (posedge clk or negedge rst_n)
   begin
      	if (!rst_n) begin
	     enable_end <= 1'b0;
	     enable_start <= 1'b0;
	   end else begin
	     case (nextState)
		   Reset: begin
		    enable_end <= 1'b0;
		    enable_start <= 1'b0;
		   end
		   Idle: begin
		     enable_start <= 1'b0;
		     enable_end <= 1'b0;
		   end
		   Filter: begin
		     enable_end <= 1'b0;
		     enable_start <= start_token;
		   end
		   Bypass: begin
		    enable_start <= start_token;
		    enable_end <= end_token;
		   end
		   default: begin
		    enable_start <= 1'b0;
		    enable_end <= 1'b0;
		   end
         endcase
	   end
   end 
   

   always @(*) begin
	  case (currentState)
	    Reset: begin
	     nextState <= Idle;
	    end
	    Idle: begin
	     if (trigger) begin 
		   nextState <= Filter;
	     end else 
	       nextState <= Idle;
	    end
	    Filter: begin
	     if (trigger == 1) begin 
	       if (outstanding_r == 0)
		     nextState <= Bypass;
	       else
		     nextState <= Filter;
	     end else
	      nextState <= Reset;
	    end
	    Bypass: begin
	     if (trigger)
	       nextState <= Bypass;
	     else
	       nextState <= Reset;
	    end
	    default:
	     nextState <= Reset;
	endcase 
   end

   always @ (posedge clk or negedge rst_n) begin
     if (!rst_n) begin
       currentState <= 2'b0;
     end else
       currentState <= nextState;
   end

   assign enable_start_out = enable_start;
   assign enable_end_out = enable_end;
   
endmodule