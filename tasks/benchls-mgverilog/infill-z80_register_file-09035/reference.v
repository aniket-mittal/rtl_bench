module mg_09035 (DOBH, DOAL, DOCL, DOBL, DOCH, DOAH,AddrC, AddrA, AddrB, DIH, DIL, clk, CEN, WEH, WEL);
input [2:0] AddrC; 
  output [7:0] DOBH; 
  input [2:0] AddrA; 
  input [2:0] AddrB; 
  input [7:0] DIH; 
  output [7:0] DOAL; 
  output [7:0] DOCL; 
  input [7:0] DIL; 
  output [7:0] DOBL; 
  output [7:0] DOCH; 
  output [7:0] DOAH; 
  input clk, CEN, WEH, WEL; 
  reg [7:0] RegsH [0:7]; 
  reg [7:0] RegsL [0:7]; 
  always @(posedge clk) 
  begin 
  if (CEN) 
  begin 
  if (WEH) RegsH[AddrA] <= DIH; 
  if (WEL) RegsL[AddrA] <= DIL; 
  end 
  end 
  assign DOAH = RegsH[AddrA]; 
  assign DOAL = RegsL[AddrA]; 
  assign DOBH = RegsH[AddrB]; 
  assign DOBL = RegsL[AddrB]; 
  assign DOCH = RegsH[AddrC]; 
  assign DOCL = RegsL[AddrC]; 
  wire [7:0] B = RegsH[0]; 
  wire [7:0] C = RegsL[0]; 
  wire [7:0] D = RegsH[1]; 
  wire [7:0] E = RegsL[1]; 
  wire [7:0] H = RegsH[2]; 
  wire [7:0] L = RegsL[2]; 
  wire [15:0] IX = { RegsH[3], RegsL[3] }; 
  wire [15:0] IY = { RegsH[7], RegsL[7] }; 
 endmodule