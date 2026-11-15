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

  autovcoder_071978 dut (
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
    stim[0] = 11'h5fd;
    stim[1] = 11'h521;
    stim[2] = 11'h07e;
    stim[3] = 11'h362;
    stim[4] = 11'h008;
    stim[5] = 11'h1c8;
    stim[6] = 11'h0a6;
    stim[7] = 11'h392;
    stim[8] = 11'h290;
    stim[9] = 11'h3bc;
    stim[10] = 11'h0c8;
    stim[11] = 11'h0f3;
    stim[12] = 11'h18a;
    stim[13] = 11'h022;
    stim[14] = 11'h238;
    stim[15] = 11'h055;
    stim[16] = 11'h258;
    stim[17] = 11'h09d;
    stim[18] = 11'h082;
    stim[19] = 11'h2d9;
    stim[20] = 11'h380;
    stim[21] = 11'h006;
    stim[22] = 11'h2ea;
    stim[23] = 11'h3d2;
    stim[24] = 11'h23d;
    stim[25] = 11'h134;
    stim[26] = 11'h119;
    stim[27] = 11'h065;
    stim[28] = 11'h0f1;
    stim[29] = 11'h351;
    stim[30] = 11'h0e8;
    stim[31] = 11'h1a8;
    stim[32] = 11'h362;
    stim[33] = 11'h1f1;
    stim[34] = 11'h321;
    stim[35] = 11'h3d3;
    stim[36] = 11'h147;
    stim[37] = 11'h06c;
    stim[38] = 11'h301;
    stim[39] = 11'h30a;
    stim[40] = 11'h1e8;
    stim[41] = 11'h03f;
    stim[42] = 11'h286;
    stim[43] = 11'h3ef;
    stim[44] = 11'h164;
    stim[45] = 11'h105;
    stim[46] = 11'h0ef;
    stim[47] = 11'h26a;
    stim[48] = 11'h25c;
    stim[49] = 11'h3dd;
    stim[50] = 11'h049;
    stim[51] = 11'h03c;
    stim[52] = 11'h07e;
    stim[53] = 11'h168;
    stim[54] = 11'h3d2;
    stim[55] = 11'h627;
    stim[56] = 11'h0b8;
    stim[57] = 11'h359;
    stim[58] = 11'h39f;
    stim[59] = 11'h1dc;
    stim[60] = 11'h048;
    stim[61] = 11'h189;
    stim[62] = 11'h002;
    stim[63] = 11'h359;
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
      expv[3] = 12'h8f8;
      expv[4] = 12'hec5;
      expv[5] = 12'hec5;
      expv[6] = 12'hec5;
      expv[7] = 12'h6c6;
      expv[8] = 12'h6c6;
      expv[9] = 12'h6c6;
      expv[10] = 12'h6c6;
      expv[11] = 12'h6c6;
      expv[12] = 12'h94d;
      expv[13] = 12'h14e;
      expv[14] = 12'h14e;
      expv[15] = 12'h14e;
      expv[16] = 12'hb15;
      expv[17] = 12'hb15;
      expv[18] = 12'hb10;
      expv[19] = 12'h905;
      expv[20] = 12'h900;
      expv[21] = 12'h900;
      expv[22] = 12'h80d;
      expv[23] = 12'h00e;
      expv[24] = 12'h00e;
      expv[25] = 12'hdd5;
      expv[26] = 12'hdd5;
      expv[27] = 12'hdd0;
      expv[28] = 12'hdd0;
      expv[29] = 12'hdd0;
      expv[30] = 12'hdd0;
      expv[31] = 12'hdd0;
      expv[32] = 12'hdd0;
      expv[33] = 12'hec5;
      expv[34] = 12'hec0;
      expv[35] = 12'hec0;
      expv[36] = 12'hfa5;
      expv[37] = 12'ha8d;
      expv[38] = 12'ha8d;
      expv[39] = 12'ha88;
      expv[40] = 12'he15;
      expv[41] = 12'he15;
      expv[42] = 12'h87d;
      expv[43] = 12'h07e;
      expv[44] = 12'hd0d;
      expv[45] = 12'hd0d;
      expv[46] = 12'hd08;
      expv[47] = 12'h9dd;
      expv[48] = 12'h1de;
      expv[49] = 12'h1de;
      expv[50] = 12'hcd5;
      expv[51] = 12'hcd0;
      expv[52] = 12'hcd0;
      expv[53] = 12'h8fd;
      expv[54] = 12'h8fd;
      expv[55] = 12'h0fe;
      expv[56] = 12'h7a0;
      expv[57] = 12'hfa0;
      expv[58] = 12'hfa0;
      expv[59] = 12'hf3d;
      expv[60] = 12'hf3d;
      expv[61] = 12'hf3d;
      expv[62] = 12'hf38;
      expv[63] = 12'h805;
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
