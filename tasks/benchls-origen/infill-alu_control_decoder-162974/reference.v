module origen_162974(
    input  [1:0] alu_op,
    input  [5:0] funct,
    output reg [2:0] alu_ctrl,
    output reg shift,
    output reg jr_sel,
    output reg multu_en,
    output reg [1:0] super_sel
);

always @(*) begin
    case (alu_op)
        2'b00: begin
            alu_ctrl = 3'b010;
            shift = 1'b0;
            jr_sel = 1'b0;
            multu_en = 1'b0;
            super_sel = 2'b00;
        end
        2'b01: begin
            alu_ctrl = 3'b110;
            shift = 1'b0;
            jr_sel = 1'b0;
            multu_en = 1'b0;
            super_sel = 2'b00;
        end
        default: begin
            case (funct)
                6'b10_0100: begin
                    alu_ctrl = 3'b000;
                    shift = 1'b0;
                    jr_sel = 1'b0;
                    multu_en = 1'b0;
                    super_sel = 2'b00;
                end
                6'b10_0101: begin
                    alu_ctrl = 3'b001;
                    shift = 1'b0;
                    jr_sel = 1'b0;
                    multu_en = 1'b0;
                    super_sel = 2'b00;
                end
                6'b10_0000: begin
                    alu_ctrl = 3'b010;
                    shift = 1'b0;
                    jr_sel = 1'b0;
                    multu_en = 1'b0;
                    super_sel = 2'b00;
                end
                6'b10_0010: begin
                    alu_ctrl = 3'b110;
                    shift = 1'b0;
                    jr_sel = 1'b0;
                    multu_en = 1'b0;
                    super_sel = 2'b00;
                end
                6'b10_1010: begin
                    alu_ctrl = 3'b111;
                    shift = 1'b0;
                    jr_sel = 1'b0;
                    multu_en = 1'b0;
                    super_sel = 2'b00;
                end
                6'b01_1001: begin
                    alu_ctrl = 3'b100;
                    shift = 1'b0;
                    jr_sel = 1'b0;
                    multu_en = 1'b1;
                    super_sel = 2'b00;
                end
                6'b01_0000: begin
                    alu_ctrl = 3'b000;
                    shift = 1'b1;
                    jr_sel = 1'b0;
                    multu_en = 1'b0;
                    super_sel = 2'b01;
                end
                6'b01_0010: begin
                    alu_ctrl = 3'b000;
                    shift = 1'b1;
                    jr_sel = 1'b0;
                    multu_en = 1'b0;
                    super_sel = 2'b10;
                end
                6'b00_0000: begin
                    alu_ctrl = 3'b000;
                    shift = 1'b0;
                    jr_sel = 1'b1;
                    multu_en = 1'b0;
                    super_sel = 2'b00;
                end
                6'b00_0010: begin
                    alu_ctrl = 3'b000;
                    shift = 1'b0;
                    jr_sel = 1'b1;
                    multu_en = 1'b0;
                    super_sel = 2'b00;
                end
                6'b00_1000: begin
                    alu_ctrl = 3'b000;
                    shift = 1'b0;
                    jr_sel = 1'b1;
                    multu_en = 1'b0;
                    super_sel = 2'b00;
                end
                default: begin
                    alu_ctrl = 3'b000;
                    shift = 1'b0;
                    jr_sel = 1'b0;
                    multu_en = 1'b0;
                    super_sel = 2'b00;
                end
            endcase
        end
    endcase
end

endmodule