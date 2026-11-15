module origen_078885(
    input [5:0] nfuncao,
    input onOP,
    output reg [3:0] controle
);

    // Instruction type parameters
    parameter ADD  = 6'b000000;
    parameter ADDI = 6'b000001;
    parameter SUB  = 6'b000010;
    parameter SUBI = 6'b000011;
    parameter ADC  = 6'b000100;
    parameter ADCI = 6'b000101;
    parameter NAND = 6'b000110;
    parameter NOR  = 6'b000111;
    parameter XNOR = 6'b001000;
    parameter NOT  = 6'b001001;
    parameter SLL  = 6'b001010;
    parameter SRL  = 6'b001011;
    parameter CMP  = 6'b001100;
    parameter CMPI = 6'b001101;
    parameter JMP  = 6'b001110;
    parameter JMPI = 6'b001111;
    parameter CALL = 6'b010000;
    parameter MUL  = 6'b010001;
    parameter DIV  = 6'b010010;

    always @(*) begin
        if (onOP) begin
            case (nfuncao)
                ADD, ADDI: controle = 4'b0000;
                SUB, SUBI: controle = 4'b0001;
                ADC, ADCI: controle = 4'b0000;
                NAND:      controle = 4'b0010;
                NOR:       controle = 4'b0011;
                XNOR:      controle = 4'b0100;
                NOT:       controle = 4'b0100;
                SLL:       controle = 4'b0101;
                SRL:       controle = 4'b0110;
                CMP, CMPI: controle = 4'b0111;
                JMP:       controle = 4'b1000;
                JMPI:      controle = 4'b1001;
                CALL:      controle = 4'b1010;
                MUL:       controle = 4'b1100;
                DIV:       controle = 4'b1101;
                default:   controle = 4'bxxxx;
            endcase
        end else begin
            controle = 4'bxxxx;
        end
    end

endmodule