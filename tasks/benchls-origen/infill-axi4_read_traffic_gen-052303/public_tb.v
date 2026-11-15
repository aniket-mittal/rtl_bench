// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 77;
  localparam OW = 70;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_052303 dut (
    .aclk(clk),
    .aresetn(in_vec[76:76]),
    .arready(in_vec[75:75]),
    .rid(in_vec[74:69]),
    .rdata(in_vec[68:5]),
    .rresp(in_vec[4:3]),
    .rlast(in_vec[2:2]),
    .ruser(in_vec[1:1]),
    .rvalid(in_vec[0:0]),
    .arid(out_vec[69:64]),
    .araddr(out_vec[63:32]),
    .arlen(out_vec[31:24]),
    .arsize(out_vec[23:21]),
    .arburst(out_vec[20:19]),
    .arlock(out_vec[18:18]),
    .arcache(out_vec[17:14]),
    .arprot(out_vec[13:11]),
    .arqos(out_vec[10:7]),
    .arregion(out_vec[6:3]),
    .aruser(out_vec[2:2]),
    .arvalid(out_vec[1:1]),
    .rready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 77'h078d0192d7c8ba479491;
    stim[1] = 77'h0fbdf6c2dc742698cff6;
    stim[2] = 77'h1d177900ec5788836317;
    stim[3] = 77'h1452ad35bc10b54a8548;
    stim[4] = 77'h14ee88f6206321f4cf09;
    stim[5] = 77'h1f8e2bf42313ba3e3c3e;
    stim[6] = 77'h151fc92fd9463b015b74;
    stim[7] = 77'h13668cfee3c6950185f8;
    stim[8] = 77'h1a33872191b200d9140d;
    stim[9] = 77'h1cfff6fa811471bb0c83;
    stim[10] = 77'h1f959e941824a5a82815;
    stim[11] = 77'h1783b68f28c0644672f4;
    stim[12] = 77'h124802f4375506ef7386;
    stim[13] = 77'h19c3bdcb295a6ffa7069;
    stim[14] = 77'h1b26bbd99ae53df1667c;
    stim[15] = 77'h132e960a297bcf5d6472;
    stim[16] = 77'h11dde3687835cf9c7892;
    stim[17] = 77'h16248c2db7386bfba5c2;
    stim[18] = 77'h10ab8b53fb9bf3223a27;
    stim[19] = 77'h1ad7b0c6101f4898fce6;
    stim[20] = 77'h1507c19602693f079c95;
    stim[21] = 77'h1096a18753ed26fdc359;
    stim[22] = 77'h14b875baf76e60c7851e;
    stim[23] = 77'h14f50e431f26f98906a2;
    stim[24] = 77'h1a0bf473f6ac41ee701d;
    stim[25] = 77'h0aed3c4011639ee1584e;
    stim[26] = 77'h1657a30a399e744b327f;
    stim[27] = 77'h121e6d53a2034e440e2f;
    stim[28] = 77'h14c96254560237a1c2c7;
    stim[29] = 77'h1601a05627eec08a46d3;
    stim[30] = 77'h13d18ebcc1c6753b7fc6;
    stim[31] = 77'h146a37e8b73523d440e8;
    stim[32] = 77'h181c51efb6937944cbb0;
    stim[33] = 77'h1d244b0bf698a2016114;
    stim[34] = 77'h1ccbbc72d91225ec5b56;
    stim[35] = 77'h108999c07f7cc3fe90ef;
    stim[36] = 77'h13d68fe64adb9f8a3252;
    stim[37] = 77'h16315464a9e0e7478d54;
    stim[38] = 77'h1845f383a0370ac34beb;
    stim[39] = 77'h169facf06b4ac0917299;
    stim[40] = 77'h12ae603dc652cae809c9;
    stim[41] = 77'h13b986244d37b500c618;
    stim[42] = 77'h12ea84c9809125c9d0b9;
    stim[43] = 77'h13ae773db4b425334dd7;
    stim[44] = 77'h100c7ec0a6bcfef93b24;
    stim[45] = 77'h18d69e246eb884565e4f;
    stim[46] = 77'h13a0e861f2f50cd00e68;
    stim[47] = 77'h1f59598d4ef5ab8aea62;
    stim[48] = 77'h158d89a7b32fd7a16333;
    stim[49] = 77'h17bc51643c6f53a9140c;
    stim[50] = 77'h1f3438a6c964483f1963;
    stim[51] = 77'h1cd883f9c77fd614146f;
    stim[52] = 77'h1340d946df37c40f6a6a;
    stim[53] = 77'h05d25eaef8687e000dc1;
    stim[54] = 77'h11e69f48e5591f48cb6b;
    stim[55] = 77'h102bfb2dfeccfc7d23d8;
    stim[56] = 77'h168d698d8af812dbf8f9;
    stim[57] = 77'h1733f4ddaa961bec2d4f;
    stim[58] = 77'h11cf68106b41a419a39e;
    stim[59] = 77'h1b4714b3b8e33f14c5c4;
    stim[60] = 77'h13b751ff907c47b10977;
    stim[61] = 77'h124b4f9240285f294def;
    stim[62] = 77'h1b5a595e1184b5997ad3;
    stim[63] = 77'h1e6a976371eafbe5664d;
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
      expv[0] = 70'h0000000000xx68400x;
      expv[1] = 70'h000000000000684000;
      expv[2] = 70'h000000000000684000;
      expv[3] = 70'h000000000000684003;
      expv[4] = 70'h000000000000684003;
      expv[5] = 70'h000000000000684003;
      expv[6] = 70'h00000000007f684002;
      expv[7] = 70'h00000000007f684002;
      expv[8] = 70'h00000000007f684003;
      expv[9] = 70'h00000000003e684003;
      expv[10] = 70'h0000000000fb684001;
      expv[11] = 70'h0000000000e1684000;
      expv[12] = 70'h0000000000f8684000;
      expv[13] = 70'h000000000041684002;
      expv[14] = 70'h00000000000f684002;
      expv[15] = 70'h000000000072684002;
      expv[16] = 70'h000000000072684003;
      expv[17] = 70'h000000000072684003;
      expv[18] = 70'h000000000072684003;
      expv[19] = 70'h000000000072684002;
      expv[20] = 70'h00000000005e684003;
      expv[21] = 70'h00000000005e684002;
      expv[22] = 70'h00000000005e684003;
      expv[23] = 70'h00000000005e684002;
      expv[24] = 70'h00000000005e684002;
      expv[25] = 70'h0000000000cb684001;
      expv[26] = 70'h000000000000684000;
      expv[27] = 70'h000000000000684003;
      expv[28] = 70'h000000000000684003;
      expv[29] = 70'h000000000000684003;
      expv[30] = 70'h000000000000684002;
      expv[31] = 70'h000000000000684002;
      expv[32] = 70'h000000000000684003;
      expv[33] = 70'h00000000003e684003;
      expv[34] = 70'h0000000000fb684001;
      expv[35] = 70'h0000000000e1684000;
      expv[36] = 70'h0000000000f8684000;
      expv[37] = 70'h000000000041684002;
      expv[38] = 70'h000000000041684002;
      expv[39] = 70'h000000000072684002;
      expv[40] = 70'h000000000072684003;
      expv[41] = 70'h000000000072684003;
      expv[42] = 70'h000000000072684003;
      expv[43] = 70'h000000000072684002;
      expv[44] = 70'h000000000072684003;
      expv[45] = 70'h000000000072684002;
      expv[46] = 70'h000000000015684003;
      expv[47] = 70'h000000000015684002;
      expv[48] = 70'h00000000002a684002;
      expv[49] = 70'h00000000002a684003;
      expv[50] = 70'h00000000002a684003;
      expv[51] = 70'h0000000000be684000;
      expv[52] = 70'h000000000097684001;
      expv[53] = 70'h000000000047684003;
      expv[54] = 70'h000000000000684000;
      expv[55] = 70'h000000000000684003;
      expv[56] = 70'h000000000000684003;
      expv[57] = 70'h000000000000684003;
      expv[58] = 70'h000000000000684002;
      expv[59] = 70'h000000000000684002;
      expv[60] = 70'h000000000091684001;
      expv[61] = 70'h00000000003e684003;
      expv[62] = 70'h00000000003e684003;
      expv[63] = 70'h0000000000e1684000;
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
