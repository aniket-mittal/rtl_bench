// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_027562 dut (
    .op(in_vec[39:36]),
    .a(in_vec[35:20]),
    .b(in_vec[19:4]),
    .cc_in(in_vec[3:0]),
    .result(out_vec[19:4]),
    .cc_out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'h5e8b479498;
    stim[1] = 40'hc5d4fe06ce;
    stim[2] = 40'h8c2998442c;
    stim[3] = 40'hc0b9c86f7d;
    stim[4] = 40'h75a0db67a5;
    stim[5] = 40'hf040c4278e;
    stim[6] = 40'h2c5e24dbc0;
    stim[7] = 40'hf70adbfe26;
    stim[8] = 40'hbf373034f1;
    stim[9] = 40'h825e0a5587;
    stim[10] = 40'h444470d2d3;
    stim[11] = 40'h42337cd4e4;
    stim[12] = 40'ha56ec567ec;
    stim[13] = 40'hcd9a75b924;
    stim[14] = 40'h344166e66c;
    stim[15] = 40'hfc7d1bdf67;
    stim[16] = 40'h876752caf3;
    stim[17] = 40'hfb6de792c7;
    stim[18] = 40'hae2dacd8a1;
    stim[19] = 40'h5a4828a728;
    stim[20] = 40'h4cde3fcac6;
    stim[21] = 40'h6547510b01;
    stim[22] = 40'h3d469d4295;
    stim[23] = 40'h0c859c2f5d;
    stim[24] = 40'hba6143eb1f;
    stim[25] = 40'hfd0452e40f;
    stim[26] = 40'h562b98be58;
    stim[27] = 40'hfc22b2abab;
    stim[28] = 40'h9f6dd96e13;
    stim[29] = 40'ha3b966e6b5;
    stim[30] = 40'h3328077de7;
    stim[31] = 40'hb8c9acb5e4;
    stim[32] = 40'ha874fb258c;
    stim[33] = 40'h18480a494a;
    stim[34] = 40'hc44d33935b;
    stim[35] = 40'h3bf08abf63;
    stim[36] = 40'hf6161abf04;
    stim[37] = 40'hff08476c4b;
    stim[38] = 40'h1e829e995f;
    stim[39] = 40'h99152bae35;
    stim[40] = 40'h5fb63e0b43;
    stim[41] = 40'hbffb812255;
    stim[42] = 40'hac7a934a9c;
    stim[43] = 40'hd1bce5511f;
    stim[44] = 40'ha751e27a96;
    stim[45] = 40'hded21dc56e;
    stim[46] = 40'h73af1653b9;
    stim[47] = 40'ha9b7e633ed;
    stim[48] = 40'h8bbfc59d76;
    stim[49] = 40'hf07c2de92f;
    stim[50] = 40'h6b88d89fe8;
    stim[51] = 40'hc53b0d628b;
    stim[52] = 40'hbc828e97ce;
    stim[53] = 40'h40b86888e4;
    stim[54] = 40'h4b12f71fd0;
    stim[55] = 40'haa3b6a872a;
    stim[56] = 40'h1b6e36b7f3;
    stim[57] = 40'hbc91183105;
    stim[58] = 40'h639001f137;
    stim[59] = 40'hedea09b7e9;
    stim[60] = 40'h2e6bcc0704;
    stim[61] = 40'h0a5aa8dcb1;
    stim[62] = 40'h04067c52c4;
    stim[63] = 40'h7554ac9d87;
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
      expv[0] = 20'hf9fd8;
      expv[1] = 20'h3dbb2;
      expv[2] = 20'h30a60;
      expv[3] = 20'h92938;
      expv[4] = 20'h0000x;
      expv[5] = 20'hxxxxe;
      expv[6] = 20'h78263;
      expv[7] = 20'hxxxx6;
      expv[8] = 20'hf6c28;
      expv[9] = 20'h0000x;
      expv[10] = 20'h04053;
      expv[11] = 20'h01060;
      expv[12] = 20'h0000x;
      expv[13] = 20'h35392;
      expv[14] = 20'hd5b18;
      expv[15] = 20'hxxxx7;
      expv[16] = 20'h00007;
      expv[17] = 20'hxxxx7;
      expv[18] = 20'hb6b8b;
      expv[19] = 20'haef28;
      expv[20] = 20'hcca0a;
      expv[21] = 20'h44c51;
      expv[22] = 20'h00412;
      expv[23] = 20'h8b4ea;
      expv[24] = 20'he4c58;
      expv[25] = 20'hxxxxf;
      expv[26] = 20'hebfd8;
      expv[27] = 20'hxxxxb;
      expv[28] = 20'hfb6eb;
      expv[29] = 20'h72c71;
      expv[30] = 20'hbaa48;
      expv[31] = 20'h57f83;
      expv[32] = 20'h0000x;
      expv[33] = 20'h29153;
      expv[34] = 20'h7e080;
      expv[35] = 20'h13142;
      expv[36] = 20'hxxxx4;
      expv[37] = 20'hxxxxb;
      expv[38] = 20'hd1bfa;
      expv[39] = 20'hf22a9;
      expv[40] = 20'hfbf7b;
      expv[41] = 20'h11dd2;
      expv[42] = 20'hd4e3a;
      expv[43] = 20'hxxxxf;
      expv[44] = 20'h8f3aa;
      expv[45] = 20'hxxxxe;
      expv[46] = 20'h0000x;
      expv[47] = 20'h0000x;
      expv[48] = 20'h0000x;
      expv[49] = 20'hxxxxf;
      expv[50] = 20'h31730;
      expv[51] = 20'h29d82;
      expv[52] = 20'hb1a4a;
      expv[53] = 20'h08860;
      expv[54] = 20'h312d0;
      expv[55] = 20'h0000x;
      expv[56] = 20'h22632;
      expv[57] = 20'h4c213;
      expv[58] = 20'h26133;
      expv[59] = 20'hxxxx9;
      expv[60] = 20'h264c2;
      expv[61] = 20'h33753;
      expv[62] = 20'h05932;
      expv[63] = 20'h0000x;
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
