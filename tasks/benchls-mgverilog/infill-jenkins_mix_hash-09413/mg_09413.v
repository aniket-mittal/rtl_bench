module mg_09413 (input CLK, input RST, input emit, input onloop, input [7:0] wcount, input [31:0] ia, input [31:0] ib, input [31:0] ic, input [31:0] k0, input [31:0] k1, input [31:0] k2, output reg[31:0] o);
reg[31:0] a0, b0, c0; 
 wire[31:0] c1 = (c0 ^ b0) - {b0[17:0], b0[31:18]}; 
 wire[31:0] a1 = (a0 ^ c1) - {c1[20:0], c1[31:21]}; 
 wire[31:0] b1 = (b0 ^ a1) - {a1[6:0], a1[31:7]}; 
 wire[31:0] c2 = (c1 ^ b1) - {b1[15:0], b1[31:16]}; 
 wire[31:0] a2 = (a1 ^ c2) - {c2[27:0], c2[31:28]}; 
 wire[31:0] b2 = (b1 ^ a2) - {a2[17:0], a2[31:18]}; 
 wire[31:0] c3 = (c2 ^ b2) - {b2[7:0], b2[31:8]}; 
 always @(posedge CLK) begin 
  if (RST) 
  o <= 32'b0; 
  else begin 
  if (emit) begin 
  if (onloop) 
  o <= c3; 
  else 
  o <= ic; 
  end 
  end 
 end 
 [MASKED] 
 endmodule