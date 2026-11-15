module mg_01378(input vid_clk,input [7:0] p,output reg stb,output reg field,output reg [31:0] ycc422);
reg [7:0] ioreg; 
 always @(posedge vid_clk) ioreg <= p; 
 reg [1:0] byten; 
 reg [31:0] inreg; 
 initial begin 
  byten <= 2'd0; 
  inreg <= 32'd0; 
 end 
 always @(posedge vid_clk) begin 
  if(&ioreg) begin 
  inreg[31:24] <= ioreg; 
  byten <= 2'd1; 
  end else begin 
  byten <= byten + 2'd1; 
  case(byten) 
  2'd0: inreg[31:24] <= ioreg; 
  2'd1: inreg[23:16] <= ioreg; 
  2'd2: inreg[15: 8] <= ioreg; 
  2'd3: inreg[ 7: 0] <= ioreg; 
  endcase 
  end 
 end 
 reg in_field; 
 reg in_hblank; 
 reg in_vblank; 
 initial begin 
  in_field <= 1'b0; 
  in_hblank <= 1'b0; 
  in_vblank <= 1'b0; 
  stb <= 1'b0; 
 end 
 always @(posedge vid_clk) begin 
  stb <= 1'b0; 
  if(byten == 2'd0) begin 
  if(inreg[31:8] == 24'hff0000) begin 
  in_hblank <= inreg[4]; 
  in_vblank <= inreg[5]; 
  in_field <= inreg[6]; 
  end else begin 
  if(~in_hblank && ~in_vblank) begin 
  stb <= 1'b1; 
  field <= in_field; 
  ycc422 <= inreg; 
  end 
  end 
  end 
 end 
 endmodule