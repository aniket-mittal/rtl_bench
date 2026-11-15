// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_056280 dut (
    .ICLK(clk),
    .DATA_IN(in_vec[10:3]),
    .OCLK(in_vec[2:2]),
    .RST_ICLK(in_vec[1:1]),
    .RST_OCLK(in_vec[0:0]),
    .DATA_OUT(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h66f;
    stim[1] = 11'h4a6;
    stim[2] = 11'h429;
    stim[3] = 11'h734;
    stim[4] = 11'h6ac;
    stim[5] = 11'h7c8;
    stim[6] = 11'h055;
    stim[7] = 11'h4cd;
    stim[8] = 11'h7a5;
    stim[9] = 11'h2d9;
    stim[10] = 11'h229;
    stim[11] = 11'h638;
    stim[12] = 11'h145;
    stim[13] = 11'h655;
    stim[14] = 11'h6b9;
    stim[15] = 11'h228;
    stim[16] = 11'h0fd;
    stim[17] = 11'h548;
    stim[18] = 11'h115;
    stim[19] = 11'h110;
    stim[20] = 11'h0f8;
    stim[21] = 11'h641;
    stim[22] = 11'h670;
    stim[23] = 11'h7c5;
    stim[24] = 11'h6bd;
    stim[25] = 11'h641;
    stim[26] = 11'h2ec;
    stim[27] = 11'h130;
    stim[28] = 11'h675;
    stim[29] = 11'h52b;
    stim[30] = 11'h19c;
    stim[31] = 11'h5bc;
    stim[32] = 11'h065;
    stim[33] = 11'h2f4;
    stim[34] = 11'h334;
    stim[35] = 11'h288;
    stim[36] = 11'h6a0;
    stim[37] = 11'h2e4;
    stim[38] = 11'h6e4;
    stim[39] = 11'h6c4;
    stim[40] = 11'h55c;
    stim[41] = 11'h0f1;
    stim[42] = 11'h688;
    stim[43] = 11'h703;
    stim[44] = 11'h005;
    stim[45] = 11'h72c;
    stim[46] = 11'h598;
    stim[47] = 11'h4a0;
    stim[48] = 11'h339;
    stim[49] = 11'h17d;
    stim[50] = 11'h438;
    stim[51] = 11'h314;
    stim[52] = 11'h1d9;
    stim[53] = 11'h690;
    stim[54] = 11'h29d;
    stim[55] = 11'h291;
    stim[56] = 11'h528;
    stim[57] = 11'h110;
    stim[58] = 11'h615;
    stim[59] = 11'h53c;
    stim[60] = 11'h5fd;
    stim[61] = 11'h349;
    stim[62] = 11'h2ad;
    stim[63] = 11'h135;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'h00;
      expv[18] = 8'h00;
      expv[19] = 8'h00;
      expv[20] = 8'h00;
      expv[21] = 8'h00;
      expv[22] = 8'h00;
      expv[23] = 8'h00;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'h00;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h00;
      expv[36] = 8'h00;
      expv[37] = 8'h00;
      expv[38] = 8'h00;
      expv[39] = 8'h00;
      expv[40] = 8'h00;
      expv[41] = 8'h00;
      expv[42] = 8'h00;
      expv[43] = 8'h00;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h00;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'h00;
      expv[51] = 8'h00;
      expv[52] = 8'h00;
      expv[53] = 8'h00;
      expv[54] = 8'h00;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'h00;
      expv[58] = 8'h00;
      expv[59] = 8'h00;
      expv[60] = 8'h00;
      expv[61] = 8'h00;
      expv[62] = 8'h00;
      expv[63] = 8'h00;
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
