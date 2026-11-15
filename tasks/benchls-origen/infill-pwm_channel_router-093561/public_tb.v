// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 61;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_093561 dut (
    .clk_control(clk),
    .control(in_vec[65:58]),
    .data_0(in_vec[57:46]),
    .data_1(in_vec[45:34]),
    .data_2(in_vec[33:22]),
    .data_3(in_vec[21:10]),
    .en(in_vec[9:9]),
    .addr(in_vec[8:0]),
    .data_out(out_vec[60:49]),
    .en_0(out_vec[48:48]),
    .en_1(out_vec[47:47]),
    .en_2(out_vec[46:46]),
    .en_3(out_vec[45:45]),
    .addr_0(out_vec[44:36]),
    .addr_1(out_vec[35:27]),
    .addr_2(out_vec[26:18]),
    .addr_3(out_vec[17:9]),
    .freq(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h0a820dd0e899f3db2;
    stim[1] = 66'h00d2cdd4667329358;
    stim[2] = 66'h35bc10335c58c65ef;
    stim[3] = 66'h0a0f4a3acdfa2b6b9;
    stim[4] = 66'h1c5b780460d0dfa80;
    stim[5] = 66'h193a94959b91044f2;
    stim[6] = 66'h0972274a1889073b9;
    stim[7] = 66'h0ef8e6d92e644789b;
    stim[8] = 66'h244dc2d0b380c110b;
    stim[9] = 66'h3122cec95264fd577;
    stim[10] = 66'h152631ce64a20ec2e;
    stim[11] = 66'h381604e611c7c1d60;
    stim[12] = 66'h0e6b85cb3425d6a53;
    stim[13] = 66'h1af627d6c915d25a0;
    stim[14] = 66'h3cad2fd89fc22cf16;
    stim[15] = 66'h3fba01a28c95d1a38;
    stim[16] = 66'h113f7de75c415a7f7;
    stim[17] = 66'h3c45899382a8ce950;
    stim[18] = 66'h16824e615d081b2ee;
    stim[19] = 66'h001bc2eb6f5c9c816;
    stim[20] = 66'h16911f783e8013faf;
    stim[21] = 66'h30834c188d0bbaef8;
    stim[22] = 66'h31315742b69513fa7;
    stim[23] = 66'h0a46b4f82880f2229;
    stim[24] = 66'h305ff8efbbf001226;
    stim[25] = 66'h3a681b74a34798f96;
    stim[26] = 66'h195209df032a9c763;
    stim[27] = 66'h10611d31260a2ed06;
    stim[28] = 66'h20680a7602c231f0a;
    stim[29] = 66'h33258714dae7f5180;
    stim[30] = 66'h079091def46d34a70;
    stim[31] = 66'h2c72f0cfbd98eb67c;
    stim[32] = 66'h3fb72b3933dd6ae4a;
    stim[33] = 66'h2553ad50c5134b72f;
    stim[34] = 66'h32c51c8483be89fe3;
    stim[35] = 66'h15499410559dd5faf;
    stim[36] = 66'h3b09f06e8d29a3842;
    stim[37] = 66'h33af46d01717336d2;
    stim[38] = 66'h2e0df595dfe264276;
    stim[39] = 66'h1844487ff10737e70;
    stim[40] = 66'h17bceb793fac13b26;
    stim[41] = 66'h0eb43a764422818e2;
    stim[42] = 66'h1cb7bf7dbee4cb136;
    stim[43] = 66'h30067502a2116fdb4;
    stim[44] = 66'h0fdef8dbebaf4f819;
    stim[45] = 66'h01a3575aab64e4f9d;
    stim[46] = 66'h286c1168f943dd4dc;
    stim[47] = 66'h3afb931d6a2b8ed65;
    stim[48] = 66'h2cf872bebbec972bd;
    stim[49] = 66'h07d55989e76348ddd;
    stim[50] = 66'h15b725912a6597cce;
    stim[51] = 66'h0a005716320d32444;
    stim[52] = 66'h23eced9c6bdbd51c7;
    stim[53] = 66'h06446184f01ab3633;
    stim[54] = 66'h281868c99d71f7645;
    stim[55] = 66'h18e8daafc53717ad5;
    stim[56] = 66'h1a20f6af568705dbb;
    stim[57] = 66'h3b1cdc1994e1448d9;
    stim[58] = 66'h2e1a47c7a133e0a66;
    stim[59] = 66'h1632d0d739d6e1c01;
    stim[60] = 66'h330d859bb72176788;
    stim[61] = 66'h0145f796dd408fc28;
    stim[62] = 66'h05badc467fff18d24;
    stim[63] = 66'h26e807507d6c6e1a0;
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
      expv[0] = 61'hxxxxxxxxxxxxxxxx;
      expv[1] = 61'hxxxx1b2000000004;
      expv[2] = 61'h0107158000000008;
      expv[3] = 61'h025800000003de04;
      expv[4] = 61'h18c90b9000000001;
      expv[5] = 61'h1d20800400000002;
      expv[6] = 61'h0044000790000001;
      expv[7] = 61'h09591b9000000002;
      expv[8] = 61'h191209b000000008;
      expv[9] = 61'h071c0000042c0002;
      expv[10] = 61'h19c000000002ee01;
      expv[11] = 61'h01fa000170000001;
      expv[12] = 61'h1ce400000002c001;
      expv[13] = 61'h1e0f053000000002;
      expv[14] = 61'h1708000d00000008;
      expv[15] = 61'h15b0200000022c04;
      expv[16] = 61'h1166200000007004;
      expv[17] = 61'h0e8c800fb8000001;
      expv[18] = 61'h19d000000002a002;
      expv[19] = 61'h00ce800770000004;
      expv[20] = 61'h130a016000000001;
      expv[21] = 61'h01bc800d78000004;
      expv[22] = 61'h1bc020000001f004;
      expv[23] = 61'h1dd6200000034e01;
      expv[24] = 61'h0279029000000002;
      expv[25] = 61'h035a200000004c02;
      expv[26] = 61'h0020200000032c02;
      expv[27] = 61'h198c800b18000002;
      expv[28] = 61'h0ef8000830000002;
      expv[29] = 61'h0988400004280002;
      expv[30] = 61'h00b0000000030001;
      expv[31] = 61'h03f5070000000004;
      expv[32] = 61'h0240400001f00002;
      expv[33] = 61'h1ecc200000009404;
      expv[34] = 61'h02d4400004bc0002;
      expv[35] = 61'h014420000003c608;
      expv[36] = 61'h0512800d78000002;
      expv[37] = 61'h0208000000008401;
      expv[38] = 61'h068e20000001a404;
      expv[39] = 61'h199a400001d80001;
      expv[40] = 61'h1fe0800380000002;
      expv[41] = 61'h007e800930000004;
      expv[42] = 61'h1bc80e2000000004;
      expv[43] = 61'h10e00009b0000004;
      expv[44] = 61'h1bec000000036801;
      expv[45] = 61'h0b7e019000000008;
      expv[46] = 61'h0f7d19d000000004;
      expv[47] = 61'h0354000003700002;
      expv[48] = 61'h128000000002ca08;
      expv[49] = 61'h03b0400002f40008;
      expv[50] = 61'h03be1dd000000008;
      expv[51] = 61'h02aa000670000004;
      expv[52] = 61'h1220044000000001;
      expv[53] = 61'h00140000071c0008;
      expv[54] = 61'h02bd033000000002;
      expv[55] = 61'h0460400001140001;
      expv[56] = 61'h1d708006a8000008;
      expv[57] = 61'h15f8000dd8000001;
      expv[58] = 61'h15e800000001b201;
      expv[59] = 61'h0a24400001980001;
      expv[60] = 61'h0212000008000001;
      expv[61] = 61'h035c200000031001;
      expv[62] = 61'h0bb2028000000002;
      expv[63] = 61'h00be124000000004;
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
