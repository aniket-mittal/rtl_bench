module origen_205277(
    input [5:0] opcode,
    input [5:0] func,
    input MIO_ready,
    input zero,
    output reg RegDst,
    output reg ALUSrc_B,
    output reg DatatoReg,
    output reg Jal,
    output reg [1:0] Branch,
    output reg RegWrite,
    output reg mem_w,
    output reg [3:0] ALU_Control,
    output reg CPU_MIO
);

    always @(*) begin
        case(opcode)
            6'b000000: begin // R-type instructions
                RegDst = 1'b1;
                ALUSrc_B = 1'b0;
                DatatoReg = 1'b0;
                Jal = 1'b0;
                Branch = 2'b00;
                RegWrite = 1'b1;
                mem_w = 1'b0;
                CPU_MIO = 1'b0;

                case(func)
                    6'b100000: ALU_Control = 4'b0010; // add
                    6'b100010: ALU_Control = 4'b0110; // sub
                    6'b100100: ALU_Control = 4'b0000; // and
                    6'b100101: ALU_Control = 4'b0001; // or
                    6'b101010: ALU_Control = 4'b0111; // slt
                    default: ALU_Control = 4'b0000;
                endcase
            end

            6'b100011: begin // lw
                RegDst = 1'b0;
                ALUSrc_B = 1'b1;
                DatatoReg = 1'b1;
                Jal = 1'b0;
                Branch = 2'b00;
                RegWrite = 1'b1;
                mem_w = 1'b0;
                ALU_Control = 4'b0010;
                CPU_MIO = 1'b1;
            end

            6'b101011: begin // sw
                RegDst = 1'bx;
                ALUSrc_B = 1'b1;
                DatatoReg = 1'bx;
                Jal = 1'b0;
                Branch = 2'b00;
                RegWrite = 1'b0;
                mem_w = 1'b1;
                ALU_Control = 4'b0010;
                CPU_MIO = 1'b1;
            end

            6'b000100: begin // beq
                RegDst = 1'bx;
                ALUSrc_B = 1'b0;
                DatatoReg = 1'bx;
                Jal = 1'b0;
                Branch = 2'b01;
                RegWrite = 1'b0;
                mem_w = 1'b0;
                ALU_Control = 4'b0110;
                CPU_MIO = 1'b0;
            end

            6'b000101: begin // bne
                RegDst = 1'bx;
                ALUSrc_B = 1'b0;
                DatatoReg = 1'bx;
                Jal = 1'b0;
                Branch = 2'b10;
                RegWrite = 1'b0;
                mem_w = 1'b0;
                ALU_Control = 4'b0110;
                CPU_MIO = 1'b0;
            end

            6'b000011: begin // jal
                RegDst = 1'b0;
                ALUSrc_B = 1'b1;
                DatatoReg = 2'b10;
                Jal = 1'b1;
                Branch = 2'b11;
                RegWrite = 1'b1;
                mem_w = 1'b0;
                ALU_Control = 4'b0010;
                CPU_MIO = 1'b0;
            end

            default: begin
                RegDst = 1'bx;
                ALUSrc_B = 1'bx;
                DatatoReg = 1'bx;
                Jal = 1'b0;
                Branch = 2'b00;
                RegWrite = 1'b0;
                mem_w = 1'b0;
                ALU_Control = 4'b0000;
                CPU_MIO = 1'b0;
            end
        endcase
    end

endmodule