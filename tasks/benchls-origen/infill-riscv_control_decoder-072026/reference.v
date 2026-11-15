module origen_072026 (
    input [31:0] instruction,
    output reg alusrc,
    output reg [1:0] writeback_ctrl,
    output reg mem_read,
    output reg regwrite,
    output reg mem_write,
    output reg [2:0] alu_ctrl,
    output reg bge,
    output reg beq,
    output reg jalr
);

    wire [4:0] opcode;
    assign opcode = instruction[6:2];

    always @(*) begin
        case(opcode)
            5'b01100: begin // R-type
                alusrc = 1'b0;
                writeback_ctrl = 2'b00;
                mem_read = 1'b0;
                regwrite = 1'b1;
                mem_write = 1'b0;
                alu_ctrl = {1'b0, instruction[30], 1'b0};
                bge = 1'b0;
                beq = 1'b0;
                jalr = 1'b0;
            end
            5'b00100: begin // I-type
                alusrc = 1'b1;
                writeback_ctrl = 2'b00;
                mem_read = 1'b0;
                regwrite = 1'b1;
                mem_write = 1'b0;
                alu_ctrl = {instruction[14], instruction[13:12]};
                bge = 1'b0;
                beq = 1'b0;
                jalr = 1'b0;
            end
            5'b00000: begin // Load
                alusrc = 1'b1;
                writeback_ctrl = 2'b01;
                mem_read = 1'b1;
                regwrite = 1'b1;
                mem_write = 1'b0;
                alu_ctrl = 3'b000;
                bge = 1'b0;
                beq = 1'b0;
                jalr = 1'b0;
            end
            5'b01000: begin // Store
                alusrc = 1'b1;
                writeback_ctrl = 2'bxx;
                mem_read = 1'b0;
                regwrite = 1'b0;
                mem_write = 1'b1;
                alu_ctrl = 3'b000;
                bge = 1'b0;
                beq = 1'b0;
                jalr = 1'b0;
            end
            5'b11000: begin // Branch
                alusrc = 1'b0;
                writeback_ctrl = 2'bxx;
                mem_read = 1'b0;
                regwrite = 1'b0;
                mem_write = 1'b0;
                alu_ctrl = 3'b000;
                bge = instruction[14];
                beq = ~instruction[14];
                jalr = 1'b0;
            end
            5'b11001: begin // JALR
                alusrc = 1'b1;
                writeback_ctrl = 2'b10;
                mem_read = 1'b0;
                regwrite = 1'b1;
                mem_write = 1'b0;
                alu_ctrl = 3'b000;
                bge = 1'b0;
                beq = 1'b0;
                jalr = 1'b1;
            end
            default: begin
                alusrc = 1'bx;
                writeback_ctrl = 2'bxx;
                mem_read = 1'b0;
                regwrite = 1'b0;
                mem_write = 1'b0;
                alu_ctrl = 3'bxxx;
                bge = 1'b0;
                beq = 1'b0;
                jalr = 1'b0;
            end
        endcase
    end

endmodule