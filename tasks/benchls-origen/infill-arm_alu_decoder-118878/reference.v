module origen_118878(
    input wire alu_op,
    input wire s,
    input wire branch,
    input wire mult,
    input wire [3:0] cmd,
    output reg no_write,
    output reg not_alu,
    output reg not_shift,
    output reg swap,
    output reg inv,
    output reg [2:0] alu_ctl,
    output reg [1:0] flag_w
);

always @(*) begin
    if (alu_op) begin
        case (cmd)
            4'b0000: begin alu_ctl = 3'b000; no_write = 0; not_alu = 0; not_shift = 0; swap = 0; inv = 0; end // AND
            4'b0001: begin alu_ctl = 3'b001; no_write = 0; not_alu = 0; not_shift = 0; swap = 0; inv = 0; end // EOR
            4'b0010: begin alu_ctl = 3'b010; no_write = 0; not_alu = 0; not_shift = 0; swap = 1; inv = 0; end // SUB
            4'b0011: begin alu_ctl = 3'b010; no_write = 0; not_alu = 0; not_shift = 0; swap = 0; inv = 0; end // RSB
            4'b0100: begin alu_ctl = 3'b011; no_write = 0; not_alu = 0; not_shift = 0; swap = 0; inv = 0; end // ADD
            4'b0101: begin alu_ctl = 3'b011; no_write = 0; not_alu = 0; not_shift = 0; swap = 0; inv = 1; end // ADC
            4'b0110: begin alu_ctl = 3'b010; no_write = 0; not_alu = 0; not_shift = 0; swap = 1; inv = 1; end // SBC
            4'b0111: begin alu_ctl = 3'b010; no_write = 0; not_alu = 0; not_shift = 0; swap = 0; inv = 1; end // RSC
            4'b1000: begin alu_ctl = 3'b000; no_write = 1; not_alu = 0; not_shift = 0; swap = 0; inv = 0; end // TST
            4'b1001: begin alu_ctl = 3'b001; no_write = 1; not_alu = 0; not_shift = 0; swap = 0; inv = 0; end // TEQ
            4'b1010: begin alu_ctl = 3'b010; no_write = 1; not_alu = 0; not_shift = 0; swap = 1; inv = 0; end // CMP
            4'b1011: begin alu_ctl = 3'b010; no_write = 1; not_alu = 0; not_shift = 0; swap = 0; inv = 0; end // CMN
            4'b1100: begin alu_ctl = 3'b100; no_write = 0; not_alu = 0; not_shift = 0; swap = 0; inv = 0; end // ORR
            4'b1101: begin alu_ctl = 3'b101; no_write = 0; not_alu = 0; not_shift = 1; swap = 0; inv = 0; end // MOV
            4'b1110: begin alu_ctl = 3'b110; no_write = 0; not_alu = 0; not_shift = 0; swap = 0; inv = 0; end // BIC
            4'b1111: begin alu_ctl = 3'b111; no_write = 0; not_alu = 0; not_shift = 1; swap = 0; inv = 0; end // MVN
        endcase
        flag_w = (alu_ctl[2:1] == 2'b00) ? {s, s} : {s, 1'b0};
    end else begin
        casez ({mult, branch, cmd[3:1], s})
            6'b1?????: begin alu_ctl = 3'b011; flag_w = 2'b00; not_alu = 1; not_shift = 1; end // Multiply
            6'b01????: begin alu_ctl = 3'b010; flag_w = 2'b00; not_alu = 0; not_shift = 1; end // Branch
            6'b001???: begin alu_ctl = 3'b011; flag_w = 2'b00; not_alu = 0; not_shift = 1; end // Load/Store
            6'b000??0: begin alu_ctl = 3'b011; flag_w = 2'b10; not_alu = 0; not_shift = 1; end // DP Imm
            6'b000??1: begin alu_ctl = 3'b011; flag_w = 2'b11; not_alu = 0; not_shift = 0; end // DP Reg
            default:   begin alu_ctl = 3'b011; flag_w = 2'b00; not_alu = 0; not_shift = 1; end
        endcase
        no_write = 0;
        swap = 0;
        inv = 0;
    end
end

endmodule