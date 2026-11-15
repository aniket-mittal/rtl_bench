module origen_144165 (
    input A,
    input B,
    input CIN,
    output SUM,
    output COUT
);
    assign SUM = A ^ B ^ CIN;
    assign COUT = (A & B) | (B & CIN) | (A & CIN);
endmodule

module full_adder_4bit (
    input [3:0] A,
    input [3:0] B,
    input CIN,
    output [3:0] SUM,
    output [3:0] COUT
);

    wire [3:0] carry;

    sky130_fd_sc_ls__fa fa0 (
        .A(A[0]),
        .B(B[0]),
        .CIN(CIN),
        .SUM(SUM[0]),
        .COUT(carry[0])
    );

    sky130_fd_sc_ls__fa fa1 (
        .A(A[1]),
        .B(B[1]),
        .CIN(carry[0]),
        .SUM(SUM[1]),
        .COUT(carry[1])
    );

    sky130_fd_sc_ls__fa fa2 (
        .A(A[2]),
        .B(B[2]),
        .CIN(carry[1]),
        .SUM(SUM[2]),
        .COUT(carry[2])
    );

    sky130_fd_sc_ls__fa fa3 (
        .A(A[3]),
        .B(B[3]),
        .CIN(carry[2]),
        .SUM(SUM[3]),
        .COUT(COUT[3])
    );

    assign COUT[2:0] = carry[2:0];

endmodule