// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 69;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_055714 dut (
    .iClock(clk),
    .iReset(in_vec[26:26]),
    .iEnable(in_vec[25:25]),
    .iData(in_vec[24:24]),
    .iBlockSize(in_vec[23:8]),
    .iPredictorOrder(in_vec[7:4]),
    .iPartitionOrder(in_vec[3:0]),
    .oMSB(out_vec[68:37]),
    .oLSB(out_vec[36:5]),
    .oRiceParam(out_vec[4:1]),
    .oDone(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h4502280;
    stim[1] = 27'h49a0391;
    stim[2] = 27'h389b32e;
    stim[3] = 27'h1ce606f;
    stim[4] = 27'h32cb901;
    stim[5] = 27'h3f0b3e6;
    stim[6] = 27'h396b2de;
    stim[7] = 27'h3f87c94;
    stim[8] = 27'h3c46a81;
    stim[9] = 27'h22d1bb2;
    stim[10] = 27'h347aef5;
    stim[11] = 27'h738adcf;
    stim[12] = 27'h367d96b;
    stim[13] = 27'h55b93ff;
    stim[14] = 27'h01b85e1;
    stim[15] = 27'h1d20e29;
    stim[16] = 27'h3eafc43;
    stim[17] = 27'h23e84ce;
    stim[18] = 27'h24ed300;
    stim[19] = 27'h21b1526;
    stim[20] = 27'h18bd941;
    stim[21] = 27'h2d1e4ee;
    stim[22] = 27'h2235382;
    stim[23] = 27'h1e7c67b;
    stim[24] = 27'h1861ab9;
    stim[25] = 27'h1ab654e;
    stim[26] = 27'h3c397f9;
    stim[27] = 27'h1de8b2e;
    stim[28] = 27'h234b166;
    stim[29] = 27'h241db5d;
    stim[30] = 27'h2a6b4b8;
    stim[31] = 27'h0f5d9af;
    stim[32] = 27'h0c03240;
    stim[33] = 27'h01c10c6;
    stim[34] = 27'h3bffc2a;
    stim[35] = 27'h3107c55;
    stim[36] = 27'h0a69726;
    stim[37] = 27'h234ac41;
    stim[38] = 27'h0578a03;
    stim[39] = 27'h2b60bd2;
    stim[40] = 27'h374f1cc;
    stim[41] = 27'h3ddf6d5;
    stim[42] = 27'h3a8d427;
    stim[43] = 27'h2576e12;
    stim[44] = 27'h1c264d4;
    stim[45] = 27'h76f8ecd;
    stim[46] = 27'h0440003;
    stim[47] = 27'h02ad357;
    stim[48] = 27'h0302c4a;
    stim[49] = 27'h3f62c83;
    stim[50] = 27'h3f00971;
    stim[51] = 27'h0130cbf;
    stim[52] = 27'h0b113d0;
    stim[53] = 27'h2b708a2;
    stim[54] = 27'h1fa394b;
    stim[55] = 27'h6c433ed;
    stim[56] = 27'h3b9e160;
    stim[57] = 27'h0dbc3c7;
    stim[58] = 27'h26f0925;
    stim[59] = 27'h04d0d32;
    stim[60] = 27'h00f93c1;
    stim[61] = 27'h2cbc12a;
    stim[62] = 27'h2416cce;
    stim[63] = 27'h2a704fd;
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
      expv[0] = 69'h000000000000000000;
      expv[1] = 69'h000000000000000000;
      expv[2] = 69'h000000000000000000;
      expv[3] = 69'h000000000000000000;
      expv[4] = 69'h000000000000000000;
      expv[5] = 69'h000000000000000000;
      expv[6] = 69'h000000000000000000;
      expv[7] = 69'h000000000000000000;
      expv[8] = 69'h000000000000000000;
      expv[9] = 69'h00000000000000001e;
      expv[10] = 69'h00000000000000001e;
      expv[11] = 69'h000000000000000000;
      expv[12] = 69'h000000000000000000;
      expv[13] = 69'h000000000000000000;
      expv[14] = 69'h000000000000000000;
      expv[15] = 69'h000000000000000000;
      expv[16] = 69'h000000000000000000;
      expv[17] = 69'h000000000000000000;
      expv[18] = 69'h000000000000000000;
      expv[19] = 69'h000000000000000000;
      expv[20] = 69'h000000000000000018;
      expv[21] = 69'h000000000000000018;
      expv[22] = 69'h000000000000000018;
      expv[23] = 69'h000000000000000018;
      expv[24] = 69'h000000000000000018;
      expv[25] = 69'h000000000000000012;
      expv[26] = 69'h000000000000000012;
      expv[27] = 69'h000000000000000012;
      expv[28] = 69'h000000000000000012;
      expv[29] = 69'h000000000000000012;
      expv[30] = 69'h00000000000000001c;
      expv[31] = 69'h00000000000000001c;
      expv[32] = 69'h00000000000000001c;
      expv[33] = 69'h00000000000000001c;
      expv[34] = 69'h00000000000000001c;
      expv[35] = 69'h000000000000000000;
      expv[36] = 69'h000000000000000000;
      expv[37] = 69'h000000000000000000;
      expv[38] = 69'h000000000000000000;
      expv[39] = 69'h000000000000000000;
      expv[40] = 69'h000000000000000010;
      expv[41] = 69'h000000000000000010;
      expv[42] = 69'h000000000000000010;
      expv[43] = 69'h000000000000000010;
      expv[44] = 69'h000000000000000010;
      expv[45] = 69'h000000000000000000;
      expv[46] = 69'h000000000000000000;
      expv[47] = 69'h000000000000000000;
      expv[48] = 69'h000000000000000000;
      expv[49] = 69'h000000000000000000;
      expv[50] = 69'h000000000000000000;
      expv[51] = 69'h000000000000000000;
      expv[52] = 69'h000000000000000006;
      expv[53] = 69'h000000000000000006;
      expv[54] = 69'h000000000000000006;
      expv[55] = 69'h000000000000000000;
      expv[56] = 69'h000000000000000000;
      expv[57] = 69'h000000000000000000;
      expv[58] = 69'h000000000000000000;
      expv[59] = 69'h000000000000000000;
      expv[60] = 69'h000000000000000000;
      expv[61] = 69'h000000000000000000;
      expv[62] = 69'h000000000000000000;
      expv[63] = 69'h000000000000000000;
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
