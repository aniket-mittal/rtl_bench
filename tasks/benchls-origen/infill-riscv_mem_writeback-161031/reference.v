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

    always @ (*) begin
        case (insn[6:0])
            7'b0000011: // Load instructions
                begin
                    case (insn[14:12])
                        3'b000: // LB
                            dataout_reg = {{24{d[7]}}, d[7:0]};
                        3'b001: // LH
                            dataout_reg = {{16{d[15]}}, d[15:0]};
                        3'b010: // LW
                            dataout_reg = d;
                        3'b100: // LBU
                            dataout_reg = {24'b0, d[7:0]};
                        3'b101: // LHU
                            dataout_reg = {16'b0, d[15:0]};
                    endcase
                end
            7'b1101111: // JAL
                dataout_reg = o;
            7'b1100111: // JALR
                dataout_reg = o;
            default:
                dataout_reg = o;
        endcase

        rwe_wb_reg = rwe;
    end

    assign dataout = dataout_reg;
    assign rwe_wb = rwe_wb_reg;
    assign insn_to_d = (insn[6:0] == 7'b0000011 || insn[6:0] == 7'b1101111 || insn[6:0] == 7'b1100111) ? 5'd31 : rdst;

endmodule