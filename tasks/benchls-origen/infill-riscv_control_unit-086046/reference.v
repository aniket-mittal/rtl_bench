module origen_086046 (
    input wire [6:0] opcode,
    input wire rst_n,
    output reg [1:0] immSel,
    output reg [1:0] ALUop,
    output reg ALUSrc,
    output reg branch,
    output reg jump,
    output reg memRead,
    output reg memWrite,
    output reg memToReg,
    output reg regWrite,
    output reg [1:0] PCSrc
);

    always @(*) begin
        if (!rst_n) begin
            immSel = 2'b00;
            ALUop = 2'b00;
            ALUSrc = 1'b0;
            branch = 1'b0;
            jump = 1'b0;
            memRead = 1'b0;
            memWrite = 1'b0;
            memToReg = 1'b0;
            regWrite = 1'b0;
            PCSrc = 2'b00;
        end else begin
            case (opcode)
                7'b0110011: begin // R-type
                    immSel = 2'b00;
                    ALUop = 2'b10;
                    ALUSrc = 1'b0;
                    branch = 1'b0;
                    jump = 1'b0;
                    memRead = 1'b0;
                    memWrite = 1'b0;
                    memToReg = 1'b0;
                    regWrite = 1'b1;
                    PCSrc = 2'b00;
                end
                7'b0000011: begin // Load
                    immSel = 2'b00;
                    ALUop = 2'b00;
                    ALUSrc = 1'b1;
                    branch = 1'b0;
                    jump = 1'b0;
                    memRead = 1'b1;
                    memWrite = 1'b0;
                    memToReg = 1'b1;
                    regWrite = 1'b1;
                    PCSrc = 2'b00;
                end
                7'b0010011: begin // I-type
                    immSel = 2'b00;
                    ALUop = 2'b10;
                    ALUSrc = 1'b1;
                    branch = 1'b0;
                    jump = 1'b0;
                    memRead = 1'b0;
                    memWrite = 1'b0;
                    memToReg = 1'b0;
                    regWrite = 1'b1;
                    PCSrc = 2'b00;
                end
                7'b0100011: begin // Store
                    immSel = 2'b01;
                    ALUop = 2'b00;
                    ALUSrc = 1'b1;
                    branch = 1'b0;
                    jump = 1'b0;
                    memRead = 1'b0;
                    memWrite = 1'b1;
                    memToReg = 1'b0;
                    regWrite = 1'b0;
                    PCSrc = 2'b00;
                end
                7'b1100011: begin // Branch
                    immSel = 2'b10;
                    ALUop = 2'b01;
                    ALUSrc = 1'b0;
                    branch = 1'b1;
                    jump = 1'b0;
                    memRead = 1'b0;
                    memWrite = 1'b0;
                    memToReg = 1'b0;
                    regWrite = 1'b0;
                    PCSrc = 2'b10;
                end
                7'b1101111: begin // Jump
                    immSel = 2'b11;
                    ALUop = 2'b00;
                    ALUSrc = 1'b0;
                    branch = 1'b0;
                    jump = 1'b1;
                    memRead = 1'b0;
                    memWrite = 1'b0;
                    memToReg = 1'b0;
                    regWrite = 1'b1;
                    PCSrc = 2'b01;
                end
                default: begin
                    immSel = 2'b00;
                    ALUop = 2'b00;
                    ALUSrc = 1'b0;
                    branch = 1'b0;
                    jump = 1'b0;
                    memRead = 1'b0;
                    memWrite = 1'b0;
                    memToReg = 1'b0;
                    regWrite = 1'b0;
                    PCSrc = 2'b00;
                end
            endcase
        end
    end

endmodule