module NAND3_X1 (input A1, input A2, input A3, output Z);
    assign Z = ~(A1 & A2 & A3);
endmodule