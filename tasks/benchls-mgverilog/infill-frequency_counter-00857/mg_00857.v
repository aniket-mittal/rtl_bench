module mg_00857(input clk,input freqin,output [23:0] frequency);
parameter SecondCount = 8001800; 
 reg [23:0] counter = 0; 
 reg [23:0] freq = 0; 
 reg [23:0] secondcounter = 0; 
 reg stopin = 0; 
 reg inreseted = 0; 
 always @(posedge clk) 
 begin 
  if(secondcounter == SecondCount) 
  begin 
  secondcounter <= 0; 
  stopin <= 1; 
  freq <= counter*2; 
  end 
  else 
  if(~stopin) 
  secondcounter <= secondcounter + 1; 
  if(inreseted) 
  stopin <= 0; 
 end 
 [MASKED] 
 assign frequency = freq; 
 endmodule