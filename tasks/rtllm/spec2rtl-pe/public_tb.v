// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  pe dut (
    .clk(clk),
    .rst(in_vec[64:64]),
    .a(in_vec[63:32]),
    .b(in_vec[31:0]),
    .c(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h1a0c654dba26c9c8e;
    stim[1] = 65'h197a1487acd160624;
    stim[2] = 65'h05dda3d827bc3e21b;
    stim[3] = 65'h0b85f330b5da44ebd;
    stim[4] = 65'h0e946bfaa2a6d955f;
    stim[5] = 65'h0e9028b6275619b25;
    stim[6] = 65'h0d2945850cea7a470;
    stim[7] = 65'h00adf961bee1e0493;
    stim[8] = 65'h06f1a0c406d461897;
    stim[9] = 65'h0921577a646bf7594;
    stim[10] = 65'h01472473ffb6a28a1;
    stim[11] = 65'h0fc05c5d70665a461;
    stim[12] = 65'h036183c6690a44f97;
    stim[13] = 65'h05c24be697d9a3411;
    stim[14] = 65'h022b9c4f7de59018b;
    stim[15] = 65'h0b984d0631a4514fc;
    stim[16] = 65'h0929e4dbde658d2ba;
    stim[17] = 65'h1e1582c208bc32138;
    stim[18] = 65'h07d59e21500af7b75;
    stim[19] = 65'h0b38e96d3ff4264bf;
    stim[20] = 65'h0a7d3fc6cfecf437e;
    stim[21] = 65'h0258048147386864f;
    stim[22] = 65'h0c6343f1016040c0e;
    stim[23] = 65'h04b81994efdbcc856;
    stim[24] = 65'h0b914527a6e3fa447;
    stim[25] = 65'h0fef5e467fbad048d;
    stim[26] = 65'h0cb3ac5f87ac4e6fc;
    stim[27] = 65'h04a957dbf096bdab5;
    stim[28] = 65'h09cc9096dff948b2e;
    stim[29] = 65'h0dc1b0447b7f790b2;
    stim[30] = 65'h0287bdae77caa7c52;
    stim[31] = 65'h0dccebabe3eedbf03;
    stim[32] = 65'h015813834a432330f;
    stim[33] = 65'h001ed99cb9e919746;
    stim[34] = 65'h0bd548e8559647de0;
    stim[35] = 65'h038606dc16ac1d3a9;
    stim[36] = 65'h0c06e6b685e6cc9f0;
    stim[37] = 65'h124b2be78562c8853;
    stim[38] = 65'h05ad7d4b54ef93c58;
    stim[39] = 65'h02f871a286a63b571;
    stim[40] = 65'h0e15778c4f5057827;
    stim[41] = 65'h01d4385a373eda610;
    stim[42] = 65'h07deacb388ea86b3b;
    stim[43] = 65'h022e170db69cc95fc;
    stim[44] = 65'h00bc7d66d9029c85e;
    stim[45] = 65'h0b6474138910ded29;
    stim[46] = 65'h0a65344d5c6676263;
    stim[47] = 65'h0d59f3e275fad426e;
    stim[48] = 65'h04196cfac7ddeda0e;
    stim[49] = 65'h075cdc76c0ac05b23;
    stim[50] = 65'h0ea0b44fc145045e5;
    stim[51] = 65'h076b52b31601ff9ce;
    stim[52] = 65'h071795618c12b294c;
    stim[53] = 65'h0f6fee714bd59cead;
    stim[54] = 65'h0c2a7cd1f1a29a6b4;
    stim[55] = 65'h04994628ae7d4cefd;
    stim[56] = 65'h0116ff1b0ae565524;
    stim[57] = 65'h0a54fb70235083d17;
    stim[58] = 65'h03ca78125653bfa14;
    stim[59] = 65'h0c5e72d397e39d0b3;
    stim[60] = 65'h062df45bc8ceeb895;
    stim[61] = 65'h0191809a03d81ddcd;
    stim[62] = 65'h0531a0446de227097;
    stim[63] = 65'h0b27233bce3def4dd;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'he05740b6;
      expv[4] = 32'hb23949d5;
      expv[5] = 32'hf06a5beb;
      expv[6] = 32'hc24ed715;
      expv[7] = 32'he7f8ba15;
      expv[8] = 32'h55de5796;
      expv[9] = 32'he8e19156;
      expv[10] = 32'hd5d39b4e;
      expv[11] = 32'hd1ea41ed;
      expv[12] = 32'h1aaaf464;
      expv[13] = 32'h8ef20e8e;
      expv[14] = 32'hf43a0787;
      expv[15] = 32'h34bbf0a4;
      expv[16] = 32'h6c6fce18;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h060f6a99;
      expv[20] = 32'hbfc25e06;
      expv[21] = 32'h187cdf2e;
      expv[22] = 32'h8745955a;
      expv[23] = 32'h2d55c83a;
      expv[24] = 32'h75ec386e;
      expv[25] = 32'h876b4044;
      expv[26] = 32'h2306a8ff;
      expv[27] = 32'hc09e591f;
      expv[28] = 32'h0f39e72a;
      expv[29] = 32'h697bc7c0;
      expv[30] = 32'h882db11e;
      expv[31] = 32'hbf47b31c;
      expv[32] = 32'h78eda556;
      expv[33] = 32'hc3da4c62;
      expv[34] = 32'hd68416e4;
      expv[35] = 32'hb30bbc44;
      expv[36] = 32'h0dab43ad;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'hda188a38;
      expv[40] = 32'h07b15de0;
      expv[41] = 32'h4c74a3bc;
      expv[42] = 32'hda3bafec;
      expv[43] = 32'h6f08edd4;
      expv[44] = 32'hbd277c68;
      expv[45] = 32'hd782606e;
      expv[46] = 32'h0824aa66;
      expv[47] = 32'haa64d2c5;
      expv[48] = 32'hfc329587;
      expv[49] = 32'h127268ef;
      expv[50] = 32'h1c7810b3;
      expv[51] = 32'hc0e4b21f;
      expv[52] = 32'h189f1c8d;
      expv[53] = 32'hc57683ad;
      expv[54] = 32'he79ec431;
      expv[55] = 32'h949417fd;
      expv[56] = 32'hd3cc865f;
      expv[57] = 32'h43e9f31f;
      expv[58] = 32'h3ebede4d;
      expv[59] = 32'hec7a1731;
      expv[60] = 32'h418e060c;
      expv[61] = 32'hec68bc78;
      expv[62] = 32'hbe979198;
      expv[63] = 32'h6a1ab6e2;
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
