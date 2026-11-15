module origen_091979(
    input [5:0] Op,
    input [5:0] Funct,
    output reg MemtoReg,
    output reg MemWrite,
    output reg Branch,
    output reg ALUSrc,
    output reg RegDst,
    output reg RegWrite,
    output reg [2:0] ALUControl
);

    reg [1:0] ALUOp;

    [MASKED]

    always @* begin
        case(ALUOp)
            2'b00: ALUControl = 3'b010; // Add
            2'b01: ALUControl = 3'b110; // Subtract
            2'b10: begin
                case(Funct)
                    6'b100000: ALUControl = 3'b010; // Add
                    6'b100010: ALUControl = 3'b110; // Subtract
                    6'b100100: ALUControl = 3'b000; // AND
                    6'b100101: ALUControl = 3'b001; // OR
                    6'b101010: ALUControl = 3'b111; // Set-on-less-than
                    default:   ALUControl = 3'bxxx;
                endcase
            end
            default: ALUControl = 3'bxxx;
        endcase
    end

endmodule