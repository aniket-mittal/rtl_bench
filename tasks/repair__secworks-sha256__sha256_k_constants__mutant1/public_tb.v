// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .round(in_vec[5:0]),
    .K(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h1a;
    stim[1] = 6'h3a;
    stim[2] = 6'h39;
    stim[3] = 6'h05;
    stim[4] = 6'h11;
    stim[5] = 6'h31;
    stim[6] = 6'h37;
    stim[7] = 6'h0a;
    stim[8] = 6'h2e;
    stim[9] = 6'h27;
    stim[10] = 6'h32;
    stim[11] = 6'h30;
    stim[12] = 6'h0b;
    stim[13] = 6'h14;
    stim[14] = 6'h18;
    stim[15] = 6'h3b;
    stim[16] = 6'h07;
    stim[17] = 6'h1d;
    stim[18] = 6'h34;
    stim[19] = 6'h3a;
    stim[20] = 6'h20;
    stim[21] = 6'h2f;
    stim[22] = 6'h10;
    stim[23] = 6'h23;
    stim[24] = 6'h1d;
    stim[25] = 6'h34;
    stim[26] = 6'h2f;
    stim[27] = 6'h33;
    stim[28] = 6'h12;
    stim[29] = 6'h16;
    stim[30] = 6'h13;
    stim[31] = 6'h12;
    stim[32] = 6'h31;
    stim[33] = 6'h27;
    stim[34] = 6'h1a;
    stim[35] = 6'h0b;
    stim[36] = 6'h07;
    stim[37] = 6'h3c;
    stim[38] = 6'h33;
    stim[39] = 6'h1e;
    stim[40] = 6'h03;
    stim[41] = 6'h12;
    stim[42] = 6'h2a;
    stim[43] = 6'h37;
    stim[44] = 6'h30;
    stim[45] = 6'h05;
    stim[46] = 6'h25;
    stim[47] = 6'h1e;
    stim[48] = 6'h21;
    stim[49] = 6'h10;
    stim[50] = 6'h2f;
    stim[51] = 6'h04;
    stim[52] = 6'h29;
    stim[53] = 6'h20;
    stim[54] = 6'h16;
    stim[55] = 6'h3f;
    stim[56] = 6'h35;
    stim[57] = 6'h1c;
    stim[58] = 6'h0b;
    stim[59] = 6'h13;
    stim[60] = 6'h05;
    stim[61] = 6'h10;
    stim[62] = 6'h26;
    stim[63] = 6'h18;
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
      expv[0] = 32'h4ffcd837;
      expv[1] = 32'h7b3787eb;
      expv[2] = 32'h875a9c90;
      expv[3] = 32'ha60eee0e;
      expv[4] = 32'h1041b879;
      expv[5] = 32'he1c893f7;
      expv[6] = 32'h97d1900c;
      expv[7] = 32'hdbce7a41;
      expv[8] = 32'h0bf1ca7a;
      expv[9] = 32'h6d8dd37a;
      expv[10] = 32'hd8b788b3;
      expv[11] = 32'he65b3ee9;
      expv[12] = 32'haaf3823c;
      expv[13] = 32'hd216d390;
      expv[14] = 32'h67c1aead;
      expv[15] = 32'h7338fdf7;
      expv[16] = 32'h54e3a12a;
      expv[17] = 32'h2a586eb8;
      expv[18] = 32'hc6e3f34c;
      expv[19] = 32'h7b3787eb;
      expv[20] = 32'hd848f57a;
      expv[21] = 32'hef955f8f;
      expv[22] = 32'h1b64963e;
      expv[23] = 32'hacc7f2ec;
      expv[24] = 32'h2a586eb8;
      expv[25] = 32'hc6e3f34c;
      expv[26] = 32'hef955f8f;
      expv[27] = 32'hcb4f434a;
      expv[28] = 32'hf03e6239;
      expv[29] = 32'ha34f5623;
      expv[30] = 32'hdbf35e33;
      expv[31] = 32'hf03e6239;
      expv[32] = 32'he1c893f7;
      expv[33] = 32'h6d8dd37a;
      expv[34] = 32'h4ffcd837;
      expv[35] = 32'haaf3823c;
      expv[36] = 32'h54e3a12a;
      expv[37] = 32'h6f410005;
      expv[38] = 32'hcb4f434a;
      expv[39] = 32'hf9359cae;
      expv[40] = 32'h164a245a;
      expv[41] = 32'hf03e6239;
      expv[42] = 32'h3db4748f;
      expv[43] = 32'h97d1900c;
      expv[44] = 32'he65b3ee9;
      expv[45] = 32'ha60eee0e;
      expv[46] = 32'h8995f544;
      expv[47] = 32'hf9359cae;
      expv[48] = 32'hd1e4dec7;
      expv[49] = 32'h1b64963e;
      expv[50] = 32'hef955f8f;
      expv[51] = 32'hc6a93da4;
      expv[52] = 32'h57e599b4;
      expv[53] = 32'hd848f57a;
      expv[54] = 32'ha34f5623;
      expv[55] = 32'h398e870d;
      expv[56] = 32'hb12755b5;
      expv[57] = 32'h391ff40c;
      expv[58] = 32'haaf3823c;
      expv[59] = 32'hdbf35e33;
      expv[60] = 32'ha60eee0e;
      expv[61] = 32'h1b64963e;
      expv[62] = 32'h7e3d36d1;
      expv[63] = 32'h67c1aead;
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
