module mg_02410 (PixelClock,inRed,inGreen,inBlue,outRed,outGreen,outBlue,VertSynchOut,HorSynchOut,XPosition,YPosition);
parameter XLimit = 1688; 
 parameter XVisible = 1280; 
 parameter XSynchPulse = 112; 
 parameter XBackPorch = 248; 
 parameter YLimit = 1066; 
 parameter YVisible = 1024; 
 parameter YSynchPulse = 3; 
 parameter YBackPorch = 38; 
 input PixelClock; 
 input [7:0] inRed; 
 input [7:0] inGreen; 
 input [7:0] inBlue; 
 output [7:0] outRed; 
 output [7:0] outGreen; 
 output [7:0] outBlue; 
 output VertSynchOut; 
 output HorSynchOut; 
 output [10:0] XPosition; 
 output [10:0] YPosition; 
 reg [10:0] XTiming; 
 reg [10:0] YTiming; 
 reg HorSynch; 
 reg VertSynch; 
 assign XPosition = XTiming - (XSynchPulse + XBackPorch); 
 assign YPosition = YTiming - (YSynchPulse + YBackPorch); 
 always@(posedge PixelClock) 
 begin 
  if (XTiming >= XLimit) 
  XTiming <= 11'd0; 
  else 
  XTiming <= XTiming + 1; 
 end 
 always@(posedge PixelClock) 
 begin 
  if (YTiming >= YLimit && XTiming >= XLimit) 
  YTiming <= 11'd0; 
  else if (XTiming >= XLimit && YTiming < YLimit) 
  YTiming <= YTiming + 1; 
  else 
  YTiming <= YTiming; 
 end 
 always@(posedge PixelClock) 
 begin 
  if (YTiming >= 0 && YTiming < YSynchPulse) 
  VertSynch <= 1'b0; 
  else 
  VertSynch <= 1'b1; 
 end 
 always@(posedge PixelClock) 
 begin 
  if (XTiming >= 0 && XTiming < XSynchPulse) 
  HorSynch <= 1'b0; 
  else 
  HorSynch <= 1'b1; 
 end 
 assign outRed = (XTiming >= (XSynchPulse + XBackPorch) && XTiming <= (XSynchPulse + XBackPorch + XVisible)) ? inRed : 8'b0; 
 assign outGreen = (XTiming >= (XSynchPulse + XBackPorch) && XTiming <= (XSynchPulse + XBackPorch + XVisible)) ? inGreen : 8'b0; 
 assign outBlue = (XTiming >= (XSynchPulse + XBackPorch) && XTiming <= (XSynchPulse + XBackPorch + XVisible)) ? inBlue : 8'b0; 
 assign VertSynchOut = VertSynch; 
 assign HorSynchOut = HorSynch; 
 initial 
 begin 
  XTiming = 11'b0; 
  YTiming = 11'b0; 
  HorSynch = 1'b1; 
  VertSynch = 1'b1; 
 end 
 endmodule