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

  rtlpp_11092 dut (
    .CLK(clk),
    .RESETn(in_vec[10:10]),
    .DATA_IN(in_vec[9:2]),
    .PUSH(in_vec[1:1]),
    .POP(in_vec[0:0]),
    .DATA_OUT(out_vec[9:2]),
    .FULL(out_vec[1:1]),
    .EMPTY(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h042;
    stim[1] = 11'h066;
    stim[2] = 11'h547;
    stim[3] = 11'h46b;
    stim[4] = 11'h5b8;
    stim[5] = 11'h72d;
    stim[6] = 11'h5e0;
    stim[7] = 11'h574;
    stim[8] = 11'h784;
    stim[9] = 11'h4e9;
    stim[10] = 11'h635;
    stim[11] = 11'h4ff;
    stim[12] = 11'h5c0;
    stim[13] = 11'h703;
    stim[14] = 11'h6c1;
    stim[15] = 11'h725;
    stim[16] = 11'h4da;
    stim[17] = 11'h58f;
    stim[18] = 11'h267;
    stim[19] = 11'h55f;
    stim[20] = 11'h78d;
    stim[21] = 11'h614;
    stim[22] = 11'h6a9;
    stim[23] = 11'h4c9;
    stim[24] = 11'h4a6;
    stim[25] = 11'h5a0;
    stim[26] = 11'h793;
    stim[27] = 11'h6fb;
    stim[28] = 11'h713;
    stim[29] = 11'h634;
    stim[30] = 11'h7e9;
    stim[31] = 11'h553;
    stim[32] = 11'h662;
    stim[33] = 11'h5ac;
    stim[34] = 11'h449;
    stim[35] = 11'h6f4;
    stim[36] = 11'h527;
    stim[37] = 11'h4a5;
    stim[38] = 11'h72e;
    stim[39] = 11'h5fd;
    stim[40] = 11'h57c;
    stim[41] = 11'h70e;
    stim[42] = 11'h510;
    stim[43] = 11'h69d;
    stim[44] = 11'h59a;
    stim[45] = 11'h5a4;
    stim[46] = 11'h560;
    stim[47] = 11'h6f3;
    stim[48] = 11'h53a;
    stim[49] = 11'h74d;
    stim[50] = 11'h703;
    stim[51] = 11'h410;
    stim[52] = 11'h676;
    stim[53] = 11'h7f5;
    stim[54] = 11'h593;
    stim[55] = 11'h264;
    stim[56] = 11'h6bc;
    stim[57] = 11'h757;
    stim[58] = 11'h5fc;
    stim[59] = 11'h4f8;
    stim[60] = 11'h5e7;
    stim[61] = 11'h7ca;
    stim[62] = 11'h5ed;
    stim[63] = 11'h5ea;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'h067;
      expv[4] = 10'h144;
      expv[5] = 10'h144;
      expv[6] = 10'hxxx;
      expv[7] = 10'hxxx;
      expv[8] = 10'hxxx;
      expv[9] = 10'hxxx;
      expv[10] = 10'hxxx;
      expv[11] = 10'hxxx;
      expv[12] = 10'hxxx;
      expv[13] = 10'hxxx;
      expv[14] = 10'hxxx;
      expv[15] = 10'hxxx;
      expv[16] = 10'hxxx;
      expv[17] = 10'hxxx;
      expv[18] = 10'hxxx;
      expv[19] = 10'h069;
      expv[20] = 10'h267;
      expv[21] = 10'h267;
      expv[22] = 10'h267;
      expv[23] = 10'h267;
      expv[24] = 10'h267;
      expv[25] = 10'h267;
      expv[26] = 10'h267;
      expv[27] = 10'h15c;
      expv[28] = 10'h303;
      expv[29] = 10'h2f8;
      expv[30] = 10'h2f8;
      expv[31] = 10'h18d;
      expv[32] = 10'h18e;
      expv[33] = 10'h18e;
      expv[34] = 10'h18e;
      expv[35] = 10'hxxx;
      expv[36] = 10'hxxx;
      expv[37] = 10'hxxx;
      expv[38] = 10'hxxx;
      expv[39] = 10'hxxx;
      expv[40] = 10'hxxx;
      expv[41] = 10'hxxx;
      expv[42] = 10'hxxx;
      expv[43] = 10'hxxx;
      expv[44] = 10'hxxx;
      expv[45] = 10'hxxx;
      expv[46] = 10'hxxx;
      expv[47] = 10'hxxx;
      expv[48] = 10'hxxx;
      expv[49] = 10'hxxx;
      expv[50] = 10'hxxx;
      expv[51] = 10'hxxx;
      expv[52] = 10'hxxx;
      expv[53] = 10'hxxx;
      expv[54] = 10'hxxx;
      expv[55] = 10'hxxx;
      expv[56] = 10'hxxx;
      expv[57] = 10'hxxx;
      expv[58] = 10'h393;
      expv[59] = 10'h393;
      expv[60] = 10'h393;
      expv[61] = 10'h354;
      expv[62] = 10'h356;
      expv[63] = 10'h3c9;
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
