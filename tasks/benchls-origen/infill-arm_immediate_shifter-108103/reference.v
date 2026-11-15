module origen_108103(
    input [11:0] shiftOperand,
    output [31:0] immediate
);
    wire [7:0] imm8;
    wire [3:0] rotate;
    
    assign imm8 = shiftOperand[7:0];
    assign rotate = shiftOperand[11:8];
    
    assign immediate = {24'b0, imm8} >> (rotate * 2);
endmodule

module registerShifter(
    input [1:0] shift,
    input [4:0] shiftImmediate,
    input [31:0] registerValue,
    output reg [31:0] shiftOutput
);
    always @(*) begin
        case(shift)
            2'b00: shiftOutput = registerValue << shiftImmediate;
            2'b01: shiftOutput = registerValue >> shiftImmediate;
            2'b10: shiftOutput = $signed(registerValue) >>> shiftImmediate;
            2'b11: shiftOutput = (registerValue >> shiftImmediate) | (registerValue << (32 - shiftImmediate));
        endcase
    end
endmodule

module secondValueGenerator(
    input loadOrStore,
    input I,
    input [11:0] shiftOperand,
    input [31:0] RmValue,
    output [31:0] secondValue
);
    wire [31:0] immediateValue;
    wire [31:0] shiftedValue;
    
    immediateGenerator ig(
        .shiftOperand(shiftOperand),
        .immediate(immediateValue)
    );
    
    registerShifter rs(
        .shift(shiftOperand[6:5]),
        .shiftImmediate(shiftOperand[11:7]),
        .registerValue(RmValue),
        .shiftOutput(shiftedValue)
    );
    
    assign secondValue = loadOrStore ? {20'b0, shiftOperand} :
                         I ? immediateValue :
                         shiftedValue;
endmodule