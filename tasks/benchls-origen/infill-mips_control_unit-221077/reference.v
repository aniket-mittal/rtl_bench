module origen_221077(
    input [31:0] ins,
    output reg jump,
    output reg RegDst,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg RegWrite,
    output reg MemWrite,
    output reg branch,
    output reg [1:0] extop,
    output reg [2:0] aluop,
    output reg sll_slt,
    output reg jr_slt,
    output reg jal_slt
);

    always @(*) begin
        jump = 0;
        RegDst = 0;
        ALUSrc = 0;
        MemtoReg = 0;
        RegWrite = 0;
        MemWrite = 0;
        branch = 0;
        extop = 2'b00;
        aluop = 3'b000;
        sll_slt = 0;
        jr_slt = 0;
        jal_slt = 0;

        case (ins[31:26])
            6'b000010: jump = 1; // j
            6'b000011: begin
                jump = 1;
                jal_slt = 1;
            end // jal
            6'b000000: begin
                case (ins[5:0])
                    6'b100001: begin
                        RegDst = 1;
                        aluop = 3'b001;
                    end // addu
                    6'b100011: begin
                        RegDst = 1;
                        aluop = 3'b010;
                    end // subu
                    6'b000000: begin
                        RegDst = 1;
                        sll_slt = 1;
                        aluop = 3'b000;
                    end // sll
                    6'b001000: begin
                        jr_slt = 1;
                    end // jr
                endcase
            end
            6'b001101: begin
                ALUSrc = 1;
                RegWrite = 1;
                extop = 2'b01;
                aluop = 3'b011;
            end // ori
            6'b001111: begin
                ALUSrc = 1;
                RegWrite = 1;
                extop = 2'b10;
                aluop = 3'b100;
            end // lui
            6'b100011: begin
                ALUSrc = 1;
                MemtoReg = 1;
                RegWrite = 1;
                extop = 2'b01;
                aluop = 3'b001;
            end // lw
            6'b101011: begin
                ALUSrc = 1;
                MemWrite = 1;
                extop = 2'b01;
                aluop = 3'b001;
            end // sw
            6'b000100: begin
                branch = 1;
                aluop = 3'b101;
            end // beq
        endcase
    end
endmodule