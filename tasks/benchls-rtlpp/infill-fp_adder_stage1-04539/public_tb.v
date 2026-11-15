// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 82;
  localparam OW = 52;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04539 dut (
    .clk(clk),
    .rst(in_vec[81:81]),
    .flush_i(in_vec[80:80]),
    .adv_i(in_vec[79:79]),
    .start_i(in_vec[78:78]),
    .is_sub_i(in_vec[77:77]),
    .signa_i(in_vec[76:76]),
    .exp10a_i(in_vec[75:66]),
    .fract24a_i(in_vec[65:42]),
    .infa_i(in_vec[41:41]),
    .signb_i(in_vec[40:40]),
    .exp10b_i(in_vec[39:30]),
    .fract24b_i(in_vec[29:6]),
    .infb_i(in_vec[5:5]),
    .snan_i(in_vec[4:4]),
    .qnan_i(in_vec[3:3]),
    .anan_sign_i(in_vec[2:2]),
    .addsub_agtb_i(in_vec[1:1]),
    .addsub_aeqb_i(in_vec[0:0]),
    .add_rdy_o(out_vec[51:51]),
    .add_sign_o(out_vec[50:50]),
    .add_sub_0_o(out_vec[49:49]),
    .add_shr_o(out_vec[48:48]),
    .add_shl_o(out_vec[47:43]),
    .add_exp10sh0_o(out_vec[42:33]),
    .add_fract28_o(out_vec[32:5]),
    .add_inv_o(out_vec[4:4]),
    .add_inf_o(out_vec[3:3]),
    .add_snan_o(out_vec[2:2]),
    .add_qnan_o(out_vec[1:1]),
    .add_anan_sign_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 82'h27a1ac0d3324a2338f803;
    stim[1] = 82'h358561e33f6612bbac93b;
    stim[2] = 82'h127bcb090bb555fc783bf;
    stim[3] = 82'h03c80a3f366ada15923a0;
    stim[4] = 82'h0145308046f5c90445cb5;
    stim[5] = 82'h13dd5cef2151213237603;
    stim[6] = 82'h004cecea893100bc59d6c;
    stim[7] = 82'h1d985d0cde771bd3ae9c9;
    stim[8] = 82'h18b662e66726858852b13;
    stim[9] = 82'h12eff3943ecd0efba0a04;
    stim[10] = 82'h0e3414c238d0836468cb3;
    stim[11] = 82'h0b946b53ae8aab649ad4a;
    stim[12] = 82'h1f07d2877a8d295688c34;
    stim[13] = 82'h04817a639eb6ad15e1b41;
    stim[14] = 82'h03d53ffbca9b83621f7bb;
    stim[15] = 82'h0d1630837b8124bf8a4ee;
    stim[16] = 82'h104b79b8e3509b2acd1a0;
    stim[17] = 82'h06b70c366380bab4b25bd;
    stim[18] = 82'h1a97d4bbf7976f7d8cd41;
    stim[19] = 82'h09d2e1d7c3beb55b76ac8;
    stim[20] = 82'h141fd83b5183d3bd24a5d;
    stim[21] = 82'h211d3f58b4450aed4dcb2;
    stim[22] = 82'h02914c6f48226b0220fee;
    stim[23] = 82'h09eb8a4a43f98fcd5abf6;
    stim[24] = 82'h175011593f5384c5c6c73;
    stim[25] = 82'h1e1744500c53805922c2f;
    stim[26] = 82'h04849a7d1e9498f0781a0;
    stim[27] = 82'h0621a7688b7389f3a13ee;
    stim[28] = 82'h1c95e771e10f165f5a7cc;
    stim[29] = 82'h11025a93c776ab98cbc95;
    stim[30] = 82'h09c71e861adeb7a77d57e;
    stim[31] = 82'h001aee628a673a7cac1fd;
    stim[32] = 82'h023e72346dcb60b81accf;
    stim[33] = 82'h0a73204dbf6bc4e96e724;
    stim[34] = 82'h114c88d5dfd3a07d05420;
    stim[35] = 82'h01e5538fbc1b94ddd721b;
    stim[36] = 82'h18982dd82f1bd996cf897;
    stim[37] = 82'h014b44ed81a484263f880;
    stim[38] = 82'h17accd83a02cd848160eb;
    stim[39] = 82'h02477f68c76f6fca40236;
    stim[40] = 82'h1c7d88f72bea7e5afccbf;
    stim[41] = 82'h1440cc5e5014d0f50c548;
    stim[42] = 82'h0e175d0228748a2189aab;
    stim[43] = 82'h15f73a6d80d3f88ddca12;
    stim[44] = 82'h161fd4c6624521b571935;
    stim[45] = 82'h02c14e97430cd8a8b79f8;
    stim[46] = 82'h143a8615a492d1fca17ab;
    stim[47] = 82'h1798fcdcb40e5cbd4b190;
    stim[48] = 82'h03e4cc5f778dbf29fb2f0;
    stim[49] = 82'h1d98f3efef247ca213a16;
    stim[50] = 82'h1da272c1b48d1a579313b;
    stim[51] = 82'h0dbfc132c518f68f13e71;
    stim[52] = 82'h08c47ab6fc48f10edff99;
    stim[53] = 82'h0178081fbf8932bdfd374;
    stim[54] = 82'h1eeec40c44e8f3522549a;
    stim[55] = 82'h1830ca91146aef0129014;
    stim[56] = 82'h002eaa78fba5b1936a304;
    stim[57] = 82'h07979b0b49dff08bd5e2e;
    stim[58] = 82'h0f5813360d8c03caa6840;
    stim[59] = 82'h0f4911503af3094b049d4;
    stim[60] = 82'h04dcfe0d464877634f21f;
    stim[61] = 82'h0a2a20d1ff784b3284a66;
    stim[62] = 82'h037d328baad382384305f;
    stim[63] = 82'h07b7fcb96550e23e74560;
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
      expv[0] = 52'hxxxxxxxxxxxxx;
      expv[1] = 52'hxxxxxxxxxxxxx;
      expv[2] = 52'hxxxxxxxxxxxxx;
      expv[3] = 52'hxxxxxxxxxxxxx;
      expv[4] = 52'hxxxxxxxxxxxxx;
      expv[5] = 52'hxxxxxxxxxxxxx;
      expv[6] = 52'hxxxxxxxxxxxxx;
      expv[7] = 52'hxxxxxxxxxxxxx;
      expv[8] = 52'hxxxxxxxxxxxxx;
      expv[9] = 52'hxxxxxxxxxxxxx;
      expv[10] = 52'hxxxxxxxxxxxxx;
      expv[11] = 52'h4038c0000000a;
      expv[12] = 52'h005b20000000c;
      expv[13] = 52'h001a00000000c;
      expv[14] = 52'h001a00000000c;
      expv[15] = 52'h001a00000000c;
      expv[16] = 52'h404a2ad4eba22;
      expv[17] = 52'h404a2ad4eba22;
      expv[18] = 52'h404a2ad4eba22;
      expv[19] = 52'h406940000000d;
      expv[20] = 52'h400b00000000b;
      expv[21] = 52'h400b00000000b;
      expv[22] = 52'h400b00000000b;
      expv[23] = 52'h400b00000000b;
      expv[24] = 52'h003b6df633520;
      expv[25] = 52'h003b6df633520;
      expv[26] = 52'h4075a0000000a;
      expv[27] = 52'h4075a0000000a;
      expv[28] = 52'h4075a0000000a;
      expv[29] = 52'h4075c0000000d;
      expv[30] = 52'h4075c0000000d;
      expv[31] = 52'h000ba0000000b;
      expv[32] = 52'h000ba0000000b;
      expv[33] = 52'h000ba0000000b;
      expv[34] = 52'h0078a97d69f23;
      expv[35] = 52'h0078a97d69f23;
      expv[36] = 52'h0078a97d69f23;
      expv[37] = 52'h406380000000f;
      expv[38] = 52'h406380000000f;
      expv[39] = 52'h406380000000f;
      expv[40] = 52'h406380000000f;
      expv[41] = 52'h405e200000019;
      expv[42] = 52'h405e200000019;
      expv[43] = 52'h204c0b760bbe5;
      expv[44] = 52'h204c0b760bbe5;
      expv[45] = 52'h204c0b760bbe5;
      expv[46] = 52'h204c0b760bbe5;
      expv[47] = 52'h204c0b760bbe5;
      expv[48] = 52'h204c0b760bbe5;
      expv[49] = 52'h204c0b760bbe5;
      expv[50] = 52'h003ec0000000f;
      expv[51] = 52'h000ba0000000a;
      expv[52] = 52'h404c60000000d;
      expv[53] = 52'h605120000000e;
      expv[54] = 52'h605120000000e;
      expv[55] = 52'h4047a0000000c;
      expv[56] = 52'h00c7843b7fe26;
      expv[57] = 52'h00c7843b7fe26;
      expv[58] = 52'h00c7843b7fe26;
      expv[59] = 52'h007760000000e;
      expv[60] = 52'h005760000000d;
      expv[61] = 52'h005760000000d;
      expv[62] = 52'hc0600f2a9a120;
      expv[63] = 52'hc0600f2a9a120;
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
