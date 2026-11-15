module rtlpp_04827 (
  input  clk,      
  input load,      
  input [31:0] din,  
  output sout, 
  output done  
);

parameter WIDTH = 32;  
localparam MSB = WIDTH-1;

reg [MSB:0] sreg;    
reg [6:0] bitcount;  
reg dflag;           

[MASKED] 

assign sout = sreg[MSB];    
assign done = dflag;        

endmodule