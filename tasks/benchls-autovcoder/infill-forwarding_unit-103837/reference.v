module autovcoder_103837 (
    input  [4:0] io_EX_MEM_REGRD,
    input  [4:0] io_MEM_WB_REGRD,
    input  [4:0] io_ID_EX_REGRS1,
    input  [4:0] io_ID_EX_REGRS2,
    input  [6:0] io_ID_EX_inst_op,
    input        io_EX_MEM_REGWR,
    input        io_MEM_WB_REGWR,
    output [1:0] io_forward_a,
    output [1:0] io_forward_b
);
  wire _T_1 = io_EX_MEM_REGRD != 5'h0;  // @[ForwardUnit.scala 23:56]
  wire _T_2 = io_EX_MEM_REGWR & _T_1;  // @[ForwardUnit.scala 23:37]
  wire _T_3 = io_EX_MEM_REGRD == io_ID_EX_REGRS1;  // @[ForwardUnit.scala 23:91]
  wire _T_4 = _T_2 & _T_3;  // @[ForwardUnit.scala 23:71]
  wire _T_5 = io_EX_MEM_REGRD == io_ID_EX_REGRS2;  // @[ForwardUnit.scala 23:132]
  wire _T_6 = _T_4 & _T_5;  // @[ForwardUnit.scala 23:112]
  wire _T_7 = io_ID_EX_inst_op != 7'h37;  // @[ForwardUnit.scala 23:173]
  wire _T_8 = _T_6 & _T_7;  // @[ForwardUnit.scala 23:153]
  wire _T_13 = _T_2 & _T_5;  // @[ForwardUnit.scala 31:78]
  wire _T_15 = _T_13 & _T_7;  // @[ForwardUnit.scala 31:119]
  wire _T_22 = _T_4 & _T_7;  // @[ForwardUnit.scala 34:119]
  wire _GEN_2 = _T_15 ? 1'h0 : _T_22;  // @[ForwardUnit.scala 31:157]
  wire _GEN_3 = _T_8 | _GEN_2;  // @[ForwardUnit.scala 23:191]
  wire _GEN_4 = _T_8 | _T_15;  // @[ForwardUnit.scala 23:191]
  wire _T_24 = io_MEM_WB_REGRD != 5'h0;  // @[ForwardUnit.scala 42:56]
  wire _T_25 = io_MEM_WB_REGWR & _T_24;  // @[ForwardUnit.scala 42:37]
  wire _T_33 = ~_T_6;  // @[ForwardUnit.scala 42:74]
  wire _T_34 = _T_25 & _T_33;  // @[ForwardUnit.scala 42:71]
  wire _T_35 = io_MEM_WB_REGRD == io_ID_EX_REGRS1;  // @[ForwardUnit.scala 42:244]
  wire _T_36 = _T_34 & _T_35;  // @[ForwardUnit.scala 42:224]
  wire _T_37 = io_MEM_WB_REGRD == io_ID_EX_REGRS2;  // @[ForwardUnit.scala 42:285]
  wire _T_38 = _T_36 & _T_37;  // @[ForwardUnit.scala 42:265]
  wire _T_40 = _T_38 & _T_7;  // @[ForwardUnit.scala 42:306]
  wire _T_49 = ~_T_13;  // @[ForwardUnit.scala 45:81]
  wire _T_50 = _T_25 & _T_49;  // @[ForwardUnit.scala 45:78]
  wire _T_52 = _T_50 & _T_37;  // @[ForwardUnit.scala 45:190]
  wire _T_54 = _T_52 & _T_7;  // @[ForwardUnit.scala 45:231]
  wire _T_63 = ~_T_4;  // @[ForwardUnit.scala 48:81]
  wire _T_64 = _T_25 & _T_63;  // @[ForwardUnit.scala 48:78]
  wire _T_66 = _T_64 & _T_35;  // @[ForwardUnit.scala 48:191]
  wire _T_68 = _T_66 & _T_7;  // @[ForwardUnit.scala 48:232]
  wire [1:0] _GEN_5 = _T_68 ? 2'h2 : {{1'd0}, _GEN_3};  // @[ForwardUnit.scala 48:270]
  wire [1:0] _GEN_6 = _T_54 ? 2'h2 : {{1'd0}, _GEN_4};  // @[ForwardUnit.scala 45:269]
  wire [1:0] _GEN_7 = _T_54 ? {{1'd0}, _GEN_3} : _GEN_5;  // @[ForwardUnit.scala 45:269]
  assign io_forward_a = _T_40 ? 2'h2 : _GEN_7; // @[ForwardUnit.scala 17:18 ForwardUnit.scala 29:22 ForwardUnit.scala 35:22 ForwardUnit.scala 43:22 ForwardUnit.scala 49:22]
  assign io_forward_b = _T_40 ? 2'h2 : _GEN_6; // @[ForwardUnit.scala 18:18 ForwardUnit.scala 30:22 ForwardUnit.scala 32:22 ForwardUnit.scala 44:22 ForwardUnit.scala 46:22]
endmodule

