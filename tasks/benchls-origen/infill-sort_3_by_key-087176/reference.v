module origen_087176 #(parameter Width = 36) (
    input [Width-1:0] InA, InB, InC,
    output reg [Width-1:0] OutA, OutB, OutC,
    output reg swap
);

    wire AltB, BltC, AltC;

    assign AltB = (InA[35:26] < InB[35:26]);
    assign BltC = (InB[35:26] < InC[35:26]);
    assign AltC = (InA[35:26] < InC[35:26]);

    always @(*) begin
        if (AltB && AltC) begin
            // A < B < C
            OutA = InA;
            OutB = InB;
            OutC = InC;
        end
        else if (!AltB && AltC) begin
            // B < A < C
            OutA = InB;
            OutB = InA;
            OutC = InC;
        end
        else if (AltB && !BltC) begin
            // A < C < B
            OutA = InA;
            OutB = InC;
            OutC = InB;
        end
        else if (!AltB && !AltC && BltC) begin
            // C < A < B
            OutA = InC;
            OutB = InA;
            OutC = InB;
        end
        else if (!AltC && !BltC) begin
            // C < B < A
            OutA = InC;
            OutB = InB;
            OutC = InA;
        end
        else begin
            // B < C < A
            OutA = InB;
            OutB = InC;
            OutC = InA;
        end

        swap = (OutA[35:26] == OutB[35:26]);
    end

endmodule