module origen_194445(
    input wire [31:0] idata,
    output reg [1:0] alusrc,
    output reg memtoreg,
    output reg regwrite,
    output reg [3:0] memwrite,
    output reg [2:0] branch,
    output reg [1:0] aluop,
    output reg [1:0] regin,
    output reg [2:0] imm
);

    always @(*) begin
        case (idata[6:2])
            5'b01100: begin // R-type
                alusrc = 2'b00;
                memtoreg = 1'b0;
                regwrite = 1'b1;
                memwrite = 4'b0000;
                branch = 3'b000;
                aluop = 2'b10;
                regin = 2'b00;
                imm = 3'b000;
            end
            5'b00000: begin // I-type (LOAD)
                alusrc = 2'b01;
                memtoreg = 1'b1;
                regwrite = 1'b1;
                memwrite = 4'b0000;
                branch = 3'b000;
                aluop = 2'b00;
                regin = 2'b01;
                imm = 3'b001;
            end
            5'b01000: begin // S-type (STORE)
                alusrc = 2'b01;
                memtoreg = 1'b0;
                regwrite = 1'b0;
                memwrite = {2'b00, idata[13:12]};
                branch = 3'b000;
                aluop = 2'b00;
                regin = 2'b00;
                imm = 3'b010;
            end
            5'b11000: begin // B-type (BRANCH)
                alusrc = 2'b00;
                memtoreg = 1'b0;
                regwrite = 1'b0;
                memwrite = 4'b0000;
                branch = {idata[14], idata[12], idata[6:5]};
                aluop = 2'b01;
                regin = 2'b00;
                imm = 3'b011;
            end
            5'b11011: begin // J-type (JAL)
                alusrc = 2'b10;
                memtoreg = 1'b0;
                regwrite = 1'b1;
                memwrite = 4'b0000;
                branch = 3'b000;
                aluop = 2'b00;
                regin = 2'b10;
                imm = 3'b100;
            end
            5'b11001: begin // I-type (JALR)
                alusrc = 2'b01;
                memtoreg = 1'b0;
                regwrite = 1'b1;
                memwrite = 4'b0000;
                branch = 3'b000;
                aluop = 2'b00;
                regin = 2'b10;
                imm = 3'b001;
            end
            default: begin
                alusrc = 2'b00;
                memtoreg = 1'b0;
                regwrite = 1'b0;
                memwrite = 4'b0000;
                branch = 3'b000;
                aluop = 2'b00;
                regin = 2'b00;
                imm = 3'b000;
            end
        endcase
    end

endmodule