module origen_080832 (
    input [2:0] OP,
    input [15:0] INPUTA, INPUTB, IMM, SP, LoadValue,
    input [1:0] ALUsrc,
    input BRANCH,
    output reg [15:0] OUT,
    output reg BRANCHING,
    output reg [15:0] SPAddress
);

    reg [15:0] temp;
    reg [15:0] lut [0:15];

    initial begin
        // Initialize lookup table (example values)
        lut[0] = 16'h0000; lut[1] = 16'h1111; lut[2] = 16'h2222; lut[3] = 16'h3333;
        lut[4] = 16'h4444; lut[5] = 16'h5555; lut[6] = 16'h6666; lut[7] = 16'h7777;
        lut[8] = 16'h8888; lut[9] = 16'h9999; lut[10] = 16'hAAAA; lut[11] = 16'hBBBB;
        lut[12] = 16'hCCCC; lut[13] = 16'hDDDD; lut[14] = 16'hEEEE; lut[15] = 16'hFFFF;
    end

    always @(*) begin
        // Input selection
        case (ALUsrc)
            2'b00: temp = INPUTB;
            2'b01: temp = IMM;
            2'b10: temp = {15'b0, IMM[2]};
            default: temp = INPUTB;
        endcase

        // ALU operations
        case (OP)
            3'b000: OUT = INPUTA + temp;
            3'b001: OUT = INPUTA - temp;
            3'b010: OUT = {15'b0, INPUTA[0]};
            3'b011: OUT = lut[temp[3:0]];
            3'b100: OUT = temp[15] ? (INPUTA >>> temp[3:0]) : (INPUTA << temp[3:0]);
            3'b101: OUT = LoadValue + temp;
            3'b110: begin
                OUT = SP + 16'd1;
                SPAddress = OUT;
            end
            3'b111: OUT = INPUTA;
            default: OUT = 16'b0;
        endcase

        // Branching logic
        BRANCHING = (OUT == 16'b0 && BRANCH) ? 1'b1 : 1'b0;

        // Stack pointer handling
        if (OP == 3'b110)
            SPAddress = OUT;
        else
            SPAddress = SP;
    end

endmodule