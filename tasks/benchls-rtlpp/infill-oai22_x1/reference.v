module OAI22_X1 (input A1, input A2, input B1, input B2, output Z);
    assign Z = ~((A1 | A2) & (B1 | B2));
endmodule