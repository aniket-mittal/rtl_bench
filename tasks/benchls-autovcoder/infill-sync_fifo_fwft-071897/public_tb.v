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

  autovcoder_071897 dut (
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
    stim[0] = 12'h8a1;
    stim[1] = 12'h920;
    stim[2] = 12'h60e;
    stim[3] = 12'h7cb;
    stim[4] = 12'h553;
    stim[5] = 12'h729;
    stim[6] = 12'h3fe;
    stim[7] = 12'h776;
    stim[8] = 12'h069;
    stim[9] = 12'h257;
    stim[10] = 12'h0cd;
    stim[11] = 12'h749;
    stim[12] = 12'h26b;
    stim[13] = 12'h50f;
    stim[14] = 12'h3ac;
    stim[15] = 12'h136;
    stim[16] = 12'h332;
    stim[17] = 12'h435;
    stim[18] = 12'h27b;
    stim[19] = 12'h50e;
    stim[20] = 12'h733;
    stim[21] = 12'h25a;
    stim[22] = 12'h70b;
    stim[23] = 12'h478;
    stim[24] = 12'h49f;
    stim[25] = 12'h016;
    stim[26] = 12'h50d;
    stim[27] = 12'h21e;
    stim[28] = 12'h45c;
    stim[29] = 12'h50f;
    stim[30] = 12'h7a3;
    stim[31] = 12'h0eb;
    stim[32] = 12'h1e6;
    stim[33] = 12'h367;
    stim[34] = 12'h51a;
    stim[35] = 12'h7b2;
    stim[36] = 12'h260;
    stim[37] = 12'h1b6;
    stim[38] = 12'h304;
    stim[39] = 12'h33a;
    stim[40] = 12'h3b5;
    stim[41] = 12'h710;
    stim[42] = 12'h02a;
    stim[43] = 12'h595;
    stim[44] = 12'h7be;
    stim[45] = 12'hd11;
    stim[46] = 12'h086;
    stim[47] = 12'h16e;
    stim[48] = 12'h1fa;
    stim[49] = 12'h6d6;
    stim[50] = 12'h0e0;
    stim[51] = 12'h30c;
    stim[52] = 12'h2b5;
    stim[53] = 12'h76a;
    stim[54] = 12'h64b;
    stim[55] = 12'h615;
    stim[56] = 12'h41e;
    stim[57] = 12'h681;
    stim[58] = 12'h7f3;
    stim[59] = 12'h443;
    stim[60] = 12'h796;
    stim[61] = 12'h5c6;
    stim[62] = 12'h110;
    stim[63] = 12'h608;
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
      expv[3] = 10'h1xx;
      expv[4] = 10'h1xx;
      expv[5] = 10'h3cb;
      expv[6] = 10'h353;
      expv[7] = 10'h353;
      expv[8] = 10'h329;
      expv[9] = 10'h329;
      expv[10] = 10'h329;
      expv[11] = 10'h329;
      expv[12] = 10'h376;
      expv[13] = 10'h376;
      expv[14] = 10'h376;
      expv[15] = 10'h376;
      expv[16] = 10'h376;
      expv[17] = 10'h376;
      expv[18] = 10'h376;
      expv[19] = 10'h376;
      expv[20] = 10'h376;
      expv[21] = 10'h349;
      expv[22] = 10'h349;
      expv[23] = 10'h30f;
      expv[24] = 10'h30f;
      expv[25] = 10'h30f;
      expv[26] = 10'h30f;
      expv[27] = 10'h30f;
      expv[28] = 10'h30f;
      expv[29] = 10'h30f;
      expv[30] = 10'h30f;
      expv[31] = 10'h30e;
      expv[32] = 10'h30e;
      expv[33] = 10'h30e;
      expv[34] = 10'h30e;
      expv[35] = 10'h30e;
      expv[36] = 10'h333;
      expv[37] = 10'h333;
      expv[38] = 10'h333;
      expv[39] = 10'h333;
      expv[40] = 10'h333;
      expv[41] = 10'h333;
      expv[42] = 10'h30b;
      expv[43] = 10'h30b;
      expv[44] = 10'h30b;
      expv[45] = 10'h30d;
      expv[46] = 10'h100;
      expv[47] = 10'h100;
      expv[48] = 10'h100;
      expv[49] = 10'h100;
      expv[50] = 10'h111;
      expv[51] = 10'h111;
      expv[52] = 10'h111;
      expv[53] = 10'h111;
      expv[54] = 10'h111;
      expv[55] = 10'h36a;
      expv[56] = 10'h16a;
      expv[57] = 10'h16a;
      expv[58] = 10'h16a;
      expv[59] = 10'h16a;
      expv[60] = 10'h3f3;
      expv[61] = 10'h1f3;
      expv[62] = 10'h396;
      expv[63] = 10'h396;
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
