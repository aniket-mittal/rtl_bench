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

[MASKED]

always @ (*)
begin
    valid = (~(|syndrom));
end
  
endmodule