// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 69;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01120 dut (
    .in(in_vec[66:3]),
    .precision(in_vec[2:1]),
    .en(in_vec[0:0]),
    .sign(out_vec[68:68]),
    .exp(out_vec[67:57]),
    .mantissa(out_vec[56:4]),
    .is_zero(out_vec[3:3]),
    .is_norm(out_vec[2:2]),
    .is_inf(out_vec[1:1]),
    .is_NaN(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h11aecaa7f40a95e4e;
    stim[1] = 67'h43aa1af3a2dc52730;
    stim[2] = 67'h491bcf5344b99bbbb;
    stim[3] = 67'h1c356c38cadb45e9b;
    stim[4] = 67'h43a9f93bd3a3ebab4;
    stim[5] = 67'h356e7faf041875ff3;
    stim[6] = 67'h491320337bef1d6f5;
    stim[7] = 67'h432455d906e3c3509;
    stim[8] = 67'h07db91376619ae971;
    stim[9] = 67'h15e262b704c3860bb;
    stim[10] = 67'h6792581a0458bb2b7;
    stim[11] = 67'h684f30c176fbbf376;
    stim[12] = 67'h3478de8ae789c776b;
    stim[13] = 67'h2df315fe2066cc141;
    stim[14] = 67'h61d41473ec007e70b;
    stim[15] = 67'h6f326bafbd2bb9e3f;
    stim[16] = 67'h22eddd183d98ce12b;
    stim[17] = 67'h35120aa127079e5c8;
    stim[18] = 67'h7ea866fa3dccb5e57;
    stim[19] = 67'h4a3f9279ced673afb;
    stim[20] = 67'h1b46e40fe9c1c5bc9;
    stim[21] = 67'h08b706ab4f29a5c50;
    stim[22] = 67'h65427557dcf6eb42c;
    stim[23] = 67'h78221d889337282eb;
    stim[24] = 67'h024d2ea7c717fa3c0;
    stim[25] = 67'h63bc02d78770e1dfc;
    stim[26] = 67'h29d131b922f55cd2c;
    stim[27] = 67'h6509258b424955fc3;
    stim[28] = 67'h6af913869a53bd3ab;
    stim[29] = 67'h6fc267937bcb4e647;
    stim[30] = 67'h022ec4b74a32e6298;
    stim[31] = 67'h07a5f39761ae5fc6b;
    stim[32] = 67'h0deebc166bcb4f03d;
    stim[33] = 67'h2287b95a19c67be1a;
    stim[34] = 67'h2b704b14776e40c48;
    stim[35] = 67'h178c50ced841881cb;
    stim[36] = 67'h65239b7beeb999883;
    stim[37] = 67'h2f45b024388fb9e9c;
    stim[38] = 67'h411517e95ec1903c8;
    stim[39] = 67'h51b39cf5ef35c1a1e;
    stim[40] = 67'h6d0cee47ff2cce63b;
    stim[41] = 67'h69cefbd1a4340db4f;
    stim[42] = 67'h484d7e3734ccee576;
    stim[43] = 67'h0f1b2f6dcf7a623e5;
    stim[44] = 67'h509db79d4828d35cd;
    stim[45] = 67'h0ea6698dd943bfe40;
    stim[46] = 67'h6fb41c9596a5d42ce;
    stim[47] = 67'h43f7a861ddfc6c7f8;
    stim[48] = 67'h32a85a61f91dc5309;
    stim[49] = 67'h226a443ae5061bcd0;
    stim[50] = 67'h6a3ed810da6310261;
    stim[51] = 67'h1cb6b6708c7000dfd;
    stim[52] = 67'h1b9b1f8ec736d21fb;
    stim[53] = 67'h1f87dc2c902ec7cf0;
    stim[54] = 67'h7230019dbb0c92882;
    stim[55] = 67'h1dbc1e0d1d15bcfd9;
    stim[56] = 67'h3fbae88f172fabeb3;
    stim[57] = 67'h0579b21ed6b3c08c5;
    stim[58] = 67'h514c4ec9b9b8a312c;
    stim[59] = 67'h441572c27291991f4;
    stim[60] = 67'h4a60d0d469b93b0ba;
    stim[61] = 67'h54663f6a998f747de;
    stim[62] = 67'h059139ddc7574a1f0;
    stim[63] = 67'h5cca01e572e981648;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 69'h000000000000000008;
      expv[1] = 69'h000000000000000008;
      expv[2] = 69'h001bddc00000000004;
      expv[3] = 69'h1005f4c00000000004;
      expv[4] = 69'h000000000000000008;
      expv[5] = 69'h1035ff800000000004;
      expv[6] = 69'h11dfbc75bc00000004;
      expv[7] = 69'h10c98abb20dc786a14;
      expv[8] = 69'h01f77226ecc335d2e4;
      expv[9] = 69'h000705c00000000004;
      expv[10] = 69'h19e54b03408b176564;
      expv[11] = 69'h000000000000000008;
      expv[12] = 69'h1007bb400000000004;
      expv[13] = 69'h0b7d62bfc40cd98284;
      expv[14] = 69'h103f38400000000005;
      expv[15] = 69'h1bcd4d75f7a5773c74;
      expv[16] = 69'h100f09400000000004;
      expv[17] = 69'h000000000000000008;
      expv[18] = 69'h1fab0cdf47b996bca4;
      expv[19] = 69'h1033d7c00000000004;
      expv[20] = 69'h06d1dc81fd3838b794;
      expv[21] = 69'h000000000000000008;
      expv[22] = 69'h000000000000000008;
      expv[23] = 69'h002917400000000004;
      expv[24] = 69'h000000000000000008;
      expv[25] = 69'h000000000000000008;
      expv[26] = 69'h000000000000000008;
      expv[27] = 69'h1015fe000000000004;
      expv[28] = 69'h003d9d400000000004;
      expv[29] = 69'h1bf14cf26f7969cc84;
      expv[30] = 69'h000000000000000008;
      expv[31] = 69'h101fe3400000000004;
      expv[32] = 69'h115f2d3c0e00000004;
      expv[33] = 69'h000000000000000008;
      expv[34] = 69'h000000000000000008;
      expv[35] = 69'h00090e400000000004;
      expv[36] = 69'h0019c4000000000004;
      expv[37] = 69'h000000000000000008;
      expv[38] = 69'h000000000000000008;
      expv[39] = 69'h000000000000000008;
      expv[40] = 69'h100f31c00000000004;
      expv[41] = 69'h1a73df7a348681b694;
      expv[42] = 69'h000000000000000008;
      expv[43] = 69'h107be988f800000004;
      expv[44] = 69'h1041a34d7200000004;
      expv[45] = 69'h000000000000000008;
      expv[46] = 69'h000000000000000008;
      expv[47] = 69'h000000000000000008;
      expv[48] = 69'h0cab0b4c3f23b8a614;
      expv[49] = 69'h000000000000000008;
      expv[50] = 69'h1a8fdb021b4c6204c4;
      expv[51] = 69'h0063c0037e00000004;
      expv[52] = 69'h10130fc00000000004;
      expv[53] = 69'h000000000000000008;
      expv[54] = 69'h000000000000000008;
      expv[55] = 69'h076f83c1a3a2b79fb4;
      expv[56] = 69'h002bf5800000000004;
      expv[57] = 69'h10b5cf023000000004;
      expv[58] = 69'h000000000000000008;
      expv[59] = 69'h000000000000000008;
      expv[60] = 69'h000000000000000008;
      expv[61] = 69'h000000000000000008;
      expv[62] = 69'h000000000000000008;
      expv[63] = 69'h000000000000000008;
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
