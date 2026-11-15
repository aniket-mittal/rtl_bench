// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 134;
  localparam OW = 224;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_054363 dut (
    .clk(clk),
    .readReg1(in_vec[133:129]),
    .readReg2(in_vec[128:124]),
    .readReg3(in_vec[123:119]),
    .writeReg(in_vec[118:114]),
    .writeData(in_vec[113:82]),
    .regWrite(in_vec[81:81]),
    .readReg1f(in_vec[80:76]),
    .readReg2f(in_vec[75:71]),
    .writeRegf(in_vec[70:66]),
    .writeData1f(in_vec[65:34]),
    .writeData2f(in_vec[33:2]),
    .regWritef(in_vec[1:1]),
    .regDWritef(in_vec[0:0]),
    .dataOut1(out_vec[223:192]),
    .dataOut2(out_vec[191:160]),
    .dataOut3(out_vec[159:128]),
    .dataOut1f(out_vec[127:96]),
    .dataOut2f(out_vec[95:64]),
    .dataOut1p1f(out_vec[63:32]),
    .dataOut2p1f(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 134'h241d865d1ab8e15a3ee416f38b67c47255;
    stim[1] = 134'h2cd721769f4d8f49f484e3534cdb5ce2f3;
    stim[2] = 134'h08f339e6ca4e0a08b8740f9a685f9d36c2;
    stim[3] = 134'h29f9a8500e9373c0337525100469ecbb1f;
    stim[4] = 134'h3dcf0233e86472ca773ebfc7bece9be488;
    stim[5] = 134'h21e272a85ac3c1073f9c1dc20d02e7d8a4;
    stim[6] = 134'h1efe2497abc7812988185cde1464bc4747;
    stim[7] = 134'h23b4f327a63306e437739fbe9191244d3a;
    stim[8] = 134'h28631f9b45d22f3fc3af971755651cbb21;
    stim[9] = 134'h1a37afa4bc2528f8fbb44dd4e642bb6d16;
    stim[10] = 134'h228090ab8bb817a2a909c5e0e4b16a4d44;
    stim[11] = 134'h04185a37b27bd17e4057df2a2c0a1f5386;
    stim[12] = 134'h001c5f00bb51d8de114ac84b39fcdf4a4f;
    stim[13] = 134'h1be047888b7ee85965e3b3513281966d6c;
    stim[14] = 134'h32d942cbf485dba76444dc188e6fe100b2;
    stim[15] = 134'h1cdefd34caea8a2057fbf2ba34b585e7b4;
    stim[16] = 134'h255f3bf5349ed819b7e056c8c7ca417d7d;
    stim[17] = 134'h34b6f48dad88407cb25ad5783899770f44;
    stim[18] = 134'h0c1c07d19d025e85d68077a07ceca4d71c;
    stim[19] = 134'h39b0e104fd716538cf415e5695cfb6ad10;
    stim[20] = 134'h029960dc02c362d48717b969da1b6f8726;
    stim[21] = 134'h2b5c4d2a99ba821d2cc2a84e14d765e36f;
    stim[22] = 134'h36bdd68f16d53f62ef8667b1675a12e94e;
    stim[23] = 134'h30fe143fe1b4881ae9b03f3c99f0e15366;
    stim[24] = 134'h2b811626b5dcb6a3a3304a9d7b66366595;
    stim[25] = 134'h349668b346317aaf234a57b62a434cd0d8;
    stim[26] = 134'h3a05900317bb877c06fc3bded4e924165c;
    stim[27] = 134'h12fc967af9e33e0ce8f755a648fa1d1ed7;
    stim[28] = 134'h0f4aa984e998778cb852c8a092f8eccb7c;
    stim[29] = 134'h0bb57fcd9c74c2b54fc0fac392f9643261;
    stim[30] = 134'h24997973a926986e2ba3763b36600357c7;
    stim[31] = 134'h0954a544bd03849b26844b8d9be4c70a81;
    stim[32] = 134'h25c5aaaa35f4f79733b4bde5a5cba8f8fd;
    stim[33] = 134'h2af744617b012d043f05dc711136d838f0;
    stim[34] = 134'h267b7f945a16faf4a94968adde12020fff;
    stim[35] = 134'h20cf413f99cce27857eb102d160bda8fae;
    stim[36] = 134'h172fd8f3deb61557bfa0a1e274d67afa93;
    stim[37] = 134'h2ca4409dc34b1c374988efc52670bbffc7;
    stim[38] = 134'h1a40aa490876ef7aa4d746b01ae2b5eec5;
    stim[39] = 134'h208a8036d231a4a98c4419dcddd7e58317;
    stim[40] = 134'h1009d48d5961959b79619679bd175a649b;
    stim[41] = 134'h0f46ce47e4be5cd4fcd0dd44f942d607ee;
    stim[42] = 134'h120dc5a626d16a873bfca9d3f24998e068;
    stim[43] = 134'h224f7c68e1e2749087633e1dfadc8503a0;
    stim[44] = 134'h2550b2bdac909d661674d437e464ddeb21;
    stim[45] = 134'h1dca8d979aafe3171939e64e87a56f4bb3;
    stim[46] = 134'h3fdcf3364742c17a34c20385f197e60e9e;
    stim[47] = 134'h3197ec434b176611402ef4aec4005b550a;
    stim[48] = 134'h1b105f7927bf2f300097aa80f75fd4dad6;
    stim[49] = 134'h178063c680edca007accabe5a3fc4e540f;
    stim[50] = 134'h11e6f846d4ae9629b1c59a67ef3da3abec;
    stim[51] = 134'h3962c6976675b828fd673b8c756433158d;
    stim[52] = 134'h32190f0e573f4dae80d9fa76ec49e9c9f3;
    stim[53] = 134'h274a8c70accf09f3a4d2312c369f714d60;
    stim[54] = 134'h2ac521c3fcff73c2e5107359dcca16ed21;
    stim[55] = 134'h05f23b153b435ee4bafcad6bdd66050fb2;
    stim[56] = 134'h0472e8970eaa946a3a9ecf015beba27dbd;
    stim[57] = 134'h20010bb2b6ad57dc3bbbf2794f34fac821;
    stim[58] = 134'h106af9140110ed5589af5677a58f768691;
    stim[59] = 134'h20d19d53a3670d13e844bff392bd3035fa;
    stim[60] = 134'h2db3eec39c3cdbee290a3182d58a57eb62;
    stim[61] = 134'h0368bdfb6fa555b423ea897ee059cee596;
    stim[62] = 134'h2dd5b63381bd43dad50604b3ebd665a0cf;
    stim[63] = 134'h3e695e7b299d0419de5540d1eb1b0f18c4;
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
      expv[0] = 224'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 224'h00000000000000000000000000000000000000000000000000000000;
      expv[2] = 224'h00000000000000000000000000000000000000000000000000000000;
      expv[3] = 224'h00000000000000000000000000000000000000000000000000000000;
      expv[4] = 224'h00000000000000000000000000000000000000002138d4d300000000;
      expv[5] = 224'h000000000000000000000000dd494401000000001a7b2ec700000000;
      expv[6] = 224'h000000000000000000000000d9f11c951d03e69a00000000b905bce2;
      expv[7] = 224'h00000000000000000000000000000000000000000000000000000000;
      expv[8] = 224'h0000000000000000000000001d03e69a00000000b905bce200000000;
      expv[9] = 224'h000000000000000000000000000000000000000000000000xxxxxxxx;
      expv[10] = 224'h000000000000000000000000b905bce259472ec8ebe5c5d500000000;
      expv[11] = 224'h000000005da7d3630000000000000000000000000000000000000000;
      expv[12] = 224'h0000000000000000000000000000000000000000000000002138d4d3;
      expv[13] = 224'h000000000000000000000000dce7efa4000000001d03e69a2138d4d3;
      expv[14] = 224'h0000000000000000000000007f37d293000000000000000000000000;
      expv[15] = 224'h000000000000000000000000000000001d03e69a00000000b905bce2;
      expv[16] = 224'h79b2938200000000000000000617378500000000192f11d100000000;
      expv[17] = 224'h00000000000000000000000000000000000000000617378500000000;
      expv[18] = 224'h00000000000000000000000000000000113706230000000000000000;
      expv[19] = 224'h00000000f467409700000000000000000000000000000000dd494401;
      expv[20] = 224'hc9e98cc100000000f46740970000000059472ec80000000000000000;
      expv[21] = 224'hf46740970000000000000000f815b23100000000f2905f5f00000000;
      expv[22] = 224'h00000000000000003700b0d8c5ee5a76000000000617378500000000;
      expv[23] = 224'h000000000000000000000000000000007f37d2930000000000000000;
      expv[24] = 224'h3700b0d800000000c9e98cc1c5ee5a76000000000617378500000000;
      expv[25] = 224'ha3c5b54f3700b0d800000000000000000000000030aa1385cc12a75e;
      expv[26] = 224'h2cd18c5e000000000000000000000000ed13753930aa138500000000;
      expv[27] = 224'h00000000000000000000000000000000000000000000000011370623;
      expv[28] = 224'h0000000000000000000000000000000011370623c5ee5a763dd56992;
      expv[29] = 224'he6d1748b00000000a3c5b54f0000000011370623113706233dd56992;
      expv[30] = 224'h9ebe78cf00000000613a661d30aa13850000000035d978db30aa1385;
      expv[31] = 224'h0000000000000000000000000000000000000000000000002138d4d3;
      expv[32] = 224'h00c5eee1a3c5b54f00000000a112e36600000000f931c2a000000000;
      expv[33] = 224'h00000000c9e98cc10000000011370623f2905f5f3dd56992b905bce2;
      expv[34] = 224'ha3c5b54f0000000079b2938215f7ca8bcc12a75e59472ec8a112e366;
      expv[35] = 224'h4aa66ea0e6d1748b00000000b905bce2a112e36615f7ca8b525a2b77;
      expv[36] = 224'h4fe6733800000000000000000000000015f7ca8bcc12a75e59472ec8;
      expv[37] = 224'h0000000000000000e51685befac40b45e828789d00000000359ebea4;
      expv[38] = 224'h00000000aa8d7d3d5da7d363192f11d1f2905f5f52b212cee828789d;
      expv[39] = 224'h0000000000c5eee1f467409700000000fac40b450000000000000000;
      expv[40] = 224'h4fe673385da7d363a3c5b54fb8ad7bb19c2efff1848083ffbe590c98;
      expv[41] = 224'h5da7d363000000004aa66ea011370623000000003dd5699200000000;
      expv[42] = 224'he6d1748b000000000000000072ea3e3f35d1ac06f2905f5fb8ad7bb1;
      expv[43] = 224'h000000000000000000000000cc12a75ef2905f5f35d1ac06e828789d;
      expv[44] = 224'h6989b45a00c5eee10000000035d1ac06c5ee5a76b8ad7bb106173785;
      expv[45] = 224'h00000000a3c5b54ff467409700000000ed2f79690000000072ea3e3f;
      expv[46] = 224'h79b29382c9e98cc1a3c5b54f59472ec8f2905f5f623bf149e828789d;
      expv[47] = 224'he51685be000000000000000000000000be590c9800000000fac40b45;
      expv[48] = 224'h3700b0d80000000000000000c5ee5a76061737850617378511067737;
      expv[49] = 224'h000000006989b45a000000009c2efff100000000be590c98c5ee5a76;
      expv[50] = 224'h00000000f1a03b72000000000000000000000000c5ee5a76c5ee5a76;
      expv[51] = 224'h5da7d36311b52ba500000000061737859c2efff111067737be590c98;
      expv[52] = 224'hc9e98cc1000000009ebe78cf0617378559472ec811067737623bf149;
      expv[53] = 224'h00000000f4674097000000003dd569922138d4d33e8747b5b32af968;
      expv[54] = 224'h4aa66ea000000000a3c5b54fff139503e95bd2ecxxxxxxxxcc12a75e;
      expv[55] = 224'ha3c5b54f0000000092421dbb000000009d350df92138d4d34e7993a1;
      expv[56] = 224'h00000000e51685be00c5eee1bf2b5af735d1ac06e828789db8ad7bb1;
      expv[57] = 224'h00000000e6d1748b9ebe78cf4e7993a1be590c98e95bd2ecfac40b45;
      expv[58] = 224'h4fe6733800000000ecadab552138d4d300000000b32af968441cd677;
      expv[59] = 224'h70ff3fdc00000000a3c5b54ffac40b45848083ff00000000ed2f7969;
      expv[60] = 224'h4fe673380000000065e6abf859472ec8e95bd2ec623bf149cc12a75e;
      expv[61] = 224'h00000000b0e70f36e6d1748bb32af96800000000ff1395032138d4d3;
      expv[62] = 224'hf4674097000000006989b45a3e8747b5faa25fb80000000035d1ac06;
      expv[63] = 224'h0000000000000000000000002138d4d341812cfab32af968f5996833;
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
