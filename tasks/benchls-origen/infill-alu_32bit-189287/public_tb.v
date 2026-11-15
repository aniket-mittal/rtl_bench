// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_189287 dut (
    .reset(in_vec[68:68]),
    .in_data_read_1(in_vec[67:36]),
    .in_ex_mux(in_vec[35:4]),
    .operation(in_vec[3:0]),
    .out_zero(out_vec[32:32]),
    .alu_result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h1c902a045b0be9c2e6;
    stim[1] = 69'h17111699a28ef48384;
    stim[2] = 69'h0cce495f2f1695d861;
    stim[3] = 69'h0f86bda83d9b5e2b57;
    stim[4] = 69'h0e741ce722d8560013;
    stim[5] = 69'h0503576b7513b57d43;
    stim[6] = 69'h1bd2403981ef43447a;
    stim[7] = 69'h04d8c63d53311e46a5;
    stim[8] = 69'h03dae3ee25aec78782;
    stim[9] = 69'h06f8ba673a4b731f28;
    stim[10] = 69'h0a3a9dc3f25ec5136a;
    stim[11] = 69'h059d5a85cd5ab16e4d;
    stim[12] = 69'h0a869ef1aad2648d88;
    stim[13] = 69'h06df44d1424d2519fd;
    stim[14] = 69'h0ef33e0a28abf6dcf4;
    stim[15] = 69'h00bd103e24345b0066;
    stim[16] = 69'h0a93f4fe4da976c09a;
    stim[17] = 69'h087262ae7f57217894;
    stim[18] = 69'h01c91052245fa288a8;
    stim[19] = 69'h05b09c40d11a28a042;
    stim[20] = 69'h0eed2589947a9885a6;
    stim[21] = 69'h03822e5d82360ae606;
    stim[22] = 69'h07a5843fd11b0211d0;
    stim[23] = 69'h07bb6f71f3cb2f0b3a;
    stim[24] = 69'h0d5a4773f903245946;
    stim[25] = 69'h0c46d699ada42cc2f8;
    stim[26] = 69'h0a46a13eee615e5e64;
    stim[27] = 69'h0f949e64c99284060f;
    stim[28] = 69'h0c7dbe0a5840b85819;
    stim[29] = 69'h073438e269ec3a2d8d;
    stim[30] = 69'h0cc2919c95316c18e7;
    stim[31] = 69'h07cb64c2e16f43c892;
    stim[32] = 69'h0b233fdb3ee5666dea;
    stim[33] = 69'h07f0b43f393ff498a5;
    stim[34] = 69'h05b1dabb48baff7a18;
    stim[35] = 69'h0f1d8a177f699d85b0;
    stim[36] = 69'h078738408a28d3a2be;
    stim[37] = 69'h04062a5ada5e4b14b4;
    stim[38] = 69'h04aa9c1e2c537cc2df;
    stim[39] = 69'h0d372b0075337fdd23;
    stim[40] = 69'h015e5c0181926292e9;
    stim[41] = 69'h012475691dc4cd24c1;
    stim[42] = 69'h08ea24460b6e26cb1d;
    stim[43] = 69'h02c095c2d294bccedf;
    stim[44] = 69'h00b7f2e97ff133cec7;
    stim[45] = 69'h06d5f5e83029fd3117;
    stim[46] = 69'h01e9815b190052c325;
    stim[47] = 69'h0e150e4457a3a0acb6;
    stim[48] = 69'h0ddf73b94e6e50224f;
    stim[49] = 69'h0fa947bc2a01b1ab73;
    stim[50] = 69'h06cbab6de226746393;
    stim[51] = 69'h0dc7b6ba0dd6199519;
    stim[52] = 69'h075dd75cac94eb8112;
    stim[53] = 69'h02fd381bfe42b5d4cc;
    stim[54] = 69'h0dc93d0edd875f9df3;
    stim[55] = 69'h081e51c715e7ac2a16;
    stim[56] = 69'h0ba14f4cd62d782309;
    stim[57] = 69'h00bf22d0cf1de6a805;
    stim[58] = 69'h046139b1b7873aa12a;
    stim[59] = 69'h096a99e0b58873dd60;
    stim[60] = 69'h0a09b39be8c1809a8b;
    stim[61] = 69'h0009074fe9c8baea55;
    stim[62] = 69'h0a207c5c17f51f9be3;
    stim[63] = 69'h00527445f28ba6818e;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 33'h100000000;
      expv[1] = 33'h100000000;
      expv[2] = 33'h0fdedddf6;
      expv[3] = 33'h100000000;
      expv[4] = 33'h0103a118c;
      expv[5] = 33'h0aec08808;
      expv[6] = 33'h100000000;
      expv[7] = 33'h01a7a7f6b;
      expv[8] = 33'h06742469a;
      expv[9] = 33'h099cc0000;
      expv[10] = 33'h0fffffe8e;
      expv[11] = 33'h0fffffffd;
      expv[12] = 33'h01a000000;
      expv[13] = 33'h00000024d;
      expv[14] = 33'h079f34e71;
      expv[15] = 33'h043450000;
      expv[16] = 33'h0ffd49fa7;
      expv[17] = 33'h07c984270;
      expv[18] = 33'h044148800;
      expv[19] = 33'h04aab4e09;
      expv[20] = 33'h047a90000;
      expv[21] = 33'h023600000;
      expv[22] = 33'h01010011d;
      expv[23] = 33'h000000f76;
      expv[24] = 33'h090320000;
      expv[25] = 33'h0b4cd0000;
      expv[26] = 33'h08a7ff9d4;
      expv[27] = 33'h100000000;
      expv[28] = 33'h063edf052;
      expv[29] = 33'h0fe7b0e8b;
      expv[30] = 33'h000000001;
      expv[31] = 33'h06a4270a7;
      expv[32] = 33'h0fffffffe;
      expv[33] = 33'h0eb0bfa69;
      expv[34] = 33'h0b63b5768;
      expv[35] = 33'h0f0988053;
      expv[36] = 33'h100000000;
      expv[37] = 33'h0e64756f8;
      expv[38] = 33'h100000000;
      expv[39] = 33'h02c880228;
      expv[40] = 33'h000005797;
      expv[41] = 33'h0de4fd6dd;
      expv[42] = 33'h0b6e26cb1;
      expv[43] = 33'h100000000;
      expv[44] = 33'h100000000;
      expv[45] = 33'h100000000;
      expv[46] = 33'h08e92e97f;
      expv[47] = 33'h07a3a0000;
      expv[48] = 33'h100000000;
      expv[49] = 33'h005608408;
      expv[50] = 33'h091000900;
      expv[51] = 33'h000006e3d;
      expv[52] = 33'h0bc93cddb;
      expv[53] = 33'h000000001;
      expv[54] = 33'h023080600;
      expv[55] = 33'h05e7a0000;
      expv[56] = 33'h00000ba14;
      expv[57] = 33'h01a13c28c;
      expv[58] = 33'h000001184;
      expv[59] = 33'h010811c02;
      expv[60] = 33'h100000000;
      expv[61] = 33'h06404c659;
      expv[62] = 33'h000a80200;
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
