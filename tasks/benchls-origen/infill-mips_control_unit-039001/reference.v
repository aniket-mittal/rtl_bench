module origen_039001(
    input [5:0] OPCode,
    input [5:0] FunctCode,
    output reg [1:0] MemtoReg,
    output reg MemWrite,
    output reg [2:0] Branch,
    output reg [1:0] ALUsrc,
    output reg [3:0] ALUop,
    output reg [1:0] EXTop,
    output reg [1:0] RegDst,
    output reg RegWrite,
    output reg Jadr,
    output reg Jsrc
);

    // Instruction opcodes
    localparam R_TYPE = 6'b000000;
    localparam ORI    = 6'b001101;
    localparam LW     = 6'b100011;
    localparam SW     = 6'b101011;
    localparam BEQ    = 6'b000100;
    localparam LUI    = 6'b001111;
    localparam JAL    = 6'b000011;

    // R-type function codes
    localparam ADDU   = 6'b100001;
    localparam SUBU   = 6'b100011;
    localparam JR     = 6'b001000;

    always @(*) begin
        // Default values
        MemtoReg = 2'b00;
        MemWrite = 1'b0;
        Branch = 3'b000;
        ALUsrc = 2'b00;
        ALUop = 4'b0000;
        EXTop = 2'b00;
        RegDst = 2'b00;
        RegWrite = 1'b0;
        Jadr = 1'b0;
        Jsrc = 1'b0;

        case(OPCode)
            R_TYPE: begin
                case(FunctCode)
                    ADDU: begin
                        RegDst = 2'b01;
                        RegWrite = 1'b1;
                        ALUop = 4'b0010;
                    end
                    SUBU: begin
                        RegDst = 2'b01;
                        RegWrite = 1'b1;
                        ALUop = 4'b0110;
                    end
                    JR: begin
                        Jsrc = 1'b1;
                        Jadr = 1'b1;
                    end
                endcase
            end
            ORI: begin
                RegWrite = 1'b1;
                ALUsrc = 2'b01;
                ALUop = 4'b0001;
            end
            LW: begin
                RegWrite = 1'b1;
                ALUsrc = 2'b01;
                ALUop = 4'b0010;
                MemtoReg = 2'b01;
                EXTop = 2'b01;
            end
            SW: begin
                ALUsrc = 2'b01;
                ALUop = 4'b0010;
                MemWrite = 1'b1;
                EXTop = 2'b01;
            end
            BEQ: begin
                Branch = 3'b001;
                ALUop = 4'b0110;
                EXTop = 2'b01;
            end
            LUI: begin
                RegWrite = 1'b1;
                ALUsrc = 2'b01;
                ALUop = 4'b1000;
                EXTop = 2'b10;
            end
            JAL: begin
                RegWrite = 1'b1;
                RegDst = 2'b10;
                MemtoReg = 2'b10;
                Jsrc = 1'b1;
            end
        endcase
    end

endmodule