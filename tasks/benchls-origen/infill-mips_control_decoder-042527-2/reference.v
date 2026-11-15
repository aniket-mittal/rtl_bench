module origen_042527(
    input [31:0] Instruction,
    output reg RegWriteD,
    output reg MemtoRegD,
    output reg MemWriteD,
    output reg [2:0] ALUCtrlD,
    output reg ALUSrcD,
    output reg RegDstD,
    output reg JumpToTargetD,
    output reg JumpAndLinkD,
    output reg JumpRegD,
    output reg BgtzD,
    output reg BeqD
);

    wire [5:0] op = Instruction[31:26];
    wire [5:0] func = Instruction[5:0];

    always @(*) begin
        // Default values
        RegWriteD = 1'b0;
        MemtoRegD = 1'b0;
        MemWriteD = 1'b0;
        ALUCtrlD = 3'b000;
        ALUSrcD = 1'b0;
        RegDstD = 1'b0;
        JumpToTargetD = 1'b0;
        JumpAndLinkD = 1'b0;
        JumpRegD = 1'b0;
        BgtzD = 1'b0;
        BeqD = 1'b0;

        case(op)
            6'b000000: begin // R-type instructions
                case(func)
                    6'b100001: begin // addu
                        RegWriteD = 1'b1;
                        RegDstD = 1'b1;
                        ALUCtrlD = 3'b000;
                    end
                    6'b100011: begin // subu
                        RegWriteD = 1'b1;
                        RegDstD = 1'b1;
                        ALUCtrlD = 3'b001;
                    end
                    6'b100000: begin // add
                        RegWriteD = 1'b1;
                        RegDstD = 1'b1;
                        ALUCtrlD = 3'b000;
                    end
                    6'b001000: begin // jr
                        JumpRegD = 1'b1;
                    end
                endcase
            end
            6'b001101: begin // ori
                RegWriteD = 1'b1;
                ALUSrcD = 1'b1;
                ALUCtrlD = 3'b010;
            end
            6'b001111: begin // lui
                RegWriteD = 1'b1;
                ALUSrcD = 1'b1;
                ALUCtrlD = 3'b011;
            end
            6'b100011: begin // lw
                RegWriteD = 1'b1;
                MemtoRegD = 1'b1;
                ALUSrcD = 1'b1;
                ALUCtrlD = 3'b000;
            end
            6'b101011: begin // sw
                MemWriteD = 1'b1;
                ALUSrcD = 1'b1;
                ALUCtrlD = 3'b000;
            end
            6'b001000: begin // addi
                RegWriteD = 1'b1;
                ALUSrcD = 1'b1;
                ALUCtrlD = 3'b000;
            end
            6'b000111: begin // bgtz
                BgtzD = 1'b1;
                ALUCtrlD = 3'b001;
            end
            6'b000100: begin // beq
                BeqD = 1'b1;
                ALUCtrlD = 3'b001;
            end
            6'b000010: begin // j
                JumpToTargetD = 1'b1;
            end
            6'b000011: begin // jal
                JumpToTargetD = 1'b1;
                JumpAndLinkD = 1'b1;
                RegWriteD = 1'b1;
            end
        endcase
    end

endmodule