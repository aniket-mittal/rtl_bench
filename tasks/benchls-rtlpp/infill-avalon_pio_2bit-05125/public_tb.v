// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05125 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[33:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h108c7a191a;
    stim[1] = 37'h14ca3a9747;
    stim[2] = 37'h037070177d;
    stim[3] = 37'h12b8ef0b1b;
    stim[4] = 37'h0a6bb3cd08;
    stim[5] = 37'h124f827aee;
    stim[6] = 37'h126d1f3c94;
    stim[7] = 37'h1aca9d5d15;
    stim[8] = 37'h161b7af462;
    stim[9] = 37'h07652ecff7;
    stim[10] = 37'h1691b13c2d;
    stim[11] = 37'h1fa030c7fb;
    stim[12] = 37'h0a8fc5dc08;
    stim[13] = 37'h0bfcb8fc4d;
    stim[14] = 37'h060ecd52ac;
    stim[15] = 37'h02f34e8490;
    stim[16] = 37'h025bd536d4;
    stim[17] = 37'h021a975652;
    stim[18] = 37'h17f63a0c23;
    stim[19] = 37'h0b379b7db6;
    stim[20] = 37'h060b68fc97;
    stim[21] = 37'h1f0df3a142;
    stim[22] = 37'h09e3a4c2c2;
    stim[23] = 37'h0ef1f0fe35;
    stim[24] = 37'h1eb2b6ff46;
    stim[25] = 37'h0ffe6051dd;
    stim[26] = 37'h1792314e0e;
    stim[27] = 37'h0e4ef74a42;
    stim[28] = 37'h1787e61a47;
    stim[29] = 37'h0a3556660e;
    stim[30] = 37'h0f2fd3d407;
    stim[31] = 37'h0e5ed58a34;
    stim[32] = 37'h0ad7636a7e;
    stim[33] = 37'h079e602566;
    stim[34] = 37'h0b9a7b6067;
    stim[35] = 37'h1b52e50bb8;
    stim[36] = 37'h0aba8d1aa0;
    stim[37] = 37'h0a7fca55de;
    stim[38] = 37'h0e0c1a0c16;
    stim[39] = 37'h0e1b8fd47e;
    stim[40] = 37'h0e8178661d;
    stim[41] = 37'h063d734caa;
    stim[42] = 37'h16cdd7234a;
    stim[43] = 37'h06a1ccc964;
    stim[44] = 37'h0eb845a252;
    stim[45] = 37'h0edc0bb7a1;
    stim[46] = 37'h1ac9479cb2;
    stim[47] = 37'h06c46a1aa1;
    stim[48] = 37'h0a8ca2e7f1;
    stim[49] = 37'h064b72a8e3;
    stim[50] = 37'h02ad0fe460;
    stim[51] = 37'h022f8b7784;
    stim[52] = 37'h0f573563cc;
    stim[53] = 37'h0fccfef459;
    stim[54] = 37'h1afc40c97b;
    stim[55] = 37'h12f6aab64b;
    stim[56] = 37'h0381f426d0;
    stim[57] = 37'h07a5378e39;
    stim[58] = 37'h0703e58bc9;
    stim[59] = 37'h1370115bbf;
    stim[60] = 37'h0e80a5ff4e;
    stim[61] = 37'h0900a3f9c8;
    stim[62] = 37'h0679b90529;
    stim[63] = 37'h02451ed5f2;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h000000000;
      expv[5] = 34'h000000000;
      expv[6] = 34'h000000000;
      expv[7] = 34'h000000000;
      expv[8] = 34'h000000000;
      expv[9] = 34'h000000000;
      expv[10] = 34'h000000000;
      expv[11] = 34'h000000000;
      expv[12] = 34'h000000000;
      expv[13] = 34'h000000000;
      expv[14] = 34'h000000000;
      expv[15] = 34'h000000000;
      expv[16] = 34'h000000000;
      expv[17] = 34'h000000000;
      expv[18] = 34'h000000000;
      expv[19] = 34'h000000000;
      expv[20] = 34'h000000000;
      expv[21] = 34'h300000000;
      expv[22] = 34'h000000000;
      expv[23] = 34'h000000000;
      expv[24] = 34'h000000000;
      expv[25] = 34'h000000000;
      expv[26] = 34'h000000000;
      expv[27] = 34'h000000000;
      expv[28] = 34'h000000000;
      expv[29] = 34'h000000000;
      expv[30] = 34'h000000000;
      expv[31] = 34'h000000000;
      expv[32] = 34'h000000000;
      expv[33] = 34'h000000000;
      expv[34] = 34'h000000000;
      expv[35] = 34'h000000000;
      expv[36] = 34'h000000000;
      expv[37] = 34'h000000000;
      expv[38] = 34'h000000000;
      expv[39] = 34'h000000000;
      expv[40] = 34'h000000000;
      expv[41] = 34'h000000000;
      expv[42] = 34'h200000000;
      expv[43] = 34'h200000002;
      expv[44] = 34'h000000000;
      expv[45] = 34'h000000000;
      expv[46] = 34'h000000000;
      expv[47] = 34'h000000000;
      expv[48] = 34'h100000000;
      expv[49] = 34'h100000001;
      expv[50] = 34'h300000003;
      expv[51] = 34'h300000003;
      expv[52] = 34'h300000000;
      expv[53] = 34'h300000000;
      expv[54] = 34'h300000000;
      expv[55] = 34'h300000000;
      expv[56] = 34'h300000003;
      expv[57] = 34'h300000003;
      expv[58] = 34'h300000003;
      expv[59] = 34'h300000000;
      expv[60] = 34'h300000000;
      expv[61] = 34'h000000000;
      expv[62] = 34'h000000000;
      expv[63] = 34'h100000001;
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
