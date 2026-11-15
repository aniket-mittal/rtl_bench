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

  origen_029956 dut (
    .CLK(clk),
    .RSTN(in_vec[10:10]),
    .RD_ENB(in_vec[9:9]),
    .WR_ENB(in_vec[8:8]),
    .DATA_IN(in_vec[7:0]),
    .DATA_OUT(out_vec[9:2]),
    .EMPTY(out_vec[1:1]),
    .FULL(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h2e3;
    stim[1] = 11'h163;
    stim[2] = 11'h51c;
    stim[3] = 11'h510;
    stim[4] = 11'h520;
    stim[5] = 11'h6ce;
    stim[6] = 11'h7d5;
    stim[7] = 11'h486;
    stim[8] = 11'h53d;
    stim[9] = 11'h76b;
    stim[10] = 11'h401;
    stim[11] = 11'h799;
    stim[12] = 11'h58c;
    stim[13] = 11'h7d6;
    stim[14] = 11'h57f;
    stim[15] = 11'h52d;
    stim[16] = 11'h7d9;
    stim[17] = 11'h7f9;
    stim[18] = 11'h6cd;
    stim[19] = 11'h611;
    stim[20] = 11'h509;
    stim[21] = 11'h50e;
    stim[22] = 11'h5b2;
    stim[23] = 11'h558;
    stim[24] = 11'h486;
    stim[25] = 11'h790;
    stim[26] = 11'h6a0;
    stim[27] = 11'h73f;
    stim[28] = 11'h4d5;
    stim[29] = 11'h458;
    stim[30] = 11'h572;
    stim[31] = 11'h4cb;
    stim[32] = 11'h47f;
    stim[33] = 11'h564;
    stim[34] = 11'h5fc;
    stim[35] = 11'h5b3;
    stim[36] = 11'h577;
    stim[37] = 11'h53a;
    stim[38] = 11'h639;
    stim[39] = 11'h779;
    stim[40] = 11'h711;
    stim[41] = 11'h7f7;
    stim[42] = 11'h7ad;
    stim[43] = 11'h530;
    stim[44] = 11'h7f5;
    stim[45] = 11'h4e7;
    stim[46] = 11'h678;
    stim[47] = 11'h585;
    stim[48] = 11'h6bc;
    stim[49] = 11'h724;
    stim[50] = 11'h7cc;
    stim[51] = 11'h6b1;
    stim[52] = 11'h47e;
    stim[53] = 11'h752;
    stim[54] = 11'h50c;
    stim[55] = 11'h687;
    stim[56] = 11'h454;
    stim[57] = 11'h6ef;
    stim[58] = 11'h5b9;
    stim[59] = 11'h0cd;
    stim[60] = 11'h720;
    stim[61] = 11'h5a2;
    stim[62] = 11'h708;
    stim[63] = 11'h66f;
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
      expv[0] = 10'h002;
      expv[1] = 10'h002;
      expv[2] = 10'h002;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h000;
      expv[6] = 10'h070;
      expv[7] = 10'h040;
      expv[8] = 10'h040;
      expv[9] = 10'h040;
      expv[10] = 10'h080;
      expv[11] = 10'h080;
      expv[12] = 10'h356;
      expv[13] = 10'h354;
      expv[14] = 10'h0f6;
      expv[15] = 10'h0f4;
      expv[16] = 10'h0f4;
      expv[17] = 10'h1ac;
      expv[18] = 10'h266;
      expv[19] = 10'h266;
      expv[20] = 10'h266;
      expv[21] = 10'h264;
      expv[22] = 10'h264;
      expv[23] = 10'h264;
      expv[24] = 10'h264;
      expv[25] = 10'h264;
      expv[26] = 10'h230;
      expv[27] = 10'h358;
      expv[28] = 10'h1fc;
      expv[29] = 10'h1fc;
      expv[30] = 10'h1fc;
      expv[31] = 10'h1fc;
      expv[32] = 10'h1fc;
      expv[33] = 10'h1fc;
      expv[34] = 10'h1fc;
      expv[35] = 10'h1fc;
      expv[36] = 10'h1fc;
      expv[37] = 10'h1fc;
      expv[38] = 10'h1fc;
      expv[39] = 10'h0b4;
      expv[40] = 10'h364;
      expv[41] = 10'h3e4;
      expv[42] = 10'h024;
      expv[43] = 10'h038;
      expv[44] = 10'h038;
      expv[45] = 10'h2c8;
      expv[46] = 10'h2c8;
      expv[47] = 10'h160;
      expv[48] = 10'h160;
      expv[49] = 10'h240;
      expv[50] = 10'h0fe;
      expv[51] = 10'h0fc;
      expv[52] = 10'h1ca;
      expv[53] = 10'h1ca;
      expv[54] = 10'h1c8;
      expv[55] = 10'h1c8;
      expv[56] = 10'h190;
      expv[57] = 10'h190;
      expv[58] = 10'h3f2;
      expv[59] = 10'h002;
      expv[60] = 10'h002;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h080;
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
