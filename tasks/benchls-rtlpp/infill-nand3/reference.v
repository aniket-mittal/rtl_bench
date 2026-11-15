module nand3(output O, input I0, I1, I2);
    assign O = ~(I0 & I1 & I2);
endmodule