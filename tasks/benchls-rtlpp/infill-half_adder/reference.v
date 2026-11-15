module Half_Adder (
    output Sum,
    output Cout,
    input A,
    input B
);
    assign Sum = A ^ B;
    assign Cout = A & B;
endmodule