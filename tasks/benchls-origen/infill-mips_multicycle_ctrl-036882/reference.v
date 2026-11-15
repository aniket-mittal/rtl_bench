module origen_036882(
    input clk,
    input reset,
    input [5:0] opcode,
    output reg PcWrite,
    output reg PcWriteCond,
    output reg IoD,
    output reg MemRead,
    output reg MemWrite,
    output reg MemtoReg,
    output reg IRwrite,
    output reg [1:0] PcSource,
    output reg [1:0] AluSrcA,
    output reg [1:0] AluSrcB,
    output reg [1:0] Aluop,
    output reg RegWrite,
    output reg RegDst
);

    reg [3:0] state, nextstate;

    parameter s0 = 4'b0000, s1 = 4'b0001, s2 = 4'b0010, s3 = 4'b0011,
              s4 = 4'b0100, s5 = 4'b0101, s6 = 4'b0110, s7 = 4'b0111,
              s8 = 4'b1000, s9 = 4'b1001, s10 = 4'b1010, s11 = 4'b1011;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= s0;
        else
            state <= nextstate;
    end

    always @(*) begin
        case (state)
            s0: nextstate = s1;
            s1: begin
                case (opcode)
                    6'b100011, 6'b101011: nextstate = s2; // load, store
                    6'b000000: nextstate = s6; // R-type
                    6'b000100: nextstate = s8; // branch
                    6'b001000: nextstate = s9; // immediate
                    6'b000010: nextstate = s11; // jump
                    default: nextstate = s0;
                endcase
            end
            s2: nextstate = (opcode == 6'b100011) ? s3 : s5;
            s3: nextstate = s4;
            s4: nextstate = s0;
            s5: nextstate = s0;
            s6: nextstate = s7;
            s7: nextstate = s0;
            s8: nextstate = s0;
            s9: nextstate = s10;
            s10: nextstate = s0;
            s11: nextstate = s0;
            default: nextstate = s0;
        endcase
    end

    always @(*) begin
        // Default values
        {PcWrite, PcWriteCond, IoD, MemRead, MemWrite, MemtoReg, IRwrite, PcSource, AluSrcA, AluSrcB, Aluop, RegWrite, RegDst} = 15'b0;

        case (state)
            s0: begin
                MemRead = 1'b1;
                AluSrcA = 2'b00;
                IoD = 1'b0;
                IRwrite = 1'b1;
                AluSrcB = 2'b01;
                Aluop = 2'b00;
                PcWrite = 1'b1;
                PcSource = 2'b00;
            end
            s1: begin
                AluSrcA = 2'b01;
                AluSrcB = 2'b11;
                Aluop = 2'b00;
            end
            s2: begin
                AluSrcA = 2'b01;
                AluSrcB = 2'b10;
                Aluop = 2'b00;
            end
            s3: begin
                MemRead = 1'b1;
                IoD = 1'b1;
            end
            s4: begin
                RegDst = 1'b0;
                RegWrite = 1'b1;
                MemtoReg = 1'b1;
            end
            s5: begin
                MemWrite = 1'b1;
                IoD = 1'b1;
            end
            s6: begin
                AluSrcA = 2'b10;
                AluSrcB = 2'b00;
                Aluop = 2'b10;
            end
            s7: begin
                RegDst = 1'b1;
                RegWrite = 1'b1;
                MemtoReg = 1'b0;
            end
            s8: begin
                AluSrcA = 2'b10;
                AluSrcB = 2'b00;
                Aluop = 2'b01;
                PcWriteCond = 1'b1;
                PcSource = 2'b01;
            end
            s9: begin
                AluSrcA = 2'b10;
                AluSrcB = 2'b10;
                Aluop = 2'b00;
            end
            s10: begin
                RegDst = 1'b0;
                RegWrite = 1'b1;
                MemtoReg = 1'b0;
            end
            s11: begin
                PcWrite = 1'b1;
                PcSource = 2'b10;
            end
        endcase
    end

endmodule