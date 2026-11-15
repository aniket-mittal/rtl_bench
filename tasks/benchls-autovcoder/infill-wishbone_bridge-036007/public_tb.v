// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 106;
  localparam OW = 119;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_036007 dut (
    .clk_i(clk),
    .wb_clk_i(in_vec[105:105]),
    .wb_rst_i(in_vec[104:104]),
    .wb_ack_i(in_vec[103:103]),
    .wb_rty_i(in_vec[102:102]),
    .wb_err_i(in_vec[101:101]),
    .wb_sel_i(in_vec[100:97]),
    .wb_dat_i(in_vec[96:65]),
    .write_i(in_vec[64:64]),
    .bes_i(in_vec[63:60]),
    .data_i(in_vec[59:28]),
    .miss_i(in_vec[27:27]),
    .addr_i(in_vec[26:0]),
    .wb_cyc_o(out_vec[118:118]),
    .wb_stb_o(out_vec[117:117]),
    .wb_we_o(out_vec[116:116]),
    .wb_cti_o(out_vec[115:113]),
    .wb_bte_o(out_vec[112:111]),
    .wb_adr_o(out_vec[110:84]),
    .wb_sel_o(out_vec[83:80]),
    .wb_dat_o(out_vec[79:48]),
    .wack_o(out_vec[47:47]),
    .wack_ao(out_vec[46:46]),
    .ack_o(out_vec[45:45]),
    .ready_o(out_vec[44:44]),
    .done_o(out_vec[43:43]),
    .busy_o(out_vec[42:42]),
    .u_write_o(out_vec[41:41]),
    .u_vld_o(out_vec[40:40]),
    .u_addr_o(out_vec[39:32]),
    .u_data_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 106'h1885940268ed6ae7fbf967a9094;
    stim[1] = 106'h33b3ec0169c09388e1c3e36727c;
    stim[2] = 106'h278851ea0e75661e6af6a44da57;
    stim[3] = 106'h0254f214b5f978be0a1a0d7545c;
    stim[4] = 106'h0afcf31d3da4d2953de3f15c260;
    stim[5] = 106'h23d47a9f035d31c1dba22225ee2;
    stim[6] = 106'h06fd0271d5dc709234e6f553dc6;
    stim[7] = 106'h08aa0db01b00f17a817e58f49ea;
    stim[8] = 106'h25feeb5dd0988bc5ddcd8096f2b;
    stim[9] = 106'h2a2f3a41bca29d22597740f267d;
    stim[10] = 106'h2d2d65ee711345dadf63f5187b6;
    stim[11] = 106'h21c877b3f5776a84d1bfdcb1fab;
    stim[12] = 106'h0d02f322ec1ca8d28a2ab076a48;
    stim[13] = 106'h2339cad1ba0b3c9e0a1898f7388;
    stim[14] = 106'h077b0ae9c746755dd551b1ceab1;
    stim[15] = 106'h2eea176db6069ba1c56aa13a6c3;
    stim[16] = 106'h2769364609ea421d5e85ad9951b;
    stim[17] = 106'h0c0d291614ea58873221d1c28f4;
    stim[18] = 106'h0e85368624bb5a0840a856c0299;
    stim[19] = 106'h2a4623fcab54103a65a99df12c3;
    stim[20] = 106'h0e01c6fb0d9b8245149a2852798;
    stim[21] = 106'h09cbe6233359959fd477c9a6459;
    stim[22] = 106'h2a6c3c5784183593946aeb2d872;
    stim[23] = 106'h09af5b3241b6d17ce826c4cbcdc;
    stim[24] = 106'h23d484449f7b3b62a7fa61f14a5;
    stim[25] = 106'h08a2e17f3d348bd2c4b2875fdc7;
    stim[26] = 106'h09346636b493069ac769d359b13;
    stim[27] = 106'h298df9776acc241403b0434ee40;
    stim[28] = 106'h2db772a478a7db3bf776363c62f;
    stim[29] = 106'h0bf74dd8a371ac8de553e3dbf4f;
    stim[30] = 106'h2990552d226ba4d339f17715a58;
    stim[31] = 106'h0620e9ad194501b75be2063ca50;
    stim[32] = 106'h01e9cc7dc72975c4bcc491a8925;
    stim[33] = 106'h2bac9a2e0fe28c56b4317fd8dc0;
    stim[34] = 106'h0a775e56a61da6ca7989046faec;
    stim[35] = 106'h267a737db7cc176d21b128e49e1;
    stim[36] = 106'h2ae1b1e2e15a08793c82fabd46b;
    stim[37] = 106'h0506391fe0f52864005e0a11f45;
    stim[38] = 106'h275c16a78eccd7e6099a70f1f28;
    stim[39] = 106'h06e0bc362658eae24952ec113a1;
    stim[40] = 106'h25a0a2e9023a6fb13f54b1f43d1;
    stim[41] = 106'h0a1fe540cb2aa33f68b687865d3;
    stim[42] = 106'h280454e0595d2198bf9c5321a00;
    stim[43] = 106'h0ee38321e25ea8cf737a65bc223;
    stim[44] = 106'h25e9cd78eb716bc5ab3257e65fa;
    stim[45] = 106'h0a7c26e8459ce14ef8c5b8e9ca4;
    stim[46] = 106'h0729540a566d4f41843a06cf838;
    stim[47] = 106'h0ed78eac64d0c99f82cfdb1a00c;
    stim[48] = 106'h2a1cc2473e1f44d75cf8228c56a;
    stim[49] = 106'h2ed0ee4d1e3a7e184994c53cd49;
    stim[50] = 106'h2bf23215b1a24a191219065e22d;
    stim[51] = 106'h0a2b4812d52bdef690568579a8e;
    stim[52] = 106'h0228424cc10addb5aee4c9d7de7;
    stim[53] = 106'h01889209146533906fadaba08ab;
    stim[54] = 106'h2088b105cbcb37fa6c75f0a4716;
    stim[55] = 106'h02f87b2cf24531958a3d3ecae5b;
    stim[56] = 106'h0f3d45bfc818cc7120b72c27650;
    stim[57] = 106'h059139575b792479105dcb5cb81;
    stim[58] = 106'h03b4d6aa449d11cc53f71c88052;
    stim[59] = 106'h29dd40731c247f53af20069037e;
    stim[60] = 106'h09fff40bbce59861c026bc6d244;
    stim[61] = 106'h287fdfe8a3b26bd6e48b68038f2;
    stim[62] = 106'h0fdb13af670544d350cd1738125;
    stim[63] = 106'h235649566de1943b5b98de9081b;
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
      expv[0] = 119'h040000000xxxxxxxxx00002ca01347;
      expv[1] = 119'h040000000xxxxxxxxx00009f600b4e;
      expv[2] = 119'h040000000xxxxxxxxx0000428f5073;
      expv[3] = 119'h040000000xxxxxxxxx0000a790a5af;
      expv[4] = 119'h040000000xxxxxxxxx0000e798e9ed;
      expv[5] = 119'h702225ee2d31c1dba204e2a3d4f81a;
      expv[6] = 119'h702225ee2d31c1dba204e2e8138eae;
      expv[7] = 119'h702225ee2d31c1dba207e2506d80d8;
      expv[8] = 119'h102225ee288bc5ddcd00e2f75aee84;
      expv[9] = 119'h102225ee288bc5ddcd00e279d20de5;
      expv[10] = 119'h102225ee288bc5ddcd40e26b2f7388;
      expv[11] = 119'h102225ee288bc5ddcd80e243bd9fab;
      expv[12] = 119'h102225ee288bc5ddcd40e217991760;
      expv[13] = 119'h6418f7380b3c9e0a182480ce568dd0;
      expv[14] = 119'h6418f7380b3c9e0a182480d8574e3a;
      expv[15] = 119'h6418f738169ba1c56a078150bb6db0;
      expv[16] = 119'h6418f738169ba1c56a048149b2304f;
      expv[17] = 119'h6418f738169ba1c56a07816948b0a7;
      expv[18] = 119'h6418f738169ba1c56a478129b43125;
      expv[19] = 119'h7018f73824103a65a9c782311fe55a;
      expv[20] = 119'h7018f73824103a65a947820e37d86c;
      expv[21] = 119'h7018f73824103a65a947825f31199a;
      expv[22] = 119'h1018f738383593946a438361e2bc20;
      expv[23] = 119'h1018f738383593946a40837ad9920d;
      expv[24] = 119'h7061f14a5b3b62a7fa04a5a42224fb;
      expv[25] = 119'h7061f14a5b3b62a7fa47a5170bf9e9;
      expv[26] = 119'h7061f14a5b3b62a7fa47a5a331b5a4;
      expv[27] = 119'h0461f14a6c241403b003a66fcbbb56;
      expv[28] = 119'h0461f14a6c241403b000a6bb9523c5;
      expv[29] = 119'h0461f14a6c241403b040a6ba6ec51b;
      expv[30] = 119'h0461f14a0ba4d339f180a082a96913;
      expv[31] = 119'h0461f14a0ba4d339f100a0074d68ca;
      expv[32] = 119'h0461f14a0ba4d339f100a04e63ee39;
      expv[33] = 119'h0461f14a028c56b43100a064d1707f;
      expv[34] = 119'h0461f14a028c56b43140a0baf2b530;
      expv[35] = 119'h0461f14a0c176d21b180a0d39bedbe;
      expv[36] = 119'h0461f14a0c176d21b140a00d8f170a;
      expv[37] = 119'h0461f14a0c176d21b180a031c8ff07;
      expv[38] = 119'h0461f14a0cd7e6099a00a0e0b53c76;
      expv[39] = 119'h0461f14a0cd7e6099a00a005e1b132;
      expv[40] = 119'h7031f43d1a6fb13f5424d105174811;
      expv[41] = 119'h7031f43d1a6fb13f5427d1ff2a0659;
      expv[42] = 119'h1031f43d2d2198bf9c43d222a702ca;
      expv[43] = 119'h1031f43d2d2198bf9cc0d21c190f12;
      expv[44] = 119'h7057e65fa16bc5ab3204fa4e6bc75b;
      expv[45] = 119'h7057e65fa16bc5ab3247fae137422c;
      expv[46] = 119'h7057e65fa16bc5ab3204fa4aa052b3;
      expv[47] = 119'h7057e65fa16bc5ab3247fabc756326;
      expv[48] = 119'h1057e65fbf44d75cf8c3fbe61239f0;
      expv[49] = 119'h1057e65fbf44d75cf840fb877268f1;
      expv[50] = 119'h1057e65fbf44d75cf800fb9190ad8d;
      expv[51] = 119'h1057e65fbf44d75cf800fb5a4096a9;
      expv[52] = 119'h1057e65fbf44d75cf800fb42126608;
      expv[53] = 119'h1057e65fbf44d75cf800fb449048a3;
      expv[54] = 119'h6470a4710b37fa6c75241045882e5e;
      expv[55] = 119'h6470a4710b37fa6c752410c3d96792;
      expv[56] = 119'h6470a4710b37fa6c756710ea2dfe40;
      expv[57] = 119'h6470a4710b37fa6c75a41089cabadb;
      expv[58] = 119'h6470a4710b37fa6c752410a6b55224;
      expv[59] = 119'h6470a471147f53af200711ea0398e1;
      expv[60] = 119'h6470a471147f53af200711ffa05de7;
      expv[61] = 119'h7070a471226bd6e48b4712feff451d;
      expv[62] = 119'h7070a471226bd6e48b8712d89d7b38;
      expv[63] = 119'h0470a47121943b5b980012b24ab36f;
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
