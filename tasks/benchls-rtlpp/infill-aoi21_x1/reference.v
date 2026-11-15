module AOI21_X1 (input A, input B1, input B2, output Z);
    assign Z = ~(A & (B1 & B2));
endmodule