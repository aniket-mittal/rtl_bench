// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_080740 dut (
    .clk_i(clk),
    .rst_i(in_vec[13:13]),
    .bitclk_i(in_vec[12:12]),
    .start_i(in_vec[11:11]),
    .abort_i(in_vec[10:10]),
    .data_i(in_vec[9:9]),
    .mode_4bit_i(in_vec[8:8]),
    .block_cnt_i(in_vec[7:0]),
    .valid_o(out_vec[11:11]),
    .data_o(out_vec[10:3]),
    .active_o(out_vec[2:2]),
    .error_o(out_vec[1:1]),
    .complete_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h3b0d;
    stim[1] = 14'h3de3;
    stim[2] = 14'h0b50;
    stim[3] = 14'h0fbb;
    stim[4] = 14'h060b;
    stim[5] = 14'h1023;
    stim[6] = 14'h1fae;
    stim[7] = 14'h0c42;
    stim[8] = 14'h0ae9;
    stim[9] = 14'h03ec;
    stim[10] = 14'h089c;
    stim[11] = 14'h1240;
    stim[12] = 14'h09ce;
    stim[13] = 14'h0df0;
    stim[14] = 14'h08eb;
    stim[15] = 14'h0595;
    stim[16] = 14'h184c;
    stim[17] = 14'h1aa7;
    stim[18] = 14'h10ba;
    stim[19] = 14'h0323;
    stim[20] = 14'h0e58;
    stim[21] = 14'h0bbe;
    stim[22] = 14'h0c3d;
    stim[23] = 14'h00f4;
    stim[24] = 14'h0691;
    stim[25] = 14'h09b6;
    stim[26] = 14'h01c9;
    stim[27] = 14'h0bb5;
    stim[28] = 14'h04b0;
    stim[29] = 14'h0bda;
    stim[30] = 14'h024a;
    stim[31] = 14'h03a6;
    stim[32] = 14'h07bd;
    stim[33] = 14'h1073;
    stim[34] = 14'h1e84;
    stim[35] = 14'h1d40;
    stim[36] = 14'h1362;
    stim[37] = 14'h167c;
    stim[38] = 14'h076c;
    stim[39] = 14'h07d8;
    stim[40] = 14'h1404;
    stim[41] = 14'h0e7c;
    stim[42] = 14'h1e01;
    stim[43] = 14'h0d2c;
    stim[44] = 14'h1243;
    stim[45] = 14'h0410;
    stim[46] = 14'h0626;
    stim[47] = 14'h01ce;
    stim[48] = 14'h06ed;
    stim[49] = 14'h12f6;
    stim[50] = 14'h124f;
    stim[51] = 14'h1a45;
    stim[52] = 14'h05d8;
    stim[53] = 14'h1a42;
    stim[54] = 14'h1ae9;
    stim[55] = 14'h1e81;
    stim[56] = 14'h0fff;
    stim[57] = 14'h09cc;
    stim[58] = 14'h14a1;
    stim[59] = 14'h10e0;
    stim[60] = 14'h1691;
    stim[61] = 14'h0c5c;
    stim[62] = 14'h0bb8;
    stim[63] = 14'h024e;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h004;
      expv[4] = 12'h000;
      expv[5] = 12'h000;
      expv[6] = 12'h000;
      expv[7] = 12'h000;
      expv[8] = 12'h000;
      expv[9] = 12'h004;
      expv[10] = 12'h004;
      expv[11] = 12'h004;
      expv[12] = 12'h004;
      expv[13] = 12'h004;
      expv[14] = 12'h000;
      expv[15] = 12'h004;
      expv[16] = 12'h000;
      expv[17] = 12'h004;
      expv[18] = 12'h004;
      expv[19] = 12'h004;
      expv[20] = 12'h004;
      expv[21] = 12'h000;
      expv[22] = 12'h004;
      expv[23] = 12'h000;
      expv[24] = 12'h000;
      expv[25] = 12'h000;
      expv[26] = 12'h004;
      expv[27] = 12'h004;
      expv[28] = 12'h004;
      expv[29] = 12'h000;
      expv[30] = 12'h004;
      expv[31] = 12'h004;
      expv[32] = 12'h004;
      expv[33] = 12'h000;
      expv[34] = 12'h000;
      expv[35] = 12'h000;
      expv[36] = 12'h000;
      expv[37] = 12'h000;
      expv[38] = 12'h000;
      expv[39] = 12'h000;
      expv[40] = 12'h000;
      expv[41] = 12'h000;
      expv[42] = 12'h000;
      expv[43] = 12'h000;
      expv[44] = 12'h000;
      expv[45] = 12'h000;
      expv[46] = 12'h000;
      expv[47] = 12'h000;
      expv[48] = 12'h000;
      expv[49] = 12'h000;
      expv[50] = 12'h000;
      expv[51] = 12'h000;
      expv[52] = 12'h004;
      expv[53] = 12'h000;
      expv[54] = 12'h004;
      expv[55] = 12'h004;
      expv[56] = 12'h000;
      expv[57] = 12'h000;
      expv[58] = 12'h004;
      expv[59] = 12'h000;
      expv[60] = 12'h000;
      expv[61] = 12'h000;
      expv[62] = 12'h000;
      expv[63] = 12'h004;
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
