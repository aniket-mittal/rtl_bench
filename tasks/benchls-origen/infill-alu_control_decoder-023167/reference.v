module origen_023167(
    input [5:0] funct_i,
    input [3:0] ALUOp_i,
    output reg [4:0] ALU_operation_o,
    output reg [1:0] FURslt_o
);

    always @(*) begin
        // Default values
        ALU_operation_o = 5'b00000;
        FURslt_o = 2'b00;

        // Determine FURslt_o
        case(ALUOp_i)
            4'b0111: FURslt_o = 2'b11;
            4'b0101: FURslt_o = 2'b10;
            4'b0010: begin
                if (funct_i == 6'b000000 || funct_i == 6'b000010)
                    FURslt_o = 2'b01;
            end
            default: FURslt_o = 2'b00;
        endcase

        // Determine ALU_operation_o
        case(ALUOp_i)
            4'b0010: begin
                case(funct_i)
                    6'b100000: ALU_operation_o = 5'b00000; // add
                    6'b100010: ALU_operation_o = 5'b00001; // sub
                    6'b100100: ALU_operation_o = 5'b00010; // AND
                    6'b100101: ALU_operation_o = 5'b00011; // OR
                    6'b100110: ALU_operation_o = 5'b00100; // XOR
                    6'b000000: ALU_operation_o = 5'b00101; // sll
                    6'b000010: ALU_operation_o = 5'b00110; // srl
                    6'b101010: ALU_operation_o = 5'b00111; // slt
                    default: ALU_operation_o = 5'b00000;
                endcase
            end
            4'b0000: ALU_operation_o = 5'b00000; // add (for lb, lh, lw, sb, sh, sw)
            4'b0001: ALU_operation_o = 5'b00001; // sub (for beq)
            4'b0011: ALU_operation_o = 5'b00111; // slt (for slti)
            4'b0100: ALU_operation_o = 5'b00010; // AND (for andi)
            4'b0101: ALU_operation_o = 5'b00011; // OR (for ori)
            4'b0110: ALU_operation_o = 5'b01000; // lui
            4'b0111: ALU_operation_o = 5'b01001; // bne
            4'b1000: ALU_operation_o = 5'b01010; // blez
            4'b1001: ALU_operation_o = 5'b01011; // bgtz
            4'b1010: ALU_operation_o = 5'b01100; // bltz
            4'b1011: ALU_operation_o = 5'b01101; // bgez
            default: ALU_operation_o = 5'b00000;
        endcase
    end

endmodule