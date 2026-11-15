module origen_174084(
    input [3:0] ALUOp,
    input [5:0] insFunction,
    output reg [3:0] ALUControl,
    output reg ShamtCtrl
);

always @(*) begin
    case (ALUOp)
        4'b0000: begin // Addition
            ALUControl = 4'b0010;
            ShamtCtrl = 1'b0;
        end
        4'b0001: begin // Subtraction
            ALUControl = 4'b0110;
            ShamtCtrl = 1'b0;
        end
        4'b0010: begin // Function-based operations
            case (insFunction)
                6'b100000: begin // Add
                    ALUControl = 4'b0010;
                    ShamtCtrl = 1'b0;
                end
                6'b100010: begin // Subtract
                    ALUControl = 4'b0110;
                    ShamtCtrl = 1'b0;
                end
                6'b100100: begin // And
                    ALUControl = 4'b0000;
                    ShamtCtrl = 1'b0;
                end
                6'b100101: begin // Or
                    ALUControl = 4'b0001;
                    ShamtCtrl = 1'b0;
                end
                6'b100110: begin // Xor
                    ALUControl = 4'b0011;
                    ShamtCtrl = 1'b0;
                end
                6'b100111: begin // Nor
                    ALUControl = 4'b0100;
                    ShamtCtrl = 1'b0;
                end
                6'b101010: begin // Slt
                    ALUControl = 4'b0111;
                    ShamtCtrl = 1'b0;
                end
                6'b000000: begin // Sll
                    ALUControl = 4'b1000;
                    ShamtCtrl = 1'b1;
                end
                6'b000010: begin // Srl
                    ALUControl = 4'b1001;
                    ShamtCtrl = 1'b1;
                end
                6'b000011: begin // Sra
                    ALUControl = 4'b1010;
                    ShamtCtrl = 1'b1;
                end
                default: begin
                    ALUControl = 4'b0000;
                    ShamtCtrl = 1'b0;
                end
            endcase
        end
        4'b0011: begin // And
            ALUControl = 4'b0000;
            ShamtCtrl = 1'b0;
        end
        4'b0100: begin // Or
            ALUControl = 4'b0001;
            ShamtCtrl = 1'b0;
        end
        4'b0101: begin // Xor
            ALUControl = 4'b0011;
            ShamtCtrl = 1'b0;
        end
        4'b0110: begin // Nor
            ALUControl = 4'b0100;
            ShamtCtrl = 1'b0;
        end
        default: begin
            ALUControl = 4'b0000;
            ShamtCtrl = 1'b0;
        end
    endcase
end

endmodule