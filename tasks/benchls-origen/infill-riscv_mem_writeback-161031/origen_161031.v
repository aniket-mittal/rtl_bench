module origen_161031 (
    input [31:0] o,
    input [31:0] d,
    input [31:0] insn,
    input br,
    input jp,
    input aluinb,
    input [5:0] aluop,
    input dmwe,
    input rwe,
    input [4:0] rdst,
    input rwd,
    input dm_byte,
    input dm_half,
    output [31:0] dataout,
    output [4:0] insn_to_d,
    output rwe_wb
);

    reg [31:0] dataout_reg;
    reg rwe_wb_reg;

    [MASKED]

    assign dataout = dataout_reg;
    assign rwe_wb = rwe_wb_reg;
    assign insn_to_d = (insn[6:0] == 7'b0000011 || insn[6:0] == 7'b1101111 || insn[6:0] == 7'b1100111) ? 5'd31 : rdst;

endmodule