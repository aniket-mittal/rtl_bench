module origen_209411(
    input [1:0] alu_op,
    input [5:0] funct,
    output reg [2:0] alu_ctrl,
    output reg hi_lo,
    output reg jr,
    output reg mf_hi_lo
);

always @(*) begin
    case (alu_op)
        2'b00: begin
            alu_ctrl = 3'b010;
            hi_lo = 1'b0;
            jr = 1'b0;
            mf_hi_lo = 1'b0;
        end
        2'b01: begin
            alu_ctrl = 3'b110;
            hi_lo = 1'b0;
            jr = 1'b0;
            mf_hi_lo = 1'b0;
        end
        default: begin
            case (funct)
                6'b100100: begin
                    alu_ctrl = 3'b000;
                    hi_lo = 1'b0;
                    jr = 1'b0;
                    mf_hi_lo = 1'b0;
                end
                6'b100101: begin
                    alu_ctrl = 3'b001;
                    hi_lo = 1'b0;
                    jr = 1'b0;
                    mf_hi_lo = 1'b0;
                end
                6'b100000: begin
                    alu_ctrl = 3'b010;
                    hi_lo = 1'b0;
                    jr = 1'b0;
                    mf_hi_lo = 1'b0;
                end
                6'b100010: begin
                    alu_ctrl = 3'b110;
                    hi_lo = 1'b0;
                    jr = 1'b0;
                    mf_hi_lo = 1'b0;
                end
                6'b101010: begin
                    alu_ctrl = 3'b111;
                    hi_lo = 1'b0;
                    jr = 1'b0;
                    mf_hi_lo = 1'b0;
                end
                6'b000010: begin
                    alu_ctrl = 3'b100;
                    hi_lo = 1'b0;
                    jr = 1'b0;
                    mf_hi_lo = 1'b0;
                end
                6'b000000: begin
                    alu_ctrl = 3'b011;
                    hi_lo = 1'b0;
                    jr = 1'b0;
                    mf_hi_lo = 1'b0;
                end
                6'b001000: begin
                    alu_ctrl = 3'bxxx;
                    hi_lo = 1'b0;
                    jr = 1'b1;
                    mf_hi_lo = 1'b0;
                end
                6'b010010: begin
                    alu_ctrl = 3'bxxx;
                    hi_lo = 1'b0;
                    jr = 1'b0;
                    mf_hi_lo = 1'b1;
                end
                6'b010000: begin
                    alu_ctrl = 3'bxxx;
                    hi_lo = 1'b1;
                    jr = 1'b0;
                    mf_hi_lo = 1'b1;
                end
                6'b011001: begin
                    alu_ctrl = 3'b101;
                    hi_lo = 1'b0;
                    jr = 1'b0;
                    mf_hi_lo = 1'b0;
                end
                default: begin
                    alu_ctrl = 3'bxxx;
                    hi_lo = 1'b0;
                    jr = 1'b0;
                    mf_hi_lo = 1'b0;
                end
            endcase
        end
    endcase
end

endmodule