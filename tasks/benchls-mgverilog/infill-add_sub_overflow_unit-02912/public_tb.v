// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02912 dut (
    .dataa(in_vec[67:36]),
    .datab(in_vec[35:4]),
    .cin(in_vec[3:3]),
    .add_sub(in_vec[2:2]),
    .bwd(in_vec[1:0]),
    .result(out_vec[33:2]),
    .cout(out_vec[1:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h75824e0304ce01f5b;
    stim[1] = 68'h4b0f0d613efc259cd;
    stim[2] = 68'ha34a8517f6e610417;
    stim[3] = 68'h1ce17ffa275a7e2b2;
    stim[4] = 68'h0cba915f8a887c870;
    stim[5] = 68'h92ea4d9ffb61fd9cf;
    stim[6] = 68'hd8d24b0ca179b9d82;
    stim[7] = 68'hc085ffec08f17f7b0;
    stim[8] = 68'h039fdbc560758616a;
    stim[9] = 68'h2242900c02e34f31e;
    stim[10] = 68'h694f1a3a0c482d991;
    stim[11] = 68'hb9ec2a25292061b11;
    stim[12] = 68'h8b66dc3429d836407;
    stim[13] = 68'h96fb3d023bc6c0d81;
    stim[14] = 68'h4da8e125dc9c1363c;
    stim[15] = 68'h54da13261b2490afb;
    stim[16] = 68'hafeaa7392920e6ddb;
    stim[17] = 68'h73fa807cdb9824d37;
    stim[18] = 68'hd861fcd9d6ecde185;
    stim[19] = 68'hd844da674ea912dfb;
    stim[20] = 68'h9aabb32a838f1c228;
    stim[21] = 68'h42efec43e02596287;
    stim[22] = 68'h2d6c4eb1ba6033797;
    stim[23] = 68'hdb97475fa19b47bc0;
    stim[24] = 68'h576a4da018cbefa29;
    stim[25] = 68'hd9099bb56b53c6923;
    stim[26] = 68'hebf721ec9c49efbf7;
    stim[27] = 68'he5f7d03935f3772f3;
    stim[28] = 68'h45a170012d027fb1c;
    stim[29] = 68'h7f3e71ce60c71013f;
    stim[30] = 68'h0e301c39dd7780feb;
    stim[31] = 68'hb174fd816e27392e9;
    stim[32] = 68'hb458d8cb52c8062f3;
    stim[33] = 68'h783277d0c3ac01caf;
    stim[34] = 68'he2448b0b35c87f2f7;
    stim[35] = 68'h5aa8d1dcbb82f1419;
    stim[36] = 68'h58439e80fb5fd63fd;
    stim[37] = 68'h0b774c48896a687a2;
    stim[38] = 68'hd07ac1df5788069d6;
    stim[39] = 68'h2132645f3d133372f;
    stim[40] = 68'hb48dc77c161cf1400;
    stim[41] = 68'heef00675962d75e2c;
    stim[42] = 68'h81c0f911bc945cef3;
    stim[43] = 68'h764f7bb8a8ee29ac9;
    stim[44] = 68'hf25bda81e59f53c03;
    stim[45] = 68'h93813c23284d4d2d3;
    stim[46] = 68'h81e83e4beff9501db;
    stim[47] = 68'he3f8700ede51cb09a;
    stim[48] = 68'h10b5b395917a17459;
    stim[49] = 68'h878bd394afa71239d;
    stim[50] = 68'h1263583ea39c56db9;
    stim[51] = 68'he53bd1777f620f97a;
    stim[52] = 68'hab27aa5ba7cc86810;
    stim[53] = 68'hb3fc0ef8699a258c4;
    stim[54] = 68'h0c3c46642b9f2e838;
    stim[55] = 68'hb231f902f0f73b4dc;
    stim[56] = 68'h80cf4c57580e95718;
    stim[57] = 68'hcefb43d7f0f8f2624;
    stim[58] = 68'h4ab0ca8b6d14a4121;
    stim[59] = 68'h1f80f0a0ba2834d54;
    stim[60] = 68'hb94c006cbb759b07d;
    stim[61] = 68'hfc450ec9d6cb88355;
    stim[62] = 68'h53564028ce54ddd67;
    stim[63] = 68'h218f461d60a460aab;
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
      expv[0] = 34'h1c2d13038;
      expv[1] = 34'h2282ccbf8;
      expv[2] = 34'h268c25562;
      expv[3] = 34'h3d61c073a;
      expv[4] = 34'h208c8535f;
      expv[5] = 34'h239312cf2;
      expv[6] = 34'h0dd6244cc;
      expv[7] = 34'h2de5201c1;
      expv[8] = 34'h28ca956be;
      expv[9] = 34'h094977cf8;
      expv[10] = 34'h1741bb280;
      expv[11] = 34'h2432f21cc;
      expv[12] = 34'h2d4fc49d0;
      expv[13] = 34'h16cd1f0a4;
      expv[14] = 34'h0a913d227;
      expv[15] = 34'h0e6d609dc;
      expv[16] = 34'h21b270170;
      expv[17] = 34'h13e4a953e;
      expv[18] = 34'h2bd3b6bc6;
      expv[19] = 34'h2266f1e20;
      expv[20] = 34'h05c725c20;
      expv[21] = 34'h08c5609ae;
      expv[22] = 34'h39f3208a8;
      expv[23] = 34'h0e7effe89;
      expv[24] = 34'h0fa7977f8;
      expv[25] = 34'h1b6d75489;
      expv[26] = 34'h2210446ae;
      expv[27] = 34'h2c0116424;
      expv[28] = 34'h1ca8fbecc;
      expv[29] = 34'h380160789;
      expv[30] = 34'h0c2e26cee;
      expv[31] = 34'h10d37114c;
      expv[32] = 34'h186434a6d;
      expv[33] = 34'h0ef79e66e;
      expv[34] = 34'h0603428ea;
      expv[35] = 34'h27c97826e;
      expv[36] = 34'h14e8dd303;
      expv[37] = 34'h208338f37;
      expv[38] = 34'h0a00b21f2;
      expv[39] = 34'h179165f48;
      expv[40] = 34'h279c358ec;
      expv[41] = 34'h21475f162;
      expv[42] = 34'h314b27086;
      expv[43] = 34'h335854832;
      expv[44] = 34'h032f21b00;
      expv[45] = 34'h1accfbbd5;
      expv[46] = 34'h247bbb8ba;
      expv[47] = 34'h0169a9414;
      expv[48] = 34'h1fcee7142;
      expv[49] = 34'h0dccb973a;
      expv[50] = 34'h1bb1c058e;
      expv[51] = 34'h197670781;
      expv[52] = 34'h00d6c8f65;
      expv[53] = 34'h07658d212;
      expv[54] = 34'h382745f87;
      expv[55] = 34'h28ca4d142;
      expv[56] = 34'h0a302db98;
      expv[57] = 34'h2ffd0d8e6;
      expv[58] = 34'h3767099e2;
      expv[59] = 34'h366a495d5;
      expv[60] = 34'h1d3066dd2;
      expv[61] = 34'h34c425bfa;
      expv[62] = 34'h086ac77fa;
      expv[63] = 34'h303ab95ce;
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
