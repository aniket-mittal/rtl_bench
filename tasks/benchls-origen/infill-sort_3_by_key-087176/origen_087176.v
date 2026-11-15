module origen_087176 #(parameter Width = 36) (
    input [Width-1:0] InA, InB, InC,
    output reg [Width-1:0] OutA, OutB, OutC,
    output reg swap
);

    wire AltB, BltC, AltC;

    assign AltB = (InA[35:26] < InB[35:26]);
    assign BltC = (InB[35:26] < InC[35:26]);
    assign AltC = (InA[35:26] < InC[35:26]);

    [MASKED]

endmodule