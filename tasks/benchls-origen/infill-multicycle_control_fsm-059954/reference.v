module origen_059954(
    input clk, rst,
    input [2:0] Opcode,
    output reg IorD, MemRead, MemWrite, LdA, LdB, PcWrite, PcWriteCond,
    output reg [1:0] PcSrc,
    output reg [2:0] ALUop,
    output reg Push, Pop, Tos, MtoS
);

    reg [3:0] ps, ns;

    // Next State Logic
    always @(*) begin
        case(ps)
            4'b0000: ns = 4'b0001;
            4'b0001: begin
                case(Opcode)
                    3'b000: ns = 4'b0010;
                    3'b001: ns = 4'b0011;
                    3'b010: ns = 4'b0100;
                    3'b011: ns = 4'b0101;
                    3'b100: ns = 4'b1000;
                    3'b101: ns = 4'b1001;
                    3'b110: ns = 4'b1010;
                    3'b111: ns = 4'b1011;
                    default: ns = 4'b0000;
                endcase
            end
            4'b0010: ns = 4'b0000;
            4'b0011: ns = 4'b0000;
            4'b0100: ns = 4'b0000;
            4'b0101: begin
                if(Opcode[2] == 1'b0)
                    ns = 4'b0110;
                else
                    ns = 4'b0111;
            end
            4'b0110: ns = 4'b0000;
            4'b0111: ns = 4'b0000;
            4'b1000: ns = 4'b1100;
            4'b1001: ns = 4'b1101;
            4'b1010: ns = 4'b0000;
            4'b1011: ns = 4'b0000;
            4'b1100: ns = 4'b0000;
            4'b1101: ns = 4'b0000;
            default: ns = 4'b0000;
        endcase
    end

    // Output Logic
    always @(*) begin
        IorD = 1'b0; MemRead = 1'b0; MemWrite = 1'b0; LdA = 1'b0; LdB = 1'b0;
        PcWrite = 1'b0; PcWriteCond = 1'b0; PcSrc = 2'b00; ALUop = 3'b000;
        Push = 1'b0; Pop = 1'b0; Tos = 1'b0; MtoS = 1'b0;

        case(ps)
            4'b0000: begin
                MemRead = 1'b1;
                PcWrite = 1'b1;
            end
            4'b0001: begin
                LdA = 1'b1;
                LdB = 1'b1;
            end
            4'b0010: begin
                ALUop = 3'b001;
                PcWrite = 1'b1;
            end
            4'b0011: begin
                ALUop = 3'b010;
                PcWrite = 1'b1;
            end
            4'b0100: begin
                ALUop = 3'b011;
                PcWrite = 1'b1;
            end
            4'b0101: begin
                ALUop = 3'b100;
            end
            4'b0110: begin
                PcWriteCond = 1'b1;
                PcSrc = 2'b01;
            end
            4'b0111: begin
                PcWrite = 1'b1;
                PcSrc = 2'b10;
            end
            4'b1000: begin
                IorD = 1'b1;
                MemRead = 1'b1;
            end
            4'b1001: begin
                IorD = 1'b1;
                MemWrite = 1'b1;
            end
            4'b1010: begin
                Push = 1'b1;
            end
            4'b1011: begin
                Pop = 1'b1;
            end
            4'b1100: begin
                Tos = 1'b1;
            end
            4'b1101: begin
                MtoS = 1'b1;
            end
        endcase
    end

    // State Register
    always @(posedge clk or posedge rst) begin
        if(rst)
            ps <= 4'b0000;
        else
            ps <= ns;
    end

endmodule