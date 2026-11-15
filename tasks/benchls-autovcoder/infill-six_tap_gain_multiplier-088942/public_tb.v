// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 220;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_088942 dut (
    .clk(clk),
    .rst_n(in_vec[37:37]),
    .fs_enb(in_vec[36:36]),
    .xout(in_vec[35:0]),
    .outa1(out_vec[219:184]),
    .outa2(out_vec[183:148]),
    .outa3(out_vec[147:112]),
    .outa4(out_vec[111:76]),
    .outa5(out_vec[75:40]),
    .outa6(out_vec[39:4]),
    .outsig(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h1608e67dbc;
    stim[1] = 38'h02804c0ce0;
    stim[2] = 38'h3d2665b06a;
    stim[3] = 38'h3ee166c49b;
    stim[4] = 38'h2a362f2dfd;
    stim[5] = 38'h2d0cac9cd1;
    stim[6] = 38'h20d6aa5216;
    stim[7] = 38'h351e62b555;
    stim[8] = 38'h3d10e4033b;
    stim[9] = 38'h3131c4f945;
    stim[10] = 38'h3d2288d555;
    stim[11] = 38'h20495c3075;
    stim[12] = 38'h397bd22dcd;
    stim[13] = 38'h336c79ce9a;
    stim[14] = 38'h3e39537584;
    stim[15] = 38'h374cb37153;
    stim[16] = 38'h31a3fab698;
    stim[17] = 38'h3f48a749bd;
    stim[18] = 38'h3c0275e6dc;
    stim[19] = 38'h249d377012;
    stim[20] = 38'h2279443767;
    stim[21] = 38'h20bfd69980;
    stim[22] = 38'h27552f8ba8;
    stim[23] = 38'h34a0bf0bc7;
    stim[24] = 38'h33d6ad0f2d;
    stim[25] = 38'h3d035843b3;
    stim[26] = 38'h300b7590e0;
    stim[27] = 38'h23420d4d70;
    stim[28] = 38'h2e22981803;
    stim[29] = 38'h378057723f;
    stim[30] = 38'h3c4de1ef96;
    stim[31] = 38'h264cec966b;
    stim[32] = 38'h212f6c5f3b;
    stim[33] = 38'h332e4b4155;
    stim[34] = 38'h3161e3efaa;
    stim[35] = 38'h322ad46de0;
    stim[36] = 38'h21632f6020;
    stim[37] = 38'h3fa65e4c17;
    stim[38] = 38'h30d56fe187;
    stim[39] = 38'h3d599582b4;
    stim[40] = 38'h2f00505722;
    stim[41] = 38'h30cbfc6592;
    stim[42] = 38'h3cc9367d09;
    stim[43] = 38'h2dec6f7148;
    stim[44] = 38'h2b0857de44;
    stim[45] = 38'h37d9df3ee7;
    stim[46] = 38'h3cfb8d913b;
    stim[47] = 38'h3362fb3260;
    stim[48] = 38'h21ca3f487a;
    stim[49] = 38'h2c608f8c0d;
    stim[50] = 38'h3bbeb67966;
    stim[51] = 38'h36339ce6fb;
    stim[52] = 38'h3ed1da7acd;
    stim[53] = 38'h24fb8b1936;
    stim[54] = 38'h2c9acf6efb;
    stim[55] = 38'h1546150c89;
    stim[56] = 38'h27ea8df2f4;
    stim[57] = 38'h26e4dd9115;
    stim[58] = 38'h31714b254d;
    stim[59] = 38'h3a63e72430;
    stim[60] = 38'h22fed46343;
    stim[61] = 38'h2bff27f091;
    stim[62] = 38'h2cffca2749;
    stim[63] = 38'h23509cf836;
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
      expv[0] = 220'h0000000000000000000000000000000000000000000000000000000;
      expv[1] = 220'h0000000000000000000000000000000000000000000000000000000;
      expv[2] = 220'h0000000000000000000000000000000000000000000000000000000;
      expv[3] = 220'h002ee0000005b2000000951000000c120000017c1000001e570000d;
      expv[4] = 220'h000fa0000001e600000031b0000004060000007eb000000a1d0000f;
      expv[5] = 220'h000fa0000001e600000031b0000004060000007eb000000a1d0000f;
      expv[6] = 220'h000fa0000001e600000031b0000004060000007eb000000a1d0000f;
      expv[7] = 220'h000fa0000001e600000031b0000004060000007eb000000a1d0000f;
      expv[8] = 220'hffb1e0000ff6820000ff0790000febe20000fd8690000fcd6f00005;
      expv[9] = 220'h002ee0000005b2000000951000000c120000017c1000001e570000d;
      expv[10] = 220'hfff060000ffe1a0000ffce50000ffbfa0000ff8150000ff5e300001;
      expv[11] = 220'h002ee0000005b2000000951000000c120000017c1000001e570000d;
      expv[12] = 220'h002ee0000005b2000000951000000c120000017c1000001e570000d;
      expv[13] = 220'h006d6000000d4a0000015bd000001c2a00000376d0000046cb00009;
      expv[14] = 220'hffd120000ffa4e0000ff6af0000ff3ee0000fe83f0000fe1a900003;
      expv[15] = 220'h001f40000003cc00000063600000080c000000fd600000143a0000e;
      expv[16] = 220'hff92a0000ff2b60000fea430000fe3d60000fc8930000fb93500007;
      expv[17] = 220'hffe0c0000ffc340000ff9ca0000ff7f40000ff02a0000febc600002;
      expv[18] = 220'h000fa0000001e600000031b0000004060000007eb000000a1d0000f;
      expv[19] = 220'h003e8000000798000000c6c000001018000001fac0000028740000c;
      expv[20] = 220'h003e8000000798000000c6c000001018000001fac0000028740000c;
      expv[21] = 220'h003e8000000798000000c6c000001018000001fac0000028740000c;
      expv[22] = 220'h003e8000000798000000c6c000001018000001fac0000028740000c;
      expv[23] = 220'h003e8000000798000000c6c000001018000001fac0000028740000c;
      expv[24] = 220'hffb1e0000ff6820000ff0790000febe20000fd8690000fcd6f00005;
      expv[25] = 220'hffc180000ff8680000ff3940000fefe80000fe0540000fd78c00004;
      expv[26] = 220'h002ee0000005b2000000951000000c120000017c1000001e570000d;
      expv[27] = 220'h0000000000000000000000000000000000000000000000000000000;
      expv[28] = 220'h0000000000000000000000000000000000000000000000000000000;
      expv[29] = 220'h0000000000000000000000000000000000000000000000000000000;
      expv[30] = 220'h007d0000000f300000018d8000002030000003f580000050e800008;
      expv[31] = 220'h003e8000000798000000c6c000001018000001fac0000028740000c;
      expv[32] = 220'h003e8000000798000000c6c000001018000001fac0000028740000c;
      expv[33] = 220'h003e8000000798000000c6c000001018000001fac0000028740000c;
      expv[34] = 220'hffd120000ffa4e0000ff6af0000ff3ee0000fe83f0000fe1a900003;
      expv[35] = 220'hfff060000ffe1a0000ffce50000ffbfa0000ff8150000ff5e300001;
      expv[36] = 220'hffe0c0000ffc340000ff9ca0000ff7f40000ff02a0000febc600002;
      expv[37] = 220'hffe0c0000ffc340000ff9ca0000ff7f40000ff02a0000febc600002;
      expv[38] = 220'h0000000000000000000000000000000000000000000000000000000;
      expv[39] = 220'hfff060000ffe1a0000ffce50000ffbfa0000ff8150000ff5e300001;
      expv[40] = 220'h002ee0000005b2000000951000000c120000017c1000001e570000d;
      expv[41] = 220'h002ee0000005b2000000951000000c120000017c1000001e570000d;
      expv[42] = 220'hfff060000ffe1a0000ffce50000ffbfa0000ff8150000ff5e300001;
      expv[43] = 220'h002ee0000005b2000000951000000c120000017c1000001e570000d;
      expv[44] = 220'h002ee0000005b2000000951000000c120000017c1000001e570000d;
      expv[45] = 220'h002ee0000005b2000000951000000c120000017c1000001e570000d;
      expv[46] = 220'h007d0000000f300000018d8000002030000003f580000050e800008;
      expv[47] = 220'h002ee0000005b2000000951000000c120000017c1000001e570000d;
      expv[48] = 220'hffd120000ffa4e0000ff6af0000ff3ee0000fe83f0000fe1a900003;
      expv[49] = 220'hffd120000ffa4e0000ff6af0000ff3ee0000fe83f0000fe1a900003;
      expv[50] = 220'hffd120000ffa4e0000ff6af0000ff3ee0000fe83f0000fe1a900003;
      expv[51] = 220'h003e8000000798000000c6c000001018000001fac0000028740000c;
      expv[52] = 220'hffa240000ff49c0000fed5e0000fe7dc0000fd07e0000fc35200006;
      expv[53] = 220'h000fa0000001e600000031b0000004060000007eb000000a1d0000f;
      expv[54] = 220'h000fa0000001e600000031b0000004060000007eb000000a1d0000f;
      expv[55] = 220'h0000000000000000000000000000000000000000000000000000000;
      expv[56] = 220'h0000000000000000000000000000000000000000000000000000000;
      expv[57] = 220'h0000000000000000000000000000000000000000000000000000000;
      expv[58] = 220'h0000000000000000000000000000000000000000000000000000000;
      expv[59] = 220'hfff060000ffe1a0000ffce50000ffbfa0000ff8150000ff5e300001;
      expv[60] = 220'h005dc000000b640000012a2000001824000002f82000003cae0000a;
      expv[61] = 220'h005dc000000b640000012a2000001824000002f82000003cae0000a;
      expv[62] = 220'h005dc000000b640000012a2000001824000002f82000003cae0000a;
      expv[63] = 220'h005dc000000b640000012a2000001824000002f82000003cae0000a;
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
