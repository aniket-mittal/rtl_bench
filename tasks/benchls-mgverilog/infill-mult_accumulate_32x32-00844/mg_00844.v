module mg_00844(input wire clk,input wire reset_n,input wire init,input wire update,input wire [63 : 0] opa,input wire [31 : 0] opb,output wire [63 : 0] res);
reg [63 : 0] mulacc_res_reg; 
  reg [63 : 0] mulacc_res_new; 
  assign res = mulacc_res_reg; 
  always @ (posedge clk) 
  begin : reg_update 
  if (!reset_n) 
  begin 
  mulacc_res_reg <= 64'h0; 
  end 
  else 
  begin 
  if (update) 
  mulacc_res_reg <= mulacc_res_new; 
  end 
  end 
  [MASKED] 
 endmodule