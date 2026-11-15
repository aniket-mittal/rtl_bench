module origen_160695(
    input  [1:0] alu_op,
    input  [5:0] funct,
    output reg [2:0] alu_ctrl,
    output reg pc_jr_sel,
    output reg rf_mult_shift_wd_sel,
    output reg mult_we,
    output reg mult_hilo_sel,
    output reg mult_shift_sel,
    output reg sl_or_sr
);

    always @(*) begin
        case ({alu_op, funct})
            8'b00_100000: begin // ADD
                alu_ctrl = 3'b010;
                pc_jr_sel = 1'b0;
                rf_mult_shift_wd_sel = 1'b0;
                mult_we = 1'b0;
                mult_hilo_sel = 1'b0;
                mult_shift_sel = 1'b0;
                sl_or_sr = 1'b0;
            end
            8'b00_100010: begin // SUB
                alu_ctrl = 3'b110;
                pc_jr_sel = 1'b0;
                rf_mult_shift_wd_sel = 1'b0;
                mult_we = 1'b0;
                mult_hilo_sel = 1'b0;
                mult_shift_sel = 1'b0;
                sl_or_sr = 1'b0;
            end
            8'b01_000000: begin // SLL
                alu_ctrl = 3'b001;
                pc_jr_sel = 1'b0;
                rf_mult_shift_wd_sel = 1'b1;
                mult_we = 1'b0;
                mult_hilo_sel = 1'b0;
                mult_shift_sel = 1'b0;
                sl_or_sr = 1'b0;
            end
            8'b01_000010: begin // SRL
                alu_ctrl = 3'b011;
                pc_jr_sel = 1'b0;
                rf_mult_shift_wd_sel = 1'b1;
                mult_we = 1'b0;
                mult_hilo_sel = 1'b0;
                mult_shift_sel = 1'b0;
                sl_or_sr = 1'b1;
            end
            8'b01_000011: begin // SRA
                alu_ctrl = 3'b100;
                pc_jr_sel = 1'b0;
                rf_mult_shift_wd_sel = 1'b1;
                mult_we = 1'b0;
                mult_hilo_sel = 1'b0;
                mult_shift_sel = 1'b0;
                sl_or_sr = 1'b1;
            end
            8'b10_011000: begin // MULT
                alu_ctrl = 3'b000;
                pc_jr_sel = 1'b0;
                rf_mult_shift_wd_sel = 1'b0;
                mult_we = 1'b1;
                mult_hilo_sel = 1'b0;
                mult_shift_sel = 1'b0;
                sl_or_sr = 1'b0;
            end
            8'b10_011010: begin // MULU
                alu_ctrl = 3'b000;
                pc_jr_sel = 1'b0;
                rf_mult_shift_wd_sel = 1'b0;
                mult_we = 1'b1;
                mult_hilo_sel = 1'b1;
                mult_shift_sel = 1'b0;
                sl_or_sr = 1'b0;
            end
            8'b10_001000: begin // JR
                alu_ctrl = 3'b000;
                pc_jr_sel = 1'b1;
                rf_mult_shift_wd_sel = 1'b0;
                mult_we = 1'b0;
                mult_hilo_sel = 1'b0;
                mult_shift_sel = 1'b0;
                sl_or_sr = 1'b0;
            end
            default: begin
                alu_ctrl = 3'b000;
                pc_jr_sel = 1'b0;
                rf_mult_shift_wd_sel = 1'b0;
                mult_we = 1'b0;
                mult_hilo_sel = 1'b0;
                mult_shift_sel = 1'b0;
                sl_or_sr = 1'b0;
            end
        endcase
    end

endmodule