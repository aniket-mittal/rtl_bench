module mg_01015 ( a, b, addnsub, o );
parameter width_a = 32; 
  parameter width_b = 32; 
  parameter width_o = 32; 
  parameter sgate_representation = 0; 
  input [width_a-1:0] a; 
  input [width_b-1:0] b; 
  input addnsub; 
  output [width_o-1:0] o; 
  reg [width_a-1:0] not_a; 
  reg [width_b-1:0] not_b; 
  reg [width_o-1:0] tmp_result; 
  integer a_int, b_int; 
  integer result_int, i; 
  wire i_add_sub; 
  buf (i_add_sub, addnsub); 
  initial 
  begin 
  if (width_a <= 0) 
  $display("Error! width_a must be greater than 0.\n"); 
  if (width_b <= 0) 
  $display("Error! width_b must be greater than 0.\n"); 
  if (width_o <= 0) 
  $display("Error! width_o must be greater than 0.\n"); 
  if (width_a != width_b) 
  $display("Error! width_a must be equal to width_b.\n"); 
  if (width_a != width_o) 
  $display("Error! width_a must be equal to width_o.\n"); 
 if (sgate_representation != 1 &&sgate_representation != 0) 
  $display("Error! sgate_representation value must be 1 (SIGNED) or 0 (UNSIGNED)."); 
  tmp_result = 'b0; 
  end 
  always @(a or b or i_add_sub) 
  begin 
  if (i_add_sub == 1) 
  begin 
  tmp_result = a + b; 
  end 
  else if (i_add_sub == 0) 
  begin 
  tmp_result = a - b; 
  end 
  if (sgate_representation == 1) 
  begin 
  not_a = ~a; 
  not_b = ~b; 
  a_int = (a[width_a-1]) ? (not_a)*(-1)-1 : a; 
  b_int = (b[width_b-1]) ? (not_b)*(-1)-1 : b; 
  if (i_add_sub == 1) 
  begin 
  result_int = a_int + b_int; 
  tmp_result = result_int; 
  end 
  else if (i_add_sub == 0) 
  begin 
  result_int = a_int - b_int; 
  tmp_result = result_int; 
  end 
  tmp_result = result_int; 
  end 
  end 
  assign o = tmp_result; 
 endmodule