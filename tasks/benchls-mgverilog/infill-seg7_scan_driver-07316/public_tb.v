// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07316 dut (
    .clk(clk),
    .data(in_vec[15:0]),
    .out_dig(out_vec[11:8]),
    .out_seg(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h51d0;
    stim[1] = 16'hf1e1;
    stim[2] = 16'h2918;
    stim[3] = 16'h086a;
    stim[4] = 16'hcc1f;
    stim[5] = 16'h42c0;
    stim[6] = 16'h31af;
    stim[7] = 16'hebe9;
    stim[8] = 16'h2192;
    stim[9] = 16'h5e48;
    stim[10] = 16'hdc72;
    stim[11] = 16'hd7d2;
    stim[12] = 16'hf519;
    stim[13] = 16'ha83f;
    stim[14] = 16'haacb;
    stim[15] = 16'h56de;
    stim[16] = 16'h8f4c;
    stim[17] = 16'hfb68;
    stim[18] = 16'h3c41;
    stim[19] = 16'h4ec9;
    stim[20] = 16'h373c;
    stim[21] = 16'h56a0;
    stim[22] = 16'h762e;
    stim[23] = 16'h33bd;
    stim[24] = 16'h1434;
    stim[25] = 16'hf9c0;
    stim[26] = 16'h9797;
    stim[27] = 16'h95cc;
    stim[28] = 16'h251f;
    stim[29] = 16'h7009;
    stim[30] = 16'h8758;
    stim[31] = 16'h1c04;
    stim[32] = 16'h6ef3;
    stim[33] = 16'hf768;
    stim[34] = 16'h076f;
    stim[35] = 16'h1e1e;
    stim[36] = 16'h3f0d;
    stim[37] = 16'hc504;
    stim[38] = 16'h68c7;
    stim[39] = 16'h271a;
    stim[40] = 16'hc17c;
    stim[41] = 16'h6af7;
    stim[42] = 16'h90eb;
    stim[43] = 16'h42bb;
    stim[44] = 16'hf201;
    stim[45] = 16'h1eee;
    stim[46] = 16'h3aa7;
    stim[47] = 16'hab8c;
    stim[48] = 16'h5a46;
    stim[49] = 16'hf84a;
    stim[50] = 16'h986d;
    stim[51] = 16'hb5ed;
    stim[52] = 16'h96ad;
    stim[53] = 16'hdcd3;
    stim[54] = 16'h37e4;
    stim[55] = 16'h15a1;
    stim[56] = 16'heece;
    stim[57] = 16'hf215;
    stim[58] = 16'h7f26;
    stim[59] = 16'h7de5;
    stim[60] = 16'hdcaf;
    stim[61] = 16'h4c8c;
    stim[62] = 16'h82ce;
    stim[63] = 16'hf36a;
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
      expv[0] = 12'hexx;
      expv[1] = 12'hexx;
      expv[2] = 12'hexx;
      expv[3] = 12'hexx;
      expv[4] = 12'hexx;
      expv[5] = 12'hexx;
      expv[6] = 12'hexx;
      expv[7] = 12'hexx;
      expv[8] = 12'hexx;
      expv[9] = 12'hexx;
      expv[10] = 12'hexx;
      expv[11] = 12'hexx;
      expv[12] = 12'hexx;
      expv[13] = 12'hexx;
      expv[14] = 12'hexx;
      expv[15] = 12'hexx;
      expv[16] = 12'hexx;
      expv[17] = 12'hexx;
      expv[18] = 12'hexx;
      expv[19] = 12'hexx;
      expv[20] = 12'hexx;
      expv[21] = 12'hexx;
      expv[22] = 12'hexx;
      expv[23] = 12'hexx;
      expv[24] = 12'hexx;
      expv[25] = 12'hexx;
      expv[26] = 12'hexx;
      expv[27] = 12'hexx;
      expv[28] = 12'hexx;
      expv[29] = 12'hexx;
      expv[30] = 12'hexx;
      expv[31] = 12'hexx;
      expv[32] = 12'hexx;
      expv[33] = 12'hexx;
      expv[34] = 12'hexx;
      expv[35] = 12'hexx;
      expv[36] = 12'hexx;
      expv[37] = 12'hexx;
      expv[38] = 12'hexx;
      expv[39] = 12'hexx;
      expv[40] = 12'hexx;
      expv[41] = 12'hexx;
      expv[42] = 12'hexx;
      expv[43] = 12'hexx;
      expv[44] = 12'hexx;
      expv[45] = 12'hexx;
      expv[46] = 12'hexx;
      expv[47] = 12'hexx;
      expv[48] = 12'hexx;
      expv[49] = 12'hexx;
      expv[50] = 12'hexx;
      expv[51] = 12'hexx;
      expv[52] = 12'hexx;
      expv[53] = 12'hexx;
      expv[54] = 12'hexx;
      expv[55] = 12'hexx;
      expv[56] = 12'hexx;
      expv[57] = 12'hexx;
      expv[58] = 12'hexx;
      expv[59] = 12'hexx;
      expv[60] = 12'hexx;
      expv[61] = 12'hexx;
      expv[62] = 12'hexx;
      expv[63] = 12'hexx;
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
