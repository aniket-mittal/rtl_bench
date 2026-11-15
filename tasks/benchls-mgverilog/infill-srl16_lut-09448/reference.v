module mg_09448 (input CLK, CE, D,input A0, A1, A2, A3,output Q, Q15);
parameter [15:0] INIT = 16'd0; 
  parameter [0:0] IS_CLK_INVERTED = 1'b0; 
  reg [15:0] r = INIT; 
  assign Q15 = r[15]; 
  assign Q = r[{A3,A2,A1,A0}]; 
  generate 
  if (IS_CLK_INVERTED) begin 
  always @(negedge CLK) if (CE) r <= { r[14:0], D }; 
  end else begin 
  always @(posedge CLK) if (CE) r <= { r[14:0], D }; 
  end 
  endgenerate 
 endmodule