module rtlpp_07638(
					input clock,		
					input reset,		
					input run,		    
					output busy,		
					output start,		
					output stop	        
				);

reg [4:0] state;

[MASKED]

assign start = run;
assign stop  = ( state == 5'd17 ); 
assign busy  = ( state != 5'd0  );

endmodule