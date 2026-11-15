module mg_00692 (out, in0, s0, in1, s1, in2, s2);
parameter bits = 32; 
 output [bits-1:0] out; 
 input [bits-1:0] in0, in1, in2; 
 input s0, s1, s2; 
  reg [bits-1:0] out; 
  always @ (s0 or s1 or s2 or in0 or in1 or in2) begin 
  case ({s2, s1, s0}) 
  3'b001: out = in0; 
  3'b010: out = in1; 
  3'b100: out = in2; 
  default: out = 65'hx; 
  endcase 
  end 
 endmodule