module asic_csa42 #(parameter PROP = "DEFAULT")  ( input  a,
    input  b,
    input  c,
    input  d,
    input  cin,
    output sum,
    output carry,
    output cout
    );

   assign cout   = (a & b) | (b & c) | (a & c);
   assign sumint = a ^ b ^ c;
   assign sum    = cin ^ d ^ sumint;
   assign carry  = (cin & d) | (cin & sumint) | (d & sumint);

endmodule