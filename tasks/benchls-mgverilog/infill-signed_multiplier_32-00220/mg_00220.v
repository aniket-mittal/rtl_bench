module mg_00220(a, b, c);
input [31:0]a; 
  input [31:0]b; 
  output [63:0]c; 
  reg [63:0]c; 
  reg is_neg_a; 
  reg is_neg_b; 
  reg [31:0]a_tmp; 
  reg [31:0]b_tmp; 
  reg [63:0]c_tmp; 
 [MASKED] 
 always@(c_tmp) 
 begin 
  c = c_tmp; 
 end 
 endmodule