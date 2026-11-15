module asic_mux2 #(parameter PROP = "DEFAULT")   (
    input  d0,
    input  d1,
    input  s,
    output z
    );

   assign z = (d0 & ~s) | (d1 & s);

endmodule