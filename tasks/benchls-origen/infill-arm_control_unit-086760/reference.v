module origen_086760 (
    input [1:0] Op,
    input Funct5, Funct4, Funct1,
    output reg Branch, RegW, MemW, MemtoReg, ALUSrc, ALUOp, link,
    output reg [1:0] ImmSrc, RegSrc
);

    initial begin
        Branch = 0;
        RegW = 0;
        MemW = 0;
        MemtoReg = 0;
        ALUSrc = 0;
        ALUOp = 0;
        link = 0;
        ImmSrc = 2'b00;
        RegSrc = 2'b00;
    end

    always @(*) begin
        case (Op)
            2'b00: begin
                if (Funct5 == 0) begin
                    // R-type arithmetic instruction
                    Branch = 0;
                    RegW = 1;
                    MemW = 0;
                    MemtoReg = 0;
                    ALUSrc = 0;
                    ALUOp = 1;
                    link = 0;
                    ImmSrc = 2'b00;
                    RegSrc = 2'b00;
                end else begin
                    // I-type arithmetic instruction with immediate
                    Branch = 0;
                    RegW = 1;
                    MemW = 0;
                    MemtoReg = 0;
                    ALUSrc = 1;
                    ALUOp = 1;
                    link = 0;
                    ImmSrc = 2'b00;
                    RegSrc = 2'b00;
                end
            end
            2'b01: begin
                if (Funct1 == 0) begin
                    // Store instruction
                    Branch = 0;
                    RegW = 0;
                    MemW = 1;
                    MemtoReg = 0;
                    ALUSrc = 1;
                    ALUOp = 0;
                    link = 0;
                    ImmSrc = 2'b01;
                    RegSrc = 2'b10;
                end else begin
                    // Load instruction
                    Branch = 0;
                    RegW = 1;
                    MemW = 0;
                    MemtoReg = 1;
                    ALUSrc = 1;
                    ALUOp = 0;
                    link = 0;
                    ImmSrc = 2'b01;
                    RegSrc = 2'b00;
                end
            end
            2'b10: begin
                // Branch instruction
                Branch = 1;
                RegW = Funct4;
                MemW = 0;
                MemtoReg = 0;
                ALUSrc = 0;
                ALUOp = 0;
                link = Funct4;
                ImmSrc = 2'b10;
                RegSrc = {1'b0, ~Funct4};
            end
            default: begin
                // Default case (Op = 11 or undefined)
                Branch = 0;
                RegW = 0;
                MemW = 0;
                MemtoReg = 0;
                ALUSrc = 0;
                ALUOp = 0;
                link = 0;
                ImmSrc = 2'b00;
                RegSrc = 2'b00;
            end
        endcase
    end
endmodule