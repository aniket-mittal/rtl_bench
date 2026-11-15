module origen_210432(
    input CLK,
    input [31:0] instruction,
    output reg [2:0] Instruction_type,
    output reg [3:0] Dataprocessing_instr_type,
    output reg [1:0] Memory_instr_type,
    output reg [1:0] Jump_instr_type
);

always @(*) begin
    case (instruction[27:26])
        2'b00: begin
            Instruction_type = 3'b001; // Data processing instruction
            case (instruction[24:21])
                4'b0000, 4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111, 4'b1100, 4'b1101, 4'b1110, 4'b1111:
                    Dataprocessing_instr_type = 4'b0001; // Immediate operand data processing instruction
                4'b1000, 4'b1001, 4'b1010, 4'b1011:
                    Dataprocessing_instr_type = 4'b0010; // Shift operand data processing instruction
                4'b1100, 4'b1101, 4'b1110, 4'b1111:
                    Dataprocessing_instr_type = 4'b0011; // Immediate shift operand data processing instruction
                default:
                    Dataprocessing_instr_type = 4'b0000; // Default/Unknown data processing instruction
            endcase
        end
        2'b01: begin
            Instruction_type = 3'b010; // Memory access instruction
            case (instruction[20])
                1'b0:
                    Memory_instr_type = 2'b01; // Load/Store instruction
                1'b1:
                    Memory_instr_type = 2'b10; // Load/Store instruction with writeback
                default:
                    Memory_instr_type = 2'b00; // Default/Unknown memory access instruction
            endcase
        end
        2'b10: begin
            Instruction_type = 3'b011; // Jump instruction
            case (instruction[24])
                1'b0:
                    Jump_instr_type = 2'b01; // Branch instruction
                1'b1:
                    Jump_instr_type = 2'b10; // Branch with link instruction
                default:
                    Jump_instr_type = 2'b00; // Default/Unknown jump instruction
            endcase
        end
        default:
            Instruction_type = 3'b000; // Default/Unknown instruction type
    endcase
end

endmodule