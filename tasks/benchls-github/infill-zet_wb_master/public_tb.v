// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 58;
  localparam OW = 58;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  zet_wb_master dut (
    .wb_clk_i(clk),
    .cpu_byte_o(in_vec[57:57]),
    .cpu_memop(in_vec[56:56]),
    .cpu_m_io(in_vec[55:55]),
    .cpu_adr_o(in_vec[54:35]),
    .cpu_dat_o(in_vec[34:19]),
    .cpu_we_o(in_vec[18:18]),
    .wb_rst_i(in_vec[17:17]),
    .wb_dat_i(in_vec[16:1]),
    .wb_ack_i(in_vec[0:0]),
    .cpu_block(out_vec[57:57]),
    .cpu_dat_i(out_vec[56:41]),
    .wb_dat_o(out_vec[40:25]),
    .wb_adr_o(out_vec[24:6]),
    .wb_we_o(out_vec[5:5]),
    .wb_tga_o(out_vec[4:4]),
    .wb_sel_o(out_vec[3:2]),
    .wb_stb_o(out_vec[1:1]),
    .wb_cyc_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 58'h3d82df28c96b67b;
    stim[1] = 58'h30fb8071fc76926;
    stim[2] = 58'h353e002d72de14d;
    stim[3] = 58'h315afac30edec79;
    stim[4] = 58'h2e2f0995ed19fd4;
    stim[5] = 58'h3bce5e70c6539ef;
    stim[6] = 58'h37e29652085bb8c;
    stim[7] = 58'h148b636ea9d6bf5;
    stim[8] = 58'h3ee6061911c67ba;
    stim[9] = 58'h3350731e1e039dd;
    stim[10] = 58'h28748bf9c1560f5;
    stim[11] = 58'h291e2bce647f52b;
    stim[12] = 58'h3d30cf07decfd83;
    stim[13] = 58'h12c21c50495bec6;
    stim[14] = 58'h1b86c463e8dd7f3;
    stim[15] = 58'h077ee57e9f87a83;
    stim[16] = 58'h0db6bcdb6d89ef4;
    stim[17] = 58'h00fb4dad785e98f;
    stim[18] = 58'h2c219219b644f32;
    stim[19] = 58'h2fd399a3935c19e;
    stim[20] = 58'h2eedc1bbed09b1f;
    stim[21] = 58'h17a839cfb093456;
    stim[22] = 58'h190ba14d719ccda;
    stim[23] = 58'h358bb9047a8f855;
    stim[24] = 58'h1a0b42272651bc9;
    stim[25] = 58'h2e368a534792a22;
    stim[26] = 58'h0d2d297a53dfc48;
    stim[27] = 58'h1b9713a09a59ff7;
    stim[28] = 58'h3f4d8d296cc33b6;
    stim[29] = 58'h18ad73d832905cc;
    stim[30] = 58'h23817366c20e471;
    stim[31] = 58'h388d4b05c8d8f8a;
    stim[32] = 58'h244159eb0c0ba11;
    stim[33] = 58'h0796ae57dcc72ab;
    stim[34] = 58'h1e12b6a2905b754;
    stim[35] = 58'h1bea853a9b139c9;
    stim[36] = 58'h0dec542e8506b1a;
    stim[37] = 58'h23529c6df69e915;
    stim[38] = 58'h0332a525c914899;
    stim[39] = 58'h14ebe6d7a74c00d;
    stim[40] = 58'h3441d9d65f9dea6;
    stim[41] = 58'h306b060a0a9d59d;
    stim[42] = 58'h2c464b601dc6751;
    stim[43] = 58'h2465084100dfdaf;
    stim[44] = 58'h14055f43889e8ff;
    stim[45] = 58'h0a00c4dea9820a6;
    stim[46] = 58'h3a0b580ac493c0e;
    stim[47] = 58'h2bacdbc4743c6f8;
    stim[48] = 58'h0e3fc3c8d208f99;
    stim[49] = 58'h3c6abecd95cff6b;
    stim[50] = 58'h3c4147146617455;
    stim[51] = 58'h2110e47ed94bf5b;
    stim[52] = 58'h20ee1922d348626;
    stim[53] = 58'h196400c38edd8b7;
    stim[54] = 58'h1db693c7fd59601;
    stim[55] = 58'h312ad0d9b28832f;
    stim[56] = 58'h1a860f949e82601;
    stim[57] = 58'h0c88e738e191527;
    stim[58] = 58'h26ef2cfe4ddd60a;
    stim[59] = 58'h338fca438641b99;
    stim[60] = 58'h2f359fb32955593;
    stim[61] = 58'h0ac1f3de2793da9;
    stim[62] = 58'h1ca2b52f9b07b0c;
    stim[63] = 58'h222a0c79ef1b2ab;
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
      expv[0] = 58'hxxxxxxxxxxxxxxx;
      expv[1] = 58'hxxxxxa32560b7e4;
      expv[2] = 58'hxxxxxc7f03ee027;
      expv[3] = 58'hxxxxxb5cb4f8024;
      expv[4] = 58'hxxxxx3b0c56be94;
      expv[5] = 58'hxxxxxb4578bc27b;
      expv[6] = 58'hxxxxxc318f397a4;
      expv[7] = 58'hxxxxx4821f8a5a4;
      expv[8] = 58'hxxxxxbaa722d8f4;
      expv[9] = 58'hxxxxx6447b98187;
      expv[10] = 58'h3ffdc7878d41cf4;
      expv[11] = 58'h3ffdd05e61d22f4;
      expv[12] = 58'h3ffdd9138478af4;
      expv[13] = 58'h3ffdc1f7b4c33e4;
      expv[14] = 58'h3ffdd4124b0873f;
      expv[15] = 58'h3ffdd8fa2e1b104;
      expv[16] = 58'h1ffddfa7fdfb954;
      expv[17] = 58'h1ffddb76d6daf24;
      expv[18] = 58'h3ffdde0b43ed374;
      expv[19] = 58'h3ffdc66d90864b7;
      expv[20] = 58'h3ffdc4c8ff4e65b;
      expv[21] = 58'h0009bb4efbb7044;
      expv[22] = 58'h2009ac33fea0e54;
      expv[23] = 58'h2009b35c642e84f;
      expv[24] = 58'h2005411eb62ee74;
      expv[25] = 58'h000549c9882d094;
      expv[26] = 58'h200554d1f8da2b4;
      expv[27] = 58'h20055e94f4b4a7f;
      expv[28] = 58'h2005468834b4ab7;
      expv[29] = 58'h20054a5b2e5c517;
      expv[30] = 58'h20054cb61d36387;
      expv[31] = 58'h070559b08e05cf4;
      expv[32] = 58'h0705417222352c4;
      expv[33] = 58'h0705431ad105664;
      expv[34] = 58'h270555f73e5abb4;
      expv[35] = 58'h27054408b84ad9b;
      expv[36] = 58'h139c8ea6cfaa154;
      expv[37] = 58'h139c8ba157b1504;
      expv[38] = 58'h139c9b7dad4a704;
      expv[39] = 58'h339c89724cca964;
      expv[40] = 58'h339c89d5f3af984;
      expv[41] = 58'h339c97f5910764b;
      expv[42] = 58'h3ff9c282a1ac1b4;
      expv[43] = 58'h3ff9d80771192e4;
      expv[44] = 58'h3ff9d0403194204;
      expv[45] = 58'h1ff9d0e230157d4;
      expv[46] = 58'h3ff9ca77a803114;
      expv[47] = 58'h3ff9c2b1282d617;
      expv[48] = 58'h3ff9dd110eb36db;
      expv[49] = 58'h3ff9d49238ff0f4;
      expv[50] = 58'h3ff9c57371aaf94;
      expv[51] = 58'h1ff9c51991051e4;
      expv[52] = 58'h1ff9dfb64443924;
      expv[53] = 58'h3ff9c8b4c3b8674;
      expv[54] = 58'h3ff9c3b0e590034;
      expv[55] = 58'h3ff9df51f6da4c4;
      expv[56] = 58'h3ff9ccb664ab414;
      expv[57] = 58'h3ff9c7a52a183d4;
      expv[58] = 58'h1ff9ce3872239e4;
      expv[59] = 58'h3ff9d37f9bbcb24;
      expv[60] = 58'h3ff9d0e18e3f2b4;
      expv[61] = 58'h3ff9ca4cdcd67d4;
      expv[62] = 58'h3ff9c9f78b07cd4;
      expv[63] = 58'h3ff9cbe6d28ad4f;
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
