module autovcoder_021115 (
    input wire iClock,
    input wire iEnable,

    input  wire [30:0] iIn0,
    input  wire [30:0] iIn1,
    input  wire [30:0] iIn2,
    input  wire [30:0] iIn3,
    input  wire [30:0] iIn4,
    input  wire [30:0] iIn5,
    input  wire [30:0] iIn6,
    input  wire [30:0] iIn7,
    input  wire [30:0] iIn8,
    input  wire [30:0] iIn9,
    input  wire [30:0] iIn10,
    input  wire [30:0] iIn11,
    input  wire [30:0] iIn12,
    input  wire [30:0] iIn13,
    input  wire [30:0] iIn14,
    output wire [ 3:0] oMinimum
);

  reg [ 3:0] index0_0;
  reg [ 3:0] index0_1;
  reg [ 3:0] index0_2;
  reg [ 3:0] index0_3;
  reg [ 3:0] index0_4;
  reg [ 3:0] index0_5;
  reg [ 3:0] index0_6;
  reg [ 3:0] rindex0_7;
  reg [ 3:0] index1_0;
  reg [ 3:0] index1_1;
  reg [ 3:0] index1_2;
  reg [ 3:0] index1_3;
  reg [ 3:0] index2_0;
  reg [ 3:0] index2_1;
  reg [ 3:0] index3_0;
  reg [30:0] value0_0;
  reg [30:0] value0_1;
  reg [30:0] value0_2;
  reg [30:0] value0_3;
  reg [30:0] value0_4;
  reg [30:0] value0_5;
  reg [30:0] value0_6;
  reg [30:0] rvalue0_7;
  reg [30:0] value1_0;
  reg [30:0] value1_1;
  reg [30:0] value1_2;
  reg [30:0] value1_3;
  reg [30:0] value2_0;
  reg [30:0] value2_1;
  reg [30:0] value3_0;

  assign oMinimum = index3_0;

  [MASKED]

endmodule

