// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07645 dut (
    .clk(clk),
    .S_BSCAN_bscanid_en(in_vec[10:10]),
    .S_BSCAN_capture(in_vec[9:9]),
    .S_BSCAN_drck(in_vec[8:8]),
    .S_BSCAN_reset(in_vec[7:7]),
    .S_BSCAN_runtest(in_vec[6:6]),
    .S_BSCAN_sel(in_vec[5:5]),
    .S_BSCAN_shift(in_vec[4:4]),
    .S_BSCAN_tck(in_vec[3:3]),
    .S_BSCAN_tdi(in_vec[2:2]),
    .S_BSCAN_tms(in_vec[1:1]),
    .S_BSCAN_update(in_vec[0:0]),
    .S_BSCAN_tdo(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h2e9;
    stim[1] = 11'h4eb;
    stim[2] = 11'h2ba;
    stim[3] = 11'h45b;
    stim[4] = 11'h50a;
    stim[5] = 11'h73f;
    stim[6] = 11'h7f3;
    stim[7] = 11'h641;
    stim[8] = 11'h25b;
    stim[9] = 11'h409;
    stim[10] = 11'h27b;
    stim[11] = 11'h763;
    stim[12] = 11'h409;
    stim[13] = 11'h01f;
    stim[14] = 11'h32a;
    stim[15] = 11'h674;
    stim[16] = 11'h102;
    stim[17] = 11'h773;
    stim[18] = 11'h363;
    stim[19] = 11'h271;
    stim[20] = 11'h010;
    stim[21] = 11'h56b;
    stim[22] = 11'h072;
    stim[23] = 11'h331;
    stim[24] = 11'h624;
    stim[25] = 11'h733;
    stim[26] = 11'h668;
    stim[27] = 11'h479;
    stim[28] = 11'h77f;
    stim[29] = 11'h03e;
    stim[30] = 11'h654;
    stim[31] = 11'h45d;
    stim[32] = 11'h76f;
    stim[33] = 11'h455;
    stim[34] = 11'h567;
    stim[35] = 11'h20c;
    stim[36] = 11'h031;
    stim[37] = 11'h52b;
    stim[38] = 11'h011;
    stim[39] = 11'h075;
    stim[40] = 11'h265;
    stim[41] = 11'h207;
    stim[42] = 11'h560;
    stim[43] = 11'h106;
    stim[44] = 11'h535;
    stim[45] = 11'h133;
    stim[46] = 11'h620;
    stim[47] = 11'h429;
    stim[48] = 11'h259;
    stim[49] = 11'h034;
    stim[50] = 11'h40a;
    stim[51] = 11'h646;
    stim[52] = 11'h506;
    stim[53] = 11'h158;
    stim[54] = 11'h720;
    stim[55] = 11'h05b;
    stim[56] = 11'h36e;
    stim[57] = 11'h659;
    stim[58] = 11'h744;
    stim[59] = 11'h47d;
    stim[60] = 11'h129;
    stim[61] = 11'h52e;
    stim[62] = 11'h15f;
    stim[63] = 11'h728;
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
      expv[0] = 1'hx;
      expv[1] = 1'hx;
      expv[2] = 1'hx;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h1;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h1;
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
