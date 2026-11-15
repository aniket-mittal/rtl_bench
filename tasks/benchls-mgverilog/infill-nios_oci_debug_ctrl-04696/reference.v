module mg_04696 (clk,dbrk_break,debugreq,hbreak_enabled,jdo,jrst_n,ocireg_ers,ocireg_mrs,reset,st_ready_test_idle,take_action_ocimem_a,take_action_ocireg,xbrk_break,debugack,monitor_error,monitor_go,monitor_ready,oci_hbreak_req,resetlatch,resetrequest);
output debugack; 
  output monitor_error; 
  output monitor_go; 
  output monitor_ready; 
  output oci_hbreak_req; 
  output resetlatch; 
  output resetrequest; 
  input clk; 
  input dbrk_break; 
  input debugreq; 
  input hbreak_enabled; 
  input [ 37: 0] jdo; 
  input jrst_n; 
  input ocireg_ers; 
  input ocireg_mrs; 
  input reset; 
  input st_ready_test_idle; 
  input take_action_ocimem_a; 
  input take_action_ocireg; 
  input xbrk_break; 
  wire debugack; 
  reg jtag_break ; 
  reg monitor_error ; 
  reg monitor_go ; 
  reg monitor_ready ; 
  wire oci_hbreak_req; 
  reg probepresent ; 
  reg resetlatch ; 
  reg resetrequest ; 
  always @(posedge clk or negedge jrst_n) 
  begin 
  if (jrst_n == 0) 
  begin 
  probepresent <= 1'b0; 
  resetrequest <= 1'b0; 
  jtag_break <= 1'b0; 
  end 
  else if (take_action_ocimem_a) 
  begin 
  resetrequest <= jdo[22]; 
  jtag_break <= jdo[21] ? 1 
  : jdo[20] ? 0 
  : jtag_break; 
  probepresent <= jdo[19] ? 1 
  : jdo[18] ? 0 
  : probepresent; 
  resetlatch <= jdo[24] ? 0 : resetlatch; 
  end 
  else if (reset) 
  begin 
  jtag_break <= probepresent; 
  resetlatch <= 1; 
  end 
  else if (~debugack & debugreq & probepresent) 
  jtag_break <= 1'b1; 
  end 
  always @(posedge clk or negedge jrst_n) 
  begin 
  if (jrst_n == 0) 
  begin 
  monitor_ready <= 1'b0; 
  monitor_error <= 1'b0; 
  monitor_go <= 1'b0; 
  end 
  else 
  begin 
  if (take_action_ocimem_a && jdo[25]) 
  monitor_ready <= 1'b0; 
  else if (take_action_ocireg && ocireg_mrs) 
  monitor_ready <= 1'b1; 
  if (take_action_ocimem_a && jdo[25]) 
  monitor_error <= 1'b0; 
  else if (take_action_ocireg && ocireg_ers) 
  monitor_error <= 1'b1; 
  if (take_action_ocimem_a && jdo[23]) 
  monitor_go <= 1'b1; 
  else if (st_ready_test_idle) 
  monitor_go <= 1'b0; 
  end 
  end 
  assign oci_hbreak_req = jtag_break | dbrk_break | xbrk_break | debugreq; 
  assign debugack = ~hbreak_enabled; 
 endmodule