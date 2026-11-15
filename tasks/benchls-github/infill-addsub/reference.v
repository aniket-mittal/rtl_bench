module addsub (sub,a,b,o);

parameter WIDTH = 16;
parameter METHOD = 1;

input sub;
input [WIDTH-1:0] a,b;
output [WIDTH:0] o;

generate
  if (METHOD == 0) begin
    // generic style
    assign o = sub ? (a - b) : (a + b);
  end
  else if (METHOD == 1) begin
    // Hardware implementation with XORs in front of a
	// carry chain.
	wire [WIDTH+1:0] tmp;
	assign tmp = {1'b0,a,sub} + {sub,{WIDTH{sub}} ^ b,sub};
	assign o = tmp[WIDTH+1:1];
  end
endgenerate

endmodule