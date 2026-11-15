module mg_03950(clk, dbusWire1, DselectWire2, bbusWire2, lwSwFlag2, dbusWire2, DselectWire3,bbusWire3,lwSwFlag3);
input clk; 
  input [31:0] dbusWire1, DselectWire2, bbusWire2; 
  input [1:0] lwSwFlag2; 
  output [31:0] dbusWire2, DselectWire3, bbusWire3; 
  output [1:0] lwSwFlag3; 
  reg [31:0] dbusWire2, DselectWire3, bbusWire3; 
  reg [1:0] lwSwFlag3; 
  [MASKED] 
 endmodule