module rtlpp_04118 (
    input D,
    input Clock,
    output reg Q,
    output Qbar
);

[MASKED]

assign Qbar = ~Q;

endmodule