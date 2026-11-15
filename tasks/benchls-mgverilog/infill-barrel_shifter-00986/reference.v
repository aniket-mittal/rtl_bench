module mg_00986 ( a, amount, cin, o);
parameter width_a = 6; 
  parameter width_amount = 6; 
  parameter width_o = 6; 
  parameter sgate_representation = 0; 
  input [width_a-1:0] a; 
  input [width_amount-1:0] amount; 
  input cin; 
  output [width_o-1:0] o; 
  integer i; 
  reg [width_a-1:0] ONES; 
  reg [width_a-1:0] tmp_buf; 
  reg [width_a-1:0] temp_result2; 
  initial 
  begin 
  if (width_amount <= 0) 
  begin 
  $display("Error! width_amount must be greater than 0.\n"); 
  $display ("Time: %0t Instance: %m", $time); 
  end 
  if (width_a <= 0) 
  begin 
  $display("Error! width_a must be greater than 0.\n"); 
  $display ("Time: %0t Instance: %m", $time); 
  end 
  if (width_a < width_o) 
  begin 
  $display("Error! width_a must be greater than or equal to width_o.\n"); 
  $display ("Time: %0t Instance: %m", $time); 
  end 
  if (sgate_representation != 1 && sgate_representation != 0) 
  begin 
  $display("Error! sgate_representation value must be 1 (SIGNED) or 0 (UNSIGNED)."); 
  $display ("Time: %0t Instance: %m", $time); 
  end 
  end 
  always @(a or amount or cin) 
  begin 
  tmp_buf[width_a-1:0]=a[width_a-1:0]; 
  if (sgate_representation) 
  begin 
  for (i=0; i < width_a; i=i+1) 
  ONES[i] = cin; 
  end 
  else 
  begin 
  for (i=0; i < width_a; i=i+1) 
  ONES[i] = cin; 
  end 
  temp_result2 = (tmp_buf << amount) | (ONES >> (width_a-amount)) ; 
  end 
  assign o = temp_result2[width_o-1:0]; 
 endmodule