module asic_nand2 #(parameter PROP = "DEFAULT")   (
    input  a,
    input  b,
    output z
    );

   assign z = ~(a & b);

endmodule