// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02855 dut (
    .clk(clk),
    .en(in_vec[22:22]),
    .pre_first(in_vec[21:21]),
    .pwm_delay(in_vec[20:18]),
    .pwm_cycle(in_vec[17:10]),
    .spread(in_vec[9:7]),
    .cur_pwm(in_vec[6:4]),
    .pwm_code(in_vec[3:0]),
    .new_pwm(out_vec[4:2]),
    .mot(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h20b18d;
    stim[1] = 23'h73a6b2;
    stim[2] = 23'h4f59b3;
    stim[3] = 23'h06a832;
    stim[4] = 23'h50ad38;
    stim[5] = 23'h09a14b;
    stim[6] = 23'h46078f;
    stim[7] = 23'h12c659;
    stim[8] = 23'h06a4f5;
    stim[9] = 23'h434341;
    stim[10] = 23'h1b44ec;
    stim[11] = 23'h06d941;
    stim[12] = 23'h1898df;
    stim[13] = 23'h1b9d05;
    stim[14] = 23'h418e57;
    stim[15] = 23'h1f8103;
    stim[16] = 23'h0f4ef1;
    stim[17] = 23'h456f21;
    stim[18] = 23'h146cb7;
    stim[19] = 23'h0ad166;
    stim[20] = 23'h1de03b;
    stim[21] = 23'h597a88;
    stim[22] = 23'h5292b6;
    stim[23] = 23'h5abf00;
    stim[24] = 23'h108037;
    stim[25] = 23'h1668a5;
    stim[26] = 23'h08310b;
    stim[27] = 23'h068743;
    stim[28] = 23'h13f7d5;
    stim[29] = 23'h5a9d6e;
    stim[30] = 23'h00ab7a;
    stim[31] = 23'h4dc834;
    stim[32] = 23'h5f04d3;
    stim[33] = 23'h5ca198;
    stim[34] = 23'h7151a8;
    stim[35] = 23'h0e1438;
    stim[36] = 23'h17ba29;
    stim[37] = 23'h4338ed;
    stim[38] = 23'h53f285;
    stim[39] = 23'h5a7c5a;
    stim[40] = 23'h50d013;
    stim[41] = 23'h4414bc;
    stim[42] = 23'h0b1d5f;
    stim[43] = 23'h0bc19a;
    stim[44] = 23'h1b60c1;
    stim[45] = 23'h4be90b;
    stim[46] = 23'h19bb76;
    stim[47] = 23'h116da4;
    stim[48] = 23'h4b9404;
    stim[49] = 23'h17dba1;
    stim[50] = 23'h07cd27;
    stim[51] = 23'h5a83db;
    stim[52] = 23'h5ade06;
    stim[53] = 23'h40c070;
    stim[54] = 23'h59ef97;
    stim[55] = 23'h03b8fa;
    stim[56] = 23'h550455;
    stim[57] = 23'h1f86d4;
    stim[58] = 23'h4f9769;
    stim[59] = 23'h139907;
    stim[60] = 23'h0794bd;
    stim[61] = 23'h1b78a9;
    stim[62] = 23'h446407;
    stim[63] = 23'h0c8d7c;
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
      expv[0] = 5'h10;
      expv[1] = 5'h0e;
      expv[2] = 5'h0e;
      expv[3] = 5'h10;
      expv[4] = 5'h00;
      expv[5] = 5'h10;
      expv[6] = 5'h03;
      expv[7] = 5'h10;
      expv[8] = 5'h10;
      expv[9] = 5'h10;
      expv[10] = 5'h10;
      expv[11] = 5'h10;
      expv[12] = 5'h10;
      expv[13] = 5'h10;
      expv[14] = 5'h14;
      expv[15] = 5'h10;
      expv[16] = 5'h10;
      expv[17] = 5'h09;
      expv[18] = 5'h10;
      expv[19] = 5'h10;
      expv[20] = 5'h10;
      expv[21] = 5'h00;
      expv[22] = 5'h0e;
      expv[23] = 5'h03;
      expv[24] = 5'h10;
      expv[25] = 5'h10;
      expv[26] = 5'h10;
      expv[27] = 5'h10;
      expv[28] = 5'h10;
      expv[29] = 5'h18;
      expv[30] = 5'h10;
      expv[31] = 5'h0e;
      expv[32] = 5'h14;
      expv[33] = 5'h00;
      expv[34] = 5'h00;
      expv[35] = 5'h10;
      expv[36] = 5'h10;
      expv[37] = 5'h18;
      expv[38] = 5'h03;
      expv[39] = 5'h14;
      expv[40] = 5'h07;
      expv[41] = 5'h0e;
      expv[42] = 5'h10;
      expv[43] = 5'h10;
      expv[44] = 5'h10;
      expv[45] = 5'h03;
      expv[46] = 5'h10;
      expv[47] = 5'h10;
      expv[48] = 5'h03;
      expv[49] = 5'h10;
      expv[50] = 5'h10;
      expv[51] = 5'h14;
      expv[52] = 5'h03;
      expv[53] = 5'h1c;
      expv[54] = 5'h07;
      expv[55] = 5'h10;
      expv[56] = 5'h14;
      expv[57] = 5'h10;
      expv[58] = 5'h18;
      expv[59] = 5'h10;
      expv[60] = 5'h10;
      expv[61] = 5'h10;
      expv[62] = 5'h03;
      expv[63] = 5'h10;
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
