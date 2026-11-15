module origen_088264 (
    input [6:2] opcode,
    output reg branch,
    output reg memread,
    output reg memtoreg,
    output reg [1:0] aluop,
    output reg memwrite,
    output reg alusrc,
    output reg regwrite,
    output reg i_type,
    output reg [1:0] AJ_control,
    output reg lui_flag
);

always @(*) begin
    case(opcode)
        5'b01100: begin // R-type
            branch = 0;
            memread = 0;
            memtoreg = 0;
            aluop = 2'b10;
            memwrite = 0;
            alusrc = 0;
            regwrite = 1;
            i_type = 0;
            AJ_control = 2'b00;
            lui_flag = 0;
        end
        5'b00000: begin // Load
            branch = 0;
            memread = 1;
            memtoreg = 1;
            aluop = 2'b00;
            memwrite = 0;
            alusrc = 1;
            regwrite = 1;
            i_type = 1;
            AJ_control = 2'b00;
            lui_flag = 0;
        end
        5'b01000: begin // Store
            branch = 0;
            memread = 0;
            memtoreg = 0;
            aluop = 2'b00;
            memwrite = 1;
            alusrc = 1;
            regwrite = 0;
            i_type = 0;
            AJ_control = 2'b00;
            lui_flag = 0;
        end
        5'b11000: begin // Branch
            branch = 1;
            memread = 0;
            memtoreg = 0;
            aluop = 2'b01;
            memwrite = 0;
            alusrc = 0;
            regwrite = 0;
            i_type = 0;
            AJ_control = 2'b00;
            lui_flag = 0;
        end
        5'b00100: begin // I-type
            branch = 0;
            memread = 0;
            memtoreg = 0;
            aluop = 2'b10;
            memwrite = 0;
            alusrc = 1;
            regwrite = 1;
            i_type = 1;
            AJ_control = 2'b00;
            lui_flag = 0;
        end
        5'b11011: begin // JAL
            branch = 1;
            memread = 0;
            memtoreg = 0;
            aluop = 2'b00;
            memwrite = 0;
            alusrc = 0;
            regwrite = 1;
            i_type = 0;
            AJ_control = 2'b01;
            lui_flag = 0;
        end
        5'b11001: begin // JALR
            branch = 1;
            memread = 0;
            memtoreg = 0;
            aluop = 2'b00;
            memwrite = 0;
            alusrc = 1;
            regwrite = 1;
            i_type = 1;
            AJ_control = 2'b10;
            lui_flag = 0;
        end
        5'b00101: begin // AUIPC
            branch = 0;
            memread = 0;
            memtoreg = 0;
            aluop = 2'b00;
            memwrite = 0;
            alusrc = 1;
            regwrite = 1;
            i_type = 0;
            AJ_control = 2'b11;
            lui_flag = 0;
        end
        5'b01101: begin // LUI
            branch = 0;
            memread = 0;
            memtoreg = 0;
            aluop = 2'b00;
            memwrite = 0;
            alusrc = 1;
            regwrite = 1;
            i_type = 0;
            AJ_control = 2'b00;
            lui_flag = 1;
        end
        default: begin
            branch = 0;
            memread = 0;
            memtoreg = 0;
            aluop = 2'b00;
            memwrite = 0;
            alusrc = 0;
            regwrite = 0;
            i_type = 0;
            AJ_control = 2'b00;
            lui_flag = 0;
        end
    endcase
end

endmodule