// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00186 dut (
    .CLK(clk),
    .RST(in_vec[40:40]),
    .CE(in_vec[39:39]),
    .WE(in_vec[38:38]),
    .SEL(in_vec[37:34]),
    .DATI(in_vec[33:2]),
    .RXD(in_vec[1:1]),
    .CTS(in_vec[0:0]),
    .DATO(out_vec[33:2]),
    .TXD(out_vec[1:1]),
    .RTS(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h1b8239d6dbc;
    stim[1] = 41'h12bf8c5c4ac;
    stim[2] = 41'h043eab59179;
    stim[3] = 41'h0142bdab912;
    stim[4] = 41'h01d3bae0dfc;
    stim[5] = 41'h02831f3b6f4;
    stim[6] = 41'h0cc68844a3d;
    stim[7] = 41'h03db08b136e;
    stim[8] = 41'h0f3e0b679ab;
    stim[9] = 41'h0da75f4e3d2;
    stim[10] = 41'h0e2d6a2ad48;
    stim[11] = 41'h0ed33f590cf;
    stim[12] = 41'h0c12f0e4cfa;
    stim[13] = 41'h0cdb62f6da4;
    stim[14] = 41'h068dd159aef;
    stim[15] = 41'h0eabaa32cde;
    stim[16] = 41'h0ba2c2b5f91;
    stim[17] = 41'h08b0cf43045;
    stim[18] = 41'h0f8ba9f9aee;
    stim[19] = 41'h092367403a1;
    stim[20] = 41'h08c41276c38;
    stim[21] = 41'h0b3ec82816a;
    stim[22] = 41'h0651f0468b8;
    stim[23] = 41'h0008f39d4ee;
    stim[24] = 41'h0a40293e202;
    stim[25] = 41'h00f93796761;
    stim[26] = 41'h028cbe47fe6;
    stim[27] = 41'h0a4cae2e5db;
    stim[28] = 41'h0a0cb29d80e;
    stim[29] = 41'h0a2f04b97fa;
    stim[30] = 41'h06499abc22a;
    stim[31] = 41'h0b161e63cb9;
    stim[32] = 41'h0ee9c78f48e;
    stim[33] = 41'h0de4eb0e0e0;
    stim[34] = 41'h0f6f175ffe6;
    stim[35] = 41'h0d2eca3eb8d;
    stim[36] = 41'h0d9977a3d77;
    stim[37] = 41'h0fe0e715c5c;
    stim[38] = 41'h053bbe14584;
    stim[39] = 41'h0c4917d12ea;
    stim[40] = 41'h04a10d3970d;
    stim[41] = 41'h0b9c2c40efb;
    stim[42] = 41'h0e75a9a0c62;
    stim[43] = 41'h0dad6c14f53;
    stim[44] = 41'h05bd2cc3a44;
    stim[45] = 41'h02721aa68e6;
    stim[46] = 41'h01374117d89;
    stim[47] = 41'h07f7d32cd6f;
    stim[48] = 41'h0c4c79d5b92;
    stim[49] = 41'h0a719f745f4;
    stim[50] = 41'h090ae3e7d7e;
    stim[51] = 41'h074a8b2fa05;
    stim[52] = 41'h0f685089560;
    stim[53] = 41'h0dc24e6d8c6;
    stim[54] = 41'h094fb6257df;
    stim[55] = 41'h05368189f68;
    stim[56] = 41'h0e993ea788c;
    stim[57] = 41'h0ce9f6d2a7b;
    stim[58] = 41'h099a5fc42c4;
    stim[59] = 41'h0e60a3c85a6;
    stim[60] = 41'h0e95896931a;
    stim[61] = 41'h0635f3ff6f2;
    stim[62] = 41'h0c60dcfd20e;
    stim[63] = 41'h04110b35269;
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
      expv[0] = 34'h000000xxx;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000001;
      expv[3] = 34'h000000002;
      expv[4] = 34'h000000000;
      expv[5] = 34'h000000000;
      expv[6] = 34'h000000xxx;
      expv[7] = 34'h000000002;
      expv[8] = 34'h00000063f;
      expv[9] = 34'h3e0b4023e;
      expv[10] = 34'h3e1f4023c;
      expv[11] = 34'h2d5f4023f;
      expv[12] = 34'h131f4023e;
      expv[13] = 34'h131f4023c;
      expv[14] = 34'h000000003;
      expv[15] = 34'h131f4023e;
      expv[16] = 34'h2b9f4023d;
      expv[17] = 34'h2b9f4023d;
      expv[18] = 34'h2b9f4023e;
      expv[19] = 34'h0ba9c023d;
      expv[20] = 34'h0ba9c023c;
      expv[21] = 34'h0ba9c023e;
      expv[22] = 34'h000000000;
      expv[23] = 34'h000000002;
      expv[24] = 34'h0ba9c00ce;
      expv[25] = 34'h000000001;
      expv[26] = 34'h000000002;
      expv[27] = 34'h0ba9c01a7;
      expv[28] = 34'h0ba9c01a6;
      expv[29] = 34'h0ba9c0xxx;
      expv[30] = 34'h000000002;
      expv[31] = 34'h0ba9c0xxx;
      expv[32] = 34'h0ba9c0xxx;
      expv[33] = 34'h29e9c0xxx;
      expv[34] = 34'h29eb00xxx;
      expv[35] = 34'h2f1740xxx;
      expv[36] = 34'h2f0a007e7;
      expv[37] = 34'h2f37803e4;
      expv[38] = 34'h000000000;
      expv[39] = 34'h20e7003e6;
      expv[40] = 34'h000000001;
      expv[41] = 34'h20e7003e7;
      expv[42] = 34'h20e7003e6;
      expv[43] = 34'h35a7003e7;
      expv[44] = 34'h000000000;
      expv[45] = 34'h000000002;
      expv[46] = 34'h000000001;
      expv[47] = 34'h000000003;
      expv[48] = 34'h35ac003e6;
      expv[49] = 34'h35ac003e4;
      expv[50] = 34'h35ac003e6;
      expv[51] = 34'h000000001;
      expv[52] = 34'h35ac0005c;
      expv[53] = 34'h28508005e;
      expv[54] = 34'h284e4005f;
      expv[55] = 34'h000000000;
      expv[56] = 34'h284e402e8;
      expv[57] = 34'h190e402eb;
      expv[58] = 34'h190e402e8;
      expv[59] = 34'h190e402ea;
      expv[60] = 34'h208e402ea;
      expv[61] = 34'h000000002;
      expv[62] = 34'h158e402ea;
      expv[63] = 34'h000000001;
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
