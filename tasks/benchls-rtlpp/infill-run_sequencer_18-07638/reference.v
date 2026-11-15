module rtlpp_07638(
					input clock,		
					input reset,		
					input run,		    
					output busy,		
					output start,		
					output stop	        
				);

reg [4:0] state;

always @(posedge clock or posedge reset)
if (reset)
  state <= 5'd0;
else
begin
  case (state)
    5'd0: if ( run )
	        state <= 5'd1;
	default: if ( state == 5'd17 )
	           state <= 5'd0;
			 else
			   state <= state + 1;
  endcase
end

assign start = run;
assign stop  = ( state == 5'd17 ); 
assign busy  = ( state != 5'd0  );

endmodule