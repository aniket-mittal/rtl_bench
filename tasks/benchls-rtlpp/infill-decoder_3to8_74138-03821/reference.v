module rtlpp_03821 (
    input A,
    input B,
    input C,
    input G,
    input G_2A,
    input G_2B,
    output Y0,
    output Y1,
    output Y2,
    output Y3,
    output Y4,
    output Y5,
    output Y6,
    output Y7
);
    wire XLXN_1, XLXN_2, XLXN_3, XLXN_4, XLXN_5, XLXN_6, XLXN_7, XLXN_8;
    wire XLXN_19, XLXN_21, XLXN_23, XLXN_28, XLXN_32;
    wire XLXN_16, XLXN_17, XLXN_32_AND;

    // Decoder Logic Embedded from Decoder_38_sch_MUSER_HTC138
    wire not_A;
    wire not_B;
    wire not_C;

    assign not_A = ~A;
    assign not_B = ~B;
    assign not_C = ~C;

    assign XLXN_19 = not_B & not_A;
    assign XLXN_21 = not_B & A;
    assign XLXN_23 = B & not_A;
    assign XLXN_28 = B & A;

    assign XLXN_1 = not_C & XLXN_19;
    assign XLXN_2 = not_C & XLXN_21;
    assign XLXN_3 = not_C & XLXN_23;
    assign XLXN_4 = not_C & XLXN_28;
    assign XLXN_5 = C & XLXN_19;
    assign XLXN_6 = C & XLXN_21;
    assign XLXN_7 = C & XLXN_23;
    assign XLXN_8 = C & XLXN_28;

    // AND and INV logic
    assign XLXN_16 = ~G_2A;
    assign XLXN_17 = ~G_2B;

    assign XLXN_32_AND = G & XLXN_17 & XLXN_16;

    // NAND logic for Y outputs
    assign Y0 = ~(XLXN_32_AND & XLXN_1);
    assign Y1 = ~(XLXN_32_AND & XLXN_2);
    assign Y2 = ~(XLXN_32_AND & XLXN_3);
    assign Y3 = ~(XLXN_32_AND & XLXN_4);
    assign Y4 = ~(XLXN_32_AND & XLXN_5);
    assign Y5 = ~(XLXN_32_AND & XLXN_6);
    assign Y6 = ~(XLXN_32_AND & XLXN_7);
    assign Y7 = ~(XLXN_32_AND & XLXN_8);
    
endmodule