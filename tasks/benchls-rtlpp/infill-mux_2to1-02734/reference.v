module rtlpp_02734(
    input D0,
    input D1,
    input S0,
    output O
);

    wire M0;
    wire M1;

    assign M0 = ~S0 & D0;
    assign M1 = S0 & D1;
    assign O = M0 | M1;

endmodule