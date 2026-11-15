module mg_01803 (input clk,input rst,input [7:0] intv,input inta,output intr,output reg [2:0] iid);
reg inta_r; 
  reg [7:0] irr; 
  reg [7:0] int_r; 
  assign intr = irr[7] | irr[6] | irr[5] | irr[4] | irr[3] | irr[2] | irr[1] | irr[0]; 
  always @(posedge clk) inta_r <= inta; 
  always @(posedge clk) int_r[0] <= rst ? 1'b0 : intv[0]; 
  always @(posedge clk) int_r[1] <= rst ? 1'b0 : intv[1]; 
  always @(posedge clk) int_r[2] <= rst ? 1'b0 : intv[2]; 
  always @(posedge clk) int_r[3] <= rst ? 1'b0 : intv[3]; 
  always @(posedge clk) int_r[4] <= rst ? 1'b0 : intv[4]; 
  always @(posedge clk) int_r[5] <= rst ? 1'b0 : intv[5]; 
  always @(posedge clk) int_r[6] <= rst ? 1'b0 : intv[6]; 
  always @(posedge clk) int_r[7] <= rst ? 1'b0 : intv[7]; 
  always @(posedge clk) irr[0] <= rst ? 1'b0 : ((intv[0] && !int_r[0]) | irr[0] & !(iid == 3'd0 && inta_r && !inta)); 
  always @(posedge clk) irr[1] <= rst ? 1'b0 : ((intv[1] && !int_r[1]) | irr[1] & !(iid == 3'd1 && inta_r && !inta)); 
  always @(posedge clk) irr[2] <= rst ? 1'b0 : ((intv[2] && !int_r[2]) | irr[2] & !(iid == 3'd2 && inta_r && !inta)); 
  always @(posedge clk) irr[3] <= rst ? 1'b0 : ((intv[3] && !int_r[3]) | irr[3] & !(iid == 3'd3 && inta_r && !inta)); 
  always @(posedge clk) irr[4] <= rst ? 1'b0 : ((intv[4] && !int_r[4]) | irr[4] & !(iid == 3'd4 && inta_r && !inta)); 
  always @(posedge clk) irr[5] <= rst ? 1'b0 : ((intv[5] && !int_r[5]) | irr[5] & !(iid == 3'd5 && inta_r && !inta)); 
  always @(posedge clk) irr[6] <= rst ? 1'b0 : ((intv[6] && !int_r[6]) | irr[6] & !(iid == 3'd6 && inta_r && !inta)); 
  always @(posedge clk) irr[7] <= rst ? 1'b0 : ((intv[7] && !int_r[7]) | irr[7] & !(iid == 3'd7 && inta_r && !inta)); 
  always @(posedge clk) 
 iid <= rst ? 3'b0 : (inta ? iid :(irr[0] ? 3'b000 :(irr[1] ? 3'b001 :(irr[2] ? 3'b010 :(irr[3] ? 3'b011 :(irr[4] ? 3'b100 :(irr[5] ? 3'b101 :(irr[6] ? 3'b110 :(irr[7] ? 3'b111 :3'b000 ))))))))); 
 endmodule