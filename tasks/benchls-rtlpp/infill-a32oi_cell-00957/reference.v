module rtlpp_00957 (
    Y,
    A1,
    A2,
    A3,
    B1,
    B2
);

    output Y;
    input  A1;
    input  A2;
    input  A3;
    input  B1;
    input  B2;

    wire and_output;

    // Internal logic to represent the functionality of sky130_fd_sc_hs__a32oi
    assign and_output = (A1 & A2 & A3) | (B1 & B2);
    assign Y = ~and_output;

endmodule