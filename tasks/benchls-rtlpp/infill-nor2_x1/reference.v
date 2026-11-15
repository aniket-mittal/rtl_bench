module NOR2_X1 (input A1, input A2, output Z);
    assign Z = ~(A1 | A2);
endmodule