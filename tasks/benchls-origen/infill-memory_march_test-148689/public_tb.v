// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_148689 dut (
    .clk(clk),
    .address(in_vec[18:11]),
    .data(in_vec[10:3]),
    .rst_n(in_vec[2:2]),
    .write_en(in_vec[1:1]),
    .test_en(in_vec[0:0]),
    .pass(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h43159;
    stim[1] = 19'h3e6e3;
    stim[2] = 19'h663f5;
    stim[3] = 19'h47b5e;
    stim[4] = 19'h58145;
    stim[5] = 19'h5e2bf;
    stim[6] = 19'h5f324;
    stim[7] = 19'h3ffe7;
    stim[8] = 19'h56ea7;
    stim[9] = 19'h1c534;
    stim[10] = 19'h1ac7e;
    stim[11] = 19'h04ced;
    stim[12] = 19'h7c777;
    stim[13] = 19'h6bc5e;
    stim[14] = 19'h2e8cf;
    stim[15] = 19'h58afc;
    stim[16] = 19'h01af5;
    stim[17] = 19'h08aa5;
    stim[18] = 19'h7ac47;
    stim[19] = 19'h5bf3d;
    stim[20] = 19'h75c65;
    stim[21] = 19'h66536;
    stim[22] = 19'h0f04d;
    stim[23] = 19'h5b5e6;
    stim[24] = 19'h0ed76;
    stim[25] = 19'h29757;
    stim[26] = 19'h1e5ae;
    stim[27] = 19'h4473d;
    stim[28] = 19'h7b605;
    stim[29] = 19'h236ce;
    stim[30] = 19'h515bf;
    stim[31] = 19'h54924;
    stim[32] = 19'h08db6;
    stim[33] = 19'h617f5;
    stim[34] = 19'h6fbcf;
    stim[35] = 19'h7be15;
    stim[36] = 19'h00817;
    stim[37] = 19'h6ae6d;
    stim[38] = 19'h48044;
    stim[39] = 19'h6ca3c;
    stim[40] = 19'h48615;
    stim[41] = 19'h4bb95;
    stim[42] = 19'h7481d;
    stim[43] = 19'h734df;
    stim[44] = 19'h4b5f7;
    stim[45] = 19'h2dcec;
    stim[46] = 19'h6314c;
    stim[47] = 19'h48c1d;
    stim[48] = 19'h4d515;
    stim[49] = 19'h75c5f;
    stim[50] = 19'h4e5c5;
    stim[51] = 19'h604ff;
    stim[52] = 19'h784be;
    stim[53] = 19'h0e4dc;
    stim[54] = 19'h3c4ad;
    stim[55] = 19'h6cad4;
    stim[56] = 19'h634f4;
    stim[57] = 19'h5c7e5;
    stim[58] = 19'h40624;
    stim[59] = 19'h408d6;
    stim[60] = 19'h12aed;
    stim[61] = 19'h137b4;
    stim[62] = 19'h5827c;
    stim[63] = 19'h035d7;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
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
