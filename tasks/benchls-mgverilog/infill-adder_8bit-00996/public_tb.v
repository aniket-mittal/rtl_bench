// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00996 dut (
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .o(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h9558;
    stim[1] = 16'h59b0;
    stim[2] = 16'hcdd8;
    stim[3] = 16'hd4c8;
    stim[4] = 16'h2ecd;
    stim[5] = 16'hd31b;
    stim[6] = 16'h898d;
    stim[7] = 16'h73be;
    stim[8] = 16'h65a2;
    stim[9] = 16'h996e;
    stim[10] = 16'ha945;
    stim[11] = 16'hcc71;
    stim[12] = 16'hba51;
    stim[13] = 16'h9710;
    stim[14] = 16'hdc87;
    stim[15] = 16'ha214;
    stim[16] = 16'h4fa4;
    stim[17] = 16'hf2c6;
    stim[18] = 16'h8739;
    stim[19] = 16'he38c;
    stim[20] = 16'h90e4;
    stim[21] = 16'h0bdf;
    stim[22] = 16'hd8ff;
    stim[23] = 16'ha77b;
    stim[24] = 16'h2c3d;
    stim[25] = 16'h741a;
    stim[26] = 16'hec62;
    stim[27] = 16'hf397;
    stim[28] = 16'hdcec;
    stim[29] = 16'h94df;
    stim[30] = 16'hd7c8;
    stim[31] = 16'h1b42;
    stim[32] = 16'h2dd2;
    stim[33] = 16'h74a6;
    stim[34] = 16'he1c2;
    stim[35] = 16'hfcd9;
    stim[36] = 16'h267f;
    stim[37] = 16'h6eb5;
    stim[38] = 16'h4d45;
    stim[39] = 16'h8f21;
    stim[40] = 16'hd00c;
    stim[41] = 16'hca99;
    stim[42] = 16'h725c;
    stim[43] = 16'he788;
    stim[44] = 16'hb41e;
    stim[45] = 16'h6526;
    stim[46] = 16'hdaed;
    stim[47] = 16'hac04;
    stim[48] = 16'h4702;
    stim[49] = 16'h0a21;
    stim[50] = 16'h2343;
    stim[51] = 16'h2b50;
    stim[52] = 16'h3d4e;
    stim[53] = 16'hcd78;
    stim[54] = 16'h27ca;
    stim[55] = 16'h2c72;
    stim[56] = 16'h0955;
    stim[57] = 16'h5206;
    stim[58] = 16'hed1f;
    stim[59] = 16'h8b07;
    stim[60] = 16'hd95a;
    stim[61] = 16'h9984;
    stim[62] = 16'h8955;
    stim[63] = 16'h5b14;
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
      expv[0] = 9'h0ed;
      expv[1] = 9'h109;
      expv[2] = 9'h1a5;
      expv[3] = 9'h19c;
      expv[4] = 9'h0fb;
      expv[5] = 9'h0ee;
      expv[6] = 9'h116;
      expv[7] = 9'h131;
      expv[8] = 9'h107;
      expv[9] = 9'h107;
      expv[10] = 9'h0ee;
      expv[11] = 9'h13d;
      expv[12] = 9'h10b;
      expv[13] = 9'h0a7;
      expv[14] = 9'h163;
      expv[15] = 9'h0b6;
      expv[16] = 9'h0f3;
      expv[17] = 9'h1b8;
      expv[18] = 9'h0c0;
      expv[19] = 9'h16f;
      expv[20] = 9'h174;
      expv[21] = 9'h0ea;
      expv[22] = 9'h1d7;
      expv[23] = 9'h122;
      expv[24] = 9'h069;
      expv[25] = 9'h08e;
      expv[26] = 9'h14e;
      expv[27] = 9'h18a;
      expv[28] = 9'h1c8;
      expv[29] = 9'h173;
      expv[30] = 9'h19f;
      expv[31] = 9'h05d;
      expv[32] = 9'h0ff;
      expv[33] = 9'h11a;
      expv[34] = 9'h1a3;
      expv[35] = 9'h1d5;
      expv[36] = 9'h0a5;
      expv[37] = 9'h123;
      expv[38] = 9'h092;
      expv[39] = 9'h0b0;
      expv[40] = 9'h0dc;
      expv[41] = 9'h163;
      expv[42] = 9'h0ce;
      expv[43] = 9'h16f;
      expv[44] = 9'h0d2;
      expv[45] = 9'h08b;
      expv[46] = 9'h1c7;
      expv[47] = 9'h0b0;
      expv[48] = 9'h049;
      expv[49] = 9'h02b;
      expv[50] = 9'h066;
      expv[51] = 9'h07b;
      expv[52] = 9'h08b;
      expv[53] = 9'h145;
      expv[54] = 9'h0f1;
      expv[55] = 9'h09e;
      expv[56] = 9'h05e;
      expv[57] = 9'h058;
      expv[58] = 9'h10c;
      expv[59] = 9'h092;
      expv[60] = 9'h133;
      expv[61] = 9'h11d;
      expv[62] = 9'h0de;
      expv[63] = 9'h06f;
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
