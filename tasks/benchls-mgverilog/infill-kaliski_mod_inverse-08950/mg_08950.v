module mg_08950 (input clk,input reset,input [255:0] rx_a,input [255:0] rx_p,output reg tx_done,output reg [255:0] tx_a);
reg [255:0] u, v, x, y; 
  reg x_carry, y_carry; 
  wire u_even = u[0] == 1'b0; 
  wire v_even = v[0] == 1'b0; 
  wire [256:0] u_minus_v = {1'b0, u} - {1'b0, v}; 
  wire [256:0] v_minus_u = {1'b0, v} - {1'b0, u}; 
  reg [256:0] x_adder, y_adder; 
  always @ (*) 
  begin 
  if (x_carry || y_carry) 
  begin 
  x_adder = x + rx_p; 
  y_adder = y + rx_p; 
  end 
  else if (u_even || v_even) 
  begin 
  x_adder = x + rx_p; 
  y_adder = y + rx_p; 
  end 
  else 
  begin 
  x_adder = x - y; 
  y_adder = y - x; 
  end 
  end 
  [MASKED] 
 endmodule