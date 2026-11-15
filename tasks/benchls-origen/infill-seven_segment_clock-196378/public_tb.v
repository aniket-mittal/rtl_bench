// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 23;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_196378 dut (
    .disp_clk(clk),
    .blink_clk(in_vec[18:18]),
    .minutes(in_vec[17:10]),
    .seconds(in_vec[9:2]),
    .adj(in_vec[1:1]),
    .sel(in_vec[0:0]),
    .AN0(out_vec[22:19]),
    .AN1(out_vec[18:15]),
    .AN2(out_vec[14:11]),
    .AN3(out_vec[10:7]),
    .CA(out_vec[6:6]),
    .CB(out_vec[5:5]),
    .CC(out_vec[4:4]),
    .CD(out_vec[3:3]),
    .CE(out_vec[2:2]),
    .CF(out_vec[1:1]),
    .CG(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h4173c;
    stim[1] = 19'h3c119;
    stim[2] = 19'h52190;
    stim[3] = 19'h2416d;
    stim[4] = 19'h6954f;
    stim[5] = 19'h30f35;
    stim[6] = 19'h42ec4;
    stim[7] = 19'h23d69;
    stim[8] = 19'h2c605;
    stim[9] = 19'h5eb61;
    stim[10] = 19'h3c138;
    stim[11] = 19'h3b039;
    stim[12] = 19'h24fdb;
    stim[13] = 19'h306a3;
    stim[14] = 19'h34755;
    stim[15] = 19'h440fc;
    stim[16] = 19'h6ab61;
    stim[17] = 19'h41fe6;
    stim[18] = 19'h30d79;
    stim[19] = 19'h1d1a2;
    stim[20] = 19'h65c38;
    stim[21] = 19'h7d4f7;
    stim[22] = 19'h05e21;
    stim[23] = 19'h3d040;
    stim[24] = 19'h2cfef;
    stim[25] = 19'h7ee65;
    stim[26] = 19'h0f3e4;
    stim[27] = 19'h05c14;
    stim[28] = 19'h67db7;
    stim[29] = 19'h42ac1;
    stim[30] = 19'h1fcd0;
    stim[31] = 19'h43a2b;
    stim[32] = 19'h2bba1;
    stim[33] = 19'h6bf8b;
    stim[34] = 19'h3e8f3;
    stim[35] = 19'h50527;
    stim[36] = 19'h6891d;
    stim[37] = 19'h6b48d;
    stim[38] = 19'h4b050;
    stim[39] = 19'h70570;
    stim[40] = 19'h49b0d;
    stim[41] = 19'h3981d;
    stim[42] = 19'h76fcb;
    stim[43] = 19'h29a74;
    stim[44] = 19'h10e36;
    stim[45] = 19'h25511;
    stim[46] = 19'h7bc54;
    stim[47] = 19'h545b6;
    stim[48] = 19'h20688;
    stim[49] = 19'h7b187;
    stim[50] = 19'h254f5;
    stim[51] = 19'h5b2cf;
    stim[52] = 19'h01266;
    stim[53] = 19'h2a11f;
    stim[54] = 19'h2192d;
    stim[55] = 19'h79fb7;
    stim[56] = 19'h7a03f;
    stim[57] = 19'h0ac13;
    stim[58] = 19'h69449;
    stim[59] = 19'h3f7a0;
    stim[60] = 19'h18601;
    stim[61] = 19'h4c853;
    stim[62] = 19'h426ea;
    stim[63] = 19'h1ff1c;
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
      expv[0] = 23'hxxxxxx;
      expv[1] = 23'h7fff80;
      expv[2] = 23'h7fff80;
      expv[3] = 23'h7fff80;
      expv[4] = 23'h7fff80;
      expv[5] = 23'h7fff80;
      expv[6] = 23'h7fff80;
      expv[7] = 23'h7fff80;
      expv[8] = 23'h7fff80;
      expv[9] = 23'h7fff80;
      expv[10] = 23'h7fff80;
      expv[11] = 23'h7fff80;
      expv[12] = 23'h7fff80;
      expv[13] = 23'h7fff80;
      expv[14] = 23'h7fff80;
      expv[15] = 23'h7fff80;
      expv[16] = 23'h7fff80;
      expv[17] = 23'h7fff80;
      expv[18] = 23'h7fff80;
      expv[19] = 23'h7fff80;
      expv[20] = 23'h7fff80;
      expv[21] = 23'h7fff80;
      expv[22] = 23'h7fff80;
      expv[23] = 23'h7fff80;
      expv[24] = 23'h7fff80;
      expv[25] = 23'h7fff80;
      expv[26] = 23'h7fff80;
      expv[27] = 23'h7fff80;
      expv[28] = 23'h7fff80;
      expv[29] = 23'h7fff80;
      expv[30] = 23'h7fff80;
      expv[31] = 23'h7fff80;
      expv[32] = 23'h7fff80;
      expv[33] = 23'h7fff80;
      expv[34] = 23'h7fff80;
      expv[35] = 23'h7fff80;
      expv[36] = 23'h7fff80;
      expv[37] = 23'h7fff80;
      expv[38] = 23'h7fff80;
      expv[39] = 23'h7fff80;
      expv[40] = 23'h7fff80;
      expv[41] = 23'h7fff80;
      expv[42] = 23'h7fff80;
      expv[43] = 23'h7fff80;
      expv[44] = 23'h7fff80;
      expv[45] = 23'h7fff80;
      expv[46] = 23'h7fff80;
      expv[47] = 23'h7fff80;
      expv[48] = 23'h7fff80;
      expv[49] = 23'h7fff80;
      expv[50] = 23'h7fff80;
      expv[51] = 23'h7fff80;
      expv[52] = 23'h7fff80;
      expv[53] = 23'h7fff80;
      expv[54] = 23'h7fff80;
      expv[55] = 23'h7fff80;
      expv[56] = 23'h7fff80;
      expv[57] = 23'h7fff80;
      expv[58] = 23'h7fff80;
      expv[59] = 23'h7fff80;
      expv[60] = 23'h7fff80;
      expv[61] = 23'h7fff80;
      expv[62] = 23'h7fff80;
      expv[63] = 23'h7fff80;
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
