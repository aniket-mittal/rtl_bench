module origen_178434(
    input [31:0] raw_dmem,
    input [2:0] LdSel,
    input [1:0] shamt,
    output reg [31:0] wb_dmem
);

always @(*) begin
    case (LdSel)
        3'b001: begin // Byte/Half-word Load with Sign-extension
            case (shamt)
                2'b00: wb_dmem <= {{24{raw_dmem[7]}}, raw_dmem[7:0]};
                2'b01: wb_dmem <= {{24{raw_dmem[15]}}, raw_dmem[15:0]};
                2'b10: wb_dmem <= {{24{raw_dmem[23]}}, raw_dmem[23:0]};
                2'b11: wb_dmem <= {{24{raw_dmem[31]}}, raw_dmem[31:0]};
            endcase
        end
        3'b000: begin // Byte Load with Sign-extension
            case (shamt)
                2'b00: wb_dmem <= {{24{raw_dmem[7]}}, raw_dmem[7:0]};
                2'b01: wb_dmem <= {{24{raw_dmem[15]}}, raw_dmem[15:8]};
                2'b10: wb_dmem <= {{24{raw_dmem[23]}}, raw_dmem[23:16]};
                2'b11: wb_dmem <= {{24{raw_dmem[31]}}, raw_dmem[31:24]};
            endcase
        end
        3'b100: begin // Half-word Load with Zero-extension
            case (shamt)
                2'b00: wb_dmem <= {16'b0, raw_dmem[15:0]};
                2'b01: wb_dmem <= {16'b0, raw_dmem[23:8]};
                2'b10: wb_dmem <= {16'b0, raw_dmem[31:16]};
                2'b11: wb_dmem <= raw_dmem;
            endcase
        end
        3'b011: begin // Byte Load with Zero-extension
            case (shamt)
                2'b00: wb_dmem <= {24'b0, raw_dmem[7:0]};
                2'b01: wb_dmem <= {24'b0, raw_dmem[15:8]};
                2'b10: wb_dmem <= {24'b0, raw_dmem[23:16]};
                2'b11: wb_dmem <= {24'b0, raw_dmem[31:24]};
            endcase
        end
        3'b010: begin // Word Load
            wb_dmem <= raw_dmem;
        end
        default: begin
            wb_dmem <= 32'dx;
        end
    endcase
end

endmodule