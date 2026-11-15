module rtlpp_00136(
  input clk,
  input reset,
  input EN,                             
  input [2:0] IR,
  input [11:0] AC,
  input LINK,
  input ckFetch, ck1, ck2,
  input stbFetchA, stbFetchB, stb1,
  input irqRq,
  input anyDone,
  output done,
  output rot2ac,
  output ac_ck,
  output clr,
  output ACclr,
  output linkclr,
  output linkcml,
  output link_ck,
  output pc_ck,
  output [11:0] ACGTF,
  output irqOverride
);

reg IE;
reg IEdly1, IEdly2;
reg irqActive;

wire link_ck5, link_ck7;
or(link_ck, link_ck5, link_ck7);

wire linkclr5, linkclr7;
or(linkclr, linkclr5, linkclr7);

wire linkcml5;
or(linkcml, linkcml5);

wire clr7;
or(clr, clr7);

wire rot2ac4, rot2ac7;
or(rot2ac, rot2ac4, rot2ac7);

wire ac_ck4, ac_ck7;
or(ac_ck, ac_ck4, ac_ck7);

wire pc_ck0, pc_ck3;
or(pc_ck, pc_ck0, pc_ck3);

wire done0, done1, done2, done3, done4, done5, done7;
or(done, done0, done1, done2, done3, done4, done5, done7);

wire instSKON = (EN & (IR == 3'o0));
wire instION = (EN & (IR == 3'o1));
wire instIOF = (EN & (IR == 3'o2));
wire instSRQ = (EN & (IR == 3'o3));
wire instGTF = (EN & (IR == 3'o4));
wire instRTF = (EN & (IR == 3'o5));
wire instSGT = (EN & (IR == 3'o6));
wire instCAF = (EN & (IR == 3'o7));

wire AC8 = ~AC[8];

[MASKED]

wire GIE = IE & ~IEdly1 & ~IEdly2;
wire preIrq = GIE & irqRq;
assign irqOverride = preIrq & (irqActive | ~ckFetch);

assign pc_ck0 = instSKON & stb1 & IE;           
assign done0 = instSKON & ck2;
assign done1 = instION & ck2;                  
assign done2 = instIOF & ck2;                  
assign pc_ck3 = instSRQ & stb1 & irqRq;         
assign done3 = instSRQ & ck2;

reg IF = 0;       
reg [2:0] DF = 0; 
reg GT = 0;       
reg II = 0;       
reg U = 0;        

assign rot2ac4 = instGTF & ck1;                  
assign ACGTF = instGTF & ck1 ? {LINK, GT, irqRq, II, IE, U, 1'b0, IF, 1'b0, DF} : 12'b0;
assign ACclr = instGTF & ck1;
assign ac_ck4 = instGTF & stb1;
assign done4 = instGTF & ck2;

assign linkclr5 = instRTF & ck1;                  
assign linkcml5 = instRTF & ck1 & AC[11]; 
assign link_ck5 = instRTF & stb1;
assign done5 = instRTF & ck2;

assign rot2ac7 = instCAF & ck1;                  
assign clr7 = instCAF & ck1;
assign linkclr7 = instCAF & ck1;
assign ac_ck7 = instCAF & stb1;
assign link_ck7 = instCAF & stb1;
assign done7 = instCAF & ck2;

endmodule