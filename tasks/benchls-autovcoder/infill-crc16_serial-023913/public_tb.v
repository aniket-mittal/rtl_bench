// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_023913 dut (
    .clk(clk),
    .start(in_vec[9:9]),
    .byte_in(in_vec[8:1]),
    .reset(in_vec[0:0]),
    .crc_16(out_vec[16:1]),
    .busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h09f;
    stim[1] = 10'h36d;
    stim[2] = 10'h268;
    stim[3] = 10'h282;
    stim[4] = 10'h342;
    stim[5] = 10'h134;
    stim[6] = 10'h1ce;
    stim[7] = 10'h002;
    stim[8] = 10'h2d0;
    stim[9] = 10'h12c;
    stim[10] = 10'h3e8;
    stim[11] = 10'h076;
    stim[12] = 10'h206;
    stim[13] = 10'h28e;
    stim[14] = 10'h2de;
    stim[15] = 10'h176;
    stim[16] = 10'h35e;
    stim[17] = 10'h1f8;
    stim[18] = 10'h2a0;
    stim[19] = 10'h1d0;
    stim[20] = 10'h306;
    stim[21] = 10'h39e;
    stim[22] = 10'h204;
    stim[23] = 10'h1c4;
    stim[24] = 10'h1f6;
    stim[25] = 10'h22c;
    stim[26] = 10'h1cb;
    stim[27] = 10'h346;
    stim[28] = 10'h142;
    stim[29] = 10'h2fa;
    stim[30] = 10'h3ba;
    stim[31] = 10'h02c;
    stim[32] = 10'h2e4;
    stim[33] = 10'h142;
    stim[34] = 10'h1a6;
    stim[35] = 10'h260;
    stim[36] = 10'h08e;
    stim[37] = 10'h386;
    stim[38] = 10'h14a;
    stim[39] = 10'h2d2;
    stim[40] = 10'h202;
    stim[41] = 10'h184;
    stim[42] = 10'h1bc;
    stim[43] = 10'h0e4;
    stim[44] = 10'h1a8;
    stim[45] = 10'h012;
    stim[46] = 10'h082;
    stim[47] = 10'h238;
    stim[48] = 10'h1e0;
    stim[49] = 10'h3de;
    stim[50] = 10'h356;
    stim[51] = 10'h00a;
    stim[52] = 10'h1ce;
    stim[53] = 10'h24e;
    stim[54] = 10'h1c2;
    stim[55] = 10'h01a;
    stim[56] = 10'h012;
    stim[57] = 10'h316;
    stim[58] = 10'h38a;
    stim[59] = 10'h1fe;
    stim[60] = 10'h02a;
    stim[61] = 10'h26a;
    stim[62] = 10'h33e;
    stim[63] = 10'h098;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'hxxxxx;
      expv[2] = 17'hxxxxx;
      expv[3] = 17'hxxxxx;
      expv[4] = 17'hxxxxx;
      expv[5] = 17'hxxxxx;
      expv[6] = 17'hxxxxx;
      expv[7] = 17'hxxxxx;
      expv[8] = 17'hxxxxx;
      expv[9] = 17'hxxxxx;
      expv[10] = 17'hxxxxx;
      expv[11] = 17'h12f7c;
      expv[12] = 17'h12f7d;
      expv[13] = 17'h12f7d;
      expv[14] = 17'h12f7d;
      expv[15] = 17'h12f7d;
      expv[16] = 17'h12f7d;
      expv[17] = 17'h12f7d;
      expv[18] = 17'h12f7d;
      expv[19] = 17'h12f7d;
      expv[20] = 17'h146ac;
      expv[21] = 17'h146ac;
      expv[22] = 17'h146ad;
      expv[23] = 17'h146ad;
      expv[24] = 17'h146ad;
      expv[25] = 17'h146ad;
      expv[26] = 17'h146ad;
      expv[27] = 17'h146ac;
      expv[28] = 17'h146ac;
      expv[29] = 17'h146ad;
      expv[30] = 17'h146ad;
      expv[31] = 17'h146ad;
      expv[32] = 17'h146ad;
      expv[33] = 17'h146ad;
      expv[34] = 17'h146ad;
      expv[35] = 17'h146ad;
      expv[36] = 17'h146ad;
      expv[37] = 17'h1f0fc;
      expv[38] = 17'h1f0fc;
      expv[39] = 17'h1f0fd;
      expv[40] = 17'h1f0fd;
      expv[41] = 17'h1f0fd;
      expv[42] = 17'h1f0fd;
      expv[43] = 17'h1f0fd;
      expv[44] = 17'h1f0fd;
      expv[45] = 17'h1f0fd;
      expv[46] = 17'h1f0fd;
      expv[47] = 17'h0b770;
      expv[48] = 17'h0b770;
      expv[49] = 17'h0b771;
      expv[50] = 17'h0b771;
      expv[51] = 17'h0b771;
      expv[52] = 17'h0b771;
      expv[53] = 17'h0b771;
      expv[54] = 17'h0b771;
      expv[55] = 17'h0b771;
      expv[56] = 17'h0b771;
      expv[57] = 17'h06cb6;
      expv[58] = 17'h06cb6;
      expv[59] = 17'h06cb7;
      expv[60] = 17'h06cb7;
      expv[61] = 17'h06cb7;
      expv[62] = 17'h06cb7;
      expv[63] = 17'h06cb7;
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
