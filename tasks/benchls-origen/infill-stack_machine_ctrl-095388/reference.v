module origen_095388(
    input wire clk,
    input wire rst,
    input wire [2:0] opcode,
    output reg IorD, memRead, memWrite,
    output reg lda, ldb,
    output reg [1:0] PCsrc,
    output reg PCwrite, PCwriteCond,
    output reg tos, pop, push,
    output reg [2:0] ALUop
);

    // State encoding
    localparam [3:0] If = 4'b0000,
                     getTop = 4'b0001,
                     readMem = 4'b0010,
                     jump = 4'b0011,
                     branch = 4'b0100,
                     pop1 = 4'b0101,
                     pop2 = 4'b0110,
                     writeMem = 4'b0111,
                     loadA = 4'b1000,
                     loadB = 4'b1001,
                     aluOp = 4'b1010,
                     pushResult = 4'b1011,
                     notOp = 4'b1100,
                     pushNot = 4'b1101;

    reg [3:0] ps, ns;

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            ps <= If;
        else
            ps <= ns;
    end

    // Next state logic
    always @(*) begin
        case (ps)
            If: ns = getTop;
            getTop: begin
                case (opcode)
                    3'b100: ns = readMem;
                    3'b110: ns = jump;
                    3'b111: ns = branch;
                    3'b101: ns = pop1;
                    3'b011: ns = notOp;
                    default: ns = loadA;
                endcase
            end
            readMem: ns = pushResult;
            jump: ns = If;
            branch: ns = If;
            pop1: ns = pop2;
            pop2: ns = writeMem;
            writeMem: ns = If;
            loadA: ns = pop1;
            loadB: ns = aluOp;
            aluOp: ns = pushResult;
            pushResult: ns = If;
            notOp: ns = pushNot;
            pushNot: ns = If;
            default: ns = If;
        endcase
    end

    // Output logic
    always @(*) begin
        // Default values
        {IorD, memRead, memWrite, lda, ldb, PCsrc, PCwrite, PCwriteCond, tos, pop, push, ALUop} = 14'b0;

        case (ps)
            If: begin
                IorD = 0;
                memRead = 1;
                PCsrc = 2'b00;
                PCwrite = 1;
            end
            getTop: tos = 1;
            readMem: begin
                IorD = 1;
                memRead = 1;
            end
            jump: begin
                PCsrc = 2'b10;
                PCwrite = 1;
            end
            branch: begin
                PCsrc = 2'b01;
                PCwriteCond = 1;
            end
            pop1: pop = 1;
            pop2: pop = 1;
            writeMem: begin
                IorD = 1;
                memWrite = 1;
            end
            loadA: lda = 1;
            loadB: ldb = 1;
            aluOp: ALUop = opcode;
            pushResult: push = 1;
            notOp: ALUop = 3'b011;
            pushNot: push = 1;
        endcase
    end

endmodule