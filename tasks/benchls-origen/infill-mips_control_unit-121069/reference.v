module origen_121069(
    input [5:0] op,
    input [5:0] func,
    output reg RegDst,
    output reg ALUSrc,
    output reg MemToReg,
    output reg RegWr,
    output reg MemWr,
    output reg Jump,
    output reg JumpR,
    output reg readRs,
    output reg readRt,
    output reg [1:0] ALUcntrl
);

always @(op or func) begin
    case(op)
        6'b000000: begin // R-type instructions
            RegDst = 1'b1;
            ALUSrc = 1'b0;
            MemToReg = 1'b0;
            RegWr = 1'b1;
            MemWr = 1'b0;
            Jump = 1'b0;
            readRs = 1'b1;
            readRt = 1'b1;
            
            if (func == 6'b000000) begin // NOP
                RegWr = 1'b0;
                readRs = 1'b0;
                readRt = 1'b0;
                ALUcntrl = 2'b00;
                JumpR = 1'b0;
            end
            else if (func == 6'b001000) begin // JR
                RegWr = 1'b0;
                readRt = 1'b0;
                ALUcntrl = 2'b00;
                JumpR = 1'b1;
            end
            else if (func == 6'b100011) begin // SUBU
                ALUcntrl = 2'b01;
                JumpR = 1'b0;
            end
            else if (func == 6'b101011) begin // SLTU
                ALUcntrl = 2'b11;
                JumpR = 1'b0;
            end
            else if (func == 6'b100111) begin // NOR
                ALUcntrl = 2'b10;
                JumpR = 1'b0;
            end
            else begin // Default for R-type
                ALUcntrl = 2'b00;
                JumpR = 1'b0;
            end
        end
        
        6'b100011: begin // Load word
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            MemToReg = 1'b1;
            RegWr = 1'b1;
            MemWr = 1'b0;
            Jump = 1'b0;
            JumpR = 1'b0;
            readRs = 1'b1;
            readRt = 1'b0;
            ALUcntrl = 2'b00;
        end
        
        6'b101011: begin // Store word
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            MemToReg = 1'b0;
            RegWr = 1'b0;
            MemWr = 1'b1;
            Jump = 1'b0;
            JumpR = 1'b0;
            readRs = 1'b1;
            readRt = 1'b1;
            ALUcntrl = 2'b00;
        end
        
        6'b000010: begin // Jump
            RegDst = 1'b0;
            ALUSrc = 1'b0;
            MemToReg = 1'b0;
            RegWr = 1'b0;
            MemWr = 1'b0;
            Jump = 1'b1;
            JumpR = 1'b0;
            readRs = 1'b0;
            readRt = 1'b0;
            ALUcntrl = 2'b00;
        end
        
        6'b000001: begin // Branch on less than zero
            RegDst = 1'b0;
            ALUSrc = 1'b0;
            MemToReg = 1'b0;
            RegWr = 1'b0;
            MemWr = 1'b0;
            Jump = 1'b0;
            JumpR = 1'b0;
            readRs = 1'b1;
            readRt = 1'b0;
            ALUcntrl = 2'b01;
        end
        
        6'b001000: begin // Add immediate
            RegDst = 1'b0;
            ALUSrc = 1'b1;
            MemToReg = 1'b0;
            RegWr = 1'b1;
            MemWr = 1'b0;
            Jump = 1'b0;
            JumpR = 1'b0;
            readRs = 1'b1;
            readRt = 1'b0;
            ALUcntrl = 2'b00;
        end
        
        default: begin // Default case
            RegDst = 1'b0;
            ALUSrc = 1'b0;
            MemToReg = 1'b0;
            RegWr = 1'b0;
            MemWr = 1'b0;
            Jump = 1'b0;
            JumpR = 1'b0;
            readRs = 1'b0;
            readRt = 1'b0;
            ALUcntrl = 2'b00;
        end
    endcase
end

endmodule