module origen_056004 (
    input wire clk,
    input wire reset,
    input wire [5:0] opcode,
    input wire [5:0] funct,
    input wire zero,
    output reg pc_load,
    output reg write,
    output reg [5:0] alu_funct,
    output reg rd_mux_s,
    output reg op2_mux_s,
    output reg branch_mux_s,
    output reg j_mux_s
);

    // State encoding
    localparam [2:0] IF = 3'b000,
                     ID = 3'b001,
                     EX = 3'b010,
                     WB = 3'b011;

    // Opcode definitions
    localparam [5:0] OP_R    = 6'b000000,
                     OP_ADDI = 6'b001000,
                     OP_BEQ  = 6'b000100,
                     OP_J    = 6'b000010;

    reg [2:0] state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IF;
        else
            state <= next_state;
    end

    // Next state logic and output logic
    always @(*) begin
        // Default values
        next_state = state;
        pc_load = 0;
        write = 0;
        alu_funct = 6'b0;
        rd_mux_s = 0;
        op2_mux_s = 0;
        branch_mux_s = 0;
        j_mux_s = 0;

        case (state)
            IF: begin
                next_state = ID;
            end

            ID: begin
                case (opcode)
                    OP_R, OP_ADDI: next_state = EX;
                    OP_BEQ: begin
                        next_state = EX;
                        op2_mux_s = 1;
                    end
                    OP_J: begin
                        next_state = IF;
                        pc_load = 1;
                        j_mux_s = 1;
                    end
                    default: next_state = IF;
                endcase
            end

            EX: begin
                case (opcode)
                    OP_R: begin
                        alu_funct = funct;
                        next_state = WB;
                    end
                    OP_ADDI: begin
                        alu_funct = 6'b100000; // ADD
                        op2_mux_s = 1;
                        next_state = WB;
                    end
                    OP_BEQ: begin
                        alu_funct = 6'b100010; // SUB
                        branch_mux_s = zero;
                        pc_load = zero;
                        next_state = IF;
                    end
                    default: next_state = IF;
                endcase
            end

            WB: begin
                case (opcode)
                    OP_R: begin
                        write = 1;
                        rd_mux_s = 1;
                    end
                    OP_ADDI: begin
                        write = 1;
                        rd_mux_s = 0;
                    end
                    default: ;
                endcase
                next_state = IF;
            end

            default: next_state = IF;
        endcase
    end

endmodule