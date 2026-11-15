module origen_057316(
    input wire reset,
    input wire [5:0] control,
    output reg [1:0] reg_Dest,
    output reg branch,
    output reg mem_Read,
    output reg [1:0] memtoReg,
    output reg [1:0] aluop,
    output reg mem_Write,
    output reg reg_Write,
    output reg alu_Source,
    output reg sign_or_zero
);

always @(*) begin
    if (reset) begin
        reg_Dest = 2'b00;
        branch = 1'b0;
        mem_Read = 1'b0;
        memtoReg = 2'b00;
        aluop = 2'b00;
        mem_Write = 1'b0;
        reg_Write = 1'b0;
        alu_Source = 1'b0;
        sign_or_zero = 1'b1;
    end else begin
        case(control)
            6'b000000: begin // R-type instruction
                reg_Dest = 2'b01;
                branch = 1'b0;
                mem_Read = 1'b0;
                memtoReg = 2'b00;
                aluop = 2'b10;
                mem_Write = 1'b0;
                reg_Write = 1'b1;
                alu_Source = 1'b0;
                sign_or_zero = 1'b1;
            end
            6'b100000: begin // Load instruction
                reg_Dest = 2'b00;
                branch = 1'b0;
                mem_Read = 1'b1;
                memtoReg = 2'b01;
                aluop = 2'b00;
                mem_Write = 1'b0;
                reg_Write = 1'b1;
                alu_Source = 1'b1;
                sign_or_zero = 1'b1;
            end
            6'b101000: begin // Store instruction
                reg_Dest = 2'b00;
                branch = 1'b0;
                mem_Read = 1'b0;
                memtoReg = 2'b00;
                aluop = 2'b00;
                mem_Write = 1'b1;
                reg_Write = 1'b0;
                alu_Source = 1'b1;
                sign_or_zero = 1'b1;
            end
            6'b110000: begin // Branch instruction
                reg_Dest = 2'b00;
                branch = 1'b1;
                mem_Read = 1'b0;
                memtoReg = 2'b00;
                aluop = 2'b01;
                mem_Write = 1'b0;
                reg_Write = 1'b0;
                alu_Source = 1'b0;
                sign_or_zero = 1'b1;
            end
            6'b111000: begin // I-type ALU instruction
                reg_Dest = 2'b00;
                branch = 1'b0;
                mem_Read = 1'b0;
                memtoReg = 2'b00;
                aluop = 2'b11;
                mem_Write = 1'b0;
                reg_Write = 1'b1;
                alu_Source = 1'b1;
                sign_or_zero = 1'b1;
            end
            default: begin // Default case (similar to R-type)
                reg_Dest = 2'b01;
                branch = 1'b0;
                mem_Read = 1'b0;
                memtoReg = 2'b00;
                aluop = 2'b10;
                mem_Write = 1'b0;
                reg_Write = 1'b1;
                alu_Source = 1'b0;
                sign_or_zero = 1'b1;
            end
        endcase
    end
end

endmodule