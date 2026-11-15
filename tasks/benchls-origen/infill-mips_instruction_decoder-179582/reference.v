module origen_179582(
    input [31:0] instruction,
    output [25:0] addrInfo,
    output [2:0] ALUop,
    output [4:0] writeReg,
    output wbEnable,
    output memRead,
    output memWrite,
    output iType,
    output isBranch,
    output isJump
);

    wire [5:0] opcode;
    wire [4:0] rs, rt, rd, shamt;
    wire [5:0] func;

    assign opcode = instruction[31:26];
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign rd = instruction[15:11];
    assign shamt = instruction[10:6];
    assign func = instruction[5:0];
    assign addrInfo = instruction[25:0];

    wire rType, iType_wire;

    assign rType = (opcode == 6'b000000);
    assign iType_wire = ~rType;

    assign iType = iType_wire;
    assign isBranch = (opcode == 6'b000100);
    assign isJump = (opcode == 6'b000010);

    assign wbEnable = rType | (opcode == 6'b100011) | (opcode == 6'b001000);
    assign memRead = (opcode == 6'b100011);
    assign memWrite = (opcode == 6'b101011);

    assign writeReg = rType ? rd : rt;

    reg [2:0] aluop;
    assign ALUop = aluop;

    always @(*) begin
        case (opcode)
            6'b000000: // R-type
                case (func)
                    6'b100000: aluop <= 3'b010; // ADD
                    6'b100010: aluop <= 3'b110; // SUB
                    6'b100100: aluop <= 3'b000; // AND
                    6'b100101: aluop <= 3'b001; // OR
                    6'b101010: aluop <= 3'b111; // SLT
                    default:   aluop <= 3'b000; // Default to AND
                endcase
            default:    aluop <= 3'b010; // ADDI, LOAD, STORE
        endcase
    end

endmodule