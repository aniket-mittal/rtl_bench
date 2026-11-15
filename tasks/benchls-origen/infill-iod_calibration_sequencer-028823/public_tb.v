// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_028823 dut (
    .clk_div(clk),
    .rst(in_vec[8:8]),
    .iod_busy(in_vec[7:0]),
    .ready(out_vec[4:4]),
    .iod_rst(out_vec[3:3]),
    .iod_mask(out_vec[2:2]),
    .iod_cal(out_vec[1:1]),
    .iod_cal_master(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1bd;
    stim[1] = 9'h16d;
    stim[2] = 9'h002;
    stim[3] = 9'h096;
    stim[4] = 9'h08a;
    stim[5] = 9'h0d8;
    stim[6] = 9'h085;
    stim[7] = 9'h068;
    stim[8] = 9'h0e4;
    stim[9] = 9'h058;
    stim[10] = 9'h055;
    stim[11] = 9'h0b6;
    stim[12] = 9'h0eb;
    stim[13] = 9'h060;
    stim[14] = 9'h0f3;
    stim[15] = 9'h0ad;
    stim[16] = 9'h0f8;
    stim[17] = 9'h092;
    stim[18] = 9'h017;
    stim[19] = 9'h022;
    stim[20] = 9'h08b;
    stim[21] = 9'h048;
    stim[22] = 9'h01a;
    stim[23] = 9'h099;
    stim[24] = 9'h176;
    stim[25] = 9'h0f6;
    stim[26] = 9'h07a;
    stim[27] = 9'h098;
    stim[28] = 9'h086;
    stim[29] = 9'h0ca;
    stim[30] = 9'h0d3;
    stim[31] = 9'h0b2;
    stim[32] = 9'h06f;
    stim[33] = 9'h06f;
    stim[34] = 9'h091;
    stim[35] = 9'h1d1;
    stim[36] = 9'h0b8;
    stim[37] = 9'h09f;
    stim[38] = 9'h03b;
    stim[39] = 9'h02b;
    stim[40] = 9'h035;
    stim[41] = 9'h06b;
    stim[42] = 9'h0ff;
    stim[43] = 9'h0d8;
    stim[44] = 9'h0b4;
    stim[45] = 9'h021;
    stim[46] = 9'h06c;
    stim[47] = 9'h0da;
    stim[48] = 9'h0c5;
    stim[49] = 9'h0d5;
    stim[50] = 9'h0fd;
    stim[51] = 9'h05c;
    stim[52] = 9'h024;
    stim[53] = 9'h0ca;
    stim[54] = 9'h003;
    stim[55] = 9'h048;
    stim[56] = 9'h03e;
    stim[57] = 9'h00a;
    stim[58] = 9'h083;
    stim[59] = 9'h018;
    stim[60] = 9'h099;
    stim[61] = 9'h070;
    stim[62] = 9'h028;
    stim[63] = 9'h017;
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
      expv[0] = 5'h0c;
      expv[1] = 5'h0c;
      expv[2] = 5'h0c;
      expv[3] = 5'h04;
      expv[4] = 5'h04;
      expv[5] = 5'h04;
      expv[6] = 5'h04;
      expv[7] = 5'h04;
      expv[8] = 5'h04;
      expv[9] = 5'h04;
      expv[10] = 5'h04;
      expv[11] = 5'h04;
      expv[12] = 5'h04;
      expv[13] = 5'h04;
      expv[14] = 5'h04;
      expv[15] = 5'h04;
      expv[16] = 5'h04;
      expv[17] = 5'h04;
      expv[18] = 5'h04;
      expv[19] = 5'h04;
      expv[20] = 5'h04;
      expv[21] = 5'h04;
      expv[22] = 5'h04;
      expv[23] = 5'h04;
      expv[24] = 5'h0c;
      expv[25] = 5'h0c;
      expv[26] = 5'h04;
      expv[27] = 5'h04;
      expv[28] = 5'h04;
      expv[29] = 5'h04;
      expv[30] = 5'h04;
      expv[31] = 5'h04;
      expv[32] = 5'h04;
      expv[33] = 5'h04;
      expv[34] = 5'h04;
      expv[35] = 5'h0c;
      expv[36] = 5'h0c;
      expv[37] = 5'h04;
      expv[38] = 5'h04;
      expv[39] = 5'h04;
      expv[40] = 5'h04;
      expv[41] = 5'h04;
      expv[42] = 5'h04;
      expv[43] = 5'h04;
      expv[44] = 5'h04;
      expv[45] = 5'h04;
      expv[46] = 5'h04;
      expv[47] = 5'h04;
      expv[48] = 5'h04;
      expv[49] = 5'h04;
      expv[50] = 5'h04;
      expv[51] = 5'h04;
      expv[52] = 5'h04;
      expv[53] = 5'h04;
      expv[54] = 5'h04;
      expv[55] = 5'h04;
      expv[56] = 5'h04;
      expv[57] = 5'h04;
      expv[58] = 5'h04;
      expv[59] = 5'h04;
      expv[60] = 5'h04;
      expv[61] = 5'h04;
      expv[62] = 5'h04;
      expv[63] = 5'h04;
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
