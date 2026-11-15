module mg_09317 (CLK,ED,WE,ODD,ADDRW,ADDRR,DR,DI,DOR,DOI);
parameter nb=16; 
  output [nb-1:0] DOR ; 
  wire [nb-1:0] DOR; 
  output [nb-1:0] DOI ; 
  wire [nb-1:0] DOI; 
  input CLK ; 
  wire CLK; 
  input ED ; 
  wire ED; 
  input WE ; 
  wire WE; 
  input ODD ; 
  wire ODD; 
  input [5:0] ADDRW ; 
  wire [5:0] ADDRW; 
  input [5:0] ADDRR ; 
  wire [5:0] ADDRR; 
  input [nb-1:0] DR ; 
  wire [nb-1:0] DR; 
  input [nb-1:0] DI ; 
  wire [nb-1:0] DI; 
  reg oddd,odd2; 
  always @( posedge CLK) begin 
  if (ED) begin 
  oddd<=ODD; 
  odd2<=oddd; 
  end 
  end 
  wire [6:0] addrr2 = {ODD,ADDRR}; 
  wire [6:0] addrw2 = {~ODD,ADDRW}; 
  wire [2*nb-1:0] di= {DR,DI}; 
  wire [2*nb-1:0] doi; 
  reg [2*nb-1:0] ram [127:0]; 
  reg [6:0] read_addra; 
  always @(posedge CLK) begin 
  if (ED) 
  begin 
  if (WE) 
  ram[addrw2] <= di; 
  read_addra <= addrr2; 
  end 
  end 
  assign doi = ram[read_addra]; 
  assign DOR=doi[2*nb-1:nb]; 
  assign DOI=doi[nb-1:0]; 
 endmodule