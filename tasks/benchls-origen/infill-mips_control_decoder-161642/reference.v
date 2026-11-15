module origen_161642(
    input [5:0] opcode,
    input [5:0] funct,
    output reg [1:0] npc_sel,
    output reg regwr,
    output reg regdst,
    output reg extop,
    output reg alusrc,
    output reg [1:0] aluctr,
    output reg memwr,
    output reg memtoreg,
    output reg addu,
    output reg subu,
    output reg ori,
    output reg lw,
    output reg sw,
    output reg beq,
    output reg lui,
    output reg j,
    output reg jal
);

    always @(*) begin
        // Default values
        npc_sel = 2'b00;
        regwr = 1'b0;
        regdst = 1'b0;
        extop = 1'b0;
        alusrc = 1'b0;
        aluctr = 2'b00;
        memwr = 1'b0;
        memtoreg = 1'b0;
        addu = 1'b0;
        subu = 1'b0;
        ori = 1'b0;
        lw = 1'b0;
        sw = 1'b0;
        beq = 1'b0;
        lui = 1'b0;
        j = 1'b0;
        jal = 1'b0;

        case (opcode)
            6'b000000: begin // R-type instructions
                case (funct)
                    6'b100001: begin // addu
                        regwr = 1'b1;
                        regdst = 1'b1;
                        aluctr = 2'b00;
                        addu = 1'b1;
                    end
                    6'b100011: begin // subu
                        regwr = 1'b1;
                        regdst = 1'b1;
                        aluctr = 2'b01;
                        subu = 1'b1;
                    end
                    default: begin
                        // Do nothing, keep default values
                    end
                endcase
            end
            6'b001101: begin // ori
                regwr = 1'b1;
                regdst = 1'b0;
                extop = 1'b0;
                alusrc = 1'b1;
                aluctr = 2'b10;
                ori = 1'b1;
            end
            6'b100011: begin // lw
                regwr = 1'b1;
                regdst = 1'b0;
                extop = 1'b1;
                alusrc = 1'b1;
                aluctr = 2'b00;
                memtoreg = 1'b1;
                lw = 1'b1;
            end
            6'b101011: begin // sw
                extop = 1'b1;
                alusrc = 1'b1;
                aluctr = 2'b00;
                memwr = 1'b1;
                sw = 1'b1;
            end
            6'b000100: begin // beq
                npc_sel = 2'b01;
                extop = 1'b1;
                aluctr = 2'b01;
                beq = 1'b1;
            end
            6'b001111: begin // lui
                regwr = 1'b1;
                regdst = 1'b0;
                alusrc = 1'b1;
                aluctr = 2'b11;
                lui = 1'b1;
            end
            6'b000010: begin // j
                npc_sel = 2'b10;
                j = 1'b1;
            end
            6'b000011: begin // jal
                npc_sel = 2'b11;
                regwr = 1'b1;
                regdst = 1'b0;
                jal = 1'b1;
            end
            default: begin
                // Do nothing, keep default values
            end
        endcase
    end
endmodule