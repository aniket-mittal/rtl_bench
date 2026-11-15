module autovcoder_092587 (
    input RST,
    input [1:0] A,
    input CSb,
    input RDb,
    input WRb,
    input [7:0] DIN,

    input  [7:0] PB,
    output [7:0] PA,
    output [7:0] PC,

    output reg [7:0] DOUT
);

  reg [7:0] REGA;
  reg [7:0] REGB;
  reg [7:0] REGC;

  reg [7:0] regCTRL;  // Mode Definition Register

  assign PA = REGA;
  assign PC = REGC;

  always @(*) begin
    case (A)
      2'b00: DOUT = REGA;
      2'b01: DOUT = PB;
      2'b10: DOUT = REGC;
      2'b11: DOUT = regCTRL;
    endcase
  end

  // Writing 
  [MASKED]





endmodule

