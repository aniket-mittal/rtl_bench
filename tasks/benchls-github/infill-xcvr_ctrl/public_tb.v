// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 29;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  xcvr_ctrl dut (
    .reconfig_clk(clk),
    .reconfig_rst(in_vec[10:10]),
    .pll_locked_in(in_vec[9:9]),
    .xcvr_reconfig_readdata(in_vec[8:1]),
    .xcvr_reconfig_waitrequest(in_vec[0:0]),
    .xcvr_reconfig_address(out_vec[28:10]),
    .xcvr_reconfig_read(out_vec[9:9]),
    .xcvr_reconfig_write(out_vec[8:8]),
    .xcvr_reconfig_writedata(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h534;
    stim[1] = 11'h4e3;
    stim[2] = 11'h38b;
    stim[3] = 11'h24d;
    stim[4] = 11'h080;
    stim[5] = 11'h237;
    stim[6] = 11'h371;
    stim[7] = 11'h0a5;
    stim[8] = 11'h33a;
    stim[9] = 11'h13a;
    stim[10] = 11'h2f1;
    stim[11] = 11'h3b1;
    stim[12] = 11'h1c4;
    stim[13] = 11'h164;
    stim[14] = 11'h0f3;
    stim[15] = 11'h2b0;
    stim[16] = 11'h3a1;
    stim[17] = 11'h044;
    stim[18] = 11'h24a;
    stim[19] = 11'h2d0;
    stim[20] = 11'h3ba;
    stim[21] = 11'h1b1;
    stim[22] = 11'h23e;
    stim[23] = 11'h191;
    stim[24] = 11'h1b1;
    stim[25] = 11'h37e;
    stim[26] = 11'h0e4;
    stim[27] = 11'h2b4;
    stim[28] = 11'h2c7;
    stim[29] = 11'h10e;
    stim[30] = 11'h335;
    stim[31] = 11'h1c6;
    stim[32] = 11'h0fb;
    stim[33] = 11'h211;
    stim[34] = 11'h3e7;
    stim[35] = 11'h049;
    stim[36] = 11'h2e1;
    stim[37] = 11'h21f;
    stim[38] = 11'h175;
    stim[39] = 11'h111;
    stim[40] = 11'h009;
    stim[41] = 11'h3ef;
    stim[42] = 11'h105;
    stim[43] = 11'h120;
    stim[44] = 11'h077;
    stim[45] = 11'h1f7;
    stim[46] = 11'h187;
    stim[47] = 11'h1ab;
    stim[48] = 11'h165;
    stim[49] = 11'h254;
    stim[50] = 11'h2fc;
    stim[51] = 11'h16c;
    stim[52] = 11'h03d;
    stim[53] = 11'h379;
    stim[54] = 11'h29f;
    stim[55] = 11'h29d;
    stim[56] = 11'h318;
    stim[57] = 11'h105;
    stim[58] = 11'h010;
    stim[59] = 11'h1d3;
    stim[60] = 11'h3c5;
    stim[61] = 11'h18f;
    stim[62] = 11'h3c1;
    stim[63] = 11'h193;
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
      expv[0] = 29'h00000000;
      expv[1] = 29'h00000000;
      expv[2] = 29'h00000000;
      expv[3] = 29'h00000000;
      expv[4] = 29'h00000000;
      expv[5] = 29'h00000000;
      expv[6] = 29'h00000000;
      expv[7] = 29'h00000000;
      expv[8] = 29'h00000000;
      expv[9] = 29'h00000000;
      expv[10] = 29'h00000000;
      expv[11] = 29'h00000000;
      expv[12] = 29'h00000000;
      expv[13] = 29'h00000000;
      expv[14] = 29'h00000000;
      expv[15] = 29'h00000000;
      expv[16] = 29'h00000000;
      expv[17] = 29'h00000000;
      expv[18] = 29'h00000000;
      expv[19] = 29'h00000000;
      expv[20] = 29'h00000000;
      expv[21] = 29'h00000000;
      expv[22] = 29'h00000000;
      expv[23] = 29'h00000000;
      expv[24] = 29'h00000000;
      expv[25] = 29'h00000000;
      expv[26] = 29'h00000000;
      expv[27] = 29'h00000000;
      expv[28] = 29'h00000000;
      expv[29] = 29'h00000000;
      expv[30] = 29'h00000000;
      expv[31] = 29'h00000000;
      expv[32] = 29'h00000000;
      expv[33] = 29'h00000000;
      expv[34] = 29'h00000000;
      expv[35] = 29'h00000000;
      expv[36] = 29'h00000000;
      expv[37] = 29'h00000000;
      expv[38] = 29'h00000000;
      expv[39] = 29'h00000000;
      expv[40] = 29'h00000000;
      expv[41] = 29'h00000000;
      expv[42] = 29'h00000000;
      expv[43] = 29'h00000000;
      expv[44] = 29'h00000000;
      expv[45] = 29'h00000000;
      expv[46] = 29'h00000000;
      expv[47] = 29'h00000000;
      expv[48] = 29'h00000000;
      expv[49] = 29'h00000000;
      expv[50] = 29'h00000000;
      expv[51] = 29'h00000000;
      expv[52] = 29'h00000000;
      expv[53] = 29'h00000000;
      expv[54] = 29'h00000000;
      expv[55] = 29'h00000000;
      expv[56] = 29'h00000000;
      expv[57] = 29'h00000000;
      expv[58] = 29'h00000000;
      expv[59] = 29'h00000000;
      expv[60] = 29'h00000000;
      expv[61] = 29'h00000000;
      expv[62] = 29'h00000000;
      expv[63] = 29'h00000000;
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
