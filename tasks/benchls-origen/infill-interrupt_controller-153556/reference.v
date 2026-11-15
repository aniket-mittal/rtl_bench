module origen_153556 (
    input [8:0] selector,
    output [15:0] CPC,
    output [15:0] TVEC0,
    output [15:0] TVEC1,
    output [15:0] TVEC2,
    output [15:0] TVEC3,
    output [15:0] EPC,
    output GIE,
    output PGIE,
    output IE0,
    output IE1,
    output IE2,
    output IE3,
    output [15:0] tvec,
    output int0_acc,
    output int1_acc,
    output int2_acc
);

    // Declare the registers
    reg [15:0] CPC_reg = 0;
    reg [15:0] TVEC0_reg = 0;
    reg [15:0] TVEC1_reg = 0;
    reg [15:0] TVEC2_reg = 0;
    reg [15:0] TVEC3_reg = 0;
    reg [15:0] EPC_reg = 0;
    reg GIE_reg = 0;
    reg PGIE_reg = 0;
    reg IE0_reg = 0;
    reg IE1_reg = 0;
    reg IE2_reg = 0;
    reg IE3_reg = 0;
    reg [15:0] tvec_reg = 0;
    reg int0_acc_reg = 0;
    reg int1_acc_reg = 0;
    reg int2_acc_reg = 0;

    // TEST_COMB_LOGIC
    always @(*) begin
        if (int0_acc_reg) begin
            tvec_reg = TVEC0_reg;
        end else if (int1_acc_reg) begin
            tvec_reg = TVEC1_reg;
        end else if (int2_acc_reg) begin
            tvec_reg = TVEC2_reg;
        end else begin
            tvec_reg = TVEC3_reg;
        end
    end

    // Output assignment based on the selector
    always @(*) begin
        case (selector)
            9'b000000000: CPC_reg = CPC_reg;
            9'b000000001: CPC_reg = TVEC0_reg;
            9'b000000010: CPC_reg = TVEC1_reg;
            9'b000000011: CPC_reg = TVEC2_reg;
            9'b000000100: CPC_reg = TVEC3_reg;
            9'b000000101: CPC_reg = EPC_reg;
            9'b000000110: CPC_reg = {15'b0, GIE_reg};
            9'b000000111: CPC_reg = {15'b0, PGIE_reg};
            9'b000001000: CPC_reg = {15'b0, IE0_reg};
            9'b000001001: CPC_reg = {15'b0, IE1_reg};
            9'b000001010: CPC_reg = {15'b0, IE2_reg};
            9'b000001011: CPC_reg = {15'b0, IE3_reg};
            9'b000001100: CPC_reg = tvec_reg;
            9'b000001101: CPC_reg = {15'b0, int0_acc_reg};
            9'b000001110: CPC_reg = {15'b0, int1_acc_reg};
            9'b000001111: CPC_reg = {15'b0, int2_acc_reg};
            default: CPC_reg = 16'h0000;
        endcase
    end

    // Assign the output signals
    assign CPC = CPC_reg;
    assign TVEC0 = TVEC0_reg;
    assign TVEC1 = TVEC1_reg;
    assign TVEC2 = TVEC2_reg;
    assign TVEC3 = TVEC3_reg;
    assign EPC = EPC_reg;
    assign GIE = GIE_reg;
    assign PGIE = PGIE_reg;
    assign IE0 = IE0_reg;
    assign IE1 = IE1_reg;
    assign IE2 = IE2_reg;
    assign IE3 = IE3_reg;
    assign tvec = tvec_reg;
    assign int0_acc = int0_acc_reg;
    assign int1_acc = int1_acc_reg;
    assign int2_acc = int2_acc_reg;

endmodule