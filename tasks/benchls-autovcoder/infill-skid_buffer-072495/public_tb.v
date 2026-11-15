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

  autovcoder_072495 dut (
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
    stim[0] = 11'h4db;
    stim[1] = 11'h654;
    stim[2] = 11'h2e3;
    stim[3] = 11'h1ee;
    stim[4] = 11'h4d3;
    stim[5] = 11'h129;
    stim[6] = 11'h146;
    stim[7] = 11'h383;
    stim[8] = 11'h288;
    stim[9] = 11'h39a;
    stim[10] = 11'h2e1;
    stim[11] = 11'h2f0;
    stim[12] = 11'h38f;
    stim[13] = 11'h1fb;
    stim[14] = 11'h134;
    stim[15] = 11'h381;
    stim[16] = 11'h259;
    stim[17] = 11'h260;
    stim[18] = 11'h1f4;
    stim[19] = 11'h29f;
    stim[20] = 11'h38a;
    stim[21] = 11'h10e;
    stim[22] = 11'h1f2;
    stim[23] = 11'h363;
    stim[24] = 11'h059;
    stim[25] = 11'h305;
    stim[26] = 11'h0bc;
    stim[27] = 11'h23d;
    stim[28] = 11'h293;
    stim[29] = 11'h050;
    stim[30] = 11'h098;
    stim[31] = 11'h0b5;
    stim[32] = 11'h3de;
    stim[33] = 11'h1c6;
    stim[34] = 11'h1bd;
    stim[35] = 11'h274;
    stim[36] = 11'h38d;
    stim[37] = 11'h267;
    stim[38] = 11'h346;
    stim[39] = 11'h10f;
    stim[40] = 11'h383;
    stim[41] = 11'h24c;
    stim[42] = 11'h0aa;
    stim[43] = 11'h058;
    stim[44] = 11'h0d1;
    stim[45] = 11'h07f;
    stim[46] = 11'h085;
    stim[47] = 11'h369;
    stim[48] = 11'h162;
    stim[49] = 11'h369;
    stim[50] = 11'h03e;
    stim[51] = 11'h2b1;
    stim[52] = 11'h383;
    stim[53] = 11'h013;
    stim[54] = 11'h2c1;
    stim[55] = 11'h3e4;
    stim[56] = 11'h3c6;
    stim[57] = 11'h270;
    stim[58] = 11'h261;
    stim[59] = 11'h261;
    stim[60] = 11'h13e;
    stim[61] = 11'h2c1;
    stim[62] = 11'h253;
    stim[63] = 11'h0d1;
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
      expv[3] = 12'hdc0;
      expv[4] = 12'hbdd;
      expv[5] = 12'h1a0;
      expv[6] = 12'h9a0;
      expv[7] = 12'ha8d;
      expv[8] = 12'hf05;
      expv[9] = 12'hf05;
      expv[10] = 12'h706;
      expv[11] = 12'hf35;
      expv[12] = 12'hf35;
      expv[13] = 12'hf1d;
      expv[14] = 12'hbf5;
      expv[15] = 12'hbf5;
      expv[16] = 12'hbf0;
      expv[17] = 12'hbf0;
      expv[18] = 12'hbf0;
      expv[19] = 12'hbf0;
      expv[20] = 12'hd3d;
      expv[21] = 12'h53e;
      expv[22] = 12'h53e;
      expv[23] = 12'h53e;
      expv[24] = 12'hf15;
      expv[25] = 12'hf10;
      expv[26] = 12'hf10;
      expv[27] = 12'hf10;
      expv[28] = 12'hf10;
      expv[29] = 12'hd25;
      expv[30] = 12'hd25;
      expv[31] = 12'hd25;
      expv[32] = 12'hd20;
      expv[33] = 12'hfbd;
      expv[34] = 12'h7be;
      expv[35] = 12'hb8d;
      expv[36] = 12'hb8d;
      expv[37] = 12'hb88;
      expv[38] = 12'hccd;
      expv[39] = 12'h4ce;
      expv[40] = 12'he8d;
      expv[41] = 12'hf05;
      expv[42] = 12'hf05;
      expv[43] = 12'h706;
      expv[44] = 12'h706;
      expv[45] = 12'h955;
      expv[46] = 12'h8fd;
      expv[47] = 12'h8f8;
      expv[48] = 12'h8f8;
      expv[49] = 12'hac5;
      expv[50] = 12'hac0;
      expv[51] = 12'h87d;
      expv[52] = 12'h878;
      expv[53] = 12'hf05;
      expv[54] = 12'h825;
      expv[55] = 12'h820;
      expv[56] = 12'h820;
      expv[57] = 12'hf8d;
      expv[58] = 12'hf8d;
      expv[59] = 12'hf88;
      expv[60] = 12'hf88;
      expv[61] = 12'ha7d;
      expv[62] = 12'ha78;
      expv[63] = 12'hca5;
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
