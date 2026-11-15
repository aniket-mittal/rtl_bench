module mg_02073(clk, rst, ena, state);
input clk, rst, ena; 
  output [3:0] state; 
  reg [3:0] state; 
  always @(posedge rst or posedge clk) begin 
  if (rst == 1) begin 
  state <= 1; 
  end else if (ena) begin 
  state[3:1] <= state[2:0]; 
  state[0] <= state[2] ^ state[3]; 
  end 
  end 
 endmodule