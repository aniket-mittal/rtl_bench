module origen_108867(
    input wire clk,
    input wire init,
    input wire decoder_en,
    input wire [8:0] inst,
    input wire cmp,
    output reg [3:0] r1,
    output reg [3:0] r2,
    output reg [2:0] inst_type,
    output reg [3:0] funct,
    output reg [7:0] immediate,
    output reg branch,
    output reg branchi,
    output reg jump,
    output reg reg_hi_en,
    output reg reg_lo_en,
    output reg reg_readx_en,
    output reg reg_ready_en,
    output reg reg_swap_en,
    output reg y_is_imm,
    output reg is_cmp,
    output reg done
);

    always @(posedge clk) begin
        if (init) begin
            r1 <= 4'b0;
            r2 <= 4'b0;
            inst_type <= 3'b0;
            funct <= 4'b0;
            immediate <= 8'b0;
            branch <= 1'b0;
            branchi <= 1'b0;
            jump <= 1'b0;
            reg_hi_en <= 1'b0;
            reg_lo_en <= 1'b0;
            reg_readx_en <= 1'b0;
            reg_ready_en <= 1'b0;
            reg_swap_en <= 1'b0;
            y_is_imm <= 1'b0;
            is_cmp <= 1'b0;
            done <= 1'b0;
        end else if (decoder_en) begin
            // Reset control signals
            branch <= 1'b0;
            branchi <= 1'b0;
            jump <= 1'b0;
            reg_hi_en <= 1'b0;
            reg_lo_en <= 1'b0;
            reg_readx_en <= 1'b0;
            reg_ready_en <= 1'b0;
            reg_swap_en <= 1'b0;
            y_is_imm <= 1'b0;
            is_cmp <= 1'b0;
            done <= 1'b0;

            case (inst[8:7])
                2'b1x: begin // Immediate and jump instructions
                    inst_type <= (inst[8] & inst[7]) ? 3'd4 : 3'd2; // Load immediate or Jump
                    r1 <= inst[7:4];
                    immediate <= inst[7:0];
                    y_is_imm <= 1'b1;
                    if (inst[8] & inst[7]) begin
                        reg_hi_en <= ~inst[3];
                        reg_lo_en <= inst[3];
                    end else begin
                        jump <= 1'b1;
                    end
                end
                2'b01: begin
                    if (inst[6]) begin // Shift and rotate operations
                        inst_type <= 3'd1; // ALU
                        funct <= {1'b0, inst[5:3]};
                        r1 <= inst[7:4];
                        r2 <= inst[3:0];
                        reg_readx_en <= 1'b1;
                        reg_ready_en <= 1'b1;
                    end else if (inst[5:4] == 2'b11) begin // Conditional branch
                        inst_type <= 3'd3;
                        r1 <= inst[3:0];
                        branchi <= 1'b1;
                        reg_readx_en <= 1'b1;
                    end else begin // Register-based operations
                        inst_type <= 3'd1; // ALU
                        funct <= inst[7:4];
                        r1 <= inst[3:0];
                        r2 <= 4'b0;
                        reg_readx_en <= 1'b1;
                        reg_ready_en <= 1'b1;
                    end
                end
                2'b00: begin
                    if (inst[7:4] == 4'b0000) begin // Special instructions
                        inst_type <= 3'd6;
                        case (inst[3:0])
                            4'b0000: done <= 1'b1;
                            4'b0001: reg_swap_en <= 1'b1;
                            // Add more special instructions here
                        endcase
                    end else begin // Register-based operations
                        inst_type <= (inst[7:6] == 2'b00) ? 3'd5 : 3'd1; // Memory or ALU
                        funct <= inst[7:4];
                        r1 <= inst[3:0];
                        r2 <= 4'b0;
                        reg_readx_en <= 1'b1;
                        reg_ready_en <= 1'b1;
                        is_cmp <= (inst[7:4] == 4'b0001);
                    end
                end
            endcase

            // Handle conditional branch
            if (inst_type == 3'd3) begin
                branch <= cmp;
            end
        end
    end

endmodule