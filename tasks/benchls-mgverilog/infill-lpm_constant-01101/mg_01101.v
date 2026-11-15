module mg_01101 (result);
parameter lpm_width = 1; 
  parameter lpm_cvalue = 0; 
  parameter lpm_strength = "UNUSED"; 
  parameter lpm_type = "lpm_constant"; 
  parameter lpm_hint = "UNUSED"; 
  output [lpm_width-1:0] result; 
  reg[32:0] int_value; 
  initial 
  begin 
  if (lpm_width <= 0) 
  begin 
  $display("Value of lpm_width parameter must be greater than 0(ERROR)"); 
  $display("Time: %0t Instance: %m", $time); 
  ; 
  end 
  int_value = lpm_cvalue; 
  end 
  [MASKED] 
 endmodule