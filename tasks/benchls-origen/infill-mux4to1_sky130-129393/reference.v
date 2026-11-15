module origen_129393 (
    input A0, A1, A2, A3,
    input S0, S1,
    input VPWR, VGND, VPB, VNB,
    output reg X
);

    always @(*) begin
        if (VPWR && !VGND && VPB && !VNB) begin
            case ({S1, S0})
                2'b00: X = A0;
                2'b01: X = A1;
                2'b10: X = A2;
                2'b11: X = A3;
                default: X = 1'bx;
            endcase
        end else begin
            X = 1'bx;
        end
    end

endmodule

