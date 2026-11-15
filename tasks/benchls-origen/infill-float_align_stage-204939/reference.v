module origen_204939(
    input [1:0] idle_Allign,
    input [35:0] cout_Allign,
    input [35:0] zout_Allign,
    input [31:0] sout_Allign,
    input [1:0] modeout_Allign,
    input operationout_Allign,
    input NatLogFlagout_Allign,
    input [7:0] difference_Allign,
    input [7:0] InsTag_Allign,
    input clock,
    output reg [1:0] idle_Allign2,
    output reg [35:0] cout_Allign2,
    output reg [35:0] zout_Allign2,
    output reg [31:0] sout_Allign2,
    output reg [1:0] modeout_Allign2,
    output reg operationout_Allign2,
    output reg NatLogFlagout_Allign2,
    output reg [7:0] InsTag_Allign2
);

always @(posedge clock) begin
    if (idle_Allign != 2'b01) begin
        if (cout_Allign[34:27] > zout_Allign[34:27]) begin
            // Align zout_Allign
            zout_Allign2 <= {zout_Allign[34:0] >> difference_Allign, zout_Allign[35]};
            cout_Allign2 <= cout_Allign;
        end else begin
            // Align cout_Allign
            cout_Allign2 <= {cout_Allign[34:0] >> difference_Allign, cout_Allign[35]};
            zout_Allign2 <= zout_Allign;
        end
        sout_Allign2 <= sout_Allign;
        modeout_Allign2 <= modeout_Allign;
        operationout_Allign2 <= operationout_Allign;
        NatLogFlagout_Allign2 <= NatLogFlagout_Allign;
        InsTag_Allign2 <= InsTag_Allign;
        idle_Allign2 <= idle_Allign;
    end else begin
        // Pass through in idle state
        cout_Allign2 <= cout_Allign;
        zout_Allign2 <= zout_Allign;
        sout_Allign2 <= sout_Allign;
        modeout_Allign2 <= modeout_Allign;
        operationout_Allign2 <= operationout_Allign;
        NatLogFlagout_Allign2 <= NatLogFlagout_Allign;
        InsTag_Allign2 <= InsTag_Allign;
        idle_Allign2 <= idle_Allign;
    end
end

endmodule