// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_119989 dut (
    .iClk(clk),
    .iClrn(in_vec[11:11]),
    .iData(in_vec[10:3]),
    .iValid(in_vec[2:2]),
    .iReq(in_vec[1:1]),
    .iPsync(in_vec[0:0]),
    .oData(out_vec[12:5]),
    .oValid(out_vec[4:4]),
    .oEmpty(out_vec[3:3]),
    .oFull(out_vec[2:2]),
    .oPSync(out_vec[1:1]),
    .oCheck(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h295;
    stim[1] = 12'h22a;
    stim[2] = 12'h9bb;
    stim[3] = 12'h94c;
    stim[4] = 12'hbf3;
    stim[5] = 12'hd7f;
    stim[6] = 12'he66;
    stim[7] = 12'h899;
    stim[8] = 12'hf27;
    stim[9] = 12'he26;
    stim[10] = 12'hfad;
    stim[11] = 12'hd6a;
    stim[12] = 12'hd8b;
    stim[13] = 12'hbc0;
    stim[14] = 12'hfe7;
    stim[15] = 12'heaf;
    stim[16] = 12'hbe4;
    stim[17] = 12'hf34;
    stim[18] = 12'heb2;
    stim[19] = 12'hd68;
    stim[20] = 12'hddf;
    stim[21] = 12'h882;
    stim[22] = 12'hdb3;
    stim[23] = 12'h823;
    stim[24] = 12'hc18;
    stim[25] = 12'he87;
    stim[26] = 12'hbcb;
    stim[27] = 12'hbec;
    stim[28] = 12'hf18;
    stim[29] = 12'hfd6;
    stim[30] = 12'h9b5;
    stim[31] = 12'hb18;
    stim[32] = 12'h9a9;
    stim[33] = 12'hcba;
    stim[34] = 12'hea9;
    stim[35] = 12'h90e;
    stim[36] = 12'hdbb;
    stim[37] = 12'hdfd;
    stim[38] = 12'hd32;
    stim[39] = 12'ha95;
    stim[40] = 12'h970;
    stim[41] = 12'h9e8;
    stim[42] = 12'h862;
    stim[43] = 12'h813;
    stim[44] = 12'had2;
    stim[45] = 12'hf5b;
    stim[46] = 12'h928;
    stim[47] = 12'hbe3;
    stim[48] = 12'h93f;
    stim[49] = 12'h83b;
    stim[50] = 12'hca5;
    stim[51] = 12'h9e9;
    stim[52] = 12'hbc6;
    stim[53] = 12'h8e8;
    stim[54] = 12'ha8b;
    stim[55] = 12'hca8;
    stim[56] = 12'hbb6;
    stim[57] = 12'hdbb;
    stim[58] = 12'hae4;
    stim[59] = 12'he6f;
    stim[60] = 12'hd58;
    stim[61] = 12'h814;
    stim[62] = 12'h278;
    stim[63] = 12'he1c;
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
      expv[0] = 13'h0008;
      expv[1] = 13'h0008;
      expv[2] = 13'h0008;
      expv[3] = 13'h000a;
      expv[4] = 13'h08fa;
      expv[5] = 13'h03f0;
      expv[6] = 13'h1ff0;
      expv[7] = 13'h0210;
      expv[8] = 13'h1ff0;
      expv[9] = 13'h1ff0;
      expv[10] = 13'h1ff0;
      expv[11] = 13'h1ff0;
      expv[12] = 13'h1ff0;
      expv[13] = 13'h1ff0;
      expv[14] = 13'h1ff0;
      expv[15] = 13'h1ff0;
      expv[16] = 13'h1ff0;
      expv[17] = 13'h1ff0;
      expv[18] = 13'h1ff0;
      expv[19] = 13'h1ff0;
      expv[20] = 13'h1ff0;
      expv[21] = 13'h1ff0;
      expv[22] = 13'h1ff0;
      expv[23] = 13'h1ff0;
      expv[24] = 13'h1ff0;
      expv[25] = 13'h1ff0;
      expv[26] = 13'h1ff0;
      expv[27] = 13'h1ff0;
      expv[28] = 13'h1ff0;
      expv[29] = 13'h1ff0;
      expv[30] = 13'h1ff0;
      expv[31] = 13'h1ff0;
      expv[32] = 13'h1ff0;
      expv[33] = 13'h1ff0;
      expv[34] = 13'h1ff0;
      expv[35] = 13'h1ff0;
      expv[36] = 13'h1ff0;
      expv[37] = 13'h1ff0;
      expv[38] = 13'h1ff0;
      expv[39] = 13'h1ff0;
      expv[40] = 13'h1ff0;
      expv[41] = 13'h1ff0;
      expv[42] = 13'h1ff0;
      expv[43] = 13'h1ff0;
      expv[44] = 13'h1ff0;
      expv[45] = 13'h1ff0;
      expv[46] = 13'h1ff0;
      expv[47] = 13'h1ff0;
      expv[48] = 13'h1ff0;
      expv[49] = 13'h1ff0;
      expv[50] = 13'h1ff0;
      expv[51] = 13'h1ff0;
      expv[52] = 13'h1ff0;
      expv[53] = 13'h1ff0;
      expv[54] = 13'h1ff0;
      expv[55] = 13'h1ff0;
      expv[56] = 13'h1ff0;
      expv[57] = 13'h1ff0;
      expv[58] = 13'h1ff0;
      expv[59] = 13'h1ff0;
      expv[60] = 13'h1ff0;
      expv[61] = 13'h1ff0;
      expv[62] = 13'h0008;
      expv[63] = 13'h0008;
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
