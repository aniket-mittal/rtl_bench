module rtlpp_04412( 
   clk,         
   data,        
   out,         
   load_data,   
   RSTn,        
   load_start,  
   load_stop,   
   load_ack,    
   load_nack    
);

input         clk;
input  [11:0] data;
output        out;
input         load_data;
input         RSTn;
input         load_start;
input         load_stop;
input         load_ack;
input         load_nack;

reg [24:0] shift_reg;	  
integer i;

assign out = shift_reg[24]; 

always @(posedge clk or negedge RSTn)
begin
  if (~RSTn) 
  begin
    shift_reg <= 25'h0AAAAAA;  
  end
  else 
  begin
    if (load_data)
    begin
      for (i=0; i<12; i=i+1)
      begin
        shift_reg[2*i+2] <= ~data[i];   
        shift_reg[2*i+1] <= data[i];    
      end
      shift_reg[0] <= 0;
    end
    else if (load_start)
      shift_reg <= 25'h02AAAAA;
    else if (load_stop)
      shift_reg <= 25'h1AAAAAA;
    else if (load_ack)
      shift_reg <= 25'h12AAAAA;
    else if (load_nack)
      shift_reg <= 25'h0AAAAAA;
    else
      shift_reg <= {shift_reg[23:0],~shift_reg[0]}; 
  end
end

endmodule