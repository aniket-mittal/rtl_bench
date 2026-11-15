module asic_or4 #(parameter PROP = "DEFAULT")   (
    input  a,
    input  b,
    input  c,
    input  d,
    output z
    );

   assign z = a | b | c | d;

endmodule