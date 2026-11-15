// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_024596 dut (
    .in1(in_vec[72:41]),
    .in2(in_vec[40:9]),
    .shamt(in_vec[8:4]),
    .op(in_vec[3:0]),
    .result(out_vec[32:1]),
    .zero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h1813a57692f6d096308;
    stim[1] = 73'h1c93c7ce9231b87ef31;
    stim[2] = 73'h164c3b5ff2e7e19803d;
    stim[3] = 73'h0d5402824f844d46c8c;
    stim[4] = 73'h133936461a9e28480c5;
    stim[5] = 73'h13bd9e2a11ac3c63fb5;
    stim[6] = 73'h064bef5662e2dbdd77e;
    stim[7] = 73'h193c22bd7da51811bc8;
    stim[8] = 73'h19343a3e6fc6e98ce8b;
    stim[9] = 73'h04f04193e7b3e225072;
    stim[10] = 73'h1180669a5c1d6ad6620;
    stim[11] = 73'h0292a362098f0fc166d;
    stim[12] = 73'h1fc73b5b3713011e963;
    stim[13] = 73'h09cb670cabcfb600b1b;
    stim[14] = 73'h140acf22c0333a9425a;
    stim[15] = 73'h1bb120fda6f62a3a388;
    stim[16] = 73'h1e812ac0e480b357250;
    stim[17] = 73'h1bfcd975fe410db01c0;
    stim[18] = 73'h0cf5496f335ea8bbf88;
    stim[19] = 73'h10f1a68a7d8ddd32752;
    stim[20] = 73'h004becf764487d77ba7;
    stim[21] = 73'h0c1820e42c71704ae47;
    stim[22] = 73'h0b224b86c2bb732ebd8;
    stim[23] = 73'h125a3f811a91f63afe9;
    stim[24] = 73'h0e255b349ba3c0a7aaa;
    stim[25] = 73'h03b35d5ee9121aff2ac;
    stim[26] = 73'h1458fa8e8cdb42f12e8;
    stim[27] = 73'h10b92f861f62c6eb473;
    stim[28] = 73'h1c98cb00762080b9196;
    stim[29] = 73'h0224d4f0ac2f290b9f2;
    stim[30] = 73'h0bd482d820673ae8979;
    stim[31] = 73'h16f97a8f858f5a03597;
    stim[32] = 73'h1c03e38f2f21f9b56d7;
    stim[33] = 73'h0db04aa6aba1e04279a;
    stim[34] = 73'h05a0548ebff0ebdc991;
    stim[35] = 73'h0013e3f0975869bc3d6;
    stim[36] = 73'h18e5939362c743c8e0e;
    stim[37] = 73'h0b27a89233e65a25414;
    stim[38] = 73'h019b23fcaa7afc587bc;
    stim[39] = 73'h0d46c88e960b19dba71;
    stim[40] = 73'h06cef410f26b7bad29a;
    stim[41] = 73'h0d201f51fa25c4fe99c;
    stim[42] = 73'h13733dbf0fec1eea644;
    stim[43] = 73'h1accaa2dc041607aa6f;
    stim[44] = 73'h1bf841fa9c20628fca6;
    stim[45] = 73'h055f725f2c7a66822b2;
    stim[46] = 73'h1f79e94804eb52a328d;
    stim[47] = 73'h08fca13eaacf4baae7c;
    stim[48] = 73'h12f9ea0314e9350a1cf;
    stim[49] = 73'h0ac9cb1651168110c72;
    stim[50] = 73'h09e022256ccc64dc05d;
    stim[51] = 73'h10d7c2cb1687d879c47;
    stim[52] = 73'h179c2053f3807f6b185;
    stim[53] = 73'h0cc520a379721d4bb76;
    stim[54] = 73'h01d33b2b9c12bf8a856;
    stim[55] = 73'h183501b6cd875d76564;
    stim[56] = 73'h1fa4ff083c3693ea301;
    stim[57] = 73'h0d33b0e4db0d5487ff0;
    stim[58] = 73'h0a8ff84df820b1365d8;
    stim[59] = 73'h0db4487fd3059b9957b;
    stim[60] = 73'h0b14e2219371c69d86d;
    stim[61] = 73'h19e89899d76c5f25254;
    stim[62] = 73'h16cd6b268919d377ed8;
    stim[63] = 73'h031340a87e0512fa049;
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
      expv[0] = 33'h057680000;
      expv[1] = 33'h1eb3fffee;
      expv[2] = 33'hxxxxxxxxx;
      expv[3] = 33'hxxxxxxxxx;
      expv[4] = 33'hxxxxxxxxx;
      expv[5] = 33'hxxxxxxxxx;
      expv[6] = 33'hxxxxxxxxx;
      expv[7] = 33'h160000000;
      expv[8] = 33'hxxxxxxxxx;
      expv[9] = 33'h0ca423b8e;
      expv[10] = 33'h100062924;
      expv[11] = 33'hxxxxxxxxx;
      expv[12] = 33'hxxxxxxxxx;
      expv[13] = 33'hxxxxxxxxx;
      expv[14] = 33'hxxxxxxxxx;
      expv[15] = 33'h1da000000;
      expv[16] = 33'h048022402;
      expv[17] = 33'h1a4009300;
      expv[18] = 33'h0f2000000;
      expv[19] = 33'h0e7f83bcc;
      expv[20] = 33'h000000002;
      expv[21] = 33'h000000002;
      expv[22] = 33'h180000000;
      expv[23] = 33'h000000004;
      expv[24] = 33'hxxxxxxxxx;
      expv[25] = 33'hxxxxxxxxx;
      expv[26] = 33'h1ea3a0000;
      expv[27] = 33'hxxxxxxxxx;
      expv[28] = 33'h06784a476;
      expv[29] = 33'h0e53fdfc2;
      expv[30] = 33'h00000017a;
      expv[31] = 33'h000000001;
      expv[32] = 33'h000000001;
      expv[33] = 33'hxxxxxxxxx;
      expv[34] = 33'h1ff0ffdea;
      expv[35] = 33'h08bb7a346;
      expv[36] = 33'hxxxxxxxxx;
      expv[37] = 33'hxxxxxxxxx;
      expv[38] = 33'hxxxxxxxxx;
      expv[39] = 33'h1f4fd9dfa;
      expv[40] = 33'hxxxxxxxxx;
      expv[41] = 33'hxxxxxxxxx;
      expv[42] = 33'hxxxxxxxxx;
      expv[43] = 33'hxxxxxxxxx;
      expv[44] = 33'h1fd7df6ac;
      expv[45] = 33'h11d9d8e14;
      expv[46] = 33'hxxxxxxxxx;
      expv[47] = 33'hxxxxxxxxx;
      expv[48] = 33'hxxxxxxxxx;
      expv[49] = 33'h1be04c270;
      expv[50] = 33'hxxxxxxxxx;
      expv[51] = 33'h000000002;
      expv[52] = 33'hxxxxxxxxx;
      expv[53] = 33'h13530357c;
      expv[54] = 33'h05c07ba10;
      expv[55] = 33'hxxxxxxxxx;
      expv[56] = 33'h1fb6ffea2;
      expv[57] = 33'h09011084c;
      expv[58] = 33'h1c0000000;
      expv[59] = 33'hxxxxxxxxx;
      expv[60] = 33'hxxxxxxxxx;
      expv[61] = 33'hxxxxxxxxx;
      expv[62] = 33'h0d64d0000;
      expv[63] = 33'h0031340a8;
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
