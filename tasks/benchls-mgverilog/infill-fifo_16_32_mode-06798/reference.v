module mg_06798(clk, rst, en, mode, din, we, dout, re, status, full, empty);
input clk, rst; 
 input en; 
 input [1:0] mode; 
 input [31:0] din; 
 input we; 
 output [19:0] dout; 
 input re; 
 output [1:0] status; 
 output full; 
 output empty; 
 reg [31:0] mem[0:3]; 
 reg [2:0] wp; 
 reg [3:0] rp; 
 wire [2:0] wp_p1; 
 reg [1:0] status; 
 reg [19:0] dout; 
 wire [31:0] dout_tmp; 
 wire [15:0] dout_tmp1; 
 wire m16b; 
 reg empty; 
 assign m16b = (mode == 2'h0); 
 always @(posedge clk) 
  if(!en) wp <= #1 3'h0; 
  else 
  if(we) wp <= #1 wp_p1; 
 assign wp_p1 = wp + 3'h1; 
 always @(posedge clk) 
  if(!en) rp <= #1 4'h0; 
  else 
  if(re & m16b) rp <= #1 rp + 4'h1; 
  else 
  if(re & !m16b) rp <= #1 rp + 4'h2; 
 always @(posedge clk) 
  status <= #1 (wp[1:0] - rp[2:1]) - 2'h1; 
 wire [3:0] rp_p1 = rp[3:0] + 4'h1; 
 always @(posedge clk) 
  empty <= #1 (rp_p1[3:1] == wp[2:0]) & (m16b ? rp_p1[0] : 1'b1); 
 assign full = (wp[1:0] == rp[2:1]) & (wp[2] != rp[3]); 
 assign dout_tmp = mem[ rp[2:1] ]; 
 assign dout_tmp1 = rp[0] ? dout_tmp[31:16] : dout_tmp[15:0]; 
 always @(posedge clk) 
  if(!en) dout <= #1 20'h0; 
  else 
  if(re) 
  case(mode) 
  2'h0: dout <= #1 {dout_tmp1, 4'h0}; 
  2'h1: dout <= #1 {dout_tmp[17:0], 2'h0}; 
  2'h2: dout <= #1 dout_tmp[19:0]; 
  endcase 
 always @(posedge clk) 
  if(we) mem[wp[1:0]] <= #1 din; 
 endmodule