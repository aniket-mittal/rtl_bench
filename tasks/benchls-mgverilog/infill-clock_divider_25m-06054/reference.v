module mg_06054(clock_out,clock_in);
input clock_in; 
  output reg clock_out; 
  reg [24:0] counter; 
  initial 
  begin 
  counter = 0; 
  clock_out = 0; 
  end 
  always @(posedge clock_in) 
  begin 
  if(counter == 0) 
  begin 
  counter <= 24999999; 
  clock_out <= ~clock_out; 
  end 
  else 
  counter <= counter - 1; 
  end 
 endmodule