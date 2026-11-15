// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_093513 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'he6b;
    stim[1] = 12'hf1a;
    stim[2] = 12'h515;
    stim[3] = 12'h10d;
    stim[4] = 12'h10f;
    stim[5] = 12'h6f9;
    stim[6] = 12'h0c9;
    stim[7] = 12'h4c8;
    stim[8] = 12'h007;
    stim[9] = 12'h65d;
    stim[10] = 12'h431;
    stim[11] = 12'h571;
    stim[12] = 12'h3f4;
    stim[13] = 12'h5cb;
    stim[14] = 12'h1ed;
    stim[15] = 12'h2e9;
    stim[16] = 12'h5e9;
    stim[17] = 12'h5f6;
    stim[18] = 12'h650;
    stim[19] = 12'h576;
    stim[20] = 12'h473;
    stim[21] = 12'h10b;
    stim[22] = 12'h60c;
    stim[23] = 12'h057;
    stim[24] = 12'h452;
    stim[25] = 12'h379;
    stim[26] = 12'h15e;
    stim[27] = 12'h281;
    stim[28] = 12'h257;
    stim[29] = 12'h3ec;
    stim[30] = 12'h0f3;
    stim[31] = 12'h65d;
    stim[32] = 12'h383;
    stim[33] = 12'h237;
    stim[34] = 12'h3c7;
    stim[35] = 12'h108;
    stim[36] = 12'h328;
    stim[37] = 12'h439;
    stim[38] = 12'h497;
    stim[39] = 12'h566;
    stim[40] = 12'h656;
    stim[41] = 12'h473;
    stim[42] = 12'h23a;
    stim[43] = 12'h06a;
    stim[44] = 12'h650;
    stim[45] = 12'h73d;
    stim[46] = 12'h697;
    stim[47] = 12'h6dc;
    stim[48] = 12'h3e1;
    stim[49] = 12'h61f;
    stim[50] = 12'h3c5;
    stim[51] = 12'h09b;
    stim[52] = 12'h7c6;
    stim[53] = 12'h653;
    stim[54] = 12'h797;
    stim[55] = 12'h6e4;
    stim[56] = 12'h7f1;
    stim[57] = 12'h67a;
    stim[58] = 12'h1df;
    stim[59] = 12'h6a6;
    stim[60] = 12'h4bb;
    stim[61] = 12'h7a8;
    stim[62] = 12'h45d;
    stim[63] = 12'h561;
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
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h11a;
      expv[4] = 10'h11a;
      expv[5] = 10'h11a;
      expv[6] = 10'h315;
      expv[7] = 10'h315;
      expv[8] = 10'h315;
      expv[9] = 10'h315;
      expv[10] = 10'h115;
      expv[11] = 10'h115;
      expv[12] = 10'h115;
      expv[13] = 10'h115;
      expv[14] = 10'h371;
      expv[15] = 10'h371;
      expv[16] = 10'h371;
      expv[17] = 10'h371;
      expv[18] = 10'h371;
      expv[19] = 10'h3cb;
      expv[20] = 10'h3cb;
      expv[21] = 10'h3cb;
      expv[22] = 10'h3cb;
      expv[23] = 10'h3e9;
      expv[24] = 10'h3e9;
      expv[25] = 10'h3e9;
      expv[26] = 10'h3e9;
      expv[27] = 10'h3e9;
      expv[28] = 10'h3e9;
      expv[29] = 10'h3e9;
      expv[30] = 10'h3e9;
      expv[31] = 10'h3e9;
      expv[32] = 10'h3f6;
      expv[33] = 10'h3f6;
      expv[34] = 10'h3f6;
      expv[35] = 10'h3f6;
      expv[36] = 10'h3f6;
      expv[37] = 10'h3f6;
      expv[38] = 10'h3f6;
      expv[39] = 10'h3f6;
      expv[40] = 10'h3f6;
      expv[41] = 10'h376;
      expv[42] = 10'h376;
      expv[43] = 10'h376;
      expv[44] = 10'h376;
      expv[45] = 10'h366;
      expv[46] = 10'h166;
      expv[47] = 10'h33d;
      expv[48] = 10'h13d;
      expv[49] = 10'h13d;
      expv[50] = 10'h13d;
      expv[51] = 10'h13d;
      expv[52] = 10'h13d;
      expv[53] = 10'h13d;
      expv[54] = 10'h3c6;
      expv[55] = 10'h1c6;
      expv[56] = 10'h397;
      expv[57] = 10'h197;
      expv[58] = 10'h3f1;
      expv[59] = 10'h3f1;
      expv[60] = 10'h1f1;
      expv[61] = 10'h1f1;
      expv[62] = 10'h1f1;
      expv[63] = 10'h3a8;
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
