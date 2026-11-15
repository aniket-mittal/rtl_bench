// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072501 dut (
    .sclk(clk),
    .reset(in_vec[10:10]),
    .s_data(in_vec[9:2]),
    .s_valid(in_vec[1:1]),
    .m_ready(in_vec[0:0]),
    .s_ready(out_vec[11:11]),
    .m_data(out_vec[10:3]),
    .m_valid(out_vec[2:2]),
    .num_data_valid(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h460;
    stim[1] = 11'h583;
    stim[2] = 11'h0b6;
    stim[3] = 11'h242;
    stim[4] = 11'h0b4;
    stim[5] = 11'h1fa;
    stim[6] = 11'h283;
    stim[7] = 11'h1db;
    stim[8] = 11'h106;
    stim[9] = 11'h3b2;
    stim[10] = 11'h112;
    stim[11] = 11'h073;
    stim[12] = 11'h150;
    stim[13] = 11'h0a2;
    stim[14] = 11'h004;
    stim[15] = 11'h200;
    stim[16] = 11'h268;
    stim[17] = 11'h20a;
    stim[18] = 11'h367;
    stim[19] = 11'h0ff;
    stim[20] = 11'h1c2;
    stim[21] = 11'h0c4;
    stim[22] = 11'h06b;
    stim[23] = 11'h3b4;
    stim[24] = 11'h21e;
    stim[25] = 11'h312;
    stim[26] = 11'h3da;
    stim[27] = 11'h0db;
    stim[28] = 11'h1ef;
    stim[29] = 11'h038;
    stim[30] = 11'h11a;
    stim[31] = 11'h2b3;
    stim[32] = 11'h23b;
    stim[33] = 11'h31f;
    stim[34] = 11'h182;
    stim[35] = 11'h01f;
    stim[36] = 11'h03a;
    stim[37] = 11'h384;
    stim[38] = 11'h05d;
    stim[39] = 11'h1b4;
    stim[40] = 11'h00d;
    stim[41] = 11'h33e;
    stim[42] = 11'h322;
    stim[43] = 11'h33f;
    stim[44] = 11'h0a2;
    stim[45] = 11'h0b7;
    stim[46] = 11'h231;
    stim[47] = 11'h20f;
    stim[48] = 11'h290;
    stim[49] = 11'h38d;
    stim[50] = 11'h352;
    stim[51] = 11'h08b;
    stim[52] = 11'h0b4;
    stim[53] = 11'h2e0;
    stim[54] = 11'h368;
    stim[55] = 11'h3db;
    stim[56] = 11'h020;
    stim[57] = 11'h21d;
    stim[58] = 11'h2d1;
    stim[59] = 11'h0c9;
    stim[60] = 11'h275;
    stim[61] = 11'h187;
    stim[62] = 11'h2e4;
    stim[63] = 11'h19e;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'h300;
      expv[3] = 12'h968;
      expv[4] = 12'hc85;
      expv[5] = 12'hc85;
      expv[6] = 12'h486;
      expv[7] = 12'hbf5;
      expv[8] = 12'hbb5;
      expv[9] = 12'h3b6;
      expv[10] = 12'h3b6;
      expv[11] = 12'h3b6;
      expv[12] = 12'ha0d;
      expv[13] = 12'ha0d;
      expv[14] = 12'h20e;
      expv[15] = 12'h20e;
      expv[16] = 12'h20e;
      expv[17] = 12'h20e;
      expv[18] = 12'h20e;
      expv[19] = 12'h945;
      expv[20] = 12'h9fd;
      expv[21] = 12'h1fe;
      expv[22] = 12'h1fe;
      expv[23] = 12'hb85;
      expv[24] = 12'hb85;
      expv[25] = 12'h386;
      expv[26] = 12'h386;
      expv[27] = 12'h386;
      expv[28] = 12'hc3d;
      expv[29] = 12'hbdd;
      expv[30] = 12'hbdd;
      expv[31] = 12'h3de;
      expv[32] = 12'ha35;
      expv[33] = 12'hc75;
      expv[34] = 12'he3d;
      expv[35] = 12'h63e;
      expv[36] = 12'hb05;
      expv[37] = 12'h306;
      expv[38] = 12'h306;
      expv[39] = 12'h875;
      expv[40] = 12'h875;
      expv[41] = 12'h870;
      expv[42] = 12'he7d;
      expv[43] = 12'h67e;
      expv[44] = 12'he45;
      expv[45] = 12'h646;
      expv[46] = 12'h945;
      expv[47] = 12'h940;
      expv[48] = 12'hc1d;
      expv[49] = 12'hc1d;
      expv[50] = 12'hc18;
      expv[51] = 12'hea5;
      expv[52] = 12'h915;
      expv[53] = 12'h915;
      expv[54] = 12'h915;
      expv[55] = 12'h915;
      expv[56] = 12'hfb5;
      expv[57] = 12'hfb5;
      expv[58] = 12'hfb0;
      expv[59] = 12'hfb0;
      expv[60] = 12'hfb0;
      expv[61] = 12'hfb0;
      expv[62] = 12'hb0d;
      expv[63] = 12'hb0d;
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
