module origen_203513(
    input  wire [3:0] MaskOp,
    output reg [1:0] MaskControlE,
    output reg [1:0] LBLHEnableM
);

always @(*) begin
    case (MaskOp)
        4'b0000: begin
            MaskControlE = 2'b00;
            LBLHEnableM = 2'b01;
        end
        4'b0001: begin
            MaskControlE = 2'b01;
            LBLHEnableM = 2'b10;
        end
        4'b0010: begin
            MaskControlE = 2'b10;
            LBLHEnableM = 2'b00;
        end
        4'b0011: begin
            MaskControlE = 2'b11;
            LBLHEnableM = 2'b00;
        end
        4'b0100: begin
            MaskControlE = 2'b00;
            LBLHEnableM = 2'b01;
        end
        4'b0101: begin
            MaskControlE = 2'b01;
            LBLHEnableM = 2'b10;
        end
        4'b0110: begin
            MaskControlE = 2'b10;
            LBLHEnableM = 2'b00;
        end
        4'b0111: begin
            MaskControlE = 2'b11;
            LBLHEnableM = 2'b00;
        end
        4'b1000: begin
            MaskControlE = 2'b00;
            LBLHEnableM = 2'b01;
        end
        default: begin
            MaskControlE = 2'b00;
            LBLHEnableM = 2'b00;
        end
    endcase
end

endmodule