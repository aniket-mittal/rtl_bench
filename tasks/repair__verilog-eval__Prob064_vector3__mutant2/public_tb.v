// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[29:25]),
    .b(in_vec[24:20]),
    .c(in_vec[19:15]),
    .d(in_vec[14:10]),
    .e(in_vec[9:5]),
    .f(in_vec[4:0]),
    .w(out_vec[31:24]),
    .x(out_vec[23:16]),
    .y(out_vec[15:8]),
    .z(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h048613b5;
    stim[1] = 30'h1c2c338e;
    stim[2] = 30'h1b6b1268;
    stim[3] = 30'h1551eda7;
    stim[4] = 30'h21de211c;
    stim[5] = 30'h0595bb7d;
    stim[6] = 30'h0623ad47;
    stim[7] = 30'h07eb32ba;
    stim[8] = 30'h1cbc6551;
    stim[9] = 30'h079fcd27;
    stim[10] = 30'h3b957ac0;
    stim[11] = 30'h38265700;
    stim[12] = 30'h2629862a;
    stim[13] = 30'h29a7db7c;
    stim[14] = 30'h180aefd5;
    stim[15] = 30'h3ce46510;
    stim[16] = 30'h01e3b1ce;
    stim[17] = 30'h28d3b3c8;
    stim[18] = 30'h119e6758;
    stim[19] = 30'h0d07153c;
    stim[20] = 30'h375bb8ab;
    stim[21] = 30'h09da0d8a;
    stim[22] = 30'h095723a9;
    stim[23] = 30'h1fe3fd6c;
    stim[24] = 30'h3a5aee26;
    stim[25] = 30'h21ecb8c5;
    stim[26] = 30'h28463d1a;
    stim[27] = 30'h101e8101;
    stim[28] = 30'h1292740f;
    stim[29] = 30'h2e48e90e;
    stim[30] = 30'h094ac1c0;
    stim[31] = 30'h1c165565;
    stim[32] = 30'h0c6f0fd2;
    stim[33] = 30'h1e1913ea;
    stim[34] = 30'h2b86d60e;
    stim[35] = 30'h279ff071;
    stim[36] = 30'h36c0259f;
    stim[37] = 30'h0294431f;
    stim[38] = 30'h2136f2b4;
    stim[39] = 30'h307297df;
    stim[40] = 30'h1402c8fc;
    stim[41] = 30'h037ecdeb;
    stim[42] = 30'h33ac6d4f;
    stim[43] = 30'h002c3c8a;
    stim[44] = 30'h282d5722;
    stim[45] = 30'h2b0eb832;
    stim[46] = 30'h0407bf6d;
    stim[47] = 30'h3e79b3f0;
    stim[48] = 30'h3ec96407;
    stim[49] = 30'h146547c3;
    stim[50] = 30'h1f0ddf84;
    stim[51] = 30'h220e0cd8;
    stim[52] = 30'h3f8d3c01;
    stim[53] = 30'h15cb1929;
    stim[54] = 30'h192c8444;
    stim[55] = 30'h0164c106;
    stim[56] = 30'h0bde37fe;
    stim[57] = 30'h1b824393;
    stim[58] = 30'h07177b95;
    stim[59] = 30'h03157ee6;
    stim[60] = 30'h25aa214b;
    stim[61] = 30'h398e5f29;
    stim[62] = 30'h3754947b;
    stim[63] = 30'h2b3ca067;
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
      expv[0] = 32'h1219d257;
      expv[1] = 32'h70b1c63b;
      expv[2] = 32'h6dad3223;
      expv[3] = 32'h5546dd9f;
      expv[4] = 32'h87788473;
      expv[5] = 32'h1657b777;
      expv[6] = 32'h188ea59f;
      expv[7] = 32'h1fad566b;
      expv[8] = 32'h72f0acc7;
      expv[9] = 32'h1e7e999f;
      expv[10] = 32'hee556f03;
      expv[11] = 32'he0998a83;
      expv[12] = 32'h98a710ab;
      expv[13] = 32'ha69fbb73;
      expv[14] = 32'h602bedd7;
      expv[15] = 32'hf3908cc3;
      expv[16] = 32'h078ee63b;
      expv[17] = 32'ha34fe623;
      expv[18] = 32'h4679ace3;
      expv[19] = 32'h341c92f3;
      expv[20] = 32'hdd6e572f;
      expv[21] = 32'h2768c1ab;
      expv[22] = 32'h255dd427;
      expv[23] = 32'h7f8ebfb3;
      expv[24] = 32'he96b1d9b;
      expv[25] = 32'h87b26717;
      expv[26] = 32'ha11887eb;
      expv[27] = 32'h407a8007;
      expv[28] = 32'h4a480ebf;
      expv[29] = 32'hb9228d3b;
      expv[30] = 32'h252ae803;
      expv[31] = 32'h7058ba97;
      expv[32] = 32'h31bde1cb;
      expv[33] = 32'h7865f22b;
      expv[34] = 32'hae1b0abb;
      expv[35] = 32'h9e7e3e47;
      expv[36] = 32'hdb00c4ff;
      expv[37] = 32'h0a51887f;
      expv[38] = 32'h84db5e53;
      expv[39] = 32'hc1cbe2ff;
      expv[40] = 32'h500a7973;
      expv[41] = 32'h0dfaf9af;
      expv[42] = 32'hceb0adbf;
      expv[43] = 32'h00b047ab;
      expv[44] = 32'ha0b59a8b;
      expv[45] = 32'hac3a174b;
      expv[46] = 32'h101fb7b7;
      expv[47] = 32'hf9e7f643;
      expv[48] = 32'hfb240c9f;
      expv[49] = 32'h5195e88f;
      expv[50] = 32'h7c37cb93;
      expv[51] = 32'h883861e3;
      expv[52] = 32'hfe340787;
      expv[53] = 32'h572c9327;
      expv[54] = 32'h64b22093;
      expv[55] = 32'h0592881b;
      expv[56] = 32'h2f79f6fb;
      expv[57] = 32'h6e09c84f;
      expv[58] = 32'h1c5dcf57;
      expv[59] = 32'h0c557f9b;
      expv[60] = 32'h96a8a42f;
      expv[61] = 32'he6399ba7;
      expv[62] = 32'hdd5232ef;
      expv[63] = 32'hacf2341f;
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
