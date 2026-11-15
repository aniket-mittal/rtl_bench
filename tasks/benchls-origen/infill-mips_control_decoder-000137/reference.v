module origen_000137(
    input [5:0] opcode,
    input [5:0] funct,
    output reg jump,
    output reg beq,
    output reg bne,
    output reg [1:0] wb,
    output reg [1:0] m,
    output reg [3:0] ex
);

    always @(*) begin
        // Default values
        jump = 1'b0;
        beq = 1'b0;
        bne = 1'b0;
        wb = 2'b00;
        m = 2'b00;
        ex = 4'b0000;

        case(opcode)
            6'b100011: begin // LW
                wb = 2'b01;
                m = 2'b01;
                ex = 4'b0001;
            end
            6'b101011: begin // SW
                m = 2'b10;
                ex = 4'b0001;
            end
            6'b001000: begin // ADDI
                wb = 2'b01;
                ex = 4'b0001;
            end
            6'b001100: begin // ANDI
                wb = 2'b01;
                ex = 4'b0010;
            end
            6'b000100: begin // BEQ
                beq = 1'b1;
                ex = 4'b0100;
            end
            6'b000101: begin // BNE
                bne = 1'b1;
                ex = 4'b0100;
            end
            6'b000010: begin // J
                jump = 1'b1;
            end
            6'b000000: begin // R-type
                case(funct)
                    6'b100000: begin // ADD
                        wb = 2'b01;
                        ex = 4'b0000;
                    end
                    6'b100010: begin // SUB
                        wb = 2'b01;
                        ex = 4'b0100;
                    end
                    6'b100100: begin // AND
                        wb = 2'b01;
                        ex = 4'b0010;
                    end
                    6'b100101: begin // OR
                        wb = 2'b01;
                        ex = 4'b0011;
                    end
                    default: begin
                        jump = 1'b0;
                        beq = 1'b0;
                        bne = 1'b0;
                        wb = 2'b00;
                        m = 2'b00;
                        ex = 4'b0000;
                    end
                endcase
            end
            default: begin
                jump = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                wb = 2'b00;
                m = 2'b00;
                ex = 4'b0000;
            end
        endcase

        // Additional check for opcode and funct both zero
        if (opcode == 6'b000000 && funct == 6'b000000) begin
            jump = 1'b0;
            beq = 1'b0;
            bne = 1'b0;
            wb = 2'b00;
            m = 2'b00;
            ex = 4'b0000;
        end
    end

endmodule