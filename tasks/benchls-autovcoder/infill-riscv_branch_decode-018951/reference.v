module autovcoder_018951 (
    input  [31:0] io_inst,
    input  [39:0] io_pc,
    output        io_out_is_ret,
    output        io_out_is_call,
    output [39:0] io_out_target,
    output [ 2:0] io_out_cfi_type,
    output        io_out_sfb_offset_valid,
    output [ 5:0] io_out_sfb_offset_bits
);
  wire [31:0] _bpd_csignals_bit_T = io_inst & 32'h707f;  // @[Decode.scala 14:65]
  wire _bpd_csignals_bit_T_1 = _bpd_csignals_bit_T == 32'h63;  // @[Decode.scala 14:121]
  wire _bpd_csignals_bit_T_3 = _bpd_csignals_bit_T == 32'h1063;  // @[Decode.scala 14:121]
  wire _bpd_csignals_bit_T_5 = _bpd_csignals_bit_T == 32'h5063;  // @[Decode.scala 14:121]
  wire _bpd_csignals_bit_T_7 = _bpd_csignals_bit_T == 32'h7063;  // @[Decode.scala 14:121]
  wire _bpd_csignals_bit_T_9 = _bpd_csignals_bit_T == 32'h4063;  // @[Decode.scala 14:121]
  wire _bpd_csignals_bit_T_11 = _bpd_csignals_bit_T == 32'h6063;  // @[Decode.scala 14:121]
  wire  bpd_csignals_0 = _bpd_csignals_bit_T_1 | _bpd_csignals_bit_T_3 | _bpd_csignals_bit_T_5 | _bpd_csignals_bit_T_7
     | _bpd_csignals_bit_T_9 | _bpd_csignals_bit_T_11; // @[Decode.scala 15:30]
  wire [31:0] _bpd_csignals_bit_T_17 = io_inst & 32'h7f;  // @[Decode.scala 14:65]
  wire bpd_csignals_1 = _bpd_csignals_bit_T_17 == 32'h6f;  // @[Decode.scala 14:121]
  wire bpd_csignals_2 = _bpd_csignals_bit_T == 32'h67;  // @[Decode.scala 14:121]
  wire [4:0] _io_out_is_ret_T_1 = io_inst[19:15] & 5'h1b;  // @[decode.scala 697:51]
  wire [19:0] _io_out_target_b_imm32_T_2 = io_inst[31] ? 20'hfffff : 20'h0; // @[Bitwise.scala 74:12]
  wire [31:0] _io_out_target_T_1 = {
    _io_out_target_b_imm32_T_2, io_inst[7], io_inst[30:25], io_inst[11:8], 1'h0
  };  // @[consts.scala 338:27]
  wire [39:0] _GEN_0 = {{8{_io_out_target_T_1[31]}}, _io_out_target_T_1};  // @[consts.scala 338:17]
  wire [39:0] _io_out_target_T_4 = $signed(io_pc) + $signed(_GEN_0);  // @[consts.scala 338:17]
  wire [39:0] _io_out_target_T_7 = $signed(_io_out_target_T_4) & -40'sh2;  // @[consts.scala 338:52]
  wire [11:0] _io_out_target_j_imm32_T_2 = io_inst[31] ? 12'hfff : 12'h0;  // @[Bitwise.scala 74:12]
  wire [31:0] _io_out_target_T_9 = {
    _io_out_target_j_imm32_T_2, io_inst[19:12], io_inst[20], io_inst[30:25], io_inst[24:21], 1'h0
  };  // @[consts.scala 344:27]
  wire [39:0] _GEN_1 = {{8{_io_out_target_T_9[31]}}, _io_out_target_T_9};  // @[consts.scala 344:17]
  wire [39:0] _io_out_target_T_12 = $signed(io_pc) + $signed(_GEN_1);  // @[consts.scala 344:17]
  wire [39:0] _io_out_target_T_15 = $signed(
      _io_out_target_T_12
  ) & -40'sh2;  // @[consts.scala 344:52]
  wire [2:0] _io_out_cfi_type_T = bpd_csignals_0 ? 3'h1 : 3'h0;  // @[decode.scala 706:8]
  wire [2:0] _io_out_cfi_type_T_1 = bpd_csignals_1 ? 3'h2 : _io_out_cfi_type_T; // @[decode.scala 704:8]
  wire [11:0] br_offset = {io_inst[7], io_inst[30:25], io_inst[11:8], 1'h0};  // @[Cat.scala 31:58]
  assign io_out_is_ret = bpd_csignals_2 & 5'h1 == _io_out_is_ret_T_1 & io_inst[11:7] == 5'h0; // @[decode.scala 697:72]
  assign io_out_is_call = (bpd_csignals_1 | bpd_csignals_2) & io_inst[11:7] == 5'h1; // @[decode.scala 696:47]
  assign io_out_target = bpd_csignals_0 ? _io_out_target_T_7 : _io_out_target_T_15; // @[decode.scala 699:23]
  assign io_out_cfi_type = bpd_csignals_2 ? 3'h3 : _io_out_cfi_type_T_1;  // @[decode.scala 702:8]
  assign io_out_sfb_offset_valid = bpd_csignals_0 & ~io_inst[31] & br_offset != 12'h0 & br_offset[11:6] == 6'h0; // @[decode.scala 712:76]
  assign io_out_sfb_offset_bits = br_offset[5:0];  // @[decode.scala 713:27]
endmodule

