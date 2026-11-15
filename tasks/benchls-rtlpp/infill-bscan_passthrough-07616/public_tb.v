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

  rtlpp_07616 dut (
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
    stim[0] = 11'h0fe;
    stim[1] = 11'h4c6;
    stim[2] = 11'h51a;
    stim[3] = 11'h361;
    stim[4] = 11'h525;
    stim[5] = 11'h451;
    stim[6] = 11'h03a;
    stim[7] = 11'h5d6;
    stim[8] = 11'h41a;
    stim[9] = 11'h451;
    stim[10] = 11'h630;
    stim[11] = 11'h62a;
    stim[12] = 11'h65b;
    stim[13] = 11'h215;
    stim[14] = 11'h470;
    stim[15] = 11'h429;
    stim[16] = 11'h32e;
    stim[17] = 11'h207;
    stim[18] = 11'h606;
    stim[19] = 11'h21c;
    stim[20] = 11'h26f;
    stim[21] = 11'h40c;
    stim[22] = 11'h530;
    stim[23] = 11'h13e;
    stim[24] = 11'h07d;
    stim[25] = 11'h36e;
    stim[26] = 11'h51d;
    stim[27] = 11'h552;
    stim[28] = 11'h343;
    stim[29] = 11'h07e;
    stim[30] = 11'h03d;
    stim[31] = 11'h013;
    stim[32] = 11'h74f;
    stim[33] = 11'h054;
    stim[34] = 11'h237;
    stim[35] = 11'h45c;
    stim[36] = 11'h748;
    stim[37] = 11'h578;
    stim[38] = 11'h42a;
    stim[39] = 11'h04a;
    stim[40] = 11'h273;
    stim[41] = 11'h053;
    stim[42] = 11'h7c4;
    stim[43] = 11'h00d;
    stim[44] = 11'h26c;
    stim[45] = 11'h22b;
    stim[46] = 11'h747;
    stim[47] = 11'h61c;
    stim[48] = 11'h512;
    stim[49] = 11'h774;
    stim[50] = 11'h75c;
    stim[51] = 11'h556;
    stim[52] = 11'h312;
    stim[53] = 11'h023;
    stim[54] = 11'h34d;
    stim[55] = 11'h466;
    stim[56] = 11'h076;
    stim[57] = 11'h341;
    stim[58] = 11'h10b;
    stim[59] = 11'h77c;
    stim[60] = 11'h74f;
    stim[61] = 11'h537;
    stim[62] = 11'h763;
    stim[63] = 11'h549;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h1;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h1;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h1;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h0;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h0;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h0;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h0;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
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
