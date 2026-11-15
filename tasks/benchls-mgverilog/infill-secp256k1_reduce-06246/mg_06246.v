module mg_06246 (input clk,input reset,input [511:0] rx_a,output reg tx_done,output reg [255:0] tx_a);
reg [3:0] cnt; 
  reg [259:0] s; 
  reg [32:0] s1; 
  reg [64:0] k; 
  wire [34:0] k11 = {s1, 2'd0} + {s1, 1'd0} + s1; 
  wire [255:0] c1 = rx_a[511:256]; 
  reg [255:0] other; 
  wire [260:0] s_minus_p = s - 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFC2F; 
  [MASKED] 
  always @ (posedge clk) 
  begin 
  cnt <= cnt + 1; 
  s <= s + other; 
  if (cnt == 8) 
  begin 
  cnt <= cnt; 
  s <= s_minus_p; 
  if (s_minus_p[260] && !tx_done) 
  begin 
  tx_done <= 1'b1; 
  tx_a <= s[255:0]; 
  end 
  end 
  s1 <= c1[255:252] + c1[255:250] + c1[255:249] + c1[255:248] + c1[255:247] + c1[255:224]; 
  k <= {s1, 32'd0} + {k11, 7'd0} + {s1, 6'd0} + {s1, 4'd0} + s1; 
  if (reset) 
  begin 
  cnt <= 0; 
  tx_done <= 1'b0; 
  s <= rx_a[255:0]; 
  end 
  end 
 endmodule