module autovcoder_002791 (
    userIDfoundFlag,
    loadButton_s,
    PASSWORD,
    passInput,
    clk,
    rst,
    accessFlag,
    blinkFlag,
    outOfAttemptsFlag,
    state
);
  input loadButton_s, rst, clk, userIDfoundFlag;
  input [3:0] passInput;
  input [15:0] PASSWORD;
  output reg accessFlag, blinkFlag, outOfAttemptsFlag;
  output reg [2:0] state;
  reg isFlagRed;
  reg [1:0] attemptCnt;

  parameter BIT0 = 3'b000,  // 7 States
  BIT1	= 3'b001,
		 	BIT2	= 3'b010,
			BIT3	= 3'b011,
			BIT4	= 3'b100,
			BIT5	= 3'b101,
		   VERIFICATION = 3'b110,
			END	= 3'b111;

  parameter PRESSED = 1'b0, YES = 1'b1, NO = 1'b0;


  [MASKED]
endmodule

