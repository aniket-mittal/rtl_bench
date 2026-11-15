// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00457 dut (
    .In1(in_vec[35:0]),
    .Out1(out_vec[35:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h5375c8513;
    stim[1] = 36'hd7801dde6;
    stim[2] = 36'ha19146883;
    stim[3] = 36'h217400c23;
    stim[4] = 36'hbb598619d;
    stim[5] = 36'h1bdf676c2;
    stim[6] = 36'h7d7bb831a;
    stim[7] = 36'h52a593356;
    stim[8] = 36'h48dbce900;
    stim[9] = 36'h4d5200872;
    stim[10] = 36'h2a007f324;
    stim[11] = 36'hfdab64430;
    stim[12] = 36'hff32b06d7;
    stim[13] = 36'h826a24c3a;
    stim[14] = 36'h1168b3f4d;
    stim[15] = 36'h734548623;
    stim[16] = 36'h3f579c09d;
    stim[17] = 36'h989b2e805;
    stim[18] = 36'he4cbab98b;
    stim[19] = 36'h76d9845e3;
    stim[20] = 36'hfde7e8cf9;
    stim[21] = 36'h9162be328;
    stim[22] = 36'h26ae3eb15;
    stim[23] = 36'h8f56a30c3;
    stim[24] = 36'hfce4b0eff;
    stim[25] = 36'h7c5f1e4ab;
    stim[26] = 36'h40c837bf1;
    stim[27] = 36'h87d1a7f96;
    stim[28] = 36'h7b0169890;
    stim[29] = 36'hfd68914d6;
    stim[30] = 36'he48ad3745;
    stim[31] = 36'h59d19946a;
    stim[32] = 36'h95fdf981b;
    stim[33] = 36'h557ec6fa5;
    stim[34] = 36'hec5948c4b;
    stim[35] = 36'h970bc2e50;
    stim[36] = 36'h138a469a9;
    stim[37] = 36'hf3924d9d4;
    stim[38] = 36'hb94e03c04;
    stim[39] = 36'h3463fb360;
    stim[40] = 36'hc2be293ec;
    stim[41] = 36'h36868be76;
    stim[42] = 36'ha44a5b986;
    stim[43] = 36'hf3d9c483f;
    stim[44] = 36'h7932ab49b;
    stim[45] = 36'hf1e3d640e;
    stim[46] = 36'hda5bcfe3c;
    stim[47] = 36'hb99c433e8;
    stim[48] = 36'h60f957a65;
    stim[49] = 36'hb706fd13c;
    stim[50] = 36'h84288de16;
    stim[51] = 36'h0b0f6a4bf;
    stim[52] = 36'hf4023e8ef;
    stim[53] = 36'h9049a4ed7;
    stim[54] = 36'h34133fa37;
    stim[55] = 36'h8f68d5618;
    stim[56] = 36'h6bb10ff92;
    stim[57] = 36'h5792409ec;
    stim[58] = 36'hb87c7d398;
    stim[59] = 36'hd3cfa2e10;
    stim[60] = 36'hbff32f65c;
    stim[61] = 36'hfa1e3ae13;
    stim[62] = 36'h8fe0a2b36;
    stim[63] = 36'h3f3bdb45a;
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
      expv[0] = 36'h29bae4289;
      expv[1] = 36'hebc00eef3;
      expv[2] = 36'hd0c8a3441;
      expv[3] = 36'h10ba00611;
      expv[4] = 36'hddacc30ce;
      expv[5] = 36'h0defb3b61;
      expv[6] = 36'h3ebddc18d;
      expv[7] = 36'h2952c99ab;
      expv[8] = 36'h246de7480;
      expv[9] = 36'h26a900439;
      expv[10] = 36'h15003f992;
      expv[11] = 36'hfed5b2218;
      expv[12] = 36'hff995836b;
      expv[13] = 36'hc1351261d;
      expv[14] = 36'h08b459fa6;
      expv[15] = 36'h39a2a4311;
      expv[16] = 36'h1fabce04e;
      expv[17] = 36'hcc4d97402;
      expv[18] = 36'hf265d5cc5;
      expv[19] = 36'h3b6cc22f1;
      expv[20] = 36'hfef3f467c;
      expv[21] = 36'hc8b15f194;
      expv[22] = 36'h13571f58a;
      expv[23] = 36'hc7ab51861;
      expv[24] = 36'hfe725877f;
      expv[25] = 36'h3e2f8f255;
      expv[26] = 36'h20641bdf8;
      expv[27] = 36'hc3e8d3fcb;
      expv[28] = 36'h3d80b4c48;
      expv[29] = 36'hfeb448a6b;
      expv[30] = 36'hf24569ba2;
      expv[31] = 36'h2ce8cca35;
      expv[32] = 36'hcafefcc0d;
      expv[33] = 36'h2abf637d2;
      expv[34] = 36'hf62ca4625;
      expv[35] = 36'hcb85e1728;
      expv[36] = 36'h09c5234d4;
      expv[37] = 36'hf9c926cea;
      expv[38] = 36'hdca701e02;
      expv[39] = 36'h1a31fd9b0;
      expv[40] = 36'he15f149f6;
      expv[41] = 36'h1b4345f3b;
      expv[42] = 36'hd2252dcc3;
      expv[43] = 36'hf9ece241f;
      expv[44] = 36'h3c9955a4d;
      expv[45] = 36'hf8f1eb207;
      expv[46] = 36'hed2de7f1e;
      expv[47] = 36'hdcce219f4;
      expv[48] = 36'h307cabd32;
      expv[49] = 36'hdb837e89e;
      expv[50] = 36'hc21446f0b;
      expv[51] = 36'h0587b525f;
      expv[52] = 36'hfa011f477;
      expv[53] = 36'hc824d276b;
      expv[54] = 36'h1a099fd1b;
      expv[55] = 36'hc7b46ab0c;
      expv[56] = 36'h35d887fc9;
      expv[57] = 36'h2bc9204f6;
      expv[58] = 36'hdc3e3e9cc;
      expv[59] = 36'he9e7d1708;
      expv[60] = 36'hdff997b2e;
      expv[61] = 36'hfd0f1d709;
      expv[62] = 36'hc7f05159b;
      expv[63] = 36'h1f9deda2d;
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
