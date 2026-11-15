module origen_051383 (
    input [11:0] signMag,
    output reg [2:0] exp,
    output reg [3:0] sig,
    output reg [0:0] roundBit
);

    always @(*) begin
        if (signMag[10]) begin
            exp = 3'd7;
            sig = signMag[10:7];
            roundBit = signMag[6];
        end
        else if (signMag[9]) begin
            exp = 3'd6;
            sig = signMag[9:6];
            roundBit = signMag[5];
        end
        else if (signMag[8]) begin
            exp = 3'd5;
            sig = signMag[8:5];
            roundBit = signMag[4];
        end
        else if (signMag[7]) begin
            exp = 3'd4;
            sig = signMag[7:4];
            roundBit = signMag[3];
        end
        else if (signMag[6]) begin
            exp = 3'd3;
            sig = signMag[6:3];
            roundBit = signMag[2];
        end
        else if (signMag[5]) begin
            exp = 3'd2;
            sig = signMag[5:2];
            roundBit = signMag[1];
        end
        else if (signMag[4]) begin
            exp = 3'd1;
            sig = signMag[4:1];
            roundBit = signMag[0];
        end
        else begin
            exp = 3'd0;
            sig = signMag[3:0];
            roundBit = 1'b0;
        end
    end

endmodule