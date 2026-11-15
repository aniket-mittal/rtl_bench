// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_022220 dut (
    .clk_input(clk),
    .data_input(in_vec[40:33]),
    .data_load(in_vec[32:32]),
    .baudRate(in_vec[31:0]),
    .tx_pin(out_vec[1:1]),
    .tx_complete(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h080dbd76184;
    stim[1] = 41'h197159d3aa9;
    stim[2] = 41'h0c96d7bf4cb;
    stim[3] = 41'h01ccff77650;
    stim[4] = 41'h0ca9b0615c6;
    stim[5] = 41'h0cc2b12f0aa;
    stim[6] = 41'h0c466ddb5ec;
    stim[7] = 41'h18060007a14;
    stim[8] = 41'h16eb7f16bd1;
    stim[9] = 41'h128a690acde;
    stim[10] = 41'h1832493bdf3;
    stim[11] = 41'h0630744dd02;
    stim[12] = 41'h10cf32d0742;
    stim[13] = 41'h0da55f6326e;
    stim[14] = 41'h1acc29fe8de;
    stim[15] = 41'h08ccd663a81;
    stim[16] = 41'h1cfd4cc36b7;
    stim[17] = 41'h1298831c02e;
    stim[18] = 41'h083d5f63edc;
    stim[19] = 41'h17d70325c09;
    stim[20] = 41'h18977050fb2;
    stim[21] = 41'h0292dcf0c6f;
    stim[22] = 41'h164a1f2cffd;
    stim[23] = 41'h1a1bc8f1ae7;
    stim[24] = 41'h1a68cc54a18;
    stim[25] = 41'h1fceaa272f4;
    stim[26] = 41'h08be4c5d479;
    stim[27] = 41'h07b2bb16142;
    stim[28] = 41'h1ec20057e40;
    stim[29] = 41'h178796e6d1c;
    stim[30] = 41'h1cc01c03953;
    stim[31] = 41'h0dfc512d194;
    stim[32] = 41'h11bc82f3de9;
    stim[33] = 41'h045bad2abad;
    stim[34] = 41'h0d58aa42c5d;
    stim[35] = 41'h033a463c427;
    stim[36] = 41'h097eb2b3d62;
    stim[37] = 41'h0f42722f659;
    stim[38] = 41'h14a0152d26a;
    stim[39] = 41'h06f4cb75655;
    stim[40] = 41'h1901d8a6963;
    stim[41] = 41'h1011a867fef;
    stim[42] = 41'h06def154c25;
    stim[43] = 41'h1ada43d84e1;
    stim[44] = 41'h1e11c8dace6;
    stim[45] = 41'h0495963bc56;
    stim[46] = 41'h03514226c09;
    stim[47] = 41'h0c72b5df421;
    stim[48] = 41'h0bb1cef8224;
    stim[49] = 41'h00a20edc00d;
    stim[50] = 41'h082f165953b;
    stim[51] = 41'h019359a5e35;
    stim[52] = 41'h11dbcdb54aa;
    stim[53] = 41'h06855fd6827;
    stim[54] = 41'h126beaac03f;
    stim[55] = 41'h1c2230e259e;
    stim[56] = 41'h13892c5915b;
    stim[57] = 41'h1afa4be2c06;
    stim[58] = 41'h129361a2834;
    stim[59] = 41'h11d2c1e9a31;
    stim[60] = 41'h1e829e174d9;
    stim[61] = 41'h031303c23ae;
    stim[62] = 41'h149ae672f6d;
    stim[63] = 41'h170bf88f464;
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
      expv[0] = 2'hx;
      expv[1] = 2'h3;
      expv[2] = 2'h2;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h0;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
