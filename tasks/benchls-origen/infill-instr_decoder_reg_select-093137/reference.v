module origen_093137(
    input [15:0] iRegToiDec,
    input [2:0] nsel,
    output [2:0] opcode,
    output [1:0] op,
    output [1:0] ALUop,
    output [15:0] sximm5,
    output [15:0] sximm8,
    output [1:0] shift,
    output [2:0] readnum,
    output [2:0] writenum,
    output [2:0] b_cond
);

    wire [2:0] Rn, Rd, Rm;

    assign opcode = iRegToiDec[15:13];
    assign op = iRegToiDec[12:11];
    assign ALUop = iRegToiDec[12:11];
    assign Rn = iRegToiDec[10:8];
    assign Rd = iRegToiDec[7:5];
    assign shift = iRegToiDec[4:3];
    assign Rm = iRegToiDec[2:0];

    assign sximm5 = {{11{iRegToiDec[4]}}, iRegToiDec[4:0]};
    assign sximm8 = {{8{iRegToiDec[7]}}, iRegToiDec[7:0]};

    Mux3H #(3) reg_select(
        .a2(Rn),
        .a1(Rd),
        .a0(Rm),
        .s(nsel),
        .b(readnum)
    );

    assign writenum = readnum;
    assign b_cond = Rn;

endmodule

module Mux3H #(
    parameter k = 16
)(
    input [k-1:0] a2, a1, a0,
    input [2:0] s,
    output reg [k-1:0] b
);

    always @(*) begin
        case(s)
            3'b001: b = a0;
            3'b010: b = a1;
            3'b100: b = a2;
            default: b = {k{1'bx}};
        endcase
    end

endmodule