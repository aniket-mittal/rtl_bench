module compress_32 (a,b,c,oo,ot);
parameter WIDTH = 16;
input [WIDTH-1:0] a,b,c;
output [WIDTH-1:0] oo,ot;

genvar i;
generate
    for (i=0; i<WIDTH; i=i+1)
    begin : cmp
        assign oo[i] = a[i] ^ b[i] ^ c[i];
        assign ot[i] = (a[i] & b[i]) | (a[i] & c[i]) | (b[i] & c[i]);
    end
endgenerate
endmodule

module compress_42 (ci,a,b,c,d,co,oo,ot);
parameter WIDTH = 16;
input ci;
input [WIDTH-1:0] a,b,c,d;
output [WIDTH-1:0] oo,ot;
output co;

wire [WIDTH-1:0] internal_o;
wire [WIDTH-1:0] internal_t;

compress_32 i (.a(a),.b(b),.c(c),.oo(internal_o),.ot(internal_t));
	defparam i .WIDTH = WIDTH;

compress_32 o (.a({internal_t[WIDTH-2:0],ci}),
				.b(d),
				.c(internal_o),
				.oo(oo),.ot(ot));
	defparam o .WIDTH = WIDTH;
assign co = internal_t[WIDTH-1];
endmodule