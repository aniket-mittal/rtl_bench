module origen_044903(
    input wire clk,
    input wire rst,
    input wire [5:0] op,
    input wire [5:0] fun,
    output reg [1:0] RegDst,
    output reg ALUSrc,
    output reg [1:0] nPC_sel,
    output reg [2:0] ALUCtr,
    output reg [1:0] MemToReg,
    output reg MemWr,
    output reg [1:0] ExtOp,
    output reg RegWr,
    output reg overflow
);

    // Instruction type parameters
    localparam R_TYPE = 6'b000000;
    localparam ADDI   = 6'b001000;
    localparam ADDIU  = 6'b001001;
    localparam ORI    = 6'b001101;
    localparam LUI    = 6'b001111;
    localparam LW     = 6'b100011;
    localparam SW     = 6'b101011;
    localparam BEQ    = 6'b000100;
    localparam J      = 6'b000010;
    localparam JAL    = 6'b000011;

    // R-type function codes
    localparam ADDU   = 6'b100001;
    localparam SUBU   = 6'b100011;
    localparam SLT    = 6'b101010;
    localparam JR     = 6'b001000;

    always @(*) begin
        // Default values
        RegDst = 2'b00;
        ALUSrc = 1'b0;
        nPC_sel = 2'b00;
        ALUCtr = 3'b000;
        MemToReg = 2'b00;
        MemWr = 1'b0;
        ExtOp = 2'b01;
        RegWr = 1'b1;
        overflow = 1'b0;

        case(op)
            R_TYPE: begin
                RegDst = 2'b01;
                case(fun)
                    ADDU: ALUCtr = 3'b000;
                    SUBU: ALUCtr = 3'b001;
                    SLT:  ALUCtr = 3'b100;
                    JR:   begin
                        nPC_sel = 2'b10;
                        RegWr = 1'b0;
                    end
                endcase
            end
            ADDI: begin
                ALUSrc = 1'b1;
                ALUCtr = 3'b011;
            end
            ADDIU: begin
                ALUSrc = 1'b1;
                ALUCtr = 3'b000;
            end
            ORI: begin
                ALUSrc = 1'b1;
                ALUCtr = 3'b010;
                ExtOp = 2'b00;
            end
            LUI: begin
                ALUSrc = 1'b1;
                ALUCtr = 3'b101;
                ExtOp = 2'b10;
            end
            LW: begin
                ALUSrc = 1'b1;
                ALUCtr = 3'b000;
                MemToReg = 2'b01;
            end
            SW: begin
                ALUSrc = 1'b1;
                ALUCtr = 3'b000;
                MemWr = 1'b1;
                RegWr = 1'b0;
            end
            BEQ: begin
                ALUCtr = 3'b001;
                nPC_sel = 2'b11;
                RegWr = 1'b0;
            end
            J: begin
                nPC_sel = 2'b01;
                RegWr = 1'b0;
            end
            JAL: begin
                RegDst = 2'b10;
                nPC_sel = 2'b01;
                MemToReg = 2'b10;
            end
        endcase
    end

endmodule