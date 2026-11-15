module rtlpp_04182( 
   clk,            
   ser_in,         
   data,           
   shift_en,       
   RSTn,           
   clear_syndrom,  
   valid,          
   clk_en          
);

input         clk;
input         ser_in;
output [12:0] data;
input         shift_en;
input         RSTn;
input         clear_syndrom;
output        valid;
input         clk_en;

reg [11:0]  shift_reg;
reg [3:0]   syndrom;    
reg         valid;

assign data = {valid, shift_reg};

always @ (posedge clk or negedge RSTn)
begin
  if (~RSTn) 
  begin
     shift_reg <= 12'h000;
     syndrom <= 4'h0;
  end
  else 
  begin
    if (clk_en)
    begin
      if (shift_en) 
        shift_reg <= {shift_reg[10:0], ser_in}; 
      
      if (clear_syndrom)
        syndrom <= 4'h0;
      else
        syndrom <= {syndrom[0]^ser_in, (syndrom[3]^syndrom[0])^ser_in, syndrom[2], syndrom[1]^ser_in};
    end
  end
end

always @ (*)
begin
    valid = (~(|syndrom));
end
  
endmodule