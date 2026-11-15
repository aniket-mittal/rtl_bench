module MUX2_X1 (input A, input B, input S, output Z);
    assign Z = S ? B : A;
endmodule