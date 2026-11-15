// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_025139 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h5640dcadb;
    stim[1] = 35'h7e7def070;
    stim[2] = 35'h21a6ca874;
    stim[3] = 35'h0394a276f;
    stim[4] = 35'h1fb0a9f15;
    stim[5] = 35'h2852c8f3f;
    stim[6] = 35'h2a65163a5;
    stim[7] = 35'h2668df140;
    stim[8] = 35'h2e4fe98f5;
    stim[9] = 35'h12ab8a347;
    stim[10] = 35'h1dc5f3afa;
    stim[11] = 35'h018684f10;
    stim[12] = 35'h0b22e5a46;
    stim[13] = 35'h0ecd72bb3;
    stim[14] = 35'h2ba0f0752;
    stim[15] = 35'h32fb29225;
    stim[16] = 35'h06147be9f;
    stim[17] = 35'h3ebe7e65b;
    stim[18] = 35'h0cc17cb0e;
    stim[19] = 35'h048501897;
    stim[20] = 35'h1dc04b355;
    stim[21] = 35'h3671100bf;
    stim[22] = 35'h24a71f855;
    stim[23] = 35'h67953bd4c;
    stim[24] = 35'h0fb545a42;
    stim[25] = 35'h2fb017aa5;
    stim[26] = 35'h30f5bf4d9;
    stim[27] = 35'h17a65ed9e;
    stim[28] = 35'h1acaa255c;
    stim[29] = 35'h03cdcaa22;
    stim[30] = 35'h4acb3d047;
    stim[31] = 35'h043ed5d84;
    stim[32] = 35'h06082fccb;
    stim[33] = 35'h18b566e49;
    stim[34] = 35'h1c2207d96;
    stim[35] = 35'h279bcfbdc;
    stim[36] = 35'h243e6b6f5;
    stim[37] = 35'h38c194657;
    stim[38] = 35'h29950e702;
    stim[39] = 35'h3a656a45d;
    stim[40] = 35'h2941ac5ef;
    stim[41] = 35'h1c3d7f8d1;
    stim[42] = 35'h25b6793e1;
    stim[43] = 35'h33b6bffb0;
    stim[44] = 35'h314bbe388;
    stim[45] = 35'h0a38cf1b6;
    stim[46] = 35'h10faf5c94;
    stim[47] = 35'h2f7bd09bc;
    stim[48] = 35'h272c182b4;
    stim[49] = 35'h39554b50d;
    stim[50] = 35'h19d226125;
    stim[51] = 35'h0907cf8d6;
    stim[52] = 35'h0d2615d00;
    stim[53] = 35'h154f0e736;
    stim[54] = 35'h32af34acb;
    stim[55] = 35'h32e576ab6;
    stim[56] = 35'h36f36f0e5;
    stim[57] = 35'h2c14ad59b;
    stim[58] = 35'h1c32f0f70;
    stim[59] = 35'h0f8bb025d;
    stim[60] = 35'h01353b7e0;
    stim[61] = 35'h201573311;
    stim[62] = 35'h286ad5245;
    stim[63] = 35'h0cbdc04de;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h3e7def070;
      expv[3] = 35'h61a6ca874;
      expv[4] = 35'h4394a276e;
      expv[5] = 35'h5fb0a9f14;
      expv[6] = 35'h6852c8f3e;
      expv[7] = 35'h6a65163a4;
      expv[8] = 35'h6668df140;
      expv[9] = 35'h6e4fe98f4;
      expv[10] = 35'h52ab8a347;
      expv[11] = 35'h12ab8a347;
      expv[12] = 35'h12ab8a347;
      expv[13] = 35'h12ab8a347;
      expv[14] = 35'h5dc5f3afb;
      expv[15] = 35'h1dc5f3afb;
      expv[16] = 35'h6ba0f0752;
      expv[17] = 35'h46147be9e;
      expv[18] = 35'h7ebe7e65b;
      expv[19] = 35'h3ebe7e65b;
      expv[20] = 35'h4cc17cb0e;
      expv[21] = 35'h5dc04b354;
      expv[22] = 35'h7671100be;
      expv[23] = 35'h64a71f854;
      expv[24] = 35'h3671100bc;
      expv[25] = 35'h4fb545a40;
      expv[26] = 35'h6fb017aa4;
      expv[27] = 35'h70f5bf4d8;
      expv[28] = 35'h57a65ed9f;
      expv[29] = 35'h57a65ed9f;
      expv[30] = 35'h17a65ed9f;
      expv[31] = 35'h17a65ed9c;
      expv[32] = 35'h443ed5d84;
      expv[33] = 35'h46082fcca;
      expv[34] = 35'h58b566e48;
      expv[35] = 35'h5c2207d97;
      expv[36] = 35'h5c2207d96;
      expv[37] = 35'h643e6b6f4;
      expv[38] = 35'h78c194657;
      expv[39] = 35'h38c194657;
      expv[40] = 35'h69950e702;
      expv[41] = 35'h6941ac5ee;
      expv[42] = 35'h5c3d7f8d0;
      expv[43] = 35'h65b6793e0;
      expv[44] = 35'h73b6bffb0;
      expv[45] = 35'h714bbe388;
      expv[46] = 35'h4a38cf1b7;
      expv[47] = 35'h4a38cf1b7;
      expv[48] = 35'h4a38cf1b7;
      expv[49] = 35'h4a38cf1b6;
      expv[50] = 35'h79554b50c;
      expv[51] = 35'h59d226124;
      expv[52] = 35'h4907cf8d7;
      expv[53] = 35'h4907cf8d7;
      expv[54] = 35'h0907cf8d7;
      expv[55] = 35'h554f0e737;
      expv[56] = 35'h154f0e737;
      expv[57] = 35'h72e576ab6;
      expv[58] = 35'h6c14ad59b;
      expv[59] = 35'h6c14ad59a;
      expv[60] = 35'h4f8bb025c;
      expv[61] = 35'h41353b7e0;
      expv[62] = 35'h601573310;
      expv[63] = 35'h686ad5244;
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
