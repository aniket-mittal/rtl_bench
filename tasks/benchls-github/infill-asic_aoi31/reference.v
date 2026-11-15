module asic_aoi31 #(parameter PROP = "DEFAULT")   (
    input  a0,
    input  a1,
    input  a2,
    input  b0,
    output z
    );

   assign z = ~((a0 & a1 & a2) | b0);

endmodule