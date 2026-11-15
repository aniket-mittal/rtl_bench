module mg_02059(clk, rst, ena, state);
input clk, rst, ena; 
  output [11:0] state; 
  reg [11:0] state; 
  always @(posedge rst or posedge clk) begin 
  if (rst == 1) begin 
  state <= 1; 
  end else if (ena) begin 
  state[11:1] <= state[10:0]; 
  state[0] <= state[3] ^ state[9] ^ state[10] ^ state[11]; 
  end 
  end 
 endmodule