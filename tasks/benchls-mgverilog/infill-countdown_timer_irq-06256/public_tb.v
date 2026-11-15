// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06256 dut (
    .clk(clk),
    .reset(in_vec[36:36]),
    .en(in_vec[35:35]),
    .wr(in_vec[34:34]),
    .addr(in_vec[33:32]),
    .data_in(in_vec[31:0]),
    .data_out(out_vec[33:2]),
    .wt(out_vec[1:1]),
    .irq(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h1a7a469bce;
    stim[1] = 37'h18d8848ece;
    stim[2] = 37'h042e2c8cc5;
    stim[3] = 37'h049b1afe64;
    stim[4] = 37'h0cc0d22ab2;
    stim[5] = 37'h099fa8e0e4;
    stim[6] = 37'h0da9e045ef;
    stim[7] = 37'h0707056946;
    stim[8] = 37'h0de74e16ef;
    stim[9] = 37'h060507c47a;
    stim[10] = 37'h06b6114ed0;
    stim[11] = 37'h0d1b54ba08;
    stim[12] = 37'h0cc823bb73;
    stim[13] = 37'h0f6e023e1c;
    stim[14] = 37'h043a9a0fd8;
    stim[15] = 37'h0312f6d6d9;
    stim[16] = 37'h04426fa278;
    stim[17] = 37'h070711c6da;
    stim[18] = 37'h032ccd2b0b;
    stim[19] = 37'h086dae014a;
    stim[20] = 37'h093de2e4b7;
    stim[21] = 37'h0211abfbc5;
    stim[22] = 37'h0b5d30472d;
    stim[23] = 37'h0096135b37;
    stim[24] = 37'h0a58ce4fa9;
    stim[25] = 37'h0e164fd7f7;
    stim[26] = 37'h039fda9fc8;
    stim[27] = 37'h07d8692d3f;
    stim[28] = 37'h0b095de799;
    stim[29] = 37'h0153ddd506;
    stim[30] = 37'h01f990c698;
    stim[31] = 37'h14c5b87d96;
    stim[32] = 37'h0659eeeab8;
    stim[33] = 37'h09eeb799fe;
    stim[34] = 37'h0ccd26cf59;
    stim[35] = 37'h0ea4ecd212;
    stim[36] = 37'h0eb8cf6ec7;
    stim[37] = 37'h05eb2e7aff;
    stim[38] = 37'h06cf8be7f6;
    stim[39] = 37'h03fdcbab31;
    stim[40] = 37'h073d90601d;
    stim[41] = 37'h0651394294;
    stim[42] = 37'h0147a79ac6;
    stim[43] = 37'h0e0aab49ab;
    stim[44] = 37'h04d8c50acc;
    stim[45] = 37'h00150c1936;
    stim[46] = 37'h09f6546324;
    stim[47] = 37'h051bcb359d;
    stim[48] = 37'h0f6a310e9a;
    stim[49] = 37'h00a815f88d;
    stim[50] = 37'h00640be4ad;
    stim[51] = 37'h04029f7ca7;
    stim[52] = 37'h0cee56e4a2;
    stim[53] = 37'h0a2795f3a9;
    stim[54] = 37'h0b3429dc02;
    stim[55] = 37'h060a620acd;
    stim[56] = 37'h0139210813;
    stim[57] = 37'h0239eda6e2;
    stim[58] = 37'h03fb44aea7;
    stim[59] = 37'h09c9c367c3;
    stim[60] = 37'h0c10c6c270;
    stim[61] = 37'h0d5737c321;
    stim[62] = 37'h068d8eca5a;
    stim[63] = 37'h0db704fe5f;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h000000000;
      expv[5] = 34'h3fffffffc;
      expv[6] = 34'h3fffffffc;
      expv[7] = 34'hxxxxxxxxx;
      expv[8] = 34'h2a78117bc;
      expv[9] = 34'h2a78117b8;
      expv[10] = 34'h39d385bbc;
      expv[11] = 34'h39d385bbc;
      expv[12] = 34'h000000008;
      expv[13] = 34'hxxxxxxxxx;
      expv[14] = 34'h00000000d;
      expv[15] = 34'hxxxxxxxxx;
      expv[16] = 34'h00000000d;
      expv[17] = 34'hxxxxxxxxx;
      expv[18] = 34'hxxxxxxxxx;
      expv[19] = 34'h00000000d;
      expv[20] = 34'h06d52e821;
      expv[21] = 34'h06d52e801;
      expv[22] = 34'hxxxxxxxxx;
      expv[23] = 34'h00000000d;
      expv[24] = 34'h06d52e7f5;
      expv[25] = 34'h06d52e7f1;
      expv[26] = 34'hxxxxxxxxx;
      expv[27] = 34'hxxxxxxxxx;
      expv[28] = 34'hxxxxxxxxx;
      expv[29] = 34'h06d52e821;
      expv[30] = 34'h06d52e821;
      expv[31] = 34'h00000000d;
      expv[32] = 34'h06d52e7d4;
      expv[33] = 34'h3fffffffc;
      expv[34] = 34'h000000000;
      expv[35] = 34'h3fffffff4;
      expv[36] = 34'h3fffffff0;
      expv[37] = 34'h3fffffffc;
      expv[38] = 34'h3ffffffe8;
      expv[39] = 34'hxxxxxxxxx;
      expv[40] = 34'hxxxxxxxxx;
      expv[41] = 34'h3ffffffdc;
      expv[42] = 34'h3fffffffc;
      expv[43] = 34'h3ffffffd4;
      expv[44] = 34'h000000004;
      expv[45] = 34'h000000004;
      expv[46] = 34'h3fffffffc;
      expv[47] = 34'h3fffffffc;
      expv[48] = 34'hxxxxxxxxx;
      expv[49] = 34'h000000004;
      expv[50] = 34'h000000004;
      expv[51] = 34'h000000004;
      expv[52] = 34'h000000004;
      expv[53] = 34'h3ffffffac;
      expv[54] = 34'hxxxxxxxxx;
      expv[55] = 34'h3ffffffa4;
      expv[56] = 34'h3fffffffc;
      expv[57] = 34'h3ffffff9c;
      expv[58] = 34'hxxxxxxxxx;
      expv[59] = 34'h3fffffffc;
      expv[60] = 34'h000000008;
      expv[61] = 34'h3fffffffc;
      expv[62] = 34'h3ffffff88;
      expv[63] = 34'h15cdf0c84;
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
