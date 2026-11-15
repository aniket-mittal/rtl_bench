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