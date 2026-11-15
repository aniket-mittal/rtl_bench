// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 118;
  localparam OW = 106;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_066553 dut (
    .wbs_clk_i(clk),
    .wbs_rst_i(in_vec[117:117]),
    .wbs_cyc_i(in_vec[116:116]),
    .wbs_stb_i(in_vec[115:115]),
    .wbs_addr_i(in_vec[114:85]),
    .wbs_sel_i(in_vec[84:81]),
    .wbs_we_i(in_vec[80:80]),
    .wbs_data_i(in_vec[79:48]),
    .sram_din(in_vec[47:0]),
    .wbs_data_o(out_vec[105:74]),
    .wbs_ack_o(out_vec[73:73]),
    .sram_ce_n(out_vec[72:72]),
    .sram_oe_n(out_vec[71:71]),
    .sram_we_n(out_vec[70:70]),
    .sram_addr(out_vec[69:48]),
    .sram_dout(out_vec[47:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 118'h24ff9f09e59ff053d16ac9035c983b;
    stim[1] = 118'h2f239b91927a6f25b7bb99e0e108d4;
    stim[2] = 118'h065222340ebb6cdefcbcc2adc0a0df;
    stim[3] = 118'h0dc143314e404ebe1db921d009d7c7;
    stim[4] = 118'h00c30133b23ac2d213dc728bcbb648;
    stim[5] = 118'h13d9ad0242863996463e21baba4602;
    stim[6] = 118'h173b172ea4ff63530f8a0cd46888bb;
    stim[7] = 118'h07738165eb856299eebd483943aa1e;
    stim[8] = 118'h0fc4e5d0b036c6fbd661d00b99da2c;
    stim[9] = 118'h0ec538a921ca9853141425e29e7d39;
    stim[10] = 118'h1b990b58d5f502249f27a71838deeb;
    stim[11] = 118'h09466bde4796c63a7e11fe4d782326;
    stim[12] = 118'h16f176b82ad9c91e5b0a136f37f8a6;
    stim[13] = 118'h1dc4b07f51ce94727235053080ebc7;
    stim[14] = 118'h1e0e7b2ac740c3cbdcd230b85e06df;
    stim[15] = 118'h0b8c0f5d4840d400a53bcd8e5f1d79;
    stim[16] = 118'h15e38dc1b1ad1662dc689148d4cb03;
    stim[17] = 118'h0c3832d88ac8086a64fb7c147222fd;
    stim[18] = 118'h002c7ae7045ba27f09ac81abae92fd;
    stim[19] = 118'h1af13749297f3015031b13ac6dee53;
    stim[20] = 118'h1acef11d6ebdf68938a0f004731d58;
    stim[21] = 118'h0a01ce8bae19ef7477000e5042d22b;
    stim[22] = 118'h0f73ba1b8bcc0ee471020426f5a239;
    stim[23] = 118'h0d51bfa139400cea6851b9895dd1f3;
    stim[24] = 118'h177bbed136bc694f396988253f8ba4;
    stim[25] = 118'h105fa3b18fb9040ee9805c7e7774a8;
    stim[26] = 118'h1b91afbdca78938cbaea9020e2e517;
    stim[27] = 118'h14d146a0044c3a142ec48561a0b2e0;
    stim[28] = 118'h11acfbd4c2251bcc606769b1ac3197;
    stim[29] = 118'h0fc0111d43e959569b7d543ce2edf6;
    stim[30] = 118'h126cb687cb58818744f11e67caa525;
    stim[31] = 118'h19f11773ac5201ae08ecfda01693b3;
    stim[32] = 118'h08ea13ddeb2864961a9aef3ec4e1a8;
    stim[33] = 118'h09a3a6b66cb02385f1da582013a872;
    stim[34] = 118'h07b218addf83949d2b42bc3d05e74d;
    stim[35] = 118'h3074e2d0b707a1e4f6f9b2c4bc7cda;
    stim[36] = 118'h1916e95080f3c81a150347180148a8;
    stim[37] = 118'h18403119e74e31201df36114e35c20;
    stim[38] = 118'h0545db328bf88a268c4c41fe3ebaf2;
    stim[39] = 118'h1f564e7b28b3b1e2c19c94be1a7318;
    stim[40] = 118'h1e7004cbd67d515b3babb9f35ef841;
    stim[41] = 118'h104b3dc1157a0c7941b6dfb15ddf2d;
    stim[42] = 118'h14418f11ede593cfc1f0a9ef76cfdd;
    stim[43] = 118'h1fc0f9752aa8223398fd01ef61a992;
    stim[44] = 118'h0ac46f808df8494227d5e778cae95d;
    stim[45] = 118'h28cabd3817462950a76813ab26a47a;
    stim[46] = 118'h0d4572c9ae2b4d8d105b2406b4ce6a;
    stim[47] = 118'h12d1d65579be7ad8889631c5210678;
    stim[48] = 118'h0d8f56a43ac8aabc87b2cee9d9f052;
    stim[49] = 118'h0673536a3a73cb9976948c7e7a8dbc;
    stim[50] = 118'h1a7532192a2aee3548f5539f0425d6;
    stim[51] = 118'h01d19c5db4a24b34d87c58a16b0d79;
    stim[52] = 118'h1b7d059e278a13c7a3ae4c1dcb9430;
    stim[53] = 118'h0731d956c2dec8b99d9fb0127cb9bf;
    stim[54] = 118'h0c4f36f68c0564c0ac11cff7f720b4;
    stim[55] = 118'h150497b6b2b70acc987d2a9b3c8935;
    stim[56] = 118'h19cef427cd358cccf4e16b18a074dd;
    stim[57] = 118'h09a2b8c4e16834220ea3a6b3e0729a;
    stim[58] = 118'h039a4e5edac863cd5b8d797a25de56;
    stim[59] = 118'h0bb09a3f3e25d8bb643dd1a16310db;
    stim[60] = 118'h11c1f1440e09af9321b018a9f503f9;
    stim[61] = 118'h1b26efc58cc20e5ac51a071af07e8a;
    stim[62] = 118'h1f650b3f4d47813629276f88a9d976;
    stim[63] = 118'h0da0dfce3caff3c16235acb91fbd8f;
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
      expv[0] = 106'hxxxxxxxxxbcf84f00009ff053d1;
      expv[1] = 106'h0000000015cdc8c00007a6f25b7;
      expv[2] = 106'h0000000015111a00000bb6cdefc;
      expv[3] = 106'h0000000014a198a0000404ebe1d;
      expv[4] = 106'h00000000158099d00003ac2d213;
      expv[5] = 106'h0000000014d6812000086399646;
      expv[6] = 106'h00000000158b9750000ff63530f;
      expv[7] = 106'h0000000019c0b2f0000856299ee;
      expv[8] = 106'h000000001672e85000036c6fbd6;
      expv[9] = 106'h000000001a9c5490000ca985314;
      expv[10] = 106'h000000001885ac60000f502249f;
      expv[11] = 106'h000000001b35ef2000096c63a7e;
      expv[12] = 106'h0000000014bb5c10000d9c91e5b;
      expv[13] = 106'h000000001a583fa0000ce947272;
      expv[14] = 106'h000000001b3d956000040c3cbdc;
      expv[15] = 106'h000000001607aea000040d400a5;
      expv[16] = 106'h0000000019c6e0d0000ad1662dc;
      expv[17] = 106'h0000000014196c40000c8086a64;
      expv[18] = 106'h00000000163d73800005ba27f09;
      expv[19] = 106'h00000000189ba4900007f301503;
      expv[20] = 106'h0000000017788eb0000bdf68938;
      expv[21] = 106'h0000000014e745d000019ef7477;
      expv[22] = 106'h0000000019dd0dc0000cc0ee471;
      expv[23] = 106'h0000000018dfd090000400cea68;
      expv[24] = 106'h0000000015df6890000bc694f39;
      expv[25] = 106'h000000001bd1d8c0000b9040ee9;
      expv[26] = 106'h0000000014d7dee000078938cba;
      expv[27] = 106'h0000000014a350000004c3a142e;
      expv[28] = 106'h00000000167dea60000251bcc60;
      expv[29] = 106'h0000000018088ea0000e959569b;
      expv[30] = 106'h000000001a5b43e000058818744;
      expv[31] = 106'h00000000148bb9d00005201ae08;
      expv[32] = 106'h000000001909eef00002864961a;
      expv[33] = 106'h0000000015d35b30000b02385f1;
      expv[34] = 106'h00000000190c56e000083949d2b;
      expv[35] = 106'h000000001a71685000007a1e4f6;
      expv[36] = 106'h000000001774a840000f3c81a15;
      expv[37] = 106'h0000000018188cf00004e31201d;
      expv[38] = 106'h000000001aed9940000f88a268c;
      expv[39] = 106'h0000000017273d90000b3b1e2c1;
      expv[40] = 106'h00000000140265e00007d515b3b;
      expv[41] = 106'h00000000199ee0800007a0c7941;
      expv[42] = 106'h0000000018c788f0000e593cfc1;
      expv[43] = 106'h00000000147cba90000a8223398;
      expv[44] = 106'h000000001a37c040000f8494227;
      expv[45] = 106'h00000000195e9c00000462950a7;
      expv[46] = 106'h0000000016b964d00002b4d8d10;
      expv[47] = 106'h0000000018eb2ab0000be7ad888;
      expv[48] = 106'h0000000017ab5210000c8aabc87;
      expv[49] = 106'h0000000015a9b51000073cb9976;
      expv[50] = 106'h0000000016990c900002aee3548;
      expv[51] = 106'h0000000014ce2ed0000a24b34d8;
      expv[52] = 106'h000000001a82cf100008a13c7a3;
      expv[53] = 106'h0000000014ecab60000dec8b99d;
      expv[54] = 106'h00000000179b7b400000564c0ac;
      expv[55] = 106'h00000000164bdb50000b70acc98;
      expv[56] = 106'h000000001b7a13e0000358cccf4;
      expv[57] = 106'h00000000195c62700006834220e;
      expv[58] = 106'h0000000015272f60000c863cd5b;
      expv[59] = 106'h00000000144d1f9000025d8bb64;
      expv[60] = 106'h0000000014f8a20000009af9321;
      expv[61] = 106'h000000001777e2c0000c20e5ac5;
      expv[62] = 106'h000000001a859fa000047813629;
      expv[63] = 106'h00000000146fe710000aff3c162;
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
