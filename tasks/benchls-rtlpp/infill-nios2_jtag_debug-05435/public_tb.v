// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 122;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05435 dut (
    .clk(clk),
    .MonDReg(in_vec[121:90]),
    .break_readreg(in_vec[89:58]),
    .dbrk_hit0_latch(in_vec[57:57]),
    .dbrk_hit1_latch(in_vec[56:56]),
    .dbrk_hit2_latch(in_vec[55:55]),
    .dbrk_hit3_latch(in_vec[54:54]),
    .debugack(in_vec[53:53]),
    .monitor_error(in_vec[52:52]),
    .monitor_ready(in_vec[51:51]),
    .reset_n(in_vec[50:50]),
    .resetlatch(in_vec[49:49]),
    .tracemem_on(in_vec[48:48]),
    .tracemem_trcdata(in_vec[47:12]),
    .tracemem_tw(in_vec[11:11]),
    .trc_im_addr(in_vec[10:4]),
    .trc_on(in_vec[3:3]),
    .trc_wrap(in_vec[2:2]),
    .trigbrktype(in_vec[1:1]),
    .trigger_state_1(in_vec[0:0]),
    .jdo(out_vec[52:15]),
    .jrst_n(out_vec[14:14]),
    .st_ready_test_idle(out_vec[13:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 122'h0576a1a46f38dcb84f860570e4f7ff7;
    stim[1] = 122'h0fcd6845069ec785a001c8f04cc7a47;
    stim[2] = 122'h246d30ae25362a2075eefd2519d0083;
    stim[3] = 122'h093141bef28aa8f8a2592c928e0cf19;
    stim[4] = 122'h0e083271dfa5e2591ed20f6366bb863;
    stim[5] = 122'h126bd3db237a45b792e3377e6c0cd86;
    stim[6] = 122'h10479f92362a7973fee8993e301c155;
    stim[7] = 122'h3ff220dbad7f4d85f9c295de9ec21a2;
    stim[8] = 122'h3b08aec914f4eac277e515c800c3f6a;
    stim[9] = 122'h09655f6bee9580529343455dd507f42;
    stim[10] = 122'h38dec8d1088157a616e9fff9101f810;
    stim[11] = 122'h09ada50b0b2c4cf201dee19454cde77;
    stim[12] = 122'h1cd8fc354aa066c6b2f4dfc7ae8580f;
    stim[13] = 122'h205959dfe70745693bd5bd58c0628c2;
    stim[14] = 122'h11f2dde728e8f1fdbfdc3949b544add;
    stim[15] = 122'h08c9fa7dd3a729ad6adece85445a6d7;
    stim[16] = 122'h199d7830d97378ef47fc93d3058c19e;
    stim[17] = 122'h3d0141b529ecab824449b39a25be637;
    stim[18] = 122'h3783438279c56bc082f3f1d1991e63e;
    stim[19] = 122'h2a7ea37e879a016afdf42dc16e6cc77;
    stim[20] = 122'h0cc94559e351e7cad74c4259008c81c;
    stim[21] = 122'h2bf06d70a1515a0f10d3dd586df1bcc;
    stim[22] = 122'h37b30480ba208f5113e2000f4274157;
    stim[23] = 122'h1590a7567244343e3a9898dd93cd38e;
    stim[24] = 122'h3bba8df94462c2eee9d077d3be07639;
    stim[25] = 122'h07efb191361225916c5e9104514f944;
    stim[26] = 122'h1bee1bc15cda775d7169cd4901ee5ba;
    stim[27] = 122'h0eb5c19af23e7deb944802f40dd7337;
    stim[28] = 122'h2e53e5e23e0d46fc40d95cc32f3567f;
    stim[29] = 122'h386d7c270b7d52564e7ca3d0c9870f6;
    stim[30] = 122'h16e052878552437dfb53c5c148dc8fd;
    stim[31] = 122'h05d7759f8a63fe23ad7ecd10126e01b;
    stim[32] = 122'h0cf817f075d49dd185ca1a07d3eab04;
    stim[33] = 122'h0f4fe890a6c5fd0c7aed73513f8f76c;
    stim[34] = 122'h3c2414ba0c57d1c4115c74d3d7c047e;
    stim[35] = 122'h2feaa702cdd95440604dd2a286c8a70;
    stim[36] = 122'h3d320b98ecc780c89a44aa4d0997b6f;
    stim[37] = 122'h1a6f696568ebacc471e933211143299;
    stim[38] = 122'h2dde8f811fdc7fb5c2c348e99e06d94;
    stim[39] = 122'h230576ed9bb95aed99c8e0e215e4b7b;
    stim[40] = 122'h0e152d18a35ee55d63dc9f219bef265;
    stim[41] = 122'h290a28d875fcaaf92a4effe83ef98e8;
    stim[42] = 122'h38e58e2c96ee385619fe59f146948f2;
    stim[43] = 122'h2bfb4f9194ad7df9ebc6c56f8ff7d2d;
    stim[44] = 122'h13e0729f37c7e6ccb5e3fbb17a16488;
    stim[45] = 122'h0a6ed273e48643fea67067aeda74151;
    stim[46] = 122'h15169fd0bc2e9fdf28f550cfadc5299;
    stim[47] = 122'h3316bddcc13301eebbde533d14a820f;
    stim[48] = 122'h0ed853ce32cd97887d5d1d81ba6f2b7;
    stim[49] = 122'h1f30ef316273ec9ad6d883d433780e7;
    stim[50] = 122'h062d6bc17d4f472358f84bcf9f90cf9;
    stim[51] = 122'h1b5feb2189f8e3f157986b925e1b1c6;
    stim[52] = 122'h355dd9131db7cdb6ade120b72a08bbf;
    stim[53] = 122'h14256351b1831bb2b6f5f1f20bee5f9;
    stim[54] = 122'h00db5729c1b9104c70cb3eb310074ad;
    stim[55] = 122'h1764e161635d5259fad58ed50656933;
    stim[56] = 122'h12bcba4097eaba4db9ff1cefd51bdff;
    stim[57] = 122'h3838ae3c19f700785ece13d2587512d;
    stim[58] = 122'h1b90fed5ccb4fe9a51f460f264882f8;
    stim[59] = 122'h3b5209c5c9d5bd24ccf81aadf4c0841;
    stim[60] = 122'h2a64cecb84b789ea4be985c27f7febb;
    stim[61] = 122'h0b674bf452daca589dfe92ef901e1c1;
    stim[62] = 122'h1edb609e325b3cf5a870334a07b2696;
    stim[63] = 122'h0292f0a0d19b17b112c0bd50919adf1;
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
      expv[0] = 53'h0b02b8727b8078;
      expv[1] = 53'h10e4782663806e;
      expv[2] = 53'h0f7e928ce80005;
      expv[3] = 53'h149649470640ee;
      expv[4] = 53'h0107b1b35de0f0;
      expv[5] = 53'h119bbf36062976;
      expv[6] = 53'h1c4c9f180e2001;
      expv[7] = 53'h194aef4f615c03;
      expv[8] = 53'h0a8ae400619b64;
      expv[9] = 53'h11a2aeea83c976;
      expv[10] = 53'h04fffc880fab74;
      expv[11] = 53'h0770ca2a66c0fe;
      expv[12] = 53'h126fe3d742a0e6;
      expv[13] = 53'h02deac60315de2;
      expv[14] = 53'h161ca4daa240e0;
      expv[15] = 53'h0f6742a22d608b;
      expv[16] = 53'h0e49e982c6039d;
      expv[17] = 53'h0cd9cd12df401d;
      expv[18] = 53'h11f8e8cc8f219f;
      expv[19] = 53'h1a16e0b73600e0;
      expv[20] = 53'h1e212c80464b74;
      expv[21] = 53'h01eeac36f8e8f6;
      expv[22] = 53'h010007a13a0017;
      expv[23] = 53'h044c6ec9e6bd83;
      expv[24] = 53'h183be9df03c08b;
      expv[25] = 53'h0f488228a7d6e8;
      expv[26] = 53'h0ce6a480f71807;
      expv[27] = 53'h14017a06ebc015;
      expv[28] = 53'h0cae61979ae09f;
      expv[29] = 53'h0e51e864c38799;
      expv[30] = 53'h19e2e0a46e40e2;
      expv[31] = 53'h17668809370089;
      expv[32] = 53'h150d03e9f5427c;
      expv[33] = 53'h0eb9a89fc7bd03;
      expv[34] = 53'h063a69ebe04897;
      expv[35] = 53'h0ee9514364506e;
      expv[36] = 53'h12552684cbc072;
      expv[37] = 53'h0c999088a18007;
      expv[38] = 53'h19a474cf03617e;
      expv[39] = 53'h1470710af24072;
      expv[40] = 53'h0e4f90cdf7c08f;
      expv[41] = 53'h077ff41f7cd56a;
      expv[42] = 53'h072cf8a34a0cf2;
      expv[43] = 53'h1b62b7c7fbc06a;
      expv[44] = 53'h11fdd8bd0b1a05;
      expv[45] = 53'h1033d76d3a008d;
      expv[46] = 53'h02a867d6e2a08b;
      expv[47] = 53'h17299e8a544083;
      expv[48] = 53'h0e8ec0dd37c081;
      expv[49] = 53'h1c41ea19bc6095;
      expv[50] = 53'h0c25e7cfc820f2;
      expv[51] = 53'h0c35c92f0d8b95;
      expv[52] = 53'h10905b95040068;
      expv[53] = 53'h12f8f905f72085;
      expv[54] = 53'h0d9f598803e007;
      expv[55] = 53'h1ac76a832b60e2;
      expv[56] = 53'h178e77ea8d80e2;
      expv[57] = 53'h0f09e92c3ae011;
      expv[58] = 53'h0a307932440897;
      expv[59] = 53'h1c0d56fa6020f8;
      expv[60] = 53'h0cc2e13fbf807a;
      expv[61] = 53'h174977c80f0091;
      expv[62] = 53'h1019a503d9148b;
      expv[63] = 53'h005ea848cd6076;
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
