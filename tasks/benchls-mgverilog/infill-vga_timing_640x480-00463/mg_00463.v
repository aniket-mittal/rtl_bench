module mg_00463(input wire dclk,input wire clr,output wire hsync,output wire vsync,output reg [2:0] red,output reg [2:0] green,output reg [1:0] blue,output [9:0]x,output [9:0]y);
parameter hpixels = 800; 
 parameter vlines = 521; 
 parameter hpulse = 96; 
 parameter vpulse = 2; 
 parameter hbp = 144; 
 parameter hfp = 784; 
 parameter vbp = 31; 
 parameter vfp = 511; 
 reg [9:0] hc; 
 reg [9:0] vc; 
 assign x = hc - hbp; 
 assign y = vc - vbp; 
 always @(posedge dclk or posedge clr) 
 begin 
  if (clr == 1) 
  begin 
  hc <= 0; 
  vc <= 0; 
  end 
  else 
  begin 
  if (hc < hpixels - 1) 
  hc <= hc + 1; 
  else 
  begin 
  hc <= 0; 
  if (vc < vlines - 1) 
  vc <= vc + 1; 
  else 
  vc <= 0; 
  end 
  end 
 end 
 assign hsync = (hc < hpulse) ? 0:1; 
 assign vsync = (vc < vpulse) ? 0:1; 
 [MASKED] 
 endmodule