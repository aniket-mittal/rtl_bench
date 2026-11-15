module origen_010795(
    input [5:0] Op,
    input [3:0] state,
    output reg [3:0] next,
    output reg PCWrite, PCWriteCond, IorD, MemRead, MemWrite,
    output reg IRWrite, MemtoReg, PCSource, ALUSrcA, RegWrite, RegDst,
    output reg [1:0] ALUSrcB, ALUOp
);

    // State definitions
    parameter S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0011,
              S4 = 4'b0100, S5 = 4'b0101, S6 = 4'b0110, S7 = 4'b0111,
              S8 = 4'b1000, S9 = 4'b1001;

    // Operation codes
    parameter R_TYPE = 6'h0, LW = 6'h23, SW = 6'h2B, BEQ = 6'h4, J = 6'h2;

    // Next state logic
    always @(*) begin
        case(state)
            S0: next = S1;
            S1: begin
                case(Op)
                    R_TYPE: next = S6;
                    LW, SW: next = S2;
                    BEQ: next = S8;
                    J: next = S9;
                    default: next = S0;
                endcase
            end
            S2: next = (Op == LW) ? S3 : S5;
            S3: next = S4;
            S4: next = S0;
            S5: next = S0;
            S6: next = S7;
            S7: next = S0;
            S8: next = S0;
            S9: next = S0;
            default: next = S0;
        endcase
    end

    // Control signal generation
    [MASKED]

endmodule