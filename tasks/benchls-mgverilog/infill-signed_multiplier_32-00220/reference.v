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
 always@(a or b or is_neg_a or is_neg_b or a_tmp or b_tmp or c) 
 begin 
  if(a[31] == 1) begin 
  a_tmp = -a; 
  is_neg_a = 1; 
  end else 
  begin 
  a_tmp = a; 
  is_neg_a = 0; 
  end 
  if(b[31] == 1) begin 
  b_tmp = -b; 
  is_neg_b = 1; 
  end else 
  begin 
  b_tmp = b; 
  is_neg_b = 0; 
  end 
  if( is_neg_a != is_neg_b) begin 
  c_tmp = -(a_tmp * b_tmp); 
  end else 
  begin 
  c_tmp = (a_tmp * b_tmp); 
  end 
 end 
 always@(c_tmp) 
 begin 
  c = c_tmp; 
 end 
 endmodule