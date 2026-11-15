module asic_oai22 #(parameter PROP = "DEFAULT")   (
    input  a0,
    input  a1,
    input  b0,
    input  b1,
    output z
    );

   assign z = ~((a0 | a1) & (b0 | b1));

endmodule