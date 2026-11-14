// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02360 dut (
    .clk(clk),
    .rst(in_vec[25:25]),
    .is_sticky(in_vec[24:24]),
    .delay_valid(in_vec[23:23]),
    .delay_cycles(in_vec[22:19]),
    .pred_valid(in_vec[18:18]),
    .pred_match(in_vec[17:17]),
    .pred_index(in_vec[16:1]),
    .act_input(in_vec[0:0]),
    .act_output(out_vec[16:16]),
    .act_index(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h394339c;
    stim[1] = 26'h24f2310;
    stim[2] = 26'h1d6b987;
    stim[3] = 26'h10ef9ab;
    stim[4] = 26'h18b93d0;
    stim[5] = 26'h1056c9c;
    stim[6] = 26'h06bf21d;
    stim[7] = 26'h0ac7e00;
    stim[8] = 26'h05d669b;
    stim[9] = 26'h0c9e4f5;
    stim[10] = 26'h1d3d922;
    stim[11] = 26'h1710b57;
    stim[12] = 26'h1a12e04;
    stim[13] = 26'h0cb924c;
    stim[14] = 26'h1a53c5a;
    stim[15] = 26'h0233caf;
    stim[16] = 26'h054e15f;
    stim[17] = 26'h12382d3;
    stim[18] = 26'h1719db7;
    stim[19] = 26'h0acad37;
    stim[20] = 26'h15674e8;
    stim[21] = 26'h0201378;
    stim[22] = 26'h0da8ee0;
    stim[23] = 26'h0685ecd;
    stim[24] = 26'h1c97f28;
    stim[25] = 26'h0f28c4b;
    stim[26] = 26'h1cae58e;
    stim[27] = 26'h05ed539;
    stim[28] = 26'h0995cc1;
    stim[29] = 26'h02893b8;
    stim[30] = 26'h15997ad;
    stim[31] = 26'h0ec202d;
    stim[32] = 26'h142f8ba;
    stim[33] = 26'h1aa0be8;
    stim[34] = 26'h0439e55;
    stim[35] = 26'h1d37a76;
    stim[36] = 26'h0d95430;
    stim[37] = 26'h187de98;
    stim[38] = 26'h130373c;
    stim[39] = 26'h032eb41;
    stim[40] = 26'h15d7c50;
    stim[41] = 26'h0c8dcaa;
    stim[42] = 26'h0e56b64;
    stim[43] = 26'h1571697;
    stim[44] = 26'h0ecceea;
    stim[45] = 26'h017a356;
    stim[46] = 26'h0da1b30;
    stim[47] = 26'h0fab231;
    stim[48] = 26'h270208f;
    stim[49] = 26'h0ef63fa;
    stim[50] = 26'h05f5cc1;
    stim[51] = 26'h080e6a2;
    stim[52] = 26'h1c2f6b0;
    stim[53] = 26'h07a58ae;
    stim[54] = 26'h07ed111;
    stim[55] = 26'h0cf7c83;
    stim[56] = 26'h0ac32b1;
    stim[57] = 26'h118b153;
    stim[58] = 26'h04c7b47;
    stim[59] = 26'h012961a;
    stim[60] = 26'h19ced6b;
    stim[61] = 26'h0ea011f;
    stim[62] = 26'h198595b;
    stim[63] = 26'h1c3ab19;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'h0xxxx;
      expv[2] = 17'h0xxxx;
      expv[3] = 17'h0xxxx;
      expv[4] = 17'h0xxxx;
      expv[5] = 17'h0xxxx;
      expv[6] = 17'h0xxxx;
      expv[7] = 17'h0xxxx;
      expv[8] = 17'h0xxxx;
      expv[9] = 17'h0xxxx;
      expv[10] = 17'h0xxxx;
      expv[11] = 17'h0xxxx;
      expv[12] = 17'h0xxxx;
      expv[13] = 17'h0xxxx;
      expv[14] = 17'h0xxxx;
      expv[15] = 17'h0xxxx;
      expv[16] = 17'h0xxxx;
      expv[17] = 17'h0xxxx;
      expv[18] = 17'h0xxxx;
      expv[19] = 17'h0xxxx;
      expv[20] = 17'h0xxxx;
      expv[21] = 17'h13a74;
      expv[22] = 17'h13a74;
      expv[23] = 17'h13a74;
      expv[24] = 17'h13a74;
      expv[25] = 17'h13a74;
      expv[26] = 17'h13a74;
      expv[27] = 17'h13a74;
      expv[28] = 17'h03a74;
      expv[29] = 17'h03a74;
      expv[30] = 17'h03a74;
      expv[31] = 17'h03a74;
      expv[32] = 17'h03a74;
      expv[33] = 17'h03a74;
      expv[34] = 17'h03a74;
      expv[35] = 17'h03a74;
      expv[36] = 17'h03a74;
      expv[37] = 17'h03a74;
      expv[38] = 17'h1ef4c;
      expv[39] = 17'h1ef4c;
      expv[40] = 17'h1ef4c;
      expv[41] = 17'h1ef4c;
      expv[42] = 17'h1ef4c;
      expv[43] = 17'h0ef4c;
      expv[44] = 17'h18b4b;
      expv[45] = 17'h08b4b;
      expv[46] = 17'h08b4b;
      expv[47] = 17'h08b4b;
      expv[48] = 17'h08b4b;
      expv[49] = 17'h08b4b;
      expv[50] = 17'h08b4b;
      expv[51] = 17'h1ae60;
      expv[52] = 17'h1ae60;
      expv[53] = 17'h1ae60;
      expv[54] = 17'h1ae60;
      expv[55] = 17'h0ae60;
      expv[56] = 17'h0ae60;
      expv[57] = 17'h0ae60;
      expv[58] = 17'h0ae60;
      expv[59] = 17'h0ae60;
      expv[60] = 17'h0ae60;
      expv[61] = 17'h0ae60;
      expv[62] = 17'h0ae60;
      expv[63] = 17'h0ae60;
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
