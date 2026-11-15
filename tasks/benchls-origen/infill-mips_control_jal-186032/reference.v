module origen_186032(
    input [5:0] opcode,
    output reg branch,
    output reg jump,
    output reg reg_dst,
    output reg we_reg,
    output reg alu_src,
    output reg we_dm,
    output reg dm2reg,
    output reg [1:0] alu_op,
    output reg jal_wa_mux_sel,
    output reg jal_wd_mux_sel
);

    always @(*) begin
        case (opcode)
            6'b000000: begin // R-type
                branch = 1'b0;
                jump = 1'b0;
                reg_dst = 1'b1;
                we_reg = 1'b1;
                alu_src = 1'b0;
                we_dm = 1'b0;
                dm2reg = 1'b0;
                alu_op = 2'b10;
                jal_wa_mux_sel = 1'b0;
                jal_wd_mux_sel = 1'b0;
            end
            6'b100011: begin // LW
                branch = 1'b0;
                jump = 1'b0;
                reg_dst = 1'b0;
                we_reg = 1'b1;
                alu_src = 1'b1;
                we_dm = 1'b0;
                dm2reg = 1'b1;
                alu_op = 2'b00;
                jal_wa_mux_sel = 1'b0;
                jal_wd_mux_sel = 1'b0;
            end
            6'b101011: begin // SW
                branch = 1'b0;
                jump = 1'b0;
                reg_dst = 1'bx;
                we_reg = 1'b0;
                alu_src = 1'b1;
                we_dm = 1'b1;
                dm2reg = 1'bx;
                alu_op = 2'b00;
                jal_wa_mux_sel = 1'b0;
                jal_wd_mux_sel = 1'b0;
            end
            6'b000100: begin // BEQ
                branch = 1'b1;
                jump = 1'b0;
                reg_dst = 1'bx;
                we_reg = 1'b0;
                alu_src = 1'b0;
                we_dm = 1'b0;
                dm2reg = 1'bx;
                alu_op = 2'b01;
                jal_wa_mux_sel = 1'b0;
                jal_wd_mux_sel = 1'b0;
            end
            6'b000010: begin // J
                branch = 1'b0;
                jump = 1'b1;
                reg_dst = 1'bx;
                we_reg = 1'b0;
                alu_src = 1'bx;
                we_dm = 1'b0;
                dm2reg = 1'bx;
                alu_op = 2'bxx;
                jal_wa_mux_sel = 1'b0;
                jal_wd_mux_sel = 1'b0;
            end
            6'b000011: begin // JAL
                branch = 1'b0;
                jump = 1'b1;
                reg_dst = 1'b0;
                we_reg = 1'b1;
                alu_src = 1'bx;
                we_dm = 1'b0;
                dm2reg = 1'b1;
                alu_op = 2'bxx;
                jal_wa_mux_sel = 1'b1;
                jal_wd_mux_sel = 1'b1;
            end
            default: begin
                branch = 1'bx;
                jump = 1'bx;
                reg_dst = 1'bx;
                we_reg = 1'bx;
                alu_src = 1'bx;
                we_dm = 1'bx;
                dm2reg = 1'bx;
                alu_op = 2'bxx;
                jal_wa_mux_sel = 1'bx;
                jal_wd_mux_sel = 1'bx;
            end
        endcase
    end
endmodule