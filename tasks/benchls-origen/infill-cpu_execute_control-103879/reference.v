module origen_103879 (
    input [1:0] mode,
    input [3:0] opcode,
    input S_ID,
    input mux_cc,
    output reg [3:0] exe_cmd,
    output reg MEM_R_EN,
    output reg MEM_W_EN,
    output reg WB_EN,
    output reg B,
    output reg S,
    output reg move_HZRD
);

always @(*) begin
    if (mux_cc) begin
        exe_cmd = 4'b0000;
        MEM_R_EN = 1'b0;
        MEM_W_EN = 1'b0;
        WB_EN = 1'b0;
        B = 1'b0;
        S = 1'b0;
        move_HZRD = 1'b0;
    end else begin
        case (mode)
            2'b00: begin // Normal operation
                case (opcode)
                    4'b0001: begin // MOV
                        exe_cmd = 4'b0001;
                        WB_EN = 1'b1;
                        S = 1'b1;
                        move_HZRD = 1'b1;
                    end
                    4'b1001: begin // MVN
                        exe_cmd = 4'b1001;
                        WB_EN = 1'b1;
                        S = 1'b1;
                        move_HZRD = 1'b1;
                    end
                    4'b0010: begin // ADD
                        exe_cmd = 4'b0010;
                        WB_EN = 1'b1;
                        S = 1'b1;
                    end
                    4'b0011: begin // SUB
                        exe_cmd = 4'b0011;
                        WB_EN = 1'b1;
                        S = 1'b1;
                    end
                    4'b0100: begin // AND
                        exe_cmd = 4'b0100;
                        WB_EN = 1'b1;
                        S = 1'b1;
                    end
                    4'b0101: begin // ORR
                        exe_cmd = 4'b0101;
                        WB_EN = 1'b1;
                        S = 1'b1;
                    end
                    4'b0110: begin // EOR
                        exe_cmd = 4'b0110;
                        WB_EN = 1'b1;
                        S = 1'b1;
                    end
                    4'b0111: begin // CMP
                        exe_cmd = 4'b0111;
                        WB_EN = 1'b0;
                        S = 1'b1;
                    end
                    4'b1000: begin // TST
                        exe_cmd = 4'b1000;
                        WB_EN = 1'b0;
                        S = 1'b1;
                    end
                    default: begin
                        exe_cmd = 4'b0000;
                        WB_EN = 1'b0;
                        S = 1'b0;
                    end
                endcase
                MEM_R_EN = 1'b0;
                MEM_W_EN = 1'b0;
                B = 1'b0;
                move_HZRD = (opcode == 4'b0001 || opcode == 4'b1001) ? 1'b1 : 1'b0;
            end
            2'b01: begin // Memory operation
                exe_cmd = 4'b0010; // ADD
                MEM_R_EN = S_ID;
                MEM_W_EN = ~S_ID;
                WB_EN = S_ID;
                B = 1'b0;
                S = 1'b0;
                move_HZRD = 1'b0;
            end
            2'b10: begin // Branch operation
                exe_cmd = 4'b0000;
                MEM_R_EN = 1'b0;
                MEM_W_EN = 1'b0;
                WB_EN = 1'b0;
                B = 1'b1;
                S = 1'b0;
                move_HZRD = 1'b1;
            end
            default: begin
                exe_cmd = 4'b0000;
                MEM_R_EN = 1'b0;
                MEM_W_EN = 1'b0;
                WB_EN = 1'b0;
                B = 1'b0;
                S = 1'b0;
                move_HZRD = 1'b0;
            end
        endcase
    end
end

endmodule