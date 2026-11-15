module origen_148461(
    input [4:0] i0,
    input [4:0] i1,
    input cin,
    output [4:0] s,
    output cout
);

    wire [5:0] cig_co;
    wire [4:0] cig_s;

    assign cig_co[0] = cin;

    CARRY4 carry4_0 (
        .CO(cig_co[4:1]),
        .O(cig_s[3:0]),
        .CI(cig_co[0]),
        .CYINIT(1'b0),
        .DI(i0[3:0]),
        .S({i0[3:0] ^ i1[3:0]})
    );

    CARRY4 carry4_1 (
        .CO(cig_co[5]),
        .O(cig_s[4]),
        .CI(cig_co[4]),
        .CYINIT(1'b0),
        .DI({i0[4], 3'b000}),
        .S({i0[4] ^ i1[4], 3'b000})
    );

    assign s = cig_s;
    assign cout = cig_co[5];

endmodule

module CARRY4(
    output [3:0] CO,
    output [3:0] O,
    input CI,
    input CYINIT,
    input [3:0] DI,
    input [3:0] S
);
    // CARRY4 implementation
    // (This is a simplified version for simulation purposes)
    wire [4:0] carry;
    assign carry[0] = CI | CYINIT;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : gen_carry
            assign carry[i+1] = (S[i] & carry[i]) | (~S[i] & DI[i]);
            assign O[i] = S[i] ^ carry[i];
        end
    endgenerate

    assign CO = carry[4:1];

endmodule