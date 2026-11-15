module origen_151735(
    input [31:0] CODE,
    input shift,
    input syscall,
    input RegDst,
    input Jal,
    input Zero_extend,
    output reg [27:0] PC,
    output reg [5:0] OPCODE,
    output reg [5:0] FUNCT,
    output reg [4:0] RA,
    output reg [4:0] RB,
    output reg [4:0] RW,
    output reg [31:0] extend
);

    initial begin
        PC = 0;
        OPCODE = 0;
        FUNCT = 0;
        RA = 0;
        RB = 0;
        RW = 0;
        extend = 0;
    end

    always @(*) begin
        PC = {CODE[31:28], 2'b00};
        OPCODE = CODE[31:26];
        FUNCT = CODE[5:0];

        if (syscall) begin
            RA = 11;
            RB = 12;
        end else begin
            RA = CODE[25:21];
            RB = CODE[20:16];
        end

        if (RegDst) begin
            RW = CODE[15:11];
        end else if (Jal) begin
            RW = 31;
        end else begin
            RW = CODE[20:16];
        end

        if (Zero_extend) begin
            extend = {16'b0, CODE[15:0]};
        end else begin
            extend = {{16{CODE[15]}}, CODE[15:0]};
        end
    end

endmodule