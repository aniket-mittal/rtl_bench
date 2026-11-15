// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01339 dut (
    .in(in_vec[33:0]),
    .out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h0741026d2;
    stim[1] = 34'h376dd44b1;
    stim[2] = 34'h3d86b3705;
    stim[3] = 34'h2806bf357;
    stim[4] = 34'h1cd2c4df3;
    stim[5] = 34'h05d26acbe;
    stim[6] = 34'h10a463d7e;
    stim[7] = 34'h3d79f6c43;
    stim[8] = 34'h3e87449fe;
    stim[9] = 34'h0dccc7d84;
    stim[10] = 34'h2fcb2d741;
    stim[11] = 34'h27d10630f;
    stim[12] = 34'h0c7b33512;
    stim[13] = 34'h10c746d35;
    stim[14] = 34'h18db90d32;
    stim[15] = 34'h15073431a;
    stim[16] = 34'h08738f942;
    stim[17] = 34'h2e2a20e79;
    stim[18] = 34'h3eb308b6e;
    stim[19] = 34'h0ecdbbc19;
    stim[20] = 34'h331e57775;
    stim[21] = 34'h264c8a40a;
    stim[22] = 34'h2dd51ae88;
    stim[23] = 34'h238a0f38e;
    stim[24] = 34'h16bd7ceb6;
    stim[25] = 34'h0a0d9a3b0;
    stim[26] = 34'h14f4c8d33;
    stim[27] = 34'h26d7f9b2d;
    stim[28] = 34'h2e262e1c1;
    stim[29] = 34'h00960b35a;
    stim[30] = 34'h0f3080cd4;
    stim[31] = 34'h3046f3f33;
    stim[32] = 34'h23040a8d6;
    stim[33] = 34'h168e4f6fd;
    stim[34] = 34'h3261dcaf0;
    stim[35] = 34'h0c7b05cbe;
    stim[36] = 34'h02f7c2fa4;
    stim[37] = 34'h03e9c5d19;
    stim[38] = 34'h2b62ed1b4;
    stim[39] = 34'h1bdd5ab23;
    stim[40] = 34'h0db29f04c;
    stim[41] = 34'h294c4f2dc;
    stim[42] = 34'h1149c3afd;
    stim[43] = 34'h134ffd6be;
    stim[44] = 34'h306db01d3;
    stim[45] = 34'h12aab1a16;
    stim[46] = 34'h287b09849;
    stim[47] = 34'h2ec4dfcc5;
    stim[48] = 34'h37a5f4049;
    stim[49] = 34'h0c83e657c;
    stim[50] = 34'h37f84f5be;
    stim[51] = 34'h1bca722cf;
    stim[52] = 34'h30c9867c5;
    stim[53] = 34'h2f1348d37;
    stim[54] = 34'h10b3c6466;
    stim[55] = 34'h38ebf5655;
    stim[56] = 34'h33ac4e63f;
    stim[57] = 34'h20adb3111;
    stim[58] = 34'h34ec5fab4;
    stim[59] = 34'h369f94a4f;
    stim[60] = 34'h2aea4432f;
    stim[61] = 34'h2fcb6595b;
    stim[62] = 34'h08b5c6b39;
    stim[63] = 34'h248dd159a;
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
      expv[0] = 1'h0;
      expv[1] = 1'h1;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h1;
      expv[5] = 1'h0;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h0;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h1;
      expv[17] = 1'h0;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h0;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h1;
      expv[27] = 1'h0;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h0;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h1;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h0;
      expv[45] = 1'h1;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h0;
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
