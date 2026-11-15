module mg_04610 (a, b, cin, o);
parameter width_a = 6; 
  parameter width_b = 6; 
  parameter sgate_representation = 0; 
  parameter width_max= width_a>width_b ? width_a : width_b; 
  input [width_a-1:0] a; 
  input [width_b-1:0] b; 
  input cin; 
  output o; 
  integer sa; 
  integer sb; 
  reg [width_a-1:0] not_a; 
  reg [width_b-1:0] not_b; 
  reg tmp_result; 
  initial 
  begin 
  if (width_a <= 0) 
  begin 
  $display("Error! width_a must be greater than 0.\n"); 
  $display ("Time: %0t Instance: %m", $time); 
  end 
  if (width_b <= 0) 
  begin 
  $display("Error! width_b must be greater than 0.\n"); 
  $display ("Time: %0t Instance: %m", $time); 
  end 
  if (sgate_representation != 1 && sgate_representation != 0) 
  begin 
  $display("Error! sgate_representation value must be 1 (SIGNED) or 0 (UNSIGNED)."); 
  $display ("Time: %0t Instance: %m", $time); 
  end 
  end 
  always @(a or b or cin) 
  begin 
  sa = a; 
  sb = b; 
  not_a = ~a; 
  not_b = ~b; 
  if (sgate_representation == "SIGNED") 
  begin 
  if (a[width_a-1] == 1) 
  sa = (not_a) * (-1) - 1; 
  if (b[width_b-1] == 1) 
  sb = (not_b) * (-1) - 1; 
  if (sa<sb) 
  begin 
  tmp_result = 1; 
  end 
  else if ((sa==sb)&&(cin)) 
  begin 
  tmp_result = 1; 
  end 
  else 
  begin 
  tmp_result = 0; 
  end 
  end 
  else 
  begin 
  if (a<b) 
  begin 
  tmp_result = 1; 
  end 
  else if ((a==b)&&(cin)) 
  begin 
  tmp_result = 1; 
  end 
  else 
  begin 
  tmp_result = 0; 
  end 
  end 
  end 
  assign o = tmp_result; 
 endmodule