module autovcoder_112167 (
    input  [ 8:0] io_uopc,
    output [ 1:0] io_cmd,
    output [29:0] io_covSum,
    output        metaAssert
);
  wire [8:0] _T;  // @[Decode.scala 14:65]
  wire _T_1;  // @[Decode.scala 14:121]
  wire [8:0] _T_2;  // @[Decode.scala 14:65]
  wire _T_3;  // @[Decode.scala 14:121]
  wire [8:0] _T_4;  // @[Decode.scala 14:65]
  wire _T_5;  // @[Decode.scala 14:121]
  wire [8:0] _T_6;  // @[Decode.scala 14:65]
  wire _T_7;  // @[Decode.scala 14:121]
  wire _T_9;  // @[Decode.scala 15:30]
  wire _T_10;  // @[Decode.scala 15:30]
  wire _T_11;  // @[Decode.scala 15:30]
  wire [8:0] _T_12;  // @[Decode.scala 14:65]
  wire _T_13;  // @[Decode.scala 14:121]
  wire _T_15;  // @[Decode.scala 14:121]
  wire [8:0] _T_16;  // @[Decode.scala 14:65]
  wire _T_17;  // @[Decode.scala 14:121]
  wire _T_19;  // @[Decode.scala 15:30]
  wire _T_20;  // @[Decode.scala 15:30]
  wire [29:0] FMADecoder_covSum;
  assign _T = io_uopc & 9'h27;  // @[Decode.scala 14:65]
  assign _T_1 = _T == 9'h0;  // @[Decode.scala 14:121]
  assign _T_2 = io_uopc & 9'h12;  // @[Decode.scala 14:65]
  assign _T_3 = _T_2 == 9'h2;  // @[Decode.scala 14:121]
  assign _T_4 = io_uopc & 9'hb;  // @[Decode.scala 14:65]
  assign _T_5 = _T_4 == 9'hb;  // @[Decode.scala 14:121]
  assign _T_6 = io_uopc & 9'he;  // @[Decode.scala 14:65]
  assign _T_7 = _T_6 == 9'he;  // @[Decode.scala 14:121]
  assign _T_9 = _T_1 | _T_3;  // @[Decode.scala 15:30]
  assign _T_10 = _T_9 | _T_5;  // @[Decode.scala 15:30]
  assign _T_11 = _T_10 | _T_7;  // @[Decode.scala 15:30]
  assign _T_12 = io_uopc & 9'h13;  // @[Decode.scala 14:65]
  assign _T_13 = _T_12 == 9'h0;  // @[Decode.scala 14:121]
  assign _T_15 = _T_12 == 9'h3;  // @[Decode.scala 14:121]
  assign _T_16 = io_uopc & 9'hf;  // @[Decode.scala 14:65]
  assign _T_17 = _T_16 == 9'hf;  // @[Decode.scala 14:121]
  assign _T_19 = _T_13 | _T_15;  // @[Decode.scala 15:30]
  assign _T_20 = _T_19 | _T_17;  // @[Decode.scala 15:30]
  assign io_cmd = {_T_20, _T_11};  // @[fpu.scala 152:10]
  assign FMADecoder_covSum = 30'h0;
  assign io_covSum = FMADecoder_covSum;
  assign metaAssert = 1'h0;
endmodule

