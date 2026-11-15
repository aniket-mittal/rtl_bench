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

always @(posedge clk) 
begin 
    if (load) 
    begin
       dflag <= 1'd0;      
       bitcount <= 7'd0;  
       sreg <= din;   
    end
    else 
    begin
       sreg <= {sreg[MSB-1:0], 1'b0}; 
       bitcount <= bitcount + 1;  
       if (bitcount == MSB) 
           dflag <= 1'b1;  
       else
           dflag <= 1'b0;  
    end
end 

assign sout = sreg[MSB];    
assign done = dflag;        

endmodule