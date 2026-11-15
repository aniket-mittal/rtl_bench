module mg_04659(input CLK, input pushPop_valid, input CE, input sr_input, output pushPop_out, input reset);
parameter INSTANCE_NAME="INST"; 
 always @(posedge CLK) begin if(pushPop_valid===1'bx) begin ; end end 
 always @(posedge CLK) begin if(reset===1'bx) begin ; end end 
  reg SR2; 
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin ; end end 
  always @(posedge CLK) begin if(reset===1'bx) begin ; end end 
  [MASKED] 
  wire [1:0] unnamedcallArbitrate8069USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate8069USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(sr_input):((1'd0)))}; 
  reg SR1; always @ (posedge CLK) begin if ((unnamedcallArbitrate8069USEDMULTIPLEcallArbitrate[1]) && CE) begin SR1 <= (unnamedcallArbitrate8069USEDMULTIPLEcallArbitrate[0]); end end 
  always @(posedge CLK) begin if(pushPop_valid===1'bx) begin ; end end 
  always @(posedge CLK) begin if(reset===1'bx) begin ; end end 
  always @(posedge CLK) begin if((({4'b0,pushPop_valid})+({4'b0,reset})) > 5'd1) begin ;; end end 
  wire [1:0] unnamedcallArbitrate8075USEDMULTIPLEcallArbitrate;assign unnamedcallArbitrate8075USEDMULTIPLEcallArbitrate = {(pushPop_valid||reset),((pushPop_valid)?(SR1):((1'd0)))}; 
  always @ (posedge CLK) begin if ((unnamedcallArbitrate8075USEDMULTIPLEcallArbitrate[1]) && CE) begin SR2 <= (unnamedcallArbitrate8075USEDMULTIPLEcallArbitrate[0]); end end 
  assign pushPop_out = SR2; 
 endmodule