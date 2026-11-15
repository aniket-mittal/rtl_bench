module origen_048822 (
    input [31:0] InputA, InputB,
    input [3:0] ULAOPCode,
    input [3:0] SRSignals,
    output reg [31:0] Outp,
    output [2:0] SRFlags
);

    reg OVFlowSignal, ZeroSignal, NegSignal;
    reg [63:0] mult_result;
    reg [31:0] div_result;

    always @(*) begin
        OVFlowSignal = 1'b0;
        ZeroSignal = 1'b0;
        NegSignal = 1'b0;

        case (ULAOPCode)
            4'b0000: begin // Signed addition
                Outp = InputA + InputB;
                OVFlowSignal = (InputA[31] == InputB[31]) && (Outp[31] != InputA[31]);
            end
            4'b0001: Outp = InputA & InputB; // Bitwise AND
            4'b0010: Outp = InputA << InputB[4:0]; // Arithmetic left shift
            4'b0011: Outp = InputA - InputB; // Signed subtraction
            4'b0100: Outp = InputA ^ InputB; // Bitwise XOR
            4'b0101: Outp = InputA >> InputB[4:0]; // Logical right shift
            4'b0110: Outp = InputA | InputB; // Bitwise OR
            4'b0111: Outp = 32'b0; // Zero
            4'b1000: begin // Signed multiplication
                mult_result = $signed(InputA) * $signed(InputB);
                Outp = mult_result[31:0];
            end
            4'b1001: begin // Signed division
                if (InputB != 0) begin
                    div_result = $signed(InputA) / $signed(InputB);
                    Outp = div_result;
                end else begin
                    Outp = 32'hFFFFFFFF; // Division by zero
                end
            end
            default: Outp = 32'b0;
        endcase

        ZeroSignal = (Outp == 32'b0);
        NegSignal = Outp[31];

        // Status Register Control
        if (SRSignals[0]) OVFlowSignal = 1'b0;
        if (SRSignals[1]) NegSignal = 1'b0;
        if (SRSignals[2]) ZeroSignal = 1'b0;
    end

    assign SRFlags = {OVFlowSignal, ZeroSignal, NegSignal};

endmodule