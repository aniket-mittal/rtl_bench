module mg_01217(input wire [63 : 0] a,input wire [63 : 0] b,input wire [63 : 0] c,input wire [63 : 0] d,input wire [63 : 0] m0,input wire [63 : 0] m1,output wire [63 : 0] a_prim,output wire [63 : 0] b_prim,output wire [63 : 0] c_prim,output wire [63 : 0] d_prim);
reg [63 : 0] internal_a_prim; 
  reg [63 : 0] internal_b_prim; 
  reg [63 : 0] internal_c_prim; 
  reg [63 : 0] internal_d_prim; 
  assign a_prim = internal_a_prim; 
  assign b_prim = internal_b_prim; 
  assign c_prim = internal_c_prim; 
  assign d_prim = internal_d_prim; 
  [MASKED] 
 endmodule