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

  autovcoder_072199 dut (
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
    stim[0] = 11'h76f;
    stim[1] = 11'h784;
    stim[2] = 11'h124;
    stim[3] = 11'h3c9;
    stim[4] = 11'h1ef;
    stim[5] = 11'h372;
    stim[6] = 11'h315;
    stim[7] = 11'h3be;
    stim[8] = 11'h273;
    stim[9] = 11'h3b2;
    stim[10] = 11'h0ce;
    stim[11] = 11'h01f;
    stim[12] = 11'h1ac;
    stim[13] = 11'h283;
    stim[14] = 11'h04f;
    stim[15] = 11'h031;
    stim[16] = 11'h0d9;
    stim[17] = 11'h35f;
    stim[18] = 11'h355;
    stim[19] = 11'h2d6;
    stim[20] = 11'h3f5;
    stim[21] = 11'h236;
    stim[22] = 11'h1a7;
    stim[23] = 11'h0ce;
    stim[24] = 11'h130;
    stim[25] = 11'h278;
    stim[26] = 11'h259;
    stim[27] = 11'h2de;
    stim[28] = 11'h23a;
    stim[29] = 11'h233;
    stim[30] = 11'h3a7;
    stim[31] = 11'h3b9;
    stim[32] = 11'h1a6;
    stim[33] = 11'h1db;
    stim[34] = 11'h002;
    stim[35] = 11'h224;
    stim[36] = 11'h1e0;
    stim[37] = 11'h2c8;
    stim[38] = 11'h2f1;
    stim[39] = 11'h04f;
    stim[40] = 11'h22c;
    stim[41] = 11'h243;
    stim[42] = 11'h270;
    stim[43] = 11'h301;
    stim[44] = 11'h10e;
    stim[45] = 11'h0b1;
    stim[46] = 11'h014;
    stim[47] = 11'h639;
    stim[48] = 11'h0d9;
    stim[49] = 11'h075;
    stim[50] = 11'h382;
    stim[51] = 11'h4b5;
    stim[52] = 11'h0d0;
    stim[53] = 11'h2d4;
    stim[54] = 11'h358;
    stim[55] = 11'h094;
    stim[56] = 11'h32a;
    stim[57] = 11'h0de;
    stim[58] = 11'h241;
    stim[59] = 11'h143;
    stim[60] = 11'h3f6;
    stim[61] = 11'h316;
    stim[62] = 11'h0f2;
    stim[63] = 11'h00f;
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
      expv[2] = 12'hxxx;
      expv[3] = 12'hxxx;
      expv[4] = 12'hxxx;
      expv[5] = 12'hbdd;
      expv[6] = 12'h3de;
      expv[7] = 12'hee5;
      expv[8] = 12'h6e6;
      expv[9] = 12'hf7d;
      expv[10] = 12'h77e;
      expv[11] = 12'h77e;
      expv[12] = 12'hf65;
      expv[13] = 12'hf65;
      expv[14] = 12'hd05;
      expv[15] = 12'h89d;
      expv[16] = 12'h898;
      expv[17] = 12'h898;
      expv[18] = 12'hebd;
      expv[19] = 12'heb8;
      expv[20] = 12'hdad;
      expv[21] = 12'hda8;
      expv[22] = 12'hc6d;
      expv[23] = 12'hb4d;
      expv[24] = 12'h34e;
      expv[25] = 12'h34e;
      expv[26] = 12'h34e;
      expv[27] = 12'h99d;
      expv[28] = 12'h19e;
      expv[29] = 12'h19e;
      expv[30] = 12'hdbd;
      expv[31] = 12'hf4d;
      expv[32] = 12'hf48;
      expv[33] = 12'hb4d;
      expv[34] = 12'hbb5;
      expv[35] = 12'h3b6;
      expv[36] = 12'h3b6;
      expv[37] = 12'h3b6;
      expv[38] = 12'h3b6;
      expv[39] = 12'h805;
      expv[40] = 12'h89d;
      expv[41] = 12'h89d;
      expv[42] = 12'hc85;
      expv[43] = 12'hc85;
      expv[44] = 12'hc80;
      expv[45] = 12'ha1d;
      expv[46] = 12'ha18;
      expv[47] = 12'ha18;
      expv[48] = 12'h218;
      expv[49] = 12'ha18;
      expv[50] = 12'ha18;
      expv[51] = 12'hf05;
      expv[52] = 12'h700;
      expv[53] = 12'hf00;
      expv[54] = 12'hf00;
      expv[55] = 12'hf00;
      expv[56] = 12'hf00;
      expv[57] = 12'he55;
      expv[58] = 12'h656;
      expv[59] = 12'h9bd;
      expv[60] = 12'ha85;
      expv[61] = 12'h286;
      expv[62] = 12'h286;
      expv[63] = 12'h286;
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
