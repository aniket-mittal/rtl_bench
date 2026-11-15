// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_112895 dut (
    .clk_base(clk),
    .clk_en(in_vec[2:2]),
    .clk_test_1(in_vec[1:1]),
    .clk_test_2(in_vec[0:0]),
    .count_1(out_vec[65:34]),
    .count_2(out_vec[33:2]),
    .isCount(out_vec[1:1]),
    .pin_r(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h4;
    stim[1] = 3'h1;
    stim[2] = 3'h7;
    stim[3] = 3'h0;
    stim[4] = 3'h5;
    stim[5] = 3'h1;
    stim[6] = 3'h3;
    stim[7] = 3'h3;
    stim[8] = 3'h5;
    stim[9] = 3'h3;
    stim[10] = 3'h7;
    stim[11] = 3'h7;
    stim[12] = 3'h6;
    stim[13] = 3'h7;
    stim[14] = 3'h0;
    stim[15] = 3'h3;
    stim[16] = 3'h2;
    stim[17] = 3'h0;
    stim[18] = 3'h2;
    stim[19] = 3'h3;
    stim[20] = 3'h7;
    stim[21] = 3'h0;
    stim[22] = 3'h2;
    stim[23] = 3'h3;
    stim[24] = 3'h3;
    stim[25] = 3'h1;
    stim[26] = 3'h4;
    stim[27] = 3'h6;
    stim[28] = 3'h1;
    stim[29] = 3'h6;
    stim[30] = 3'h0;
    stim[31] = 3'h6;
    stim[32] = 3'h5;
    stim[33] = 3'h5;
    stim[34] = 3'h4;
    stim[35] = 3'h1;
    stim[36] = 3'h6;
    stim[37] = 3'h7;
    stim[38] = 3'h7;
    stim[39] = 3'h4;
    stim[40] = 3'h7;
    stim[41] = 3'h4;
    stim[42] = 3'h2;
    stim[43] = 3'h2;
    stim[44] = 3'h1;
    stim[45] = 3'h2;
    stim[46] = 3'h2;
    stim[47] = 3'h0;
    stim[48] = 3'h4;
    stim[49] = 3'h3;
    stim[50] = 3'h6;
    stim[51] = 3'h1;
    stim[52] = 3'h1;
    stim[53] = 3'h7;
    stim[54] = 3'h7;
    stim[55] = 3'h7;
    stim[56] = 3'h0;
    stim[57] = 3'h2;
    stim[58] = 3'h3;
    stim[59] = 3'h6;
    stim[60] = 3'h3;
    stim[61] = 3'h3;
    stim[62] = 3'h6;
    stim[63] = 3'h7;
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
      expv[0] = 66'hxxxxxxxxxxxxxxxxx;
      expv[1] = 66'hxxxxxxxxxxxxxxxxx;
      expv[2] = 66'hxxxxxxxxxxxxxxxxx;
      expv[3] = 66'hxxxxxxxxxxxxxxxxx;
      expv[4] = 66'hxxxxxxxxxxxxxxxxx;
      expv[5] = 66'hxxxxxxxxxxxxxxxxx;
      expv[6] = 66'h00000000800000009;
      expv[7] = 66'h00000000800000009;
      expv[8] = 66'h00000000800000009;
      expv[9] = 66'h00000000800000009;
      expv[10] = 66'h00000000800000009;
      expv[11] = 66'h00000000800000009;
      expv[12] = 66'h00000000800000009;
      expv[13] = 66'h00000000800000009;
      expv[14] = 66'h00000000800000009;
      expv[15] = 66'h00000000800000009;
      expv[16] = 66'h00000000800000009;
      expv[17] = 66'h00000000800000009;
      expv[18] = 66'h00000000800000008;
      expv[19] = 66'h00000000800000008;
      expv[20] = 66'h00000000800000008;
      expv[21] = 66'h00000000800000008;
      expv[22] = 66'h00000000800000008;
      expv[23] = 66'h00000000800000008;
      expv[24] = 66'h00000000800000008;
      expv[25] = 66'h00000000800000008;
      expv[26] = 66'h00000000800000008;
      expv[27] = 66'h0000000080000000a;
      expv[28] = 66'h0000000080000000a;
      expv[29] = 66'h0000000080000000a;
      expv[30] = 66'h0000000080000000a;
      expv[31] = 66'h0000000080000000a;
      expv[32] = 66'h0000000080000000a;
      expv[33] = 66'h0000000080000000a;
      expv[34] = 66'h0000000080000000a;
      expv[35] = 66'h0000000080000000a;
      expv[36] = 66'h0000000080000000a;
      expv[37] = 66'h0000000080000000a;
      expv[38] = 66'h0000000080000000a;
      expv[39] = 66'h0000000080000000a;
      expv[40] = 66'h0000000080000000b;
      expv[41] = 66'h0000000080000000b;
      expv[42] = 66'h00000001c00000020;
      expv[43] = 66'h00000001c00000020;
      expv[44] = 66'h00000001c00000020;
      expv[45] = 66'h00000001c00000020;
      expv[46] = 66'h00000001c00000020;
      expv[47] = 66'h00000001c00000020;
      expv[48] = 66'h00000001c00000020;
      expv[49] = 66'h00000001c00000021;
      expv[50] = 66'h00000001c00000021;
      expv[51] = 66'h00000001c00000021;
      expv[52] = 66'h00000001c00000021;
      expv[53] = 66'h00000001c00000023;
      expv[54] = 66'h00000001c00000023;
      expv[55] = 66'h00000001c00000023;
      expv[56] = 66'h00000001c00000023;
      expv[57] = 66'h00000001000000000;
      expv[58] = 66'h00000001000000000;
      expv[59] = 66'h00000001000000000;
      expv[60] = 66'h00000001000000000;
      expv[61] = 66'h00000001000000000;
      expv[62] = 66'h00000001000000000;
      expv[63] = 66'h00000001000000000;
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
