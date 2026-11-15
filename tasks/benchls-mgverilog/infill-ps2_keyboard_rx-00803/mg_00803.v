module mg_00803(input wire clk, clr,input wire ps2c, ps2d,output wire [15:0] xkey);
reg PS2Cf, PS2Df; 
  reg [ 7:0] ps2c_filter, ps2d_filter; 
  reg [10:0] shift1, shift2; 
  assign xkey = {shift2[8:1], shift1[8:1]}; 
  [MASKED] 
  always @ (negedge PS2Cf or posedge clr) 
  begin 
  if (clr == 1) 
  begin 
  shift1 <= 0; 
  shift2 <= 1; 
  end 
  else 
  begin 
  shift1 <= {PS2Df, shift1[10:1]}; 
  shift2 <= {shift1[0], shift2[10:1]}; 
  end 
  end 
 endmodule