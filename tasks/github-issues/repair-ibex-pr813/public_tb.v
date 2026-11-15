// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 108;
  localparam OW = 144;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ibex_load_store_unit dut (
    .clk_i(clk),
    .rst_ni(in_vec[107:107]),
    .data_gnt_i(in_vec[106:106]),
    .data_rvalid_i(in_vec[105:105]),
    .data_err_i(in_vec[104:104]),
    .data_pmp_err_i(in_vec[103:103]),
    .data_rdata_i(in_vec[102:71]),
    .lsu_we_i(in_vec[70:70]),
    .lsu_type_i(in_vec[69:68]),
    .lsu_wdata_i(in_vec[67:36]),
    .lsu_sign_ext_i(in_vec[35:35]),
    .lsu_req_i(in_vec[34:34]),
    .adder_result_ex_i(in_vec[33:2]),
    .illegal_insn_id_i(in_vec[1:1]),
    .instr_valid_id_i(in_vec[0:0]),
    .data_req_o(out_vec[143:143]),
    .data_addr_o(out_vec[142:111]),
    .data_we_o(out_vec[110:110]),
    .data_be_o(out_vec[109:106]),
    .data_wdata_o(out_vec[105:74]),
    .lsu_rdata_o(out_vec[73:42]),
    .lsu_rdata_valid_o(out_vec[41:41]),
    .addr_incr_req_o(out_vec[40:40]),
    .addr_last_o(out_vec[39:8]),
    .lsu_req_done_o(out_vec[7:7]),
    .lsu_resp_valid_o(out_vec[6:6]),
    .load_err_o(out_vec[5:5]),
    .store_err_o(out_vec[4:4]),
    .load_o(out_vec[3:3]),
    .busy_o(out_vec[2:2]),
    .perf_load_o(out_vec[1:1]),
    .perf_store_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 108'h0c9e1e99c7a7e2fbccf2e36e763;
    stim[1] = 108'h004956b4f5506d448260d95ebfb;
    stim[2] = 108'hecd71da8200d2064c5bc1ce98ea;
    stim[3] = 108'hea64a51b35efb9b48c759e69032;
    stim[4] = 108'he4600ee9ebeaea3c17250fc6c0f;
    stim[5] = 108'hbb817806ec6c7603cab9ecf0a89;
    stim[6] = 108'hd5a22193740951d70461d262611;
    stim[7] = 108'hb0a34f6a746d37a5376ae88e16d;
    stim[8] = 108'h820153ea4347929ab609ebd20bc;
    stim[9] = 108'hf1a1ea6b001f907287db15ef35c;
    stim[10] = 108'hc9993f84d8616a89027a99d3a6d;
    stim[11] = 108'h8837dd57849e464a1fb279528b8;
    stim[12] = 108'hc72cf9f67b5b367e5e57cfb07fa;
    stim[13] = 108'hfbe44d88aa58165b92752fe3685;
    stim[14] = 108'hfc0887835e17d61bfe8f4ae50f3;
    stim[15] = 108'h88b61167d0ab2d0965ef2f4ce74;
    stim[16] = 108'h86bf94131276e17570423d61cb3;
    stim[17] = 108'h8ad750b96ee5654d7e35241afd0;
    stim[18] = 108'hd7a1d565faf557d09bde2d6ad93;
    stim[19] = 108'hd2c6da64b983ff7bc71490e4620;
    stim[20] = 108'he96cbcac086705667d7700ac9d7;
    stim[21] = 108'h87b62a531d36ba83abdf74abf60;
    stim[22] = 108'hf1327d172a713cd1d5c8737df8f;
    stim[23] = 108'h91f367132f9a924b6d23a69cbb1;
    stim[24] = 108'hc9c088b837a90ad3d72be522fa5;
    stim[25] = 108'he1bc8dbd775b1cbb41ff5c2a22c;
    stim[26] = 108'hf15b2e4aa8f56adb3900e70ca43;
    stim[27] = 108'h979a010c23b101675f3a60e6ad4;
    stim[28] = 108'h856ec5985e0f40adf128af68257;
    stim[29] = 108'hd63fa1ae341ddfa21ed4b617b16;
    stim[30] = 108'hfa8e7f2ccc867f52838a8d36d03;
    stim[31] = 108'hd322fe17c8e73359ed31e445ce3;
    stim[32] = 108'hc644b164d64214328e60ef0e216;
    stim[33] = 108'h9b52489547f540519e3da49eed1;
    stim[34] = 108'hebb38a394dcf2a18b06b68aeb95;
    stim[35] = 108'he77c7be97c6585912c74a5e0767;
    stim[36] = 108'hd824c2b6d2bef9eb358be0db231;
    stim[37] = 108'he949c9bbcc5caadec1428186118;
    stim[38] = 108'h8a78bd01b92dbe77daff1678f4c;
    stim[39] = 108'he9a8ffd87ffa64c3e79ec051661;
    stim[40] = 108'hd4d063d8cd322e1a0a5e6cf1756;
    stim[41] = 108'h85125d97bb7c2cf44d5a76d097f;
    stim[42] = 108'h86a09a58ee68430ca14bc62d983;
    stim[43] = 108'h9f6f67d7e93ffc6e6b18dfe80ba;
    stim[44] = 108'ha6f90a67e0c8cb8f923694900e1;
    stim[45] = 108'he2f8ae22e0eef1dc3529c68ce60;
    stim[46] = 108'hc147bac1d4c299cf9f53a9643be;
    stim[47] = 108'hf03515fb38e4cec8c2d63f3b254;
    stim[48] = 108'h838f68230df08916d1b6e99f72a;
    stim[49] = 108'h9aa9b061c41e7458076de507936;
    stim[50] = 108'h8c22f39c28278115668c909ce71;
    stim[51] = 108'he3f255f7f59c019a5ba2d86b4d6;
    stim[52] = 108'h78c97b064e1978f88b4276ac277;
    stim[53] = 108'hf456d60b2f0ae296d22769e7ea6;
    stim[54] = 108'h8b7209d552d10c2a0b7f4819e1c;
    stim[55] = 108'he00b8c74ee8d157c1801653ce26;
    stim[56] = 108'hab9662e6f84a1f9ca0a03a574b4;
    stim[57] = 108'hdd8a4b2b8f4e3e57dc2eddcb216;
    stim[58] = 108'hdc3955dd1fb279c1e7f1c3c0f44;
    stim[59] = 108'hb579c924b3e66d12df8da042ece;
    stim[60] = 108'h88d549bde18569e12b2b4dbcc52;
    stim[61] = 108'he7cd9f0c358b59ef72996455d37;
    stim[62] = 108'hbdd995ed078928aa766d0ea6c84;
    stim[63] = 108'h04e4eece7e108f12524286663d2;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 144'he5c6dcec469f8bef324f0f4ce00000000009;
      expv[1] = 144'hc1b2bd7e71120941b424ab5a780000000009;
      expv[2] = 144'h7839d31c31931434826b8ed4120000000048;
      expv[3] = 144'heb3cd2064fbee6d23132528d9a00000000c9;
      expv[4] = 144'h4a1f8d80205faba8f0000374f4d679a40c50;
      expv[5] = 144'h73d9e150700f29b1d800000374d679a40c50;
      expv[6] = 144'hc3a4c4c27c25475c100000c9b8d679a40c81;
      expv[7] = 144'hd5d11c2c60ddb4de9451a7b5388749898451;
      expv[8] = 144'h93d7a41622d91e4a6900a9f5208749898404;
      expv[9] = 144'hb62bde6a221c7e41c8d0f535808749898404;
      expv[10] = 144'hf533a74c1c0985aa249fc26c016c57bcd70c;
      expv[11] = 144'h64f2a51671287e791beeabc0016c57bcd70c;
      expv[12] = 144'h2f9f60fe11f9796cda7cfb3c016c57bcd70c;
      expv[13] = 144'h6a5fc6d008596e496226c454016c57bcd78c;
      expv[14] = 144'h1e95ca1e445f586ff843c1adf26c57bcd768;
      expv[15] = 144'hde5e99ce38b42596af08b3e9f06c57bcd70a;
      expv[16] = 144'h847ac39605db85d5c3ca0989f06c57bcd70c;
      expv[17] = 144'hea4835fa47959535f8000000b508f5872c0c;
      expv[18] = 144'hbc5ad5b207d55f426c000002fd08f5872c8c;
      expv[19] = 144'h2921c8c40e0ffdef1ffffffe5e08f5872c68;
      expv[20] = 144'hee01593a381599f59ffffffe0608f5872c6a;
      expv[21] = 144'hbee957ec44daea0ead8d6ba85ddc02b2750c;
      expv[22] = 144'h90e6fbf02355c4f34797db1529dc02b2758c;
      expv[23] = 144'h474d3976466a492db4000000f8dc02b27508;
      expv[24] = 144'h57ca45f4482b4f5ea4000000e0dc02b27508;
      expv[25] = 144'hfeb8544461056c72ec000000dedc02b275e9;
      expv[26] = 144'h01ce19483fd5ab6ce4000000acfd70a88b50;
      expv[27] = 144'h74c1cd5a08059d7ec7ffffffccfd70a88b00;
      expv[28] = 144'h515ed04a4902b7c43ffffffeb4fd70a88b00;
      expv[29] = 144'ha96c2f627b7e887877ffffff1cfd70a88b01;
      expv[30] = 144'h951a6da04219fd4a0e67db152952d85ec584;
      expv[31] = 144'h63c88b9c3f9ccd67b7e7db152852d85ec550;
      expv[32] = 144'hc1de1c424850ca390a6bdb152852d85ec581;
      expv[33] = 144'h7b493dda47d50146780000004883bc388500;
      expv[34] = 144'hd6d15d7258a862c33c0000011c83bc3885c1;
      expv[35] = 144'he94bc0ec7a1644b19400023df4ada2bae551;
      expv[36] = 144'h97c1b64606fbe7acd76bdb1529d29781d904;
      expv[37] = 144'h05030c22737b0572a9e7db1529d29781d984;
      expv[38] = 144'hfe2cf1e82368b6f9dcdfdb15280a06184652;
      expv[39] = 144'hbd80a2cc47e9930f9c3fdb15280a06184604;
      expv[40] = 144'hbcd9e2ea44b86828c8000000657b01459884;
      expv[41] = 144'hb4eda12e2135f0b3d3ffffffdc7b01459802;
      expv[42] = 144'h978c5b3045a10c3284000000747b01459804;
      expv[43] = 144'hb1bfd01631b9acfff3fffffff47b01459804;
      expv[44] = 144'hed29201c3f232e3e4bfffffff07b01459804;
      expv[45] = 144'hd38d19cc3fbbc770d4000001707b01459884;
      expv[46] = 144'ha752c876627f0a673ca3dd60e8a71a339809;
      expv[47] = 144'hac7e764a073b230b928afd9fd94ea590ef84;
      expv[48] = 144'h6dd33ee4705b47c227b41187d84ea590ef00;
      expv[49] = 144'hdbca0f2679d1601c78d830e3d84ea590ef01;
      expv[50] = 144'h992139ce3c9e04559979ce17d84ea590ef04;
      expv[51] = 144'hc5b0d69a4406696e71f92afbf93242739c8c;
      expv[52] = 144'h84ed584e49e3e22c6464bd832600000000e9;
      expv[53] = 144'h4ed3cfd44b8a5b482a2b6b05960000000068;
      expv[54] = 144'hfe9033c2202f4430a9b904eaa8000000000a;
      expv[55] = 144'h82ca79c44855f0623405c63a74000000008c;
      expv[56] = 144'h4074ae96387e728128000001700594f38950;
      expv[57] = 144'h5dbb964248f95f7138000001940594f38900;
      expv[58] = 144'he38781e849e7079ec8000002ec0594f38981;
      expv[59] = 144'h1b4085d8237f99b44800000090c70f03d150;
      expv[60] = 144'h569b798a0e15a784ac000000dcc70f03d100;
      expv[61] = 144'h32c8aba65967bdca2fffffff84c70f03d140;
      expv[62] = 144'hda1d4d9048a2a9da27fffffef4c70f03d151;
      expv[63] = 144'h850ccc7a44423c494a7277673c0000000009;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
