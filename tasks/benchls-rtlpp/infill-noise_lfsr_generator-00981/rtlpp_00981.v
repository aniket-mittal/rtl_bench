module rtlpp_00981(
    input           clk,
    input           i_nrst,
    input           i_ctrl44Khz,
    input   [3:0]   i_noiseShift,
    input   [3:0]   i_noiseStep,
    
    output  [15:0]  o_noiseOut
);

reg [18:0] noiseTimer;
reg [15:0] noiseLevel;

wire parityBit = noiseLevel[15] ^ noiseLevel[12] ^ noiseLevel[11] ^ noiseLevel[10] ^ 1'b1;
wire [18:0] M4to7 = { {15{i_noiseStep[3]}} , i_noiseStep };   
wire [18:0] inputTimer = noiseTimer + M4to7;

reg [15:0] shiftedNoiseAdd;
[MASKED]

wire [18:0] offset = { 1'b0, shiftedNoiseAdd, 2'b0 };
wire [18:0] secondT = inputTimer + offset;
wire [18:0] thirdT = inputTimer + {shiftedNoiseAdd, 3'b0};
wire [18:0] finalT = secondT[18] ? thirdT : secondT;
wire [18:0] writeT = inputTimer[18] ? finalT : inputTimer;

wire [15:0] Noise_Value = {noiseLevel[14:0], parityBit};

always @(posedge clk) begin
    if (i_nrst == 1'b0) begin
        noiseTimer <= 19'd0;
        noiseLevel <= 16'd0;
    end else if (i_ctrl44Khz) begin
        noiseTimer <= writeT;
        noiseLevel <= Noise_Value;
    end
end

assign o_noiseOut = Noise_Value;

endmodule