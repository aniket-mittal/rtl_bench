module foo(z, a, b, c, d);
output reg z;
input a, b, c, d;
reg q;

  always @ (posedge d)
    q <= a & b | c;

  always @ (posedge d)
    z <= q ^ c; 

endmodule