// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 29;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  axis_register dut (
    .clk(clk),
    .rst(in_vec[29:29]),
    .s_axis_tdata(in_vec[28:21]),
    .s_axis_tkeep(in_vec[20:20]),
    .s_axis_tvalid(in_vec[19:19]),
    .s_axis_tlast(in_vec[18:18]),
    .s_axis_tid(in_vec[17:10]),
    .s_axis_tdest(in_vec[9:2]),
    .s_axis_tuser(in_vec[1:1]),
    .m_axis_tready(in_vec[0:0]),
    .s_axis_tready(out_vec[28:28]),
    .m_axis_tdata(out_vec[27:20]),
    .m_axis_tkeep(out_vec[19:19]),
    .m_axis_tvalid(out_vec[18:18]),
    .m_axis_tlast(out_vec[17:17]),
    .m_axis_tid(out_vec[16:9]),
    .m_axis_tdest(out_vec[8:1]),
    .m_axis_tuser(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h3aee659d;
    stim[1] = 30'h2edb3d3c;
    stim[2] = 30'h114451e8;
    stim[3] = 30'h06d61fcf;
    stim[4] = 30'h02e16f99;
    stim[5] = 30'h17a9fd21;
    stim[6] = 30'h15f2475b;
    stim[7] = 30'h0a16eb1c;
    stim[8] = 30'h1bfd4fe4;
    stim[9] = 30'h1d3c23fe;
    stim[10] = 30'h19ccf824;
    stim[11] = 30'h03da235d;
    stim[12] = 30'h02b2596b;
    stim[13] = 30'h0e02bcad;
    stim[14] = 30'h19990879;
    stim[15] = 30'h186bc4bb;
    stim[16] = 30'h07fa0e80;
    stim[17] = 30'h1d524368;
    stim[18] = 30'h125b21de;
    stim[19] = 30'h0b611576;
    stim[20] = 30'h1b62e612;
    stim[21] = 30'h1bd70d1b;
    stim[22] = 30'h1f735534;
    stim[23] = 30'h1d50629a;
    stim[24] = 30'h0e7755de;
    stim[25] = 30'h17ebc34d;
    stim[26] = 30'h1a19b746;
    stim[27] = 30'h0cf0567c;
    stim[28] = 30'h0b4ef814;
    stim[29] = 30'h0aea144a;
    stim[30] = 30'h1cfe221a;
    stim[31] = 30'h096146ba;
    stim[32] = 30'h0d64e1e7;
    stim[33] = 30'h108ee982;
    stim[34] = 30'h1643a73d;
    stim[35] = 30'h11854ca5;
    stim[36] = 30'h13bbaa90;
    stim[37] = 30'h02d52ced;
    stim[38] = 30'h05002f3b;
    stim[39] = 30'h177ba020;
    stim[40] = 30'h169590fd;
    stim[41] = 30'h111129be;
    stim[42] = 30'h0ac298d3;
    stim[43] = 30'h18aec95e;
    stim[44] = 30'h11f00647;
    stim[45] = 30'h1e7d67b0;
    stim[46] = 30'h1281af71;
    stim[47] = 30'h0921145b;
    stim[48] = 30'h036af97c;
    stim[49] = 30'h102c839e;
    stim[50] = 30'h15c81a9a;
    stim[51] = 30'h0db9f191;
    stim[52] = 30'h086dc9aa;
    stim[53] = 30'h061a1c65;
    stim[54] = 30'h154204fb;
    stim[55] = 30'h13ba7d3c;
    stim[56] = 30'h029713a9;
    stim[57] = 30'h1170b995;
    stim[58] = 30'h14972431;
    stim[59] = 30'h172cadc0;
    stim[60] = 30'h0fe53bca;
    stim[61] = 30'h1e467f0f;
    stim[62] = 30'h0f31647c;
    stim[63] = 30'h109244dd;
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
      expv[0] = 29'h00080000;
      expv[1] = 29'h00080000;
      expv[2] = 29'h00080000;
      expv[3] = 29'h10080000;
      expv[4] = 29'h136a0001;
      expv[5] = 29'h11780000;
      expv[6] = 29'h1bdc0000;
      expv[7] = 29'h1af80001;
      expv[8] = 29'h150a0000;
      expv[9] = 29'h1dfe0000;
      expv[10] = 29'h0dfe0000;
      expv[11] = 29'h0dfe0000;
      expv[12] = 29'h1e9e0001;
      expv[13] = 29'h11580001;
      expv[14] = 29'h17080000;
      expv[15] = 29'h1ccc0000;
      expv[16] = 29'h1c3c0001;
      expv[17] = 29'h0c3c0001;
      expv[18] = 29'h0c3c0001;
      expv[19] = 29'h0c3c0001;
      expv[20] = 29'h0c3c0001;
      expv[21] = 29'h0c3c0001;
      expv[22] = 29'h13fc0000;
      expv[23] = 29'h13fc0000;
      expv[24] = 29'h13fc0000;
      expv[25] = 29'h13fc0000;
      expv[26] = 29'h1bfc0000;
      expv[27] = 29'h0bfc0000;
      expv[28] = 29'h0bfc0000;
      expv[29] = 29'h0bfc0000;
      expv[30] = 29'h0bfc0000;
      expv[31] = 29'h0bfc0000;
      expv[32] = 29'h0bfc0000;
      expv[33] = 29'h1d0c0001;
      expv[34] = 29'h0d0c0001;
      expv[35] = 29'h184e0001;
      expv[36] = 29'h18ca0000;
      expv[37] = 29'h19dc0000;
      expv[38] = 29'h116a0000;
      expv[39] = 29'h12880001;
      expv[40] = 29'h1bbc0000;
      expv[41] = 29'h1b4a0000;
      expv[42] = 29'h18880001;
      expv[43] = 29'h15680001;
      expv[44] = 29'h1c5e0001;
      expv[45] = 29'h18f80001;
      expv[46] = 29'h1f3e0000;
      expv[47] = 29'h19480000;
      expv[48] = 29'h14980001;
      expv[49] = 29'h11bc0000;
      expv[50] = 29'h01bc0000;
      expv[51] = 29'h01bc0000;
      expv[52] = 29'h181e0001;
      expv[53] = 29'h081e0001;
      expv[54] = 29'h143e0001;
      expv[55] = 29'h1aa80001;
      expv[56] = 29'h19dc0000;
      expv[57] = 29'h114a0000;
      expv[58] = 29'h18b80000;
      expv[59] = 29'h1a4a0000;
      expv[60] = 29'h1b9e0000;
      expv[61] = 29'h1b9e0000;
      expv[62] = 29'h1f2a0001;
      expv[63] = 29'h17980000;
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
