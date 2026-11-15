// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_128283 dut (
    .clk(clk),
    .reset(in_vec[12:12]),
    .green_time(in_vec[11:8]),
    .yellow_time(in_vec[7:4]),
    .red_time(in_vec[3:0]),
    .state(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1229;
    stim[1] = 13'h1f16;
    stim[2] = 13'h0df2;
    stim[3] = 13'h0801;
    stim[4] = 13'h03ed;
    stim[5] = 13'h00a8;
    stim[6] = 13'h0461;
    stim[7] = 13'h0924;
    stim[8] = 13'h091a;
    stim[9] = 13'h0c55;
    stim[10] = 13'h0288;
    stim[11] = 13'h0e16;
    stim[12] = 13'h0436;
    stim[13] = 13'h0f9b;
    stim[14] = 13'h0ca4;
    stim[15] = 13'h06eb;
    stim[16] = 13'h072f;
    stim[17] = 13'h01e1;
    stim[18] = 13'h0bb5;
    stim[19] = 13'h03b5;
    stim[20] = 13'h013b;
    stim[21] = 13'h0f16;
    stim[22] = 13'h01ad;
    stim[23] = 13'h0b72;
    stim[24] = 13'h1d75;
    stim[25] = 13'h0237;
    stim[26] = 13'h0b4f;
    stim[27] = 13'h0132;
    stim[28] = 13'h01b0;
    stim[29] = 13'h0fec;
    stim[30] = 13'h08bc;
    stim[31] = 13'h034c;
    stim[32] = 13'h0039;
    stim[33] = 13'h002e;
    stim[34] = 13'h0f94;
    stim[35] = 13'h0681;
    stim[36] = 13'h07a0;
    stim[37] = 13'h0188;
    stim[38] = 13'h062a;
    stim[39] = 13'h099a;
    stim[40] = 13'h08a0;
    stim[41] = 13'h047b;
    stim[42] = 13'h0b9d;
    stim[43] = 13'h084d;
    stim[44] = 13'h0c82;
    stim[45] = 13'h0376;
    stim[46] = 13'h06c5;
    stim[47] = 13'h044d;
    stim[48] = 13'h0c7a;
    stim[49] = 13'h0b0c;
    stim[50] = 13'h00e0;
    stim[51] = 13'h0dbc;
    stim[52] = 13'h0ee4;
    stim[53] = 13'h0dde;
    stim[54] = 13'h09d4;
    stim[55] = 13'h0fe1;
    stim[56] = 13'h0666;
    stim[57] = 13'h0cc9;
    stim[58] = 13'h0d87;
    stim[59] = 13'h00cf;
    stim[60] = 13'h0587;
    stim[61] = 13'h0286;
    stim[62] = 13'h06d5;
    stim[63] = 13'h0e35;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h0;
      expv[4] = 2'h1;
      expv[5] = 2'h1;
      expv[6] = 2'h2;
      expv[7] = 2'h2;
      expv[8] = 2'h2;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h0;
      expv[15] = 2'h1;
      expv[16] = 2'h1;
      expv[17] = 2'h1;
      expv[18] = 2'h2;
      expv[19] = 2'h2;
      expv[20] = 2'h2;
      expv[21] = 2'h2;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h1;
      expv[29] = 2'h1;
      expv[30] = 2'h1;
      expv[31] = 2'h1;
      expv[32] = 2'h2;
      expv[33] = 2'h2;
      expv[34] = 2'h2;
      expv[35] = 2'h2;
      expv[36] = 2'h2;
      expv[37] = 2'h2;
      expv[38] = 2'h2;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h1;
      expv[42] = 2'h1;
      expv[43] = 2'h1;
      expv[44] = 2'h1;
      expv[45] = 2'h1;
      expv[46] = 2'h2;
      expv[47] = 2'h2;
      expv[48] = 2'h2;
      expv[49] = 2'h2;
      expv[50] = 2'h0;
      expv[51] = 2'h1;
      expv[52] = 2'h1;
      expv[53] = 2'h1;
      expv[54] = 2'h1;
      expv[55] = 2'h1;
      expv[56] = 2'h1;
      expv[57] = 2'h1;
      expv[58] = 2'h1;
      expv[59] = 2'h1;
      expv[60] = 2'h2;
      expv[61] = 2'h2;
      expv[62] = 2'h2;
      expv[63] = 2'h2;
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
