// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 174;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09043 dut (
    .clk(clk),
    .resetn(in_vec[173:173]),
    .phase(in_vec[172:141]),
    .phase_valid(in_vec[140:140]),
    .data(in_vec[139:116]),
    .data_valid(in_vec[115:115]),
    .data_filtered(in_vec[114:83]),
    .data_filtered_valid(in_vec[82:82]),
    .i_q(in_vec[81:50]),
    .i_q_valid(in_vec[49:49]),
    .i_q_filtered(in_vec[48:17]),
    .i_q_filtered_valid(in_vec[16:16]),
    .dma_wr_overflow(in_vec[15:15]),
    .dma_wr_xfer_req(in_vec[14:14]),
    .channel_enable(in_vec[13:0]),
    .phase_ready(out_vec[40:40]),
    .data_ready(out_vec[39:39]),
    .data_filtered_ready(out_vec[38:38]),
    .i_q_ready(out_vec[37:37]),
    .i_q_filtered_ready(out_vec[36:36]),
    .overflow(out_vec[35:35]),
    .dma_wr_data(out_vec[34:3]),
    .dma_wr_en(out_vec[2:2]),
    .dma_wr_sync(out_vec[1:1]),
    .processing_resetn(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 174'h04c0f31e92260c7283bc91a53103891cd6216c55ba11;
    stim[1] = 174'h03d675433975efd16517a046200c900d84169cab6f57;
    stim[2] = 174'h3cf5458067dc04c388acbfbcdd944c90b29b2424ea02;
    stim[3] = 174'h31e8e99456fbd50187d9fba83353c941eeb0e44964c5;
    stim[4] = 174'h2f4ef16d133582758074dd89321e1ccbc06d08678a74;
    stim[5] = 174'h313fb9bed610535f93846c2ac8c07c6ad49b4636ff17;
    stim[6] = 174'h39a2710eb083437620a881df6bb195610078368f113e;
    stim[7] = 174'h2bc63cc150b125c57f3899ef08924fca5be9b97e9bd7;
    stim[8] = 174'h2f5561f4dd2d326cc253cfd56e45d58bf900c1f2a436;
    stim[9] = 174'h3efcd306bd591b091ef29d4fcae4c5798a070860d9c8;
    stim[10] = 174'h3ee32c2cb2f1e2a186628fa23ac1255fea1429a5cca5;
    stim[11] = 174'h2b9af25b8b811381c03346fabb00496124fe30e59e69;
    stim[12] = 174'h29f97cc9a7e807152abbd7356b7b2c55b379d44d30e6;
    stim[13] = 174'h23d1f1bb86261017c4179cbb6f8f1209c079309884bc;
    stim[14] = 174'h2f49132e9bf229d5859fd1d71de60b8ad3c1a8067e71;
    stim[15] = 174'h3cf44a46d96ec74209226109dfb4ccc259b6a48a34e1;
    stim[16] = 174'h2714d9538ccdcd6d776d7182db9de166abe40c693c95;
    stim[17] = 174'h3d3f70ed836d2d3326658e0624be47565d082faa8a2e;
    stim[18] = 174'h320eb76a574290668193610e0d26a836ba87ce7c80da;
    stim[19] = 174'h3afc203d6c43518e9af5bfa98cecca70b2199543e14f;
    stim[20] = 174'h36236e50205a56b129dab027df580f9444013befd014;
    stim[21] = 174'h33015fd7bc1cf7ce5efd6e53f0c85b652d0d903959e2;
    stim[22] = 174'h2597bee0bb65cc9b825721cce7435116717d52c56d83;
    stim[23] = 174'h223b459c799b1b5f7cd3f2c1bc91c1a2e23b56c940bd;
    stim[24] = 174'h2378bc2716db6fa5d68e6a3bd25ac8bec2f49847b34e;
    stim[25] = 174'h380702e793fce8a76f855efb8d110fc875e6213677b7;
    stim[26] = 174'h2731712c47ca75db0134d40b0404dc530343bbe5450d;
    stim[27] = 174'h3630aad381b58b7ff382fef7d2ef88a43249e16cc476;
    stim[28] = 174'h350ba551d1ec99a4aac85eeb5dc9318669a4dbb4a7c8;
    stim[29] = 174'h21201a3c9080a1a066ff9201ded7a154b431f930cfa2;
    stim[30] = 174'h27111ea7b1d50b2c89f9cd1455425f77d13febcc8a3d;
    stim[31] = 174'h3663d8d532908a88a16e0accf016207ce2f3601d0023;
    stim[32] = 174'h38cf4bcfc225f690947c0c45d1ac5fa48db8f360d093;
    stim[33] = 174'h354f3fcc19c08b3a12820a9f3b8b8df65d8aadb540c9;
    stim[34] = 174'h36a5863937698e768888bb0cdfe1ed509787c7bb4207;
    stim[35] = 174'h360d06b17b81abc64cfc3fa40bac516a894d4093725b;
    stim[36] = 174'h334a1ca8e109cb0dfb698ed4d4b485f591ffd7811945;
    stim[37] = 174'h2e57a041fb00aac1ff84cc6369690f25018f96e1d92e;
    stim[38] = 174'h37fb4368e70ba1d63c03d269a010090f1e40a86600e2;
    stim[39] = 174'h2885948a70158b14268a324fd8d9579c8ef224504e6a;
    stim[40] = 174'h2d44c66131d1eaf2af81920b34d9b2527393faeed719;
    stim[41] = 174'h355e074210fdf24a036959cebaa7d301c8116514ac39;
    stim[42] = 174'h2608c16c26ae609c8b86c93e12fd354e71f53fd501ab;
    stim[43] = 174'h36c0fac57a668bb9329263c53065cc9e360e5b90f7b9;
    stim[44] = 174'h3fb1e3dee958894ddf66a50343e47a8cdc8fe032ce18;
    stim[45] = 174'h2d3876b433b35420aae8b7385017ea51f2f3dc4810c8;
    stim[46] = 174'h2b6af12c47bc6d4632ca0e90907cac270fd222c0b360;
    stim[47] = 174'h25f09dd8e812c7a17cfe5d67effd01b7fab908f80f1b;
    stim[48] = 174'h313ae7dc8a5449ddf5410c329b43625eea49030d17d6;
    stim[49] = 174'h3c26f657230b11c3b5ac697eea1bbe4556592bcf7079;
    stim[50] = 174'h21db34a861324046e21ea8e792eeeaf0330262cce7d5;
    stim[51] = 174'h31032416cfa0d41be4cd6042fbd173bd6698e67acfb8;
    stim[52] = 174'h305190370ecb2d44eb56ba2381a3e16e405c6552f9ce;
    stim[53] = 174'h260bdd6efa1f874e10f2359e144e952f9956927d8422;
    stim[54] = 174'h335a34a237d6499ed2cf7fb69a157932e51d186d409b;
    stim[55] = 174'h2a1d71b24fb9bd48bccf95da193362443096c771cc87;
    stim[56] = 174'h2c663d33b1cb83d310e1e186cc1293f4773f23c5b025;
    stim[57] = 174'h247bb0726c84c861e7c6bd9a9de29a90b2e22a7574a7;
    stim[58] = 174'h0aabdb6c57221f9aefed386726bc1e128e05d7d06cbc;
    stim[59] = 174'h36c10b60c6880ad81ddc711f2efa14e2ba4eadf5a0ae;
    stim[60] = 174'h2cb909ce035de359fcb907e4266e3840c742b3696ea1;
    stim[61] = 174'h31b169b0a2a40d232358a762ea1b33b09ffcb43750ec;
    stim[62] = 174'h2070dcb5920523e9bcf2a6bca70de37a13659050e588;
    stim[63] = 174'h298e966b91ffba1b14a3badd34e958e72ad7ef4bd5df;
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
      expv[0] = 41'hxx800000002;
      expv[1] = 41'hxx000000003;
      expv[2] = 41'hxx800000003;
      expv[3] = 41'hxx73d51601b;
      expv[4] = 41'h08c7a3a6516;
      expv[5] = 41'h088019ac139;
      expv[6] = 41'h040030829ac;
      expv[7] = 41'h02e20a881d8;
      expv[8] = 41'h02e11249f90;
      expv[9] = 41'h01adc8bab11;
      expv[10] = 41'h01e281c2181;
      expv[11] = 41'h01fa850a694;
      expv[12] = 41'h10493f8c390;
      expv[13] = 41'h10a7e5f3268;
      expv[14] = 41'h100f47c6ee1;
      expv[15] = 41'h083d244cba0;
      expv[16] = 41'h08004b763a0;
      expv[17] = 41'h0480666e6b0;
      expv[18] = 41'h02b26658e00;
      expv[19] = 41'h02c1a4d5069;
      expv[20] = 41'h02b19d994e1;
      expv[21] = 41'h027beb01f29;
      expv[22] = 41'h027e190b6c9;
      expv[23] = 41'h011ce86a22d;
      expv[24] = 41'h01b88ed5b20;
      expv[25] = 41'h1030bd26119;
      expv[26] = 41'h08601c0b9e5;
      expv[27] = 41'h04803e53ae9;
      expv[28] = 41'h02ff382fef4;
      expv[29] = 41'h02ebb926309;
      expv[30] = 41'h02bbdaf42a8;
      expv[31] = 41'h010aa84bee8;
      expv[32] = 41'h01b8bcd8071;
      expv[33] = 41'h01236e3cd81;
      expv[34] = 41'h101762ab6d5;
      expv[35] = 41'h085a9618e49;
      expv[36] = 41'h08005c0d5e0;
      expv[37] = 41'h0480084e581;
      expv[38] = 41'h041ff84cc60;
      expv[39] = 41'h0463c03d269;
      expv[40] = 41'h02c268a324d;
      expv[41] = 41'h02e69b364a4;
      expv[42] = 41'h025754fa600;
      expv[43] = 41'h01c25fa6a99;
      expv[44] = 41'h018d8396e41;
      expv[45] = 41'h013723f80c8;
      expv[46] = 41'h01fcbcf7120;
      expv[47] = 41'h0143f488b00;
      expv[48] = 41'h017eae423e0;
      expv[49] = 41'h013a9240c31;
      expv[50] = 41'h10d5964af3d;
      expv[51] = 41'h10876cd2a19;
      expv[52] = 41'h10c40c905b1;
      expv[53] = 41'h10c14640dc0;
      expv[54] = 41'h08182f75bb9;
      expv[55] = 41'h04803eb24cd;
      expv[56] = 41'h048bccf95d8;
      expv[57] = 41'h02310e1e181;
      expv[58] = 41'h10000000003;
      expv[59] = 41'h10800000002;
      expv[60] = 41'h105b042d833;
      expv[61] = 41'h1032e427383;
      expv[62] = 41'h10c6c5a6c2b;
      expv[63] = 41'h0881c372d63;
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
