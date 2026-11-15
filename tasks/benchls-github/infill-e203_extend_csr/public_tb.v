// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  e203_extend_csr dut (
    .clk(clk),
    .eai_csr_valid(in_vec[66:66]),
    .eai_csr_addr(in_vec[65:34]),
    .eai_csr_wr(in_vec[33:33]),
    .eai_csr_wdata(in_vec[32:1]),
    .rst_n(in_vec[0:0]),
    .eai_csr_ready(out_vec[32:32]),
    .eai_csr_rdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h51723bd4bdec6a68e;
    stim[1] = 67'h0adaa6cfd354878d2;
    stim[2] = 67'h5046f2ab45fe6ef8b;
    stim[3] = 67'h023b622eb0f050565;
    stim[4] = 67'h5b4b012afae08a1a7;
    stim[5] = 67'h4e6aab50c2eca683d;
    stim[6] = 67'h7d1d07ba639d8453b;
    stim[7] = 67'h52c128cce62ac79bf;
    stim[8] = 67'h5ef34bde3d9e684a1;
    stim[9] = 67'h59c8551d6c1975de7;
    stim[10] = 67'h26b42aca17dfc12c3;
    stim[11] = 67'h235fab95ee85459fb;
    stim[12] = 67'h293f2a3d2109e9e2b;
    stim[13] = 67'h1e21b22c50bc7b8fd;
    stim[14] = 67'h5badf75ad41ca4e3b;
    stim[15] = 67'h2e00faf7e6b396faf;
    stim[16] = 67'h30f8f051b6e8f0f45;
    stim[17] = 67'h7478a5fd18113c4d3;
    stim[18] = 67'h042230aaae791dced;
    stim[19] = 67'h23156c6c0c48bca9b;
    stim[20] = 67'h6367a98d1bea2624d;
    stim[21] = 67'h3fd01daef280707bf;
    stim[22] = 67'h31bf3b1aa0c65be57;
    stim[23] = 67'h5d13950ae57e93529;
    stim[24] = 67'h0a03f3aed2d28ef75;
    stim[25] = 67'h07f96e4609dfb5c23;
    stim[26] = 67'h3b71d5e9c5821f323;
    stim[27] = 67'h25e988c60fe96ac7f;
    stim[28] = 67'h1933607886a91ee6d;
    stim[29] = 67'h3ca24b993c1c8014d;
    stim[30] = 67'h3226f53451d90ac6f;
    stim[31] = 67'h74183e45360d32319;
    stim[32] = 67'h3ce48537d58b7f427;
    stim[33] = 67'h210dea4e3e17a92df;
    stim[34] = 67'h201715f79f27a85cc;
    stim[35] = 67'h6902fe6270238728f;
    stim[36] = 67'h024d96f1a8b7a302d;
    stim[37] = 67'h7b25ed427b8901d08;
    stim[38] = 67'h3c1714de7c11f94fd;
    stim[39] = 67'h683c80e10a5729cff;
    stim[40] = 67'h08ca20ec6ffe1c85b;
    stim[41] = 67'h65e043516b60afe41;
    stim[42] = 67'h7fe80fa8d130f6045;
    stim[43] = 67'h530a3d8a6ccac4cc5;
    stim[44] = 67'h32736262e3c473a01;
    stim[45] = 67'h1039475fa97f82591;
    stim[46] = 67'h1cd4b34e7b9d84c1b;
    stim[47] = 67'h5cc27d183da63e76d;
    stim[48] = 67'h2e85ce1f2c913c84f;
    stim[49] = 67'h6fd28652be60a1bd3;
    stim[50] = 67'h6cf50dcae7f300d33;
    stim[51] = 67'h053fc76a418b1187d;
    stim[52] = 67'h3b66b70c1b407bb61;
    stim[53] = 67'h116164a7ec3649c61;
    stim[54] = 67'h72138f57b06c15d4d;
    stim[55] = 67'h0cba71c7fc57bdb8b;
    stim[56] = 67'h1f143a0beee34a145;
    stim[57] = 67'h3b83895371bd40c6b;
    stim[58] = 67'h4365744b6ef170d07;
    stim[59] = 67'h005b7a2a7b0348961;
    stim[60] = 67'h3a06f9a05bfcefc5b;
    stim[61] = 67'h779ac99fd74de5683;
    stim[62] = 67'h14cc4e8c67d60a0d1;
    stim[63] = 67'h31774c21856e57aad;
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
      expv[0] = 33'h100000000;
      expv[1] = 33'h100000000;
      expv[2] = 33'h100000000;
      expv[3] = 33'h100000000;
      expv[4] = 33'h100000000;
      expv[5] = 33'h100000000;
      expv[6] = 33'h100000000;
      expv[7] = 33'h100000000;
      expv[8] = 33'h100000000;
      expv[9] = 33'h100000000;
      expv[10] = 33'h100000000;
      expv[11] = 33'h100000000;
      expv[12] = 33'h100000000;
      expv[13] = 33'h100000000;
      expv[14] = 33'h100000000;
      expv[15] = 33'h100000000;
      expv[16] = 33'h100000000;
      expv[17] = 33'h100000000;
      expv[18] = 33'h100000000;
      expv[19] = 33'h100000000;
      expv[20] = 33'h100000000;
      expv[21] = 33'h100000000;
      expv[22] = 33'h100000000;
      expv[23] = 33'h100000000;
      expv[24] = 33'h100000000;
      expv[25] = 33'h100000000;
      expv[26] = 33'h100000000;
      expv[27] = 33'h100000000;
      expv[28] = 33'h100000000;
      expv[29] = 33'h100000000;
      expv[30] = 33'h100000000;
      expv[31] = 33'h100000000;
      expv[32] = 33'h100000000;
      expv[33] = 33'h100000000;
      expv[34] = 33'h100000000;
      expv[35] = 33'h100000000;
      expv[36] = 33'h100000000;
      expv[37] = 33'h100000000;
      expv[38] = 33'h100000000;
      expv[39] = 33'h100000000;
      expv[40] = 33'h100000000;
      expv[41] = 33'h100000000;
      expv[42] = 33'h100000000;
      expv[43] = 33'h100000000;
      expv[44] = 33'h100000000;
      expv[45] = 33'h100000000;
      expv[46] = 33'h100000000;
      expv[47] = 33'h100000000;
      expv[48] = 33'h100000000;
      expv[49] = 33'h100000000;
      expv[50] = 33'h100000000;
      expv[51] = 33'h100000000;
      expv[52] = 33'h100000000;
      expv[53] = 33'h100000000;
      expv[54] = 33'h100000000;
      expv[55] = 33'h100000000;
      expv[56] = 33'h100000000;
      expv[57] = 33'h100000000;
      expv[58] = 33'h100000000;
      expv[59] = 33'h100000000;
      expv[60] = 33'h100000000;
      expv[61] = 33'h100000000;
      expv[62] = 33'h100000000;
      expv[63] = 33'h100000000;
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
