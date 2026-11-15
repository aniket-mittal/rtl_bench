// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mux2_mux_internal dut (
    .data(in_vec[32:1]),
    .sel(in_vec[0:0]),
    .result(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h0d22b0772;
    stim[1] = 33'h17fe4b8e4;
    stim[2] = 33'h19811bf21;
    stim[3] = 33'h124a800e2;
    stim[4] = 33'h1b8348374;
    stim[5] = 33'h01bf50b46;
    stim[6] = 33'h041af8404;
    stim[7] = 33'h02463dab2;
    stim[8] = 33'h1f88dd0e1;
    stim[9] = 33'h115b0b1d7;
    stim[10] = 33'h0228b9ae2;
    stim[11] = 33'h004a1d4b1;
    stim[12] = 33'h069c39667;
    stim[13] = 33'h0baaea206;
    stim[14] = 33'h1b1137d65;
    stim[15] = 33'h00b4e20ad;
    stim[16] = 33'h1d4ef4c07;
    stim[17] = 33'h0d612b595;
    stim[18] = 33'h14c693f34;
    stim[19] = 33'h0c46677ff;
    stim[20] = 33'h08d4032ce;
    stim[21] = 33'h019dfddd4;
    stim[22] = 33'h0eb9061e0;
    stim[23] = 33'h06bbe5cb9;
    stim[24] = 33'h1c7beb311;
    stim[25] = 33'h1c230389e;
    stim[26] = 33'h025e47ca6;
    stim[27] = 33'h1ad873c25;
    stim[28] = 33'h04c0255da;
    stim[29] = 33'h02040d8a3;
    stim[30] = 33'h1f508c709;
    stim[31] = 33'h15705ec03;
    stim[32] = 33'h1b4f4d236;
    stim[33] = 33'h082f6b16b;
    stim[34] = 33'h03148c346;
    stim[35] = 33'h178bb8c72;
    stim[36] = 33'h043700745;
    stim[37] = 33'h0367aee07;
    stim[38] = 33'h09ff3e22b;
    stim[39] = 33'h08e3de77c;
    stim[40] = 33'h0c231ed14;
    stim[41] = 33'h147573e74;
    stim[42] = 33'h0b205c3ed;
    stim[43] = 33'h1f796f710;
    stim[44] = 33'h1b9973e80;
    stim[45] = 33'h1908dd941;
    stim[46] = 33'h0dfff0857;
    stim[47] = 33'h17fbd2069;
    stim[48] = 33'h0013b217d;
    stim[49] = 33'h07f10cdc1;
    stim[50] = 33'h06a234429;
    stim[51] = 33'h0ded3ff85;
    stim[52] = 33'h02851a9e1;
    stim[53] = 33'h17f80a7b9;
    stim[54] = 33'h16748b2da;
    stim[55] = 33'h1a4e606ba;
    stim[56] = 33'h19f606a9e;
    stim[57] = 33'h072ddce9c;
    stim[58] = 33'h183dbc5fd;
    stim[59] = 33'h1d43225d9;
    stim[60] = 33'h03e317eb3;
    stim[61] = 33'h1bb1abf4e;
    stim[62] = 33'h10e8971f0;
    stim[63] = 33'h17c4ad1ef;
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
      expv[0] = 16'h83b9;
      expv[1] = 16'h5c72;
      expv[2] = 16'hcc08;
      expv[3] = 16'h0071;
      expv[4] = 16'h41ba;
      expv[5] = 16'h85a3;
      expv[6] = 16'hc202;
      expv[7] = 16'hed59;
      expv[8] = 16'hfc46;
      expv[9] = 16'h8ad8;
      expv[10] = 16'hcd71;
      expv[11] = 16'h0250;
      expv[12] = 16'h34e1;
      expv[13] = 16'h5103;
      expv[14] = 16'hd889;
      expv[15] = 16'h05a7;
      expv[16] = 16'hea77;
      expv[17] = 16'h6b09;
      expv[18] = 16'h9f9a;
      expv[19] = 16'h6233;
      expv[20] = 16'h1967;
      expv[21] = 16'heeea;
      expv[22] = 16'h30f0;
      expv[23] = 16'h35df;
      expv[24] = 16'he3df;
      expv[25] = 16'h1c4f;
      expv[26] = 16'h3e53;
      expv[27] = 16'hd6c3;
      expv[28] = 16'h2aed;
      expv[29] = 16'h1020;
      expv[30] = 16'hfa84;
      expv[31] = 16'hab82;
      expv[32] = 16'h691b;
      expv[33] = 16'h417b;
      expv[34] = 16'h61a3;
      expv[35] = 16'hc639;
      expv[36] = 16'h21b8;
      expv[37] = 16'h1b3d;
      expv[38] = 16'h4ff9;
      expv[39] = 16'hf3be;
      expv[40] = 16'hf68a;
      expv[41] = 16'h9f3a;
      expv[42] = 16'h5902;
      expv[43] = 16'h7b88;
      expv[44] = 16'h9f40;
      expv[45] = 16'hc846;
      expv[46] = 16'h6fff;
      expv[47] = 16'hbfde;
      expv[48] = 16'h009d;
      expv[49] = 16'h3f88;
      expv[50] = 16'h3511;
      expv[51] = 16'h6f69;
      expv[52] = 16'h1428;
      expv[53] = 16'hbfc0;
      expv[54] = 16'h596d;
      expv[55] = 16'h035d;
      expv[56] = 16'h354f;
      expv[57] = 16'he74e;
      expv[58] = 16'hc1ed;
      expv[59] = 16'hea19;
      expv[60] = 16'h1f18;
      expv[61] = 16'h5fa7;
      expv[62] = 16'hb8f8;
      expv[63] = 16'hbe25;
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
