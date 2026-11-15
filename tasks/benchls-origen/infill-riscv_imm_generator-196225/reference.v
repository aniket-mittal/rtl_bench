module origen_196225(
    input  [31:0] instr_i,
    output [31:0] imm_o
);

    parameter Opcode_I_type   = 7'b0010011;
    parameter Opcode_lw       = 7'b0000011;
    parameter Opcode_sw       = 7'b0100011;
    parameter Opcode_beq      = 7'b1100011;
    parameter funct3_srai     = 3'b101;

    reg [11:0] imm_reg;
    wire [6:0] Op_i;
    wire [2:0] funct3;
    wire [6:0] funct7;
    wire [4:0] rs2;
    wire [4:0] rd;

    assign Op_i   = instr_i[6:0];
    assign funct3 = instr_i[14:12];
    assign funct7 = instr_i[31:25];
    assign rs2    = instr_i[24:20];
    assign rd     = instr_i[11:7];

    initial begin
        imm_reg = 12'b0;
    end

    assign imm_o = {{20{imm_reg[11]}}, imm_reg};

    always @(*) begin
        case (Op_i)
            Opcode_I_type: begin
                if (funct3 == funct3_srai) begin
                    imm_reg = {7'b0, rs2};
                end else begin
                    imm_reg = {funct7, rs2};
                end
            end
            Opcode_lw: begin
                imm_reg = {funct7, rs2};
            end
            Opcode_sw: begin
                imm_reg = {funct7, rd};
            end
            Opcode_beq: begin
                imm_reg = {funct7[6], rd[0], funct7[5:0], rd[4:1], 1'b0};
            end
            default: begin
                imm_reg = 12'b0;
            end
        endcase
    end

endmodule