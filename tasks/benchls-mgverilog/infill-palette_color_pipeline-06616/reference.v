module mg_06616 (input pixclk,input hresetn,input colres,input sixbitlin,input [7:0] p0_red_pal_adr,input [7:0] p0_grn_pal_adr,input [7:0] p0_blu_pal_adr,input [7:0] palr2dac_evn,input [7:0] palg2dac_evn,input [7:0] palb2dac_evn,output reg [7:0] p0_red_pal,output reg [7:0] p0_grn_pal,output reg [7:0] p0_blu_pal,output reg [7:0] palr_addr_evn,output reg [7:0] palg_addr_evn,output reg [7:0] palb_addr_evn);
wire apply_lin = ! (colres | sixbitlin); 
  always @( posedge pixclk or negedge hresetn) 
  if (!hresetn) begin 
  palr_addr_evn <= 8'b0; 
  palg_addr_evn <= 8'b0; 
  palb_addr_evn <= 8'b0; 
  end else begin 
  palr_addr_evn <= p0_red_pal_adr; 
  palg_addr_evn <= p0_grn_pal_adr; 
  palb_addr_evn <= p0_blu_pal_adr; 
  end 
  always @( posedge pixclk or negedge hresetn) 
  if (!hresetn) begin 
  p0_red_pal <= 8'b0; 
  p0_grn_pal <= 8'b0; 
  p0_blu_pal <= 8'b0; 
  end else begin 
  p0_red_pal <= apply_lin ? {palr2dac_evn[7:2] ,palr2dac_evn[7:6]} : 
  palr2dac_evn ; 
  p0_grn_pal <= apply_lin ? {palg2dac_evn[7:2] ,palg2dac_evn[7:6]} : 
  palg2dac_evn ; 
  p0_blu_pal <= apply_lin ? {palb2dac_evn[7:2] ,palb2dac_evn[7:6]} : 
  palb2dac_evn ; 
  end 
 endmodule