module origen_027303 (
    input [2:0] alu_op,
    input [5:0] func,
    output reg [2:0] alu_code
);

    // ALU operation codes
    parameter ADD = 3'b010;
    parameter SUB = 3'b110;
    parameter AND = 3'b000;
    parameter OR  = 3'b001;
    parameter SLT = 3'b111;

    // ALU_OP codes
    parameter MEM_OP  = 3'b000;
    parameter BEQ     = 3'b001;
    parameter R_TYPE  = 3'b010;
    parameter SLTI    = 3'b011;
    parameter BNE     = 3'b100;

    // Function codes
    parameter FUNC_AND  = 6'b100100;
    parameter FUNC_OR   = 6'b100101;
    parameter FUNC_ADD  = 6'b100000;
    parameter FUNC_ADDU = 6'b100001;
    parameter FUNC_JR   = 6'b001000;
    parameter FUNC_SUB  = 6'b100010;
    parameter FUNC_SLT  = 6'b101010;

    always @* begin
        case (alu_op)
            MEM_OP: alu_code = ADD;
            BEQ:    alu_code = SUB;
            R_TYPE: begin
                case (func)
                    FUNC_AND:  alu_code = AND;
                    FUNC_OR:   alu_code = OR;
                    FUNC_ADD:  alu_code = ADD;
                    FUNC_ADDU: alu_code = ADD;
                    FUNC_JR:   alu_code = ADD;
                    FUNC_SUB:  alu_code = SUB;
                    FUNC_SLT:  alu_code = SLT;
                    default:   alu_code = 3'bxxx;
                endcase
            end
            SLTI:   alu_code = SLT;
            BNE:    alu_code = SUB;
            default: alu_code = 3'bxxx;
        endcase
    end

endmodule