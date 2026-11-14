// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .rst(in_vec[66:66]),
    .i_ibus_adr(in_vec[65:34]),
    .i_ibus_cyc(in_vec[33:33]),
    .i_wb_ibus_rdt(in_vec[32:1]),
    .i_wb_ibus_ack(in_vec[0:0]),
    .o_ibus_rdt(out_vec[65:34]),
    .o_ibus_ack(out_vec[33:33]),
    .o_wb_ibus_adr(out_vec[32:1]),
    .o_wb_ibus_cyc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h583d0fe38efebd64b;
    stim[1] = 67'h418e5359c9ac451b1;
    stim[2] = 67'h198155e3b40dfce64;
    stim[3] = 67'h0b6bac19e9b9059ef;
    stim[4] = 67'h2e4540959561fd0f4;
    stim[5] = 67'h6696f81d6b5d74223;
    stim[6] = 67'h07f5215fe3226502c;
    stim[7] = 67'h335b67c54a2b2a4da;
    stim[8] = 67'h2a6585c4ad73cbd84;
    stim[9] = 67'h353d479b4dac1d28d;
    stim[10] = 67'h0f751aaa197cabab5;
    stim[11] = 67'h3ac5255db9cef01e7;
    stim[12] = 67'h301559b38efa54ace;
    stim[13] = 67'h15a71363fdf2bd6e8;
    stim[14] = 67'h1351271e934f2de37;
    stim[15] = 67'h3d13d82281b9905cd;
    stim[16] = 67'h02a478e858d7d4712;
    stim[17] = 67'h181a6a4531718d1b3;
    stim[18] = 67'h130673305b5dd5843;
    stim[19] = 67'h2e1fa79bcdb088100;
    stim[20] = 67'h242b6ae55e607d1c8;
    stim[21] = 67'h1eca81d6ace562c52;
    stim[22] = 67'h0eb8f0b0da3e57938;
    stim[23] = 67'h139975a4be7d6c4e3;
    stim[24] = 67'h0ddea6e38e537d7b6;
    stim[25] = 67'h324f1d408330ea783;
    stim[26] = 67'h17b8d59efb1f8bbbd;
    stim[27] = 67'h3f11d47cb96cccf4a;
    stim[28] = 67'h311d310f5fbd1b17d;
    stim[29] = 67'h140001207b55029f5;
    stim[30] = 67'h100cb6ceb7d93b41e;
    stim[31] = 67'h1d5b902279848827e;
    stim[32] = 67'h2305dc93c8566a29c;
    stim[33] = 67'h234cf97112140280f;
    stim[34] = 67'h330f141a44c0d1ab6;
    stim[35] = 67'h20975c299f7997531;
    stim[36] = 67'h7134c464d88aab8f4;
    stim[37] = 67'h1c1a084be12a35963;
    stim[38] = 67'h1dd09c062bec87c37;
    stim[39] = 67'h0d75af447c8a55c68;
    stim[40] = 67'h251d230293e99c960;
    stim[41] = 67'h20e39a2412219ef4c;
    stim[42] = 67'h346bd6fd196549cfb;
    stim[43] = 67'h1810a749ea0bed7e4;
    stim[44] = 67'h33e9500c6fbb5f997;
    stim[45] = 67'h239613f91d6f03a65;
    stim[46] = 67'h3a77f8abc0ce38dd3;
    stim[47] = 67'h2d068c4387350919f;
    stim[48] = 67'h1bfe675f43601148b;
    stim[49] = 67'h2b7f820d1d5146a86;
    stim[50] = 67'h1e56ec65d103462af;
    stim[51] = 67'h102bf20445d70840b;
    stim[52] = 67'h0ca857ba67a0c8b92;
    stim[53] = 67'h00388ade1ea7181d9;
    stim[54] = 67'h28a53875c5ad5ea64;
    stim[55] = 67'h0d77ef02c99e3995e;
    stim[56] = 67'h3d021e2d0e7ff4c56;
    stim[57] = 67'h009882624acf67889;
    stim[58] = 67'h0164ccbab24bfcda8;
    stim[59] = 67'h043424338612cc089;
    stim[60] = 67'h21d70e78f7bbd272e;
    stim[61] = 67'h1f36bce1e801fc95f;
    stim[62] = 67'h0619500f08481a2eb;
    stim[63] = 67'h2af6e6a8f4836371e;
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
      expv[0] = 66'hxxxxxxxxxc1e87fxx;
      expv[1] = 66'h13588a3600c729ace;
      expv[2] = 66'h281bf9cc8cc0aaf1d;
      expv[3] = 66'h13720b3dc5b5d60cf;
      expv[4] = 66'h3a1e8b3dd722a04b4;
      expv[5] = 66'h28444b3df34b7c0f3;
      expv[6] = 66'h0644ca0583fa90aff;
      expv[7] = 66'h1456549b59adb3e2a;
      expv[8] = 66'h1ae797b09532c2e25;
      expv[9] = 66'h1b583a51ba9ea3cda;
      expv[10] = 66'h32f95756a7ba8d550;
      expv[11] = 66'h339de03cdd6292aed;
      expv[12] = 66'h2959e03cd80aacda4;
      expv[13] = 66'h3add203ccad389b27;
      expv[14] = 66'h1bc6e03ce9a8938fc;
      expv[15] = 66'h037320b99e89ec114;
      expv[16] = 66'h28e260b981523c74a;
      expv[17] = 66'h1a3660b9ac0d35231;
      expv[18] = 66'h2b085a3669833998a;
      expv[19] = 66'h10202b08570fd3ce6;
      expv[20] = 66'h3a392b085215b5732;
      expv[21] = 66'h058a6b084f6540ebd;
      expv[22] = 66'h2f272b08475c7858e;
      expv[23] = 66'h189c6b0869ccbad2d;
      expv[24] = 66'h1ca6faf6c6ef5371c;
      expv[25] = 66'h0661d4f059278ea04;
      expv[26] = 66'h177794f06bdc6acff;
      expv[27] = 66'h32d999e95f88ea3e5;
      expv[28] = 66'h3f7a362fb88e9887a;
      expv[29] = 66'h36aa053eaa0000903;
      expv[30] = 66'h2fb27683c8065b675;
      expv[31] = 66'h3309104fceadc8113;
      expv[32] = 66'h10acd4539182ee49e;
      expv[33] = 66'h24280501f1a67cb88;
      expv[34] = 66'h0981a356d9878a0d2;
      expv[35] = 66'h3ef32ea6104bae14c;
      expv[36] = 66'h171eaea6189a6232e;
      expv[37] = 66'h02546b2c4e0d0425f;
      expv[38] = 66'h0f86eb2c6ee84e039;
      expv[39] = 66'h2b8d0f86c6bad7a2b;
      expv[40] = 66'h392c0f86d28e9181c;
      expv[41] = 66'h3de98f86d071cd128;
      expv[42] = 66'h139f4f86fa35eb7f0;
      expv[43] = 66'h1afc939f4c0853a57;
      expv[44] = 66'h3f32d39f79f4a806b;
      expv[45] = 66'h074cbf32f1cb09fd0;
      expv[46] = 66'h31ba474cbd3bfc566;
      expv[47] = 66'h0e6a1233d6834621c;
      expv[48] = 66'h22915233edff33b02;
      expv[49] = 66'h0d50e29155bfc1070;
      expv[50] = 66'h0c55e2916f2b76336;
      expv[51] = 66'h0bae10816815f9022;
      expv[52] = 66'h0f41917246542bdd3;
      expv[53] = 66'h3d4e303b201c456f0;
      expv[54] = 66'h0b5abd4c94529c3ae;
      expv[55] = 66'h133c732bc6bbf7816;
      expv[56] = 66'h1cffe98ade810f168;
      expv[57] = 66'h159ecf11204c41312;
      expv[58] = 66'h2497f9b500b2665d5;
      expv[59] = 66'h0c259811021a1219c;
      expv[60] = 66'h24e5d81110eb873cf;
      expv[61] = 66'h392bd8112f9b5e717;
      expv[62] = 66'h1090345d630ca8078;
      expv[63] = 66'h2906c6e3d57b73547;
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
