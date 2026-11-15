module origen_181635(
    input [5:0] iIR_opcode,
    input [5:0] iIR_func,
    output reg [1:0] oALUOp,
    output reg [1:0] oMemToReg,
    output reg oMemWrite,
    output reg [1:0] oRegDST,
    output reg oRegWrite,
    output reg oJump,
    output reg oALUSrc,
    output reg oBranch,
    output reg oExtOp,
    output reg oJAL,
    output reg oJR
);

always @(*) begin
    // Initialize control signals
    oALUOp = 2'b00;
    oMemToReg = 2'b00;
    oMemWrite = 1'b0;
    oRegDST = 2'b00;
    oRegWrite = 1'b0;
    oJump = 1'b0;
    oALUSrc = 1'b0;
    oBranch = 1'b0;
    oExtOp = 1'b0;
    oJAL = 1'b0;
    oJR = 1'b0;

    case (iIR_opcode)
        6'b000000: begin // R-type instructions
            oALUOp = 2'b10;
            oRegDST = 2'b01;
            oRegWrite = 1'b1;

            case (iIR_func)
                6'b100000: oALUOp = 2'b10; // ADD
                6'b100010: oALUOp = 2'b11; // SUB
                6'b100100: oALUOp = 2'b00; // AND
                6'b100101: oALUOp = 2'b01; // OR
                6'b101010: oALUOp = 2'b11; // SLT
                default: oExtOp = 1'b1;
            endcase
        end

        6'b000010: begin // J-type (jump)
            oJump = 1'b1;
        end

        6'b000011: begin // JAL
            oJAL = 1'b1;
            oRegDST = 2'b10;
            oRegWrite = 1'b1;
        end

        6'b000100: begin // BEQ
            oBranch = 1'b1;
        end

        6'b000101: begin // BNE
            oBranch = 1'b1;
        end

        6'b100011: begin // LW
            oALUSrc = 1'b1;
            oMemToReg = 2'b01;
            oRegWrite = 1'b1;
        end

        6'b101011: begin // SW
            oALUSrc = 1'b1;
            oMemWrite = 1'b1;
        end

        6'b001000: begin // ADDI
            oALUOp = 2'b00;
            oALUSrc = 1'b1;
            oRegWrite = 1'b1;
        end

        6'b000001: begin // BGEZ/BLTZ
            oBranch = 1'b1;
        end

        6'b001111: begin // LUI
            oALUOp = 2'b00;
            oALUSrc = 1'b1;
            oRegWrite = 1'b1;
        end

        6'b000011: begin // JAL
            oJAL = 1'b1;
            oRegDST = 2'b10;
            oRegWrite = 1'b1;
        end

        6'b000000: begin // JR
            oJR = 1'b1;
        end

        default: begin
            // Unsupported instruction
        end
    endcase
end
endmodule