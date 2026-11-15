module origen_048262(
    input [3:0] condition,
    input set_condition,
    input [4:0] controls,
    input [1:0] format,
    output reg [10:0] signals
);

    localparam ALU = 2'b00;
    localparam LOAD_STORE = 2'b01;
    localparam BRANCH = 2'b10;

    localparam ADD = 5'b00000;
    localparam ADDI = 5'b00001;
    localparam SUB = 5'b00010;
    localparam SUBI = 5'b00011;
    localparam AND = 5'b00100;
    localparam ANDI = 5'b00101;
    localparam OR = 5'b00110;
    localparam ORI = 5'b00111;

    localparam RM = 5'b00000;
    localparam IMM = 5'b00001;

    always @(*) begin
        case (format)
            ALU: begin
                case (controls)
                    ADD: signals = set_condition ? 11'b10000100001 : 11'b10000000001;
                    ADDI: signals = set_condition ? 11'b10001100001 : 11'b10001000001;
                    SUB: signals = set_condition ? 11'b10010100001 : 11'b10010000001;
                    SUBI: signals = set_condition ? 11'b10011100001 : 11'b10011000001;
                    AND: signals = set_condition ? 11'b10100100001 : 11'b10100000001;
                    ANDI: signals = set_condition ? 11'b10101100001 : 11'b10101000001;
                    OR: signals = set_condition ? 11'b10110100001 : 11'b10110000001;
                    ORI: signals = set_condition ? 11'b10111100001 : 11'b10111000001;
                    default: signals = 11'b00000000000;
                endcase
            end
            LOAD_STORE: begin
                case (controls)
                    RM: signals = set_condition ? 11'b01000100010 : 11'b01000000010;
                    IMM: signals = set_condition ? 11'b01001100010 : 11'b01001000010;
                    default: signals = 11'b00000000000;
                endcase
            end
            BRANCH: begin
                signals = 11'b00100000100;
            end
            default: signals = 11'b00000000000;
        endcase
    end

endmodule