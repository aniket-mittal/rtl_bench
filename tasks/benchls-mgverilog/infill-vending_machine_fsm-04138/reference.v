module mg_04138(clk, rst, deposited, selected, cancel, maintenance, purchase,ldRdeposit, ldRselect, ldRprice, ldA, ldRproduct, ldRchange,ldRpurchase, ldMprice, ldMquantity, clrRdeposit, clrRselect,clrRprice, clrA, clrRproduct, clrRchange, clrRpurchase,refundall, depositall, state);
input clk, rst; 
  input deposited, selected, cancel, maintenance, purchase; 
  output ldRdeposit, ldRselect, ldRprice, ldA, ldRproduct, ldRchange; 
  output ldRpurchase, ldMprice, ldMquantity, clrRdeposit, clrRselect; 
  output clrRprice, clrA, clrRproduct, clrRchange, clrRpurchase; 
  output refundall, depositall; 
  output [2:0] state; 
  reg [2:0] pstate, nstate; 
  reg [15:0] cv; 
  parameter S_init = 3'b000, S_wait = 3'b001, S_deposit = 3'b010, 
  S_cancel = 3'b011, S_select = 3'b100, S_purchase = 3'b101, 
  S_maintenance = 3'b110; 
  always @ (negedge clk or negedge rst) begin 
  if (rst == 0) pstate <= S_init; 
  else pstate <= nstate; 
  end 
  always @ (pstate or cancel or maintenance or deposited or selected or purchase) begin 
  case (pstate) 
  S_init: 
  nstate = S_wait; 
  S_wait: 
  if (maintenance) nstate = S_maintenance; 
  else if (deposited) nstate = S_deposit; 
  else if (cancel) nstate = S_cancel; 
  else if (selected) nstate = S_select; 
  else nstate = S_wait; 
  S_select: 
  if (purchase) nstate = S_purchase; 
  else nstate = S_wait; 
  S_purchase: nstate = S_init; 
  S_maintenance: 
  if (maintenance) nstate = S_maintenance; 
  else nstate = S_init; 
  default: nstate = S_wait; 
  endcase 
  end 
  always @ (pstate or selected) begin 
  case (pstate) 
  S_init: cv = 16'b0011_1111_1000_0000; 
  S_wait: cv = 16'b0011_1000_0000_0111; 
  S_deposit: cv = 16'b0011_1011_0000_1001; 
  S_cancel: cv = 16'b0011_1111_1000_0000; 
  S_select: cv = 16'b0001_1010_1100_0000; 
  S_purchase: cv = 16'b1010_0010_1011_0000; 
  S_maintenance: 
  if (selected) cv = 16'b0111_1100_1000_0110; 
  else cv = 16'b0011_1100_1000_0000; 
  endcase 
  end 
  assign state = pstate; 
  assign ldRdeposit = cv[0]; 
  assign ldRselect = cv[1]; 
  assign ldRprice = cv[2]; 
  assign ldA = cv[3]; 
  assign ldRproduct = cv[4]; 
  assign ldRchange = cv[5]; 
  assign ldRpurchase = cv[6]; 
  assign clrRdeposit = cv[7]; 
  assign clrRselect = cv[8]; 
  assign clrRprice = cv[9]; 
  assign clrA = cv[10]; 
  assign clrRproduct = cv[11]; 
  assign clrRchange = cv[12]; 
  assign clrRpurchase = cv[13]; 
  assign ldMprice = cv[14]; 
  assign ldMquantity = cv[15]; 
  assign refundall = (state == S_cancel || state == S_maintenance) ? 1'b1 : 1'b0; 
  assign depositall = (state == S_purchase) ? 1'b1 : 1'b0; 
 endmodule