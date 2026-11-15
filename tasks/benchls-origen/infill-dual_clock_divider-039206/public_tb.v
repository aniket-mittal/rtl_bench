// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 58;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_039206 dut (
    .CLOCK(clk),
    .SLOWER_CLOCK(in_vec[22:22]),
    .RESET(in_vec[21:21]),
    .abtoggle(in_vec[20:20]),
    .HF_toggle(in_vec[19:19]),
    .sw13(in_vec[18:18]),
    .sw14(in_vec[17:17]),
    .sw15(in_vec[16:16]),
    .btnL(in_vec[15:15]),
    .btnR(in_vec[14:14]),
    .stepsize_input(in_vec[13:2]),
    .PULSE_l(in_vec[1:1]),
    .PULSE_r(in_vec[0:0]),
    .frequency(out_vec[57:30]),
    .frequency2(out_vec[29:2]),
    .outputclock(out_vec[1:1]),
    .outputclock2(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h69fcb4;
    stim[1] = 23'h226901;
    stim[2] = 23'h4d4172;
    stim[3] = 23'h44650e;
    stim[4] = 23'h4be5e3;
    stim[5] = 23'h51528d;
    stim[6] = 23'h4dbe53;
    stim[7] = 23'h583171;
    stim[8] = 23'h4503ee;
    stim[9] = 23'h1c59be;
    stim[10] = 23'h00cbf2;
    stim[11] = 23'h0cd0ba;
    stim[12] = 23'h4edc96;
    stim[13] = 23'h5629f3;
    stim[14] = 23'h465272;
    stim[15] = 23'h114880;
    stim[16] = 23'h47a663;
    stim[17] = 23'h423049;
    stim[18] = 23'h0eee0f;
    stim[19] = 23'h157bae;
    stim[20] = 23'h5a89d1;
    stim[21] = 23'h07a9ad;
    stim[22] = 23'h5ea5b8;
    stim[23] = 23'h1b63f9;
    stim[24] = 23'h069c32;
    stim[25] = 23'h0aa202;
    stim[26] = 23'h115a6e;
    stim[27] = 23'h18faf4;
    stim[28] = 23'h0d25fc;
    stim[29] = 23'h4537cd;
    stim[30] = 23'h1eb5d6;
    stim[31] = 23'h12cbf6;
    stim[32] = 23'h1d72bd;
    stim[33] = 23'h102599;
    stim[34] = 23'h09f564;
    stim[35] = 23'h18a8a3;
    stim[36] = 23'h596e23;
    stim[37] = 23'h127e2c;
    stim[38] = 23'h1410dd;
    stim[39] = 23'h5748c1;
    stim[40] = 23'h01a7fd;
    stim[41] = 23'h4f8eca;
    stim[42] = 23'h0ea2ac;
    stim[43] = 23'h14b725;
    stim[44] = 23'h5432b8;
    stim[45] = 23'h57295c;
    stim[46] = 23'h13bb6a;
    stim[47] = 23'h127b70;
    stim[48] = 23'h1d98b8;
    stim[49] = 23'h5dab46;
    stim[50] = 23'h133f25;
    stim[51] = 23'h0499a4;
    stim[52] = 23'h56db96;
    stim[53] = 23'h5ad0d9;
    stim[54] = 23'h17cb05;
    stim[55] = 23'h161a85;
    stim[56] = 23'h4d2e23;
    stim[57] = 23'h45387d;
    stim[58] = 23'h0d5369;
    stim[59] = 23'h08bc9b;
    stim[60] = 23'h1a3954;
    stim[61] = 23'h11e461;
    stim[62] = 23'h01b30e;
    stim[63] = 23'h1f0916;
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
      expv[0] = 58'h000003200000320;
      expv[1] = 58'h000003200000320;
      expv[2] = 58'h000003200000320;
      expv[3] = 58'h000003200000323;
      expv[4] = 58'h000003200000323;
      expv[5] = 58'h000003200000323;
      expv[6] = 58'h000003200000323;
      expv[7] = 58'h000003200000323;
      expv[8] = 58'h000003200000323;
      expv[9] = 58'h000003200000323;
      expv[10] = 58'h000003200000323;
      expv[11] = 58'h000003200000323;
      expv[12] = 58'h000003000000323;
      expv[13] = 58'h000003000000323;
      expv[14] = 58'h000003000000323;
      expv[15] = 58'h000003000000323;
      expv[16] = 58'h00000a3c0000323;
      expv[17] = 58'h00000a3c0000323;
      expv[18] = 58'h00000a3c0000323;
      expv[19] = 58'h00000a3c0000323;
      expv[20] = 58'h000009e80000323;
      expv[21] = 58'h000009e80000323;
      expv[22] = 58'h000001900000193;
      expv[23] = 58'h000001900000193;
      expv[24] = 58'h000001900000193;
      expv[25] = 58'h000001900000193;
      expv[26] = 58'h000001900000193;
      expv[27] = 58'h000001900000193;
      expv[28] = 58'h000001900000193;
      expv[29] = 58'h000001900000193;
      expv[30] = 58'h000001900000193;
      expv[31] = 58'h000001900000193;
      expv[32] = 58'h000001900000193;
      expv[33] = 58'h000001900000193;
      expv[34] = 58'h000001900000193;
      expv[35] = 58'h000001900000193;
      expv[36] = 58'h0000018c0000193;
      expv[37] = 58'h0000018c0000193;
      expv[38] = 58'h0000018c0000193;
      expv[39] = 58'h000000c800000cb;
      expv[40] = 58'h000000c800000cb;
      expv[41] = 58'h000000c800000c7;
      expv[42] = 58'h000000c800000c7;
      expv[43] = 58'h000000c800000c7;
      expv[44] = 58'h000000dc00000c7;
      expv[45] = 58'h000000dc00000c7;
      expv[46] = 58'h000000dc00000c7;
      expv[47] = 58'h000000dc00000c7;
      expv[48] = 58'h000000dc00000c7;
      expv[49] = 58'h000003200000323;
      expv[50] = 58'h000003200000323;
      expv[51] = 58'h000003200000323;
      expv[52] = 58'h000003200000323;
      expv[53] = 58'h000003200000323;
      expv[54] = 58'h000003200000323;
      expv[55] = 58'h000003200000323;
      expv[56] = 58'h000003200000327;
      expv[57] = 58'h000003200000327;
      expv[58] = 58'h000003200000327;
      expv[59] = 58'h000003200000327;
      expv[60] = 58'h000003200000327;
      expv[61] = 58'h000003200000327;
      expv[62] = 58'h000003200000327;
      expv[63] = 58'h000003200000327;
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
