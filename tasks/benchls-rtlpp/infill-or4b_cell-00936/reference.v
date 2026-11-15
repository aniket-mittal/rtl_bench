module rtlpp_00936 (
    X   ,
    A   ,
    B   ,
    C   ,
    D_N
);

    output X;
    input  A;
    input  B;
    input  C;
    input  D_N;
    
    assign X = A | B | C | ~D_N;

endmodule