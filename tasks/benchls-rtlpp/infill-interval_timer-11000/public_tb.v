// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11000 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h31f352;
    stim[1] = 22'h2c2563;
    stim[2] = 22'h03e475;
    stim[3] = 22'h138a6f;
    stim[4] = 22'h02393d;
    stim[5] = 22'h16d517;
    stim[6] = 22'h2b74d1;
    stim[7] = 22'h16e171;
    stim[8] = 22'h1bc3b4;
    stim[9] = 22'h3b6d16;
    stim[10] = 22'h03f59b;
    stim[11] = 22'h03d3f4;
    stim[12] = 22'h1fdcc6;
    stim[13] = 22'h13eed5;
    stim[14] = 22'h066fb6;
    stim[15] = 22'h172e3e;
    stim[16] = 22'h1ac060;
    stim[17] = 22'h3605b0;
    stim[18] = 22'h1bd545;
    stim[19] = 22'h1bfc45;
    stim[20] = 22'h3a0ead;
    stim[21] = 22'h22c061;
    stim[22] = 22'h06c6e8;
    stim[23] = 22'h1ef4bc;
    stim[24] = 22'h16c908;
    stim[25] = 22'h176161;
    stim[26] = 22'h02c487;
    stim[27] = 22'h13f018;
    stim[28] = 22'h0e7c54;
    stim[29] = 22'h233478;
    stim[30] = 22'h06faaa;
    stim[31] = 22'h37f385;
    stim[32] = 22'h2b0176;
    stim[33] = 22'h1ac619;
    stim[34] = 22'h2e7e57;
    stim[35] = 22'h36c8c2;
    stim[36] = 22'h2e597a;
    stim[37] = 22'h36ebd5;
    stim[38] = 22'h2a7ac1;
    stim[39] = 22'h163e31;
    stim[40] = 22'h0243df;
    stim[41] = 22'h0be7e2;
    stim[42] = 22'h17dcc1;
    stim[43] = 22'h23fde0;
    stim[44] = 22'h3fe00f;
    stim[45] = 22'h1b92bf;
    stim[46] = 22'h26fe57;
    stim[47] = 22'h2bc1bd;
    stim[48] = 22'h1f659c;
    stim[49] = 22'h3f808e;
    stim[50] = 22'h2b9817;
    stim[51] = 22'h1e096d;
    stim[52] = 22'h235a81;
    stim[53] = 22'h1fe5f4;
    stim[54] = 22'h0f8d78;
    stim[55] = 22'h167a0c;
    stim[56] = 22'h1aed46;
    stim[57] = 22'h1e8b31;
    stim[58] = 22'h03108b;
    stim[59] = 22'h3fafc1;
    stim[60] = 22'h3e7a00;
    stim[61] = 22'h372a9c;
    stim[62] = 22'h1689d7;
    stim[63] = 22'h1e9b83;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h0f0b7;
      expv[5] = 17'h00000;
      expv[6] = 17'h0f0b7;
      expv[7] = 17'h00000;
      expv[8] = 17'h0d517;
      expv[9] = 17'h002fa;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h002fa;
      expv[14] = 17'h0e171;
      expv[15] = 17'h00000;
      expv[16] = 17'h0e171;
      expv[17] = 17'h002fa;
      expv[18] = 17'h00000;
      expv[19] = 17'h002fa;
      expv[20] = 17'h002fa;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h002fa;
      expv[25] = 17'h0e171;
      expv[26] = 17'h0c908;
      expv[27] = 17'h00000;
      expv[28] = 17'h0c908;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00002;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h0f4bc;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h0f4bc;
      expv[38] = 17'h00000;
      expv[39] = 17'h0f4bc;
      expv[40] = 17'h0c908;
      expv[41] = 17'h00002;
      expv[42] = 17'h00004;
      expv[43] = 17'h03e31;
      expv[44] = 17'h0c901;
      expv[45] = 17'h00000;
      expv[46] = 17'h0f4bc;
      expv[47] = 17'h0c901;
      expv[48] = 17'h0f4bc;
      expv[49] = 17'h0f4bc;
      expv[50] = 17'h00000;
      expv[51] = 17'h0f4bc;
      expv[52] = 17'h0f4bc;
      expv[53] = 17'h03e31;
      expv[54] = 17'h0096d;
      expv[55] = 17'h00004;
      expv[56] = 17'h03e31;
      expv[57] = 17'h0096d;
      expv[58] = 17'h0096d;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h07a0c;
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
