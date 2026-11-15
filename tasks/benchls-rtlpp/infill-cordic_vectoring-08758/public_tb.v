// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08758 dut (
    .clk(clk),
    .rst(in_vec[40:40]),
    .x_input(in_vec[39:20]),
    .y_input(in_vec[19:0]),
    .z_res(out_vec[19:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h1e9a673b4ba;
    stim[1] = 41'h15b5927c1f1;
    stim[2] = 41'h0e5fcbfad14;
    stim[3] = 41'h0888787cfd5;
    stim[4] = 41'h02c3eec2f2b;
    stim[5] = 41'h01dabf9618a;
    stim[6] = 41'h032f3e17baa;
    stim[7] = 41'h02c0d51fa40;
    stim[8] = 41'h006dcb30a50;
    stim[9] = 41'h0ad5b4bc30e;
    stim[10] = 41'h0c4d725d0db;
    stim[11] = 41'h0fed38445fa;
    stim[12] = 41'h0090092d01f;
    stim[13] = 41'h0829731ac55;
    stim[14] = 41'h0febedf8421;
    stim[15] = 41'h04107104573;
    stim[16] = 41'h0400d597f44;
    stim[17] = 41'h07c83226d9e;
    stim[18] = 41'h054fd482585;
    stim[19] = 41'h092c155c346;
    stim[20] = 41'h0895d62ee8a;
    stim[21] = 41'h03678e40c74;
    stim[22] = 41'h006bf0305a8;
    stim[23] = 41'h009edf2d88a;
    stim[24] = 41'h03a0b9d0d91;
    stim[25] = 41'h0e4d0c77112;
    stim[26] = 41'h0029f5ea2bd;
    stim[27] = 41'h0c81018b305;
    stim[28] = 41'h0d3cd126888;
    stim[29] = 41'h05322df3cc7;
    stim[30] = 41'h03a061de505;
    stim[31] = 41'h013713c1f5d;
    stim[32] = 41'h01726c06627;
    stim[33] = 41'h0de478b8186;
    stim[34] = 41'h085b54660dd;
    stim[35] = 41'h0baf99b0f6c;
    stim[36] = 41'h0934c951b44;
    stim[37] = 41'h0bdb25955cf;
    stim[38] = 41'h09dd2a93712;
    stim[39] = 41'h04c4cede3c3;
    stim[40] = 41'h0aed53413b0;
    stim[41] = 41'h0211b1948c8;
    stim[42] = 41'h05f62983b37;
    stim[43] = 41'h0e53fe9cb5a;
    stim[44] = 41'h056ab3fcf06;
    stim[45] = 41'h06d9b6042e8;
    stim[46] = 41'h0079ba4d45f;
    stim[47] = 41'h085965adc3f;
    stim[48] = 41'h0e7bbf59b56;
    stim[49] = 41'h057d4a76ef4;
    stim[50] = 41'h01c1c9c80f3;
    stim[51] = 41'h058f1ed395d;
    stim[52] = 41'h0190cdf141d;
    stim[53] = 41'h00e368b5ac9;
    stim[54] = 41'h0383ce60768;
    stim[55] = 41'h0c3845ffb0e;
    stim[56] = 41'h0fee7846a15;
    stim[57] = 41'h08a708f7c05;
    stim[58] = 41'h07b90bf1a21;
    stim[59] = 41'h0a1b1b5f98b;
    stim[60] = 41'h06526fb97bf;
    stim[61] = 41'h051fa078e05;
    stim[62] = 41'h0f586c946b0;
    stim[63] = 41'h0ab48ffae32;
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
      expv[0] = 20'hxxxxx;
      expv[1] = 20'hxxxxx;
      expv[2] = 20'hff802;
      expv[3] = 20'h00000;
      expv[4] = 20'h00000;
      expv[5] = 20'h00000;
      expv[6] = 20'h00000;
      expv[7] = 20'h00000;
      expv[8] = 20'h00000;
      expv[9] = 20'h00000;
      expv[10] = 20'h00000;
      expv[11] = 20'h00000;
      expv[12] = 20'h00000;
      expv[13] = 20'h00000;
      expv[14] = 20'h00000;
      expv[15] = 20'h00000;
      expv[16] = 20'h00000;
      expv[17] = 20'h00000;
      expv[18] = 20'h00000;
      expv[19] = 20'h00000;
      expv[20] = 20'h00000;
      expv[21] = 20'h00000;
      expv[22] = 20'h00000;
      expv[23] = 20'h00000;
      expv[24] = 20'h00000;
      expv[25] = 20'h00000;
      expv[26] = 20'h00000;
      expv[27] = 20'h00000;
      expv[28] = 20'h00000;
      expv[29] = 20'h00000;
      expv[30] = 20'h00000;
      expv[31] = 20'h00000;
      expv[32] = 20'h00000;
      expv[33] = 20'h00000;
      expv[34] = 20'h00000;
      expv[35] = 20'h00000;
      expv[36] = 20'h00000;
      expv[37] = 20'h00000;
      expv[38] = 20'h00000;
      expv[39] = 20'h00000;
      expv[40] = 20'h00000;
      expv[41] = 20'h00000;
      expv[42] = 20'h00000;
      expv[43] = 20'h00000;
      expv[44] = 20'h00000;
      expv[45] = 20'h00000;
      expv[46] = 20'h00000;
      expv[47] = 20'h00000;
      expv[48] = 20'h00000;
      expv[49] = 20'h00000;
      expv[50] = 20'h00000;
      expv[51] = 20'h00000;
      expv[52] = 20'h00000;
      expv[53] = 20'h00000;
      expv[54] = 20'h00000;
      expv[55] = 20'h00000;
      expv[56] = 20'h00000;
      expv[57] = 20'h00000;
      expv[58] = 20'h00000;
      expv[59] = 20'h00000;
      expv[60] = 20'h00000;
      expv[61] = 20'h00000;
      expv[62] = 20'h00000;
      expv[63] = 20'h00000;
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
