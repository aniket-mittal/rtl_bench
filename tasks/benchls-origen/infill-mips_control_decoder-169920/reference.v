module origen_169920(
    input clk,
    input rst,
    input beqout,
    input [5:0] op,
    input [5:0] funct,
    output reg DMWrite,
    output reg [1:0] npc_sel,
    output reg RegWrt,
    output reg [1:0] ExtOp,
    output reg mux4_5sel,
    output reg mux2sel,
    output reg [1:0] mux4_32sel,
    output reg [2:0] ALUctr,
    output reg Rtype,
    output reg add,
    output reg sub,
    output reg lw,
    output reg sw,
    output reg beq,
    output reg lui,
    output reg addiu,
    output reg j,
    output reg bgtz
);

always @(*) begin
    DMWrite = 0;
    npc_sel = 2'b00;
    RegWrt = 0;
    ExtOp = 2'b01;
    mux4_5sel = 0;
    mux2sel = 0;
    mux4_32sel = 2'b00;
    ALUctr = 3'b000;
    Rtype = 0;
    add = 0;
    sub = 0;
    lw = 0;
    sw = 0;
    beq = 0;
    lui = 0;
    addiu = 0;
    j = 0;
    bgtz = 0;

    case (op)
        6'b000000: begin // R-type
            Rtype = 1;
            mux4_5sel = 1;
            RegWrt = 1;

            case (funct)
                6'b100000: begin // ADD
                    add = 1;
                    ALUctr = 3'b001;
                end
                6'b100010: begin // SUB
                    sub = 1;
                    ALUctr = 3'b000;
                end
            endcase
        end
        6'b100011: begin // LW
            lw = 1;
            RegWrt = 1;
            ExtOp = 2'b10;
            mux2sel = 1;
            mux4_32sel = 2'b01;
            ALUctr = 3'b001;
        end
        6'b101011: begin // SW
            sw = 1;
            DMWrite = 1;
            ExtOp = 2'b10;
            mux2sel = 1;
            mux4_32sel = 2'b01;
            ALUctr = 3'b001;
        end
        6'b000100: begin // BEQ
            beq = 1;
            npc_sel = (beqout) ? 2'b11 : 2'b00;
            ALUctr = 3'b010;
        end
        6'b001111: begin // LUI
            lui = 1;
            RegWrt = 1;
            ExtOp = 2'b00;
            mux4_32sel = 2'b10;
        end
        6'b001001: begin // ADDIU
            addiu = 1;
            RegWrt = 1;
            ExtOp = 2'b01;
            mux4_5sel = 1;
            mux2sel = 1;
            mux4_32sel = 2'b11;
            ALUctr = 3'b001;
        end
        6'b000010: begin // J
            j = 1;
            npc_sel = 2'b01;
        end
        6'b000111: begin // BGTZ
            bgtz = 1;
            npc_sel = (beqout) ? 2'b10 : 2'b00;
        end
    endcase
end

endmodule