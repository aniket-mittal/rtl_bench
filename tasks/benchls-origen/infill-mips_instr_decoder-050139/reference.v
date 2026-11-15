`define ADD 6'b100000
`define SUB 6'b100010
`define ORI 6'b001101
`define LW  6'b100011
`define SW  6'b101011
`define BEQ 6'b000100
`define J   6'b000010
`define JAL 6'b000011
`define JR  6'b001000
`define LUI 6'b001111

module origen_050139(
    input [31:0] instr,
    output reg RegWrite,
    output reg [1:0] Mem_to_Reg,
    output reg MemWrite,
    output reg [2:0] ALUctr,
    output reg ALUsrc,
    output reg if_j,
    output reg if_jal,
    output reg if_jr,
    output reg [1:0] RegDst,
    output reg [1:0] Ext_op,
    output reg Branch_on_equal,
    output reg [1:0] res
);

wire [5:0] op = instr[31:26];
wire [5:0] func = instr[5:0];

always @(*) begin
    RegWrite = 1'b0;
    Mem_to_Reg = 2'b00;
    MemWrite = 1'b0;
    ALUctr = 3'b000;
    ALUsrc = 1'b0;
    if_j = 1'b0;
    if_jal = 1'b0;
    if_jr = 1'b0;
    RegDst = 2'b00;
    Ext_op = 2'b00;
    Branch_on_equal = 1'b0;
    res = 2'b00;

    case(op)
        6'b000000: begin // R-type
            case(func)
                `ADD: begin
                    RegWrite = 1'b1;
                    ALUctr = 3'b010;
                    RegDst = 2'b01;
                    res = 2'b00;
                end
                `SUB: begin
                    RegWrite = 1'b1;
                    ALUctr = 3'b110;
                    RegDst = 2'b01;
                    res = 2'b00;
                end
                `JR: begin
                    if_jr = 1'b1;
                end
            endcase
        end
        `ORI: begin
            RegWrite = 1'b1;
            ALUctr = 3'b001;
            ALUsrc = 1'b1;
            Ext_op = 2'b01;
            res = 2'b00;
        end
        `LW: begin
            RegWrite = 1'b1;
            Mem_to_Reg = 2'b01;
            ALUctr = 3'b010;
            ALUsrc = 1'b1;
            Ext_op = 2'b00;
            res = 2'b01;
        end
        `SW: begin
            MemWrite = 1'b1;
            ALUctr = 3'b010;
            ALUsrc = 1'b1;
            Ext_op = 2'b00;
        end
        `BEQ: begin
            ALUctr = 3'b110;
            Branch_on_equal = 1'b1;
            Ext_op = 2'b00;
        end
        `J: begin
            if_j = 1'b1;
        end
        `JAL: begin
            RegWrite = 1'b1;
            if_jal = 1'b1;
            RegDst = 2'b10;
            res = 2'b10;
        end
        `LUI: begin
            RegWrite = 1'b1;
            ALUctr = 3'b011;
            ALUsrc = 1'b1;
            Ext_op = 2'b10;
            res = 2'b00;
        end
    endcase
end

endmodule