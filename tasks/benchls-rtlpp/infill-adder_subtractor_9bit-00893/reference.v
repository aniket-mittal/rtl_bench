module rtlpp_00893(
    input [8:0] A,
    input ADD,
    input [8:0] B,
    input CI,
    output CO,
    output OFL,
    output [8:0] S
);

    wire C0, C1, C2, C3, C4, C5, C6, C6O;
    wire I0, I1, I2, I3, I4, I5, I6, I8;
    wire SUB0, SUB1, SUB2, SUB3, SUB4, SUB5, SUB6, SUB7, SUB8;
    wire XLXN_329, XLXN_346, CO_DUMMY;

    assign CO = CO_DUMMY;

    assign SUB0 = ~ADD;
    assign SUB1 = ~ADD;
    assign SUB2 = ~ADD;
    assign SUB3 = ~ADD;
    assign SUB4 = ~ADD;
    assign SUB5 = ~ADD;
    assign SUB6 = ~ADD;
    assign SUB7 = ~ADD;
    assign SUB8 = ~ADD;

    assign I0 = A[0] ^ B[0] ^ SUB0;
    assign I1 = A[1] ^ B[1] ^ SUB1;
    assign I2 = A[2] ^ B[2] ^ SUB2;
    assign I3 = A[3] ^ B[3] ^ SUB3;
    assign I4 = A[4] ^ B[4] ^ SUB4;
    assign I5 = A[5] ^ B[5] ^ SUB5;
    assign I6 = A[6] ^ B[6] ^ SUB6;
    assign XLXN_329 = A[7] ^ B[7] ^ SUB7;
    assign I8 = A[8] ^ B[8] ^ SUB8;

    assign {C0} = CI && (A[0] ^ SUB0);
    assign {C1} = C0 && (A[1] ^ SUB1);
    assign {C2} = C1 && (A[2] ^ SUB2);
    assign {C3} = C2 && (A[3] ^ SUB3);
    assign {C4} = C3 && (A[4] ^ SUB4);
    assign {C5} = C4 && (A[5] ^ SUB5);
    assign {C6} = C5 && (A[6] ^ SUB6);
    assign {XLXN_346, C6O} = C6 && ((A[7] ^ SUB7) + XLXN_329);
    assign {CO_DUMMY} = XLXN_346 && ((A[8] ^ SUB8) + I8);

    assign S[0] = CI ^ I0;
    assign S[1] = C0 ^ I1;
    assign S[2] = C1 ^ I2;
    assign S[3] = C2 ^ I3;
    assign S[4] = C3 ^ I4;
    assign S[5] = C4 ^ I5;
    assign S[6] = C5 ^ I6;
    assign S[7] = C6 ^ XLXN_329;
    assign S[8] = XLXN_346 ^ I8;

    assign OFL = C6O ^ CO_DUMMY;

endmodule