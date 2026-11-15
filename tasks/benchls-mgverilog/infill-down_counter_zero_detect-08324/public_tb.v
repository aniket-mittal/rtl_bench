// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08324 dut (
    .Clk_i(clk),
    .Reset_n_i(in_vec[34:34]),
    .Preset_i(in_vec[33:33]),
    .Enable_i(in_vec[32:32]),
    .PresetVal_i(in_vec[31:0]),
    .Zero_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h21fac2ac9;
    stim[1] = 35'h390301c83;
    stim[2] = 35'h4ed615a1e;
    stim[3] = 35'h1c0ff9096;
    stim[4] = 35'h4fbcf359e;
    stim[5] = 35'h1db1ac8a2;
    stim[6] = 35'h5af6e9052;
    stim[7] = 35'h1a319ead8;
    stim[8] = 35'h020d7bc17;
    stim[9] = 35'h42bd7a1e8;
    stim[10] = 35'h0edc55d48;
    stim[11] = 35'h4ba42c24e;
    stim[12] = 35'h138119cd2;
    stim[13] = 35'h52e4f6848;
    stim[14] = 35'h013c262d7;
    stim[15] = 35'h16234b28d;
    stim[16] = 35'h176eee8a8;
    stim[17] = 35'h50b6f63e3;
    stim[18] = 35'h5a655517b;
    stim[19] = 35'h52b699bb4;
    stim[20] = 35'h108a8b233;
    stim[21] = 35'h088fa7ad1;
    stim[22] = 35'h09b456489;
    stim[23] = 35'h595f0f942;
    stim[24] = 35'h0dec0c201;
    stim[25] = 35'h47f85bdad;
    stim[26] = 35'h4615b169c;
    stim[27] = 35'h35bea6464;
    stim[28] = 35'h0ff7af491;
    stim[29] = 35'h4fbef4338;
    stim[30] = 35'h03cc1a95c;
    stim[31] = 35'h12c7f214d;
    stim[32] = 35'h1cbb8b14a;
    stim[33] = 35'h0d7a76018;
    stim[34] = 35'h087ef9622;
    stim[35] = 35'h1208351f3;
    stim[36] = 35'h108855274;
    stim[37] = 35'h1ac1eeeb3;
    stim[38] = 35'h10d8cafdc;
    stim[39] = 35'h4d9aecbb6;
    stim[40] = 35'h499a9f2f9;
    stim[41] = 35'h044735271;
    stim[42] = 35'h47bf767b5;
    stim[43] = 35'h072e35be9;
    stim[44] = 35'h1310d9a7b;
    stim[45] = 35'h0268c606e;
    stim[46] = 35'h598bef6c8;
    stim[47] = 35'h0b2b5a47f;
    stim[48] = 35'h038609a1e;
    stim[49] = 35'h588517b1b;
    stim[50] = 35'h4c4a9082d;
    stim[51] = 35'h434d89c84;
    stim[52] = 35'h1991e1a4a;
    stim[53] = 35'h478c55130;
    stim[54] = 35'h11f5c9b11;
    stim[55] = 35'h0b375cf0c;
    stim[56] = 35'h4edce50af;
    stim[57] = 35'h0a4c60c4c;
    stim[58] = 35'h441e4136c;
    stim[59] = 35'h43024b08a;
    stim[60] = 35'h54868afe7;
    stim[61] = 35'h59c3190a3;
    stim[62] = 35'h41fba87e5;
    stim[63] = 35'h52194d5cb;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
