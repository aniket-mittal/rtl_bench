module mg_09985 (input clk,input reset_n,input in_valid,input [ 7: 0] in_data,output reg out_valid,output reg [ 7: 0] out_data,input out_ready);
reg [ 7: 0] in_payload; 
  reg [ 7: 0] out_payload; 
  reg [ 0: 0] ready; 
  reg in_ready; 
  always @(negedge in_ready) begin 
  ; 
  end 
  always @* begin 
  in_payload = {in_data}; 
  {out_data} = out_payload; 
  end 
  [MASKED] 
 endmodule