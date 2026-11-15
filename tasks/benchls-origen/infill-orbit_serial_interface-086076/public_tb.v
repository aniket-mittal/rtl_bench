// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_086076 dut (
    .iClkOrb(clk),
    .reset(in_vec[12:12]),
    .iWord(in_vec[11:0]),
    .oAddr(out_vec[34:24]),
    .oRdEn(out_vec[23:23]),
    .oSwitch(out_vec[22:22]),
    .oOrbit(out_vec[21:21]),
    .oParallel(out_vec[20:9]),
    .oVal(out_vec[8:8]),
    .cycle(out_vec[7:2]),
    .RqSlow(out_vec[1:1]),
    .RqFast(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h10e6;
    stim[1] = 13'h17b0;
    stim[2] = 13'h016c;
    stim[3] = 13'h01d4;
    stim[4] = 13'h0183;
    stim[5] = 13'h0ba7;
    stim[6] = 13'h0e5c;
    stim[7] = 13'h0e46;
    stim[8] = 13'h05ea;
    stim[9] = 13'h02bb;
    stim[10] = 13'h0e1e;
    stim[11] = 13'h0b92;
    stim[12] = 13'h0f1a;
    stim[13] = 13'h0aa7;
    stim[14] = 13'h0aa6;
    stim[15] = 13'h0e94;
    stim[16] = 13'h0d93;
    stim[17] = 13'h0289;
    stim[18] = 13'h08fd;
    stim[19] = 13'h02a4;
    stim[20] = 13'h0c16;
    stim[21] = 13'h0a1f;
    stim[22] = 13'h0265;
    stim[23] = 13'h05c7;
    stim[24] = 13'h086a;
    stim[25] = 13'h0735;
    stim[26] = 13'h0f51;
    stim[27] = 13'h018f;
    stim[28] = 13'h0215;
    stim[29] = 13'h0d16;
    stim[30] = 13'h08e5;
    stim[31] = 13'h0521;
    stim[32] = 13'h0bbc;
    stim[33] = 13'h0ae3;
    stim[34] = 13'h069b;
    stim[35] = 13'h094f;
    stim[36] = 13'h0176;
    stim[37] = 13'h0f36;
    stim[38] = 13'h036d;
    stim[39] = 13'h0ac9;
    stim[40] = 13'h0371;
    stim[41] = 13'h0d6e;
    stim[42] = 13'h0752;
    stim[43] = 13'h0d79;
    stim[44] = 13'h0ecf;
    stim[45] = 13'h0c5a;
    stim[46] = 13'h09e7;
    stim[47] = 13'h04ef;
    stim[48] = 13'h068d;
    stim[49] = 13'h0e64;
    stim[50] = 13'h002c;
    stim[51] = 13'h09d2;
    stim[52] = 13'h0221;
    stim[53] = 13'h08e2;
    stim[54] = 13'h09ac;
    stim[55] = 13'h03cd;
    stim[56] = 13'h068d;
    stim[57] = 13'h03c3;
    stim[58] = 13'h04c3;
    stim[59] = 13'h00a9;
    stim[60] = 13'h04dc;
    stim[61] = 13'h0143;
    stim[62] = 13'h0d7d;
    stim[63] = 13'h1698;
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
      expv[0] = 35'h000000000;
      expv[1] = 35'h0009e0000;
      expv[2] = 35'h000000000;
      expv[3] = 35'h000000000;
      expv[4] = 35'h000000000;
      expv[5] = 35'h000000000;
      expv[6] = 35'h000000000;
      expv[7] = 35'h000000000;
      expv[8] = 35'h000000000;
      expv[9] = 35'h000000000;
      expv[10] = 35'h000000000;
      expv[11] = 35'h000000000;
      expv[12] = 35'h000000000;
      expv[13] = 35'h000000000;
      expv[14] = 35'h000000000;
      expv[15] = 35'h000000000;
      expv[16] = 35'h000000000;
      expv[17] = 35'h000000000;
      expv[18] = 35'h000000000;
      expv[19] = 35'h000000000;
      expv[20] = 35'h000000000;
      expv[21] = 35'h000000000;
      expv[22] = 35'h000000000;
      expv[23] = 35'h000000000;
      expv[24] = 35'h000000000;
      expv[25] = 35'h000000000;
      expv[26] = 35'h000000000;
      expv[27] = 35'h000000000;
      expv[28] = 35'h000000000;
      expv[29] = 35'h000000000;
      expv[30] = 35'h000000000;
      expv[31] = 35'h000000000;
      expv[32] = 35'h000000000;
      expv[33] = 35'h000000000;
      expv[34] = 35'h000000000;
      expv[35] = 35'h000000000;
      expv[36] = 35'h000000000;
      expv[37] = 35'h000000000;
      expv[38] = 35'h000000000;
      expv[39] = 35'h000000000;
      expv[40] = 35'h000000000;
      expv[41] = 35'h000000000;
      expv[42] = 35'h000000000;
      expv[43] = 35'h000000000;
      expv[44] = 35'h000000000;
      expv[45] = 35'h000000000;
      expv[46] = 35'h000000000;
      expv[47] = 35'h000000000;
      expv[48] = 35'h000000000;
      expv[49] = 35'h000000000;
      expv[50] = 35'h000000000;
      expv[51] = 35'h000000000;
      expv[52] = 35'h000000000;
      expv[53] = 35'h000000000;
      expv[54] = 35'h000000000;
      expv[55] = 35'h000000000;
      expv[56] = 35'h000000000;
      expv[57] = 35'h000000000;
      expv[58] = 35'h000000000;
      expv[59] = 35'h000000000;
      expv[60] = 35'h000000000;
      expv[61] = 35'h000000000;
      expv[62] = 35'h000000000;
      expv[63] = 35'h000000000;
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
