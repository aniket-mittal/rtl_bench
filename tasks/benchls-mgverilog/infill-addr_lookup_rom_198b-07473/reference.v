module mg_07473 (clk, addr, out, effective);
input clk; 
  input [5:0] addr; 
  output reg [197:0] out; 
  output reg effective; 
  always @ (posedge clk) 
  begin 
  effective <= 1; 
  case (addr) 
  1: out <= 198'd0; 
  2: out <= 198'd1; 
  4: out <= {6'b000101, 192'd0}; 
  8: out <= {6'b001001, 192'd0}; 
  16: out <= {6'b010101, 192'd0}; 
  default: 
  begin out <= 198'd0; effective <= 0; end 
  endcase 
  end 
 endmodule