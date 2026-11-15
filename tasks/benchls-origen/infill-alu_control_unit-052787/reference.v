module origen_052787 (
    input [5:0] funct,
    input [1:0] aluop,
    output reg [2:0] select
);

    // Parameters for instruction types
    parameter R_TYPE = 2'b10;
    parameter LOAD_STORE = 2'b00;
    parameter I_TYPE = 2'b01;
    parameter UNKNOWN = 2'b11;

    // Parameters for function codes (R-type instructions)
    parameter ADD_FUNCT = 6'b100000;
    parameter SUB_FUNCT = 6'b100010;
    parameter AND_FUNCT = 6'b100100;
    parameter OR_FUNCT  = 6'b100101;
    parameter SLT_FUNCT = 6'b101010;

    // Parameters for ALU operations
    parameter ALU_ADD = 3'b000;
    parameter ALU_SUB = 3'b001;
    parameter ALU_AND = 3'b010;
    parameter ALU_OR  = 3'b011;
    parameter ALU_SLT = 3'b100;
    parameter ALU_X   = 3'b111;

    // Initialize select
    initial begin
        select = 3'b000;
    end

    // Combinational logic for ALU control
    always @(*) begin
        case (aluop)
            R_TYPE: begin
                case (funct)
                    ADD_FUNCT: select = ALU_ADD;
                    SUB_FUNCT: select = ALU_SUB;
                    AND_FUNCT: select = ALU_AND;
                    OR_FUNCT:  select = ALU_OR;
                    SLT_FUNCT: select = ALU_SLT;
                    default:   select = ALU_X;
                endcase
            end
            LOAD_STORE: select = ALU_ADD;
            I_TYPE:     select = ALU_SUB;
            UNKNOWN:    select = ALU_X;
            default:    select = select; // Maintain previous value
        endcase
    end

endmodule