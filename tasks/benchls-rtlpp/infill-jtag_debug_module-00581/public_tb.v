// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00581 dut (
    .tck(clk),
    .MonDReg(in_vec[128:97]),
    .break_readreg(in_vec[96:65]),
    .dbrk_hit0_latch(in_vec[64:64]),
    .dbrk_hit1_latch(in_vec[63:63]),
    .dbrk_hit2_latch(in_vec[62:62]),
    .dbrk_hit3_latch(in_vec[61:61]),
    .debugack(in_vec[60:60]),
    .ir_in(in_vec[59:58]),
    .jtag_state_rti(in_vec[57:57]),
    .monitor_error(in_vec[56:56]),
    .monitor_ready(in_vec[55:55]),
    .reset_n(in_vec[54:54]),
    .resetlatch(in_vec[53:53]),
    .tdi(in_vec[52:52]),
    .tracemem_on(in_vec[51:51]),
    .tracemem_trcdata(in_vec[50:15]),
    .tracemem_tw(in_vec[14:14]),
    .trc_im_addr(in_vec[13:7]),
    .trc_on(in_vec[6:6]),
    .trc_wrap(in_vec[5:5]),
    .trigbrktype(in_vec[4:4]),
    .trigger_state_1(in_vec[3:3]),
    .vs_cdr(in_vec[2:2]),
    .vs_sdr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .ir_out(out_vec[42:41]),
    .jrst_n(out_vec[40:40]),
    .sr(out_vec[39:2]),
    .st_ready_test_idle(out_vec[1:1]),
    .tdo(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h0448b64630ccef6a224305a6d26c26fa0;
    stim[1] = 129'h075587ff4148a6a8828bf7c7399277d62;
    stim[2] = 129'h06ccefa2a37a6164fe8e00011f362e98c;
    stim[3] = 129'h1c9c8fb86b7419bf4d7e2cdc6e25506c9;
    stim[4] = 129'h04599f7e6e34434f54b7ba65e0a4ea11d;
    stim[5] = 129'h04eb5afab33da9dd0e450b95084d73bb2;
    stim[6] = 129'h1fd30b2e4a8353168e561e9b4d20af1cf;
    stim[7] = 129'h156202fca9ec90c9073e6c88e9bf37273;
    stim[8] = 129'h1366bde5f860cdcd99d630da0749ef7c2;
    stim[9] = 129'h1cdf75a262af1986f34c6417e578254b0;
    stim[10] = 129'h035c96750b38ac52803e8a293cc63c089;
    stim[11] = 129'h0333b18727a5e4121f376d8e120e1e378;
    stim[12] = 129'h080af567a90a9620e3c614ebc7be86470;
    stim[13] = 129'h0e92b9991db5294a06cde45ea7a28fe43;
    stim[14] = 129'h05f3e92cc7efe68038b439be6dc6901fa;
    stim[15] = 129'h023feca1f4cb5dd9498426baa7e148372;
    stim[16] = 129'h1260aca1ac05387aaecc7134a02c87c16;
    stim[17] = 129'h158dbf377c5949b776dc67334f286dba6;
    stim[18] = 129'h005be2fa325caae63af575e09e890cb9e;
    stim[19] = 129'h1152df386752331866aedc34f0678265a;
    stim[20] = 129'h0d07447e1a5b332566d5ebf32b56de7b5;
    stim[21] = 129'h042fd82f9012dd813927275e67de5687a;
    stim[22] = 129'h0eb7141b6740164a64148fbb945762c31;
    stim[23] = 129'h171749b6e50f7f5e1d57ca7a1c105822a;
    stim[24] = 129'h070db794a9420dd3785ffc9a88369c426;
    stim[25] = 129'h0252a1c832865f94bcec13277aec580e4;
    stim[26] = 129'h1a6c47829c92391f1835eaf95d3c2f143;
    stim[27] = 129'h1a5772ac1dd59a49a74f0253e39e65120;
    stim[28] = 129'h04e6b108f34bb40f50812fa0deb3ea967;
    stim[29] = 129'h0b0a6cbca1ec629e8f365ec940fb84b9a;
    stim[30] = 129'h1bc44b1fa42bb6a53414f0fe10bda004f;
    stim[31] = 129'h045fa9399d0f8a89946eb5d75fc3e7959;
    stim[32] = 129'h011e1ab32f033eedd207be75f64c085f5;
    stim[33] = 129'h1dd2d176bbab3744053de400427bc2154;
    stim[34] = 129'h1ed394c3f9f35621d65466cdaa7813f1b;
    stim[35] = 129'h0f4356e614e51eddcf1609aeb643e09d1;
    stim[36] = 129'h1c51c1cc76532992dc960452db2564187;
    stim[37] = 129'h1c8afdd90ecb6bde9cffe6c26471f698b;
    stim[38] = 129'h0ea897e05446b97d8d753029372d3ee68;
    stim[39] = 129'h1b2835e53e3f7865a1ded4bbf5d71403d;
    stim[40] = 129'h1a2669c9ecad6274786f1f7a5e7d3a3be;
    stim[41] = 129'h09e692b523dd9a29c165739201b84e8a9;
    stim[42] = 129'h0489c87cdc1b36a790b9eb8924cce6c33;
    stim[43] = 129'h191701184aadb0e20b8445edaef48368c;
    stim[44] = 129'h150e851bf1db7f2c3417e332722abefd8;
    stim[45] = 129'h184a99dc1925af155c35ca0fddaa3989f;
    stim[46] = 129'h12ab5a1b7d9ddda654d631aa25df0eadb;
    stim[47] = 129'h0315d24a93e3ab55c4bfbdd4fa144a2bd;
    stim[48] = 129'h1796f386f7f5ea898c14de8b75255aa41;
    stim[49] = 129'h16d8b42035441e33af0ede0c457cfb82d;
    stim[50] = 129'h18367e52dc8594bbaf9c53ec4da12f3ae;
    stim[51] = 129'h08a763f051c9aa11c826e9ad56f969626;
    stim[52] = 129'h10cc2706d2220fe5885d74a51936dfdef;
    stim[53] = 129'h055156400f781ae1120c598eee5fb2039;
    stim[54] = 129'h007e3441af68ac78b2fc53d3eafcd0e50;
    stim[55] = 129'h0c8d57c9b057a629ad7670b32769686b3;
    stim[56] = 129'h140d5dd835e6b3fdeb0768fafabb637e0;
    stim[57] = 129'h0234186645b813e82e9fdfccf7f893daa;
    stim[58] = 129'h0c72e3592062b719de3e4ee10fdb96daf;
    stim[59] = 129'h1d517a655e90e47aa2a56be41ecd9294a;
    stim[60] = 129'h111de0126755ab41c1969428fc6bb3749;
    stim[61] = 129'h072a7493ff4c8d29fcbe7ec95d37d5b22;
    stim[62] = 129'h18a46b03330b2a161136de9cac3c92c03;
    stim[63] = 129'h051fc60d828e9f13a92cadfed334a1b9e;
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
      expv[0] = 43'h0xxxxxxxxxx;
      expv[1] = 43'h0xxxxxxxxxx;
      expv[2] = 43'h1xxxxxxxxxx;
      expv[3] = 43'h1f8de98593a;
      expv[4] = 43'h1f8de98593a;
      expv[5] = 43'h3ab8d10d3d5;
      expv[6] = 43'h7d5c68869e8;
      expv[7] = 43'h16ae34434f7;
      expv[8] = 43'h13571a21a78;
      expv[9] = 43'h11ab8d10d3d;
      expv[10] = 43'h71ab8d10d3f;
      expv[11] = 43'h51ab8d10d3f;
      expv[12] = 43'h71ab8d10d3d;
      expv[13] = 43'h31ab8d10d3d;
      expv[14] = 43'h5ad5c68869f;
      expv[15] = 43'h556ae34434d;
      expv[16] = 43'h32b571821a5;
      expv[17] = 43'h115ab8c10d0;
      expv[18] = 43'h50ad5c4086a;
      expv[19] = 43'h3856ae20437;
      expv[20] = 43'h342b5710218;
      expv[21] = 43'h142b57004fa;
      expv[22] = 43'h3a15aba027d;
      expv[23] = 43'h1a15aba027d;
      expv[24] = 43'h5f0ad5d013d;
      expv[25] = 43'h1f856ae809f;
      expv[26] = 43'h5f856ac001f;
      expv[27] = 43'h3fc2b56000d;
      expv[28] = 43'h0fc2b56000d;
      expv[29] = 43'h1fe15ab0007;
      expv[30] = 43'h17f0ad58000;
      expv[31] = 43'h13f856ac002;
      expv[32] = 43'h53f856ac000;
      expv[33] = 43'h1084786acca;
      expv[34] = 43'h31774b45dad;
      expv[35] = 43'h10bba5a2ed5;
      expv[36] = 43'h70bba5a2ed5;
      expv[37] = 43'h105dd2d176a;
      expv[38] = 43'h582ee968bb7;
      expv[39] = 43'h182ee968bb5;
      expv[40] = 43'h382ee94000a;
      expv[41] = 43'h5c1774a0007;
      expv[42] = 43'h0c1774a0007;
      expv[43] = 43'h1e0bba50000;
      expv[44] = 43'h1d2ab6c3880;
      expv[45] = 43'h1d2ab6c3882;
      expv[46] = 43'h5e955b61c40;
      expv[47] = 43'h154aadb0e22;
      expv[48] = 43'h1a4f8ead575;
      expv[49] = 43'h1a4f8ead575;
      expv[50] = 43'h38db62d080d;
      expv[51] = 43'h146db168407;
      expv[52] = 43'h7036d8b4200;
      expv[53] = 43'h7a1b6c5a100;
      expv[54] = 43'h1a1b6c5a102;
      expv[55] = 43'h3a1b6c5a102;
      expv[56] = 43'h350db62d080;
      expv[57] = 43'h350db62d080;
      expv[58] = 43'h5a86db16842;
      expv[59] = 43'h55436d8b422;
      expv[60] = 43'h3aa1b6c5a10;
      expv[61] = 43'h3aa1b6c5a12;
      expv[62] = 43'h1550db62d0a;
      expv[63] = 43'h52a86db1687;
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
