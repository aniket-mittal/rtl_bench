module origen_076840(
    input [5:0] OP,
    input [5:0] FUNCT,
    input zero,
    input overflow,
    output reg RegDst,
    output reg RegWr,
    output reg MemWr,
    output reg MemToReg,
    output reg [3:0] ALUctrl,
    output reg ALUsrc,
    output reg IsJump,
    output reg IsJAL,
    output reg IsJR,
    output reg IsBranch,
    output reg pcEnable,
    output reg controlLUT0,
    output reg if_Idreg
);

    // Define opcodes
    `define R_TYPE 6'b000000
    `define J      6'b000010
    `define JAL    6'b000011
    `define BEQ    6'b000100
    `define BNE    6'b000101

    // Define function codes for R-type instructions
    `define JR     6'b001000

    always @(*) begin
        // Default values
        {RegDst, RegWr, MemWr, MemToReg, ALUctrl, ALUsrc, IsJump, IsJAL, IsJR, IsBranch} = 13'b0;
        
        case(OP)
            `J, `JAL, `BEQ, `BNE: begin
                pcEnable = 1'b0;
                controlLUT0 = 1'b0;
                if_Idreg = 1'b0;
                
                if (OP == `J || OP == `JAL) IsJump = 1'b1;
                if (OP == `JAL) IsJAL = 1'b1;
                if (OP == `BEQ || OP == `BNE) IsBranch = 1'b1;
            end
            
            `R_TYPE: begin
                if (FUNCT == `JR) begin
                    pcEnable = 1'b0;
                    controlLUT0 = 1'b0;
                    if_Idreg = 1'b0;
                    IsJR = 1'b1;
                end else begin
                    pcEnable = 1'b1;
                    controlLUT0 = 1'b1;
                    if_Idreg = 1'b1;
                    RegDst = 1'b1;
                    RegWr = 1'b1;
                    // Set ALUctrl based on FUNCT code
                    case(FUNCT)
                        6'b100000: ALUctrl = 4'b0010; // ADD
                        6'b100010: ALUctrl = 4'b0110; // SUB
                        6'b100100: ALUctrl = 4'b0000; // AND
                        6'b100101: ALUctrl = 4'b0001; // OR
                        6'b101010: ALUctrl = 4'b0111; // SLT
                        default:   ALUctrl = 4'b0000;
                    endcase
                end
            end
            
            default: begin
                pcEnable = 1'b1;
                controlLUT0 = 1'b1;
                if_Idreg = 1'b1;
                RegWr = 1'b1;
                ALUsrc = 1'b1;
                
                case(OP)
                    6'b001000: begin // ADDI
                        ALUctrl = 4'b0010;
                    end
                    6'b100011: begin // LW
                        ALUctrl = 4'b0010;
                        MemToReg = 1'b1;
                    end
                    6'b101011: begin // SW
                        ALUctrl = 4'b0010;
                        MemWr = 1'b1;
                        RegWr = 1'b0;
                    end
                    default: ALUctrl = 4'b0000;
                endcase
            end
        endcase
    end

endmodule