// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08369 dut (
    .Clk(clk),
    .Data_in(in_vec[19:4]),
    .ip_resetn(in_vec[3:3]),
    .global_resetn(in_vec[2:2]),
    .write(in_vec[1:1]),
    .write_enable(in_vec[0:0]),
    .Data_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hb4037;
    stim[1] = 20'hf1ab0;
    stim[2] = 20'hca1fc;
    stim[3] = 20'h576ab;
    stim[4] = 20'hb6d1a;
    stim[5] = 20'h0d5be;
    stim[6] = 20'h01afd;
    stim[7] = 20'hefb6d;
    stim[8] = 20'ha013f;
    stim[9] = 20'h9978b;
    stim[10] = 20'ha347a;
    stim[11] = 20'hce81f;
    stim[12] = 20'h8ccd9;
    stim[13] = 20'h9fd8e;
    stim[14] = 20'h9b699;
    stim[15] = 20'hbc86a;
    stim[16] = 20'hf43bf;
    stim[17] = 20'he47ad;
    stim[18] = 20'h7ba37;
    stim[19] = 20'h8445b;
    stim[20] = 20'hc148f;
    stim[21] = 20'hf829e;
    stim[22] = 20'h163e8;
    stim[23] = 20'hc8aac;
    stim[24] = 20'hfbf18;
    stim[25] = 20'h4529a;
    stim[26] = 20'he16dd;
    stim[27] = 20'h3f4a8;
    stim[28] = 20'hcb19e;
    stim[29] = 20'h0a6d9;
    stim[30] = 20'h255ee;
    stim[31] = 20'h47d48;
    stim[32] = 20'h2151f;
    stim[33] = 20'he6179;
    stim[34] = 20'h1ab89;
    stim[35] = 20'h156cb;
    stim[36] = 20'ha324b;
    stim[37] = 20'h3a55f;
    stim[38] = 20'hc592f;
    stim[39] = 20'hf5c5a;
    stim[40] = 20'h748ab;
    stim[41] = 20'h441ac;
    stim[42] = 20'h882fc;
    stim[43] = 20'h70fcd;
    stim[44] = 20'h4a6fa;
    stim[45] = 20'hff839;
    stim[46] = 20'h8bf9e;
    stim[47] = 20'h7279b;
    stim[48] = 20'h7a3be;
    stim[49] = 20'h5266f;
    stim[50] = 20'h4398c;
    stim[51] = 20'h934db;
    stim[52] = 20'h18a7f;
    stim[53] = 20'h834d8;
    stim[54] = 20'h4217f;
    stim[55] = 20'hed18e;
    stim[56] = 20'hdae2f;
    stim[57] = 20'h216ab;
    stim[58] = 20'h65cb8;
    stim[59] = 20'hdb399;
    stim[60] = 20'h5c719;
    stim[61] = 20'hfe7cc;
    stim[62] = 20'h6fdec;
    stim[63] = 20'h56948;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h576a;
      expv[5] = 16'h576a;
      expv[6] = 16'h576a;
      expv[7] = 16'h576b;
      expv[8] = 16'h576b;
      expv[9] = 16'h576b;
      expv[10] = 16'h576b;
      expv[11] = 16'h576b;
      expv[12] = 16'h576b;
      expv[13] = 16'h576b;
      expv[14] = 16'h576b;
      expv[15] = 16'h576b;
      expv[16] = 16'h576b;
      expv[17] = 16'h576b;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h8444;
      expv[21] = 16'h8444;
      expv[22] = 16'h8444;
      expv[23] = 16'h8445;
      expv[24] = 16'h8445;
      expv[25] = 16'h8445;
      expv[26] = 16'h8445;
      expv[27] = 16'h8445;
      expv[28] = 16'h8445;
      expv[29] = 16'h8445;
      expv[30] = 16'h8445;
      expv[31] = 16'h8445;
      expv[32] = 16'h8445;
      expv[33] = 16'h8445;
      expv[34] = 16'h8445;
      expv[35] = 16'h8445;
      expv[36] = 16'h8445;
      expv[37] = 16'h8445;
      expv[38] = 16'h8445;
      expv[39] = 16'h8445;
      expv[40] = 16'h8445;
      expv[41] = 16'h8445;
      expv[42] = 16'h8445;
      expv[43] = 16'h8445;
      expv[44] = 16'h8445;
      expv[45] = 16'h8445;
      expv[46] = 16'h8445;
      expv[47] = 16'h8445;
      expv[48] = 16'h8445;
      expv[49] = 16'h8445;
      expv[50] = 16'h8445;
      expv[51] = 16'h8445;
      expv[52] = 16'h8445;
      expv[53] = 16'h8445;
      expv[54] = 16'h8445;
      expv[55] = 16'h8445;
      expv[56] = 16'h8445;
      expv[57] = 16'h8445;
      expv[58] = 16'h8445;
      expv[59] = 16'h8445;
      expv[60] = 16'h8445;
      expv[61] = 16'h8445;
      expv[62] = 16'h8445;
      expv[63] = 16'h8445;
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
