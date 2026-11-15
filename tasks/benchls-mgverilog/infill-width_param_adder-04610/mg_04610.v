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
  [MASKED] 
  assign o = tmp_result; 
 endmodule