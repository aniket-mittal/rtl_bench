module mg_09085(input clk,input rst,input sample,input [2:0] volume,input signed [13:0] pre,output reg signed [15:0] post);
wire signed [14:0] x2 = pre<<<1; 
 wire signed [15:0] x3 = x2+pre; 
 wire signed [15:0] x4 = pre<<<2; 
 wire signed [16:0] x6 = x4+x2; 
 wire signed [16:0] x8 = pre<<<3; 
 wire signed [17:0] x12 = x8+x4; 
 wire signed [17:0] x16 = pre<<<4; 
 always @(posedge clk) 
 if( rst ) 
  post <= 16'd0; 
 else 
 if( sample ) 
  case( volume ) 
  3'd0: 
  post <= { {2{pre[13]}}, pre }; 
  3'd1: 
  post <= { x2[14], x2 }; 
  3'd2: 
  post <= { x2, 1'd0 }; 
  3'd3: 
  post <= x4; 
  3'd4: 
  casex( x6[16:15] ) 
  2'b00, 2'b11: post <= x6[15:0]; 
  2'b0x: post <= 16'h7FFF; 
  2'b1x: post <= 16'h8000; 
  endcase 
  3'd5: 
  casex( x8[16:15] ) 
  2'b00, 2'b11: post <= x8[15:0]; 
  2'b0x: post <= 16'h7FFF; 
  2'b1x: post <= 16'h8000; 
  endcase 
  3'd6: 
  casex( x12[17:15] ) 
  3'b000, 3'b111: post <= x12[15:0]; 
  3'b0xx: post <= 16'h7FFF; 
  3'b1xx: post <= 16'h8000; 
  endcase 
  3'd7: 
  casex( x16[17:15] ) 
  3'b000, 3'b111: post <= x16[15:0]; 
  3'b0xx: post <= 16'h7FFF; 
  3'b1xx: post <= 16'h8000; 
  endcase 
  endcase 
 endmodule