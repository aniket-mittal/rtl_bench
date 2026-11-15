// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03788 dut (
    .dec_in(in_vec[22:7]),
    .parity_in(in_vec[6:1]),
    .ecc_en(in_vec[0:0]),
    .dec_out(out_vec[17:2]),
    .error(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h3b3a2b;
    stim[1] = 23'h0b30c1;
    stim[2] = 23'h243383;
    stim[3] = 23'h05a1ef;
    stim[4] = 23'h1739f9;
    stim[5] = 23'h214fc4;
    stim[6] = 23'h4b36cd;
    stim[7] = 23'h6505fe;
    stim[8] = 23'h3a4fd2;
    stim[9] = 23'h5eb074;
    stim[10] = 23'h540fc5;
    stim[11] = 23'h082c5e;
    stim[12] = 23'h3e7de0;
    stim[13] = 23'h7b5528;
    stim[14] = 23'h1046f0;
    stim[15] = 23'h7a05e0;
    stim[16] = 23'h273fdc;
    stim[17] = 23'h623736;
    stim[18] = 23'h59639a;
    stim[19] = 23'h0d3ee0;
    stim[20] = 23'h25d4b6;
    stim[21] = 23'h742281;
    stim[22] = 23'h09675e;
    stim[23] = 23'h606a72;
    stim[24] = 23'h06af59;
    stim[25] = 23'h05d513;
    stim[26] = 23'h531c67;
    stim[27] = 23'h4b3ea5;
    stim[28] = 23'h451151;
    stim[29] = 23'h45c724;
    stim[30] = 23'h000912;
    stim[31] = 23'h09e26a;
    stim[32] = 23'h5be04c;
    stim[33] = 23'h450f7d;
    stim[34] = 23'h6e4fe6;
    stim[35] = 23'h296df5;
    stim[36] = 23'h0e9430;
    stim[37] = 23'h0222be;
    stim[38] = 23'h02a935;
    stim[39] = 23'h7a5084;
    stim[40] = 23'h55c810;
    stim[41] = 23'h765e31;
    stim[42] = 23'h2e0ca2;
    stim[43] = 23'h48bf79;
    stim[44] = 23'h18931b;
    stim[45] = 23'h5b142a;
    stim[46] = 23'h151de0;
    stim[47] = 23'h69d8cd;
    stim[48] = 23'h592a6d;
    stim[49] = 23'h4a7b49;
    stim[50] = 23'h2da5d5;
    stim[51] = 23'h31fbdf;
    stim[52] = 23'h2ca4f8;
    stim[53] = 23'h26e20d;
    stim[54] = 23'h49966c;
    stim[55] = 23'h330e44;
    stim[56] = 23'h1ec6ea;
    stim[57] = 23'h14987b;
    stim[58] = 23'h5bf556;
    stim[59] = 23'h44216e;
    stim[60] = 23'h617878;
    stim[61] = 23'h61a451;
    stim[62] = 23'h6308ae;
    stim[63] = 23'h0ef1eb;
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
      expv[0] = 18'h1d9d2;
      expv[1] = 18'h07987;
      expv[2] = 18'h1219e;
      expv[3] = 18'h02d0f;
      expv[4] = 18'h099cf;
      expv[5] = 18'h10a7e;
      expv[6] = 18'h259b6;
      expv[7] = 18'h3282d;
      expv[8] = 18'h1d27f;
      expv[9] = 18'h2f582;
      expv[10] = 18'h2a07e;
      expv[11] = 18'h04163;
      expv[12] = 18'h1f3ee;
      expv[13] = 18'h3daaa;
      expv[14] = 18'h08236;
      expv[15] = 18'h3d02e;
      expv[16] = 18'h139fd;
      expv[17] = 18'h311ba;
      expv[18] = 18'h2cb1e;
      expv[19] = 18'h069f7;
      expv[20] = 18'h12ea6;
      expv[21] = 18'h3a517;
      expv[22] = 18'h04b3a;
      expv[23] = 18'h30352;
      expv[24] = 18'h0357b;
      expv[25] = 18'h02eab;
      expv[26] = 18'h298e3;
      expv[27] = 18'h259f6;
      expv[28] = 18'h22c8b;
      expv[29] = 18'h22e3a;
      expv[30] = 18'h0004a;
      expv[31] = 18'h04f12;
      expv[32] = 18'h2df03;
      expv[33] = 18'h2287a;
      expv[34] = 18'h3727f;
      expv[35] = 18'h14b6f;
      expv[36] = 18'h074a2;
      expv[37] = 18'h01117;
      expv[38] = 18'h0154a;
      expv[39] = 18'h3d287;
      expv[40] = 18'h2ae42;
      expv[41] = 18'h3b2f2;
      expv[42] = 18'h17065;
      expv[43] = 18'h245fb;
      expv[44] = 18'h0c49b;
      expv[45] = 18'h2d8a2;
      expv[46] = 18'h0a8ee;
      expv[47] = 18'h34ec6;
      expv[48] = 18'h2c953;
      expv[49] = 18'h252db;
      expv[50] = 18'h16d2e;
      expv[51] = 18'h18fde;
      expv[52] = 18'h16527;
      expv[53] = 18'h13711;
      expv[54] = 18'h24cb3;
      expv[55] = 18'h19873;
      expv[56] = 18'h0f637;
      expv[57] = 18'h0a4c2;
      expv[58] = 18'h2dfab;
      expv[59] = 18'h2210b;
      expv[60] = 18'h30bc3;
      expv[61] = 18'h30d22;
      expv[62] = 18'h31846;
      expv[63] = 18'h0778f;
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
