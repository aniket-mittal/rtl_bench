module origen_167418(
    input [31:0] s1val,
    input [31:0] s2val,
    input [4:0] sa,
    input [5:0] ALUop,
    input [31:0] insn,
    output reg [31:0] result,
    output reg branch
);

reg [63:0] div_lo, div_hi;

always @(*) begin
    case (ALUop)
        6'b100000: result = s1val & s2val;  // AND
        6'b100001: result = s1val | s2val;  // OR
        6'b100010: result = s1val + s2val;  // ADD
        6'b100110: result = s1val - s2val;  // SUB
        6'b100111: result = (s1val < s2val) ? 1 : 0;  // SLT
        6'b101100: result = ~(s1val | s2val);  // NOR
        6'b101110: result = s1val << sa;  // SLL
        6'b100000: result = s1val >> sa;  // SRL
        6'b011100: begin  // MULT
            {div_hi, div_lo} = s1val * s2val;
            result = div_lo;
        end
        6'b011110: begin  // DIV
            div_lo = s1val / s2val;
            div_hi = s1val % s2val;
            result = div_lo;
        end
        6'b111000: result = s1val ^ s2val;  // XOR
        6'b100101: begin  // MFHI
            result = div_hi;
        end
        6'b100111: begin  // MFLO
            result = div_lo;
        end
        default: result = 'b0;
    endcase

    case (ALUop)
        6'b110000: branch = (s1val == s2val);  // BEQ
        6'b110001: branch = (s1val == 0);  // BEZ
        6'b110010: branch = (s1val > 0);  // BGZ
        6'b110011: branch = (s1val <= 0);  // BLEZ
        6'b110100: branch = (s1val < 0);  // BLZ
        6'b110101: branch = (s1val != s2val);  // BNE
        default: branch = 1'b0;
    endcase
end

endmodule