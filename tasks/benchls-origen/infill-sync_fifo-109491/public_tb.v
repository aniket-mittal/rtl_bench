// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_109491 dut (
    .clk(clk),
    .rst(in_vec[10:10]),
    .in_read_ctrl(in_vec[9:9]),
    .in_write_ctrl(in_vec[8:8]),
    .in_write_data(in_vec[7:0]),
    .out_read_data(out_vec[9:2]),
    .out_is_full(out_vec[1:1]),
    .out_is_empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h710;
    stim[1] = 11'h474;
    stim[2] = 11'h100;
    stim[3] = 11'h3a6;
    stim[4] = 11'h382;
    stim[5] = 11'h31e;
    stim[6] = 11'h14a;
    stim[7] = 11'h1f1;
    stim[8] = 11'h1d2;
    stim[9] = 11'h306;
    stim[10] = 11'h270;
    stim[11] = 11'h0da;
    stim[12] = 11'h198;
    stim[13] = 11'h1ee;
    stim[14] = 11'h38b;
    stim[15] = 11'h17d;
    stim[16] = 11'h024;
    stim[17] = 11'h1f0;
    stim[18] = 11'h1ea;
    stim[19] = 11'h35d;
    stim[20] = 11'h1dd;
    stim[21] = 11'h3d3;
    stim[22] = 11'h301;
    stim[23] = 11'h19d;
    stim[24] = 11'h390;
    stim[25] = 11'h220;
    stim[26] = 11'h307;
    stim[27] = 11'h14f;
    stim[28] = 11'h155;
    stim[29] = 11'h0b8;
    stim[30] = 11'h07d;
    stim[31] = 11'h321;
    stim[32] = 11'h264;
    stim[33] = 11'h13d;
    stim[34] = 11'h28d;
    stim[35] = 11'h3e2;
    stim[36] = 11'h319;
    stim[37] = 11'h157;
    stim[38] = 11'h0e4;
    stim[39] = 11'h246;
    stim[40] = 11'h10c;
    stim[41] = 11'h136;
    stim[42] = 11'h320;
    stim[43] = 11'h129;
    stim[44] = 11'h2b7;
    stim[45] = 11'h0da;
    stim[46] = 11'h0a8;
    stim[47] = 11'h7f0;
    stim[48] = 11'h1d5;
    stim[49] = 11'h0bb;
    stim[50] = 11'h2c8;
    stim[51] = 11'h23b;
    stim[52] = 11'h197;
    stim[53] = 11'h318;
    stim[54] = 11'h1cd;
    stim[55] = 11'h0da;
    stim[56] = 11'h28d;
    stim[57] = 11'h085;
    stim[58] = 11'h05b;
    stim[59] = 11'h2d3;
    stim[60] = 11'h1dd;
    stim[61] = 11'h361;
    stim[62] = 11'h3a9;
    stim[63] = 11'h32d;
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
      expv[0] = 10'h001;
      expv[1] = 10'h001;
      expv[2] = 10'h001;
      expv[3] = 10'h000;
      expv[4] = 10'h001;
      expv[5] = 10'h000;
      expv[6] = 10'h299;
      expv[7] = 10'h298;
      expv[8] = 10'h298;
      expv[9] = 10'h298;
      expv[10] = 10'h348;
      expv[11] = 10'h018;
      expv[12] = 10'h018;
      expv[13] = 10'h018;
      expv[14] = 10'h018;
      expv[15] = 10'h260;
      expv[16] = 10'h260;
      expv[17] = 10'h260;
      expv[18] = 10'h262;
      expv[19] = 10'h262;
      expv[20] = 10'h3b8;
      expv[21] = 10'h3ba;
      expv[22] = 10'h22c;
      expv[23] = 10'h1f4;
      expv[24] = 10'h1f4;
      expv[25] = 10'h3c0;
      expv[26] = 10'h374;
      expv[27] = 10'h005;
      expv[28] = 10'h004;
      expv[29] = 10'h004;
      expv[30] = 10'h004;
      expv[31] = 10'h004;
      expv[32] = 10'h154;
      expv[33] = 10'h085;
      expv[34] = 10'h084;
      expv[35] = 10'h0f5;
      expv[36] = 10'h0f4;
      expv[37] = 10'h389;
      expv[38] = 10'h388;
      expv[39] = 10'h388;
      expv[40] = 10'h065;
      expv[41] = 10'h064;
      expv[42] = 10'h064;
      expv[43] = 10'h15c;
      expv[44] = 10'h15c;
      expv[45] = 10'h030;
      expv[46] = 10'h030;
      expv[47] = 10'h001;
      expv[48] = 10'h001;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h355;
      expv[52] = 10'h355;
      expv[53] = 10'h354;
      expv[54] = 10'h25d;
      expv[55] = 10'h25c;
      expv[56] = 10'h25c;
      expv[57] = 10'h061;
      expv[58] = 10'h061;
      expv[59] = 10'h061;
      expv[60] = 10'h061;
      expv[61] = 10'h060;
      expv[62] = 10'h335;
      expv[63] = 10'h334;
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
