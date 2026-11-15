// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_217797 dut (
    .clk25MHz(clk),
    .up(in_vec[16:16]),
    .down(in_vec[15:15]),
    .right(in_vec[14:14]),
    .left(in_vec[13:13]),
    .step_2(in_vec[12:9]),
    .secim1(in_vec[8:6]),
    .es1(in_vec[5:3]),
    .secim2(in_vec[2:0]),
    .es2(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h03323;
    stim[1] = 17'h010e1;
    stim[2] = 17'h06531;
    stim[3] = 17'h02fc9;
    stim[4] = 17'h117b9;
    stim[5] = 17'h015e7;
    stim[6] = 17'h0e329;
    stim[7] = 17'h0446b;
    stim[8] = 17'h00e26;
    stim[9] = 17'h15f04;
    stim[10] = 17'h1ee58;
    stim[11] = 17'h12e5f;
    stim[12] = 17'h0d37b;
    stim[13] = 17'h08517;
    stim[14] = 17'h15df1;
    stim[15] = 17'h03377;
    stim[16] = 17'h12e89;
    stim[17] = 17'h08861;
    stim[18] = 17'h1eb31;
    stim[19] = 17'h18e72;
    stim[20] = 17'h168fe;
    stim[21] = 17'h0a79e;
    stim[22] = 17'h03697;
    stim[23] = 17'h1bd4e;
    stim[24] = 17'h1c877;
    stim[25] = 17'h132b6;
    stim[26] = 17'h0c50e;
    stim[27] = 17'h1013e;
    stim[28] = 17'h0e500;
    stim[29] = 17'h05f73;
    stim[30] = 17'h0bc4e;
    stim[31] = 17'h1a5b5;
    stim[32] = 17'h195b3;
    stim[33] = 17'h03780;
    stim[34] = 17'h0b70a;
    stim[35] = 17'h0dbcd;
    stim[36] = 17'h15e8e;
    stim[37] = 17'h0a071;
    stim[38] = 17'h045be;
    stim[39] = 17'h111e3;
    stim[40] = 17'h12993;
    stim[41] = 17'h0fe1c;
    stim[42] = 17'h1b9ff;
    stim[43] = 17'h0b282;
    stim[44] = 17'h19949;
    stim[45] = 17'h19666;
    stim[46] = 17'h17d1e;
    stim[47] = 17'h02ad3;
    stim[48] = 17'h15281;
    stim[49] = 17'h1a6b5;
    stim[50] = 17'h16d12;
    stim[51] = 17'h0fb95;
    stim[52] = 17'h0d217;
    stim[53] = 17'h040fa;
    stim[54] = 17'h1fa23;
    stim[55] = 17'h116d4;
    stim[56] = 17'h06874;
    stim[57] = 17'h04174;
    stim[58] = 17'h0f7ce;
    stim[59] = 17'h09bcd;
    stim[60] = 17'h03d2e;
    stim[61] = 17'h0c61c;
    stim[62] = 17'h1d39b;
    stim[63] = 17'h03600;
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
      expv[0] = 3'hx;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h0;
      expv[6] = 3'h0;
      expv[7] = 3'h0;
      expv[8] = 3'h0;
      expv[9] = 3'h0;
      expv[10] = 3'h0;
      expv[11] = 3'h0;
      expv[12] = 3'h0;
      expv[13] = 3'h0;
      expv[14] = 3'h0;
      expv[15] = 3'h0;
      expv[16] = 3'h0;
      expv[17] = 3'h0;
      expv[18] = 3'h0;
      expv[19] = 3'h0;
      expv[20] = 3'h0;
      expv[21] = 3'h0;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h0;
      expv[27] = 3'h0;
      expv[28] = 3'h0;
      expv[29] = 3'h0;
      expv[30] = 3'h0;
      expv[31] = 3'h0;
      expv[32] = 3'h0;
      expv[33] = 3'h0;
      expv[34] = 3'h0;
      expv[35] = 3'h0;
      expv[36] = 3'h0;
      expv[37] = 3'h0;
      expv[38] = 3'h0;
      expv[39] = 3'h0;
      expv[40] = 3'h0;
      expv[41] = 3'h0;
      expv[42] = 3'h0;
      expv[43] = 3'h0;
      expv[44] = 3'h0;
      expv[45] = 3'h0;
      expv[46] = 3'h0;
      expv[47] = 3'h0;
      expv[48] = 3'h0;
      expv[49] = 3'h0;
      expv[50] = 3'h0;
      expv[51] = 3'h0;
      expv[52] = 3'h0;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h0;
      expv[56] = 3'h0;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h0;
      expv[60] = 3'h0;
      expv[61] = 3'h0;
      expv[62] = 3'h0;
      expv[63] = 3'h0;
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
