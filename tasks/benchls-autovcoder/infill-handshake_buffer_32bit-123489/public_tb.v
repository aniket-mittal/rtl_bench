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

  autovcoder_123489 dut (
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
    stim[0] = 35'h6e81c8cc4;
    stim[1] = 35'h7ec2d9c7c;
    stim[2] = 35'h08f9bfe3a;
    stim[3] = 35'h2bb2f9c20;
    stim[4] = 35'h20bd4e48f;
    stim[5] = 35'h31c470c2f;
    stim[6] = 35'h0d3935020;
    stim[7] = 35'h26e9e754d;
    stim[8] = 35'h28d39b22f;
    stim[9] = 35'h1472b1ebe;
    stim[10] = 35'h3ba9c20ee;
    stim[11] = 35'h078c4cce3;
    stim[12] = 35'h2cdfbe836;
    stim[13] = 35'h03f4c923c;
    stim[14] = 35'h182d2ae3f;
    stim[15] = 35'h0d75bbd3f;
    stim[16] = 35'h35cd95559;
    stim[17] = 35'h20a6a46a3;
    stim[18] = 35'h04e19de47;
    stim[19] = 35'h1222858a0;
    stim[20] = 35'h0bd99b5dd;
    stim[21] = 35'h1e283bbda;
    stim[22] = 35'h10c7d2092;
    stim[23] = 35'h325919912;
    stim[24] = 35'h2c61f332e;
    stim[25] = 35'h13c559cf3;
    stim[26] = 35'h01ec9c7ed;
    stim[27] = 35'h010d7140d;
    stim[28] = 35'h30e14b5ca;
    stim[29] = 35'h3f424d3aa;
    stim[30] = 35'h01ad2792d;
    stim[31] = 35'h0553addc4;
    stim[32] = 35'h18f100f56;
    stim[33] = 35'h0f98a5f21;
    stim[34] = 35'h1303d3629;
    stim[35] = 35'h3e784f868;
    stim[36] = 35'h10a617cd7;
    stim[37] = 35'h05b95fd66;
    stim[38] = 35'h244763ac3;
    stim[39] = 35'h462efe116;
    stim[40] = 35'h22d38f9cd;
    stim[41] = 35'h10c1b3624;
    stim[42] = 35'h249d19b8c;
    stim[43] = 35'h3685adc2a;
    stim[44] = 35'h03bde0103;
    stim[45] = 35'h21ef0d8fc;
    stim[46] = 35'h1bf0e1299;
    stim[47] = 35'h1ea2f055a;
    stim[48] = 35'h26a3583c9;
    stim[49] = 35'h1d5ff836f;
    stim[50] = 35'h33462f8c3;
    stim[51] = 35'h0b7bdc2eb;
    stim[52] = 35'h1d44fb69b;
    stim[53] = 35'h35327af56;
    stim[54] = 35'h23e46dd4f;
    stim[55] = 35'h1d1ea03c3;
    stim[56] = 35'h1ec6ac12e;
    stim[57] = 35'h12f815224;
    stim[58] = 35'h1436dee34;
    stim[59] = 35'h27e2c2f95;
    stim[60] = 35'h25b70a604;
    stim[61] = 35'h24d2ae62b;
    stim[62] = 35'h21be21f48;
    stim[63] = 35'h0527f6bd9;
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
      expv[2] = 35'h3ec2d9c7c;
      expv[3] = 35'h48f9bfe38;
      expv[4] = 35'h6bb2f9c20;
      expv[5] = 35'h60bd4e48e;
      expv[6] = 35'h71c470c2f;
      expv[7] = 35'h71c470c2e;
      expv[8] = 35'h66e9e754c;
      expv[9] = 35'h68d39b22f;
      expv[10] = 35'h28d39b22f;
      expv[11] = 35'h28d39b22f;
      expv[12] = 35'h5472b1ebf;
      expv[13] = 35'h1472b1ebf;
      expv[14] = 35'h1472b1ebf;
      expv[15] = 35'h6cdfbe836;
      expv[16] = 35'h4d75bbd3e;
      expv[17] = 35'h75cd95558;
      expv[18] = 35'h60a6a46a2;
      expv[19] = 35'h44e19de47;
      expv[20] = 35'h44e19de46;
      expv[21] = 35'h4bd99b5dc;
      expv[22] = 35'h5e283bbdb;
      expv[23] = 35'h1e283bbdb;
      expv[24] = 35'h1e283bbdb;
      expv[25] = 35'h1e283bbdb;
      expv[26] = 35'h50c7d2092;
      expv[27] = 35'h41ec9c7ec;
      expv[28] = 35'h410d7140c;
      expv[29] = 35'h70e14b5cb;
      expv[30] = 35'h30e14b5cb;
      expv[31] = 35'h7f424d3ab;
      expv[32] = 35'h7f424d3ab;
      expv[33] = 35'h3f424d3ab;
      expv[34] = 35'h58f100f56;
      expv[35] = 35'h5303d3628;
      expv[36] = 35'h7e784f868;
      expv[37] = 35'h50a617cd7;
      expv[38] = 35'h10a617cd7;
      expv[39] = 35'h45b95fd67;
      expv[40] = 35'h05b95fd64;
      expv[41] = 35'h62d38f9cc;
      expv[42] = 35'h50c1b3624;
      expv[43] = 35'h649d19b8c;
      expv[44] = 35'h7685adc2a;
      expv[45] = 35'h43bde0103;
      expv[46] = 35'h43bde0102;
      expv[47] = 35'h5bf0e1298;
      expv[48] = 35'h5ea2f055a;
      expv[49] = 35'h66a3583c8;
      expv[50] = 35'h5d5ff836e;
      expv[51] = 35'h73462f8c2;
      expv[52] = 35'h4b7bdc2ea;
      expv[53] = 35'h5d44fb69b;
      expv[54] = 35'h1d44fb69b;
      expv[55] = 35'h75327af56;
      expv[56] = 35'h5d1ea03c3;
      expv[57] = 35'h1d1ea03c3;
      expv[58] = 35'h1d1ea03c3;
      expv[59] = 35'h1d1ea03c3;
      expv[60] = 35'h5ec6ac12f;
      expv[61] = 35'h5ec6ac12e;
      expv[62] = 35'h64d2ae62b;
      expv[63] = 35'h64d2ae62a;
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
