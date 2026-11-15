// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_056004 dut (
    .clk(clk),
    .reset(in_vec[13:13]),
    .opcode(in_vec[12:7]),
    .funct(in_vec[6:1]),
    .zero(in_vec[0:0]),
    .pc_load(out_vec[11:11]),
    .write(out_vec[10:10]),
    .alu_funct(out_vec[9:4]),
    .rd_mux_s(out_vec[3:3]),
    .op2_mux_s(out_vec[2:2]),
    .branch_mux_s(out_vec[1:1]),
    .j_mux_s(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h2485;
    stim[1] = 14'h2d04;
    stim[2] = 14'h1799;
    stim[3] = 14'h1c2b;
    stim[4] = 14'h1e3a;
    stim[5] = 14'h121d;
    stim[6] = 14'h189f;
    stim[7] = 14'h0861;
    stim[8] = 14'h3a5b;
    stim[9] = 14'h0afe;
    stim[10] = 14'h1f0e;
    stim[11] = 14'h0f29;
    stim[12] = 14'h1401;
    stim[13] = 14'h0995;
    stim[14] = 14'h03ed;
    stim[15] = 14'h0f41;
    stim[16] = 14'h15bb;
    stim[17] = 14'h15ab;
    stim[18] = 14'h1a4b;
    stim[19] = 14'h073b;
    stim[20] = 14'h06a4;
    stim[21] = 14'h04bb;
    stim[22] = 14'h1862;
    stim[23] = 14'h0c93;
    stim[24] = 14'h012d;
    stim[25] = 14'h0f19;
    stim[26] = 14'h0bcb;
    stim[27] = 14'h0b3a;
    stim[28] = 14'h0eb7;
    stim[29] = 14'h0e86;
    stim[30] = 14'h06b5;
    stim[31] = 14'h17fc;
    stim[32] = 14'h0639;
    stim[33] = 14'h0635;
    stim[34] = 14'h03b9;
    stim[35] = 14'h1999;
    stim[36] = 14'h0a9a;
    stim[37] = 14'h0e4d;
    stim[38] = 14'h1e49;
    stim[39] = 14'h1464;
    stim[40] = 14'h08da;
    stim[41] = 14'h0722;
    stim[42] = 14'h0a92;
    stim[43] = 14'h170e;
    stim[44] = 14'h141b;
    stim[45] = 14'h02d1;
    stim[46] = 14'h136f;
    stim[47] = 14'h0f55;
    stim[48] = 14'h1552;
    stim[49] = 14'h05e0;
    stim[50] = 14'h1ba6;
    stim[51] = 14'h108d;
    stim[52] = 14'h1d6f;
    stim[53] = 14'h17b6;
    stim[54] = 14'h0cba;
    stim[55] = 14'h0bcd;
    stim[56] = 14'h01bd;
    stim[57] = 14'h0392;
    stim[58] = 14'h0c9b;
    stim[59] = 14'h1130;
    stim[60] = 14'h1c08;
    stim[61] = 14'h0ec5;
    stim[62] = 14'h08ed;
    stim[63] = 14'h021c;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h000;
      expv[4] = 12'h000;
      expv[5] = 12'h000;
      expv[6] = 12'h000;
      expv[7] = 12'h000;
      expv[8] = 12'h000;
      expv[9] = 12'h000;
      expv[10] = 12'h000;
      expv[11] = 12'h000;
      expv[12] = 12'h000;
      expv[13] = 12'h000;
      expv[14] = 12'h000;
      expv[15] = 12'h000;
      expv[16] = 12'h000;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h000;
      expv[20] = 12'h000;
      expv[21] = 12'h000;
      expv[22] = 12'h000;
      expv[23] = 12'h000;
      expv[24] = 12'h801;
      expv[25] = 12'h000;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'h000;
      expv[29] = 12'h000;
      expv[30] = 12'h000;
      expv[31] = 12'h000;
      expv[32] = 12'h000;
      expv[33] = 12'h000;
      expv[34] = 12'h000;
      expv[35] = 12'h000;
      expv[36] = 12'h000;
      expv[37] = 12'h000;
      expv[38] = 12'h000;
      expv[39] = 12'h000;
      expv[40] = 12'h000;
      expv[41] = 12'h000;
      expv[42] = 12'h000;
      expv[43] = 12'h000;
      expv[44] = 12'h000;
      expv[45] = 12'h000;
      expv[46] = 12'h000;
      expv[47] = 12'h000;
      expv[48] = 12'h000;
      expv[49] = 12'h000;
      expv[50] = 12'h000;
      expv[51] = 12'h000;
      expv[52] = 12'h000;
      expv[53] = 12'h000;
      expv[54] = 12'h000;
      expv[55] = 12'h000;
      expv[56] = 12'h000;
      expv[57] = 12'h000;
      expv[58] = 12'h000;
      expv[59] = 12'h000;
      expv[60] = 12'h000;
      expv[61] = 12'h000;
      expv[62] = 12'h000;
      expv[63] = 12'h000;
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
