// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 132;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_075652 dut (
    .clk(clk),
    .reset(in_vec[131:131]),
    .stream_read_ready(in_vec[130:130]),
    .stream_read_data(in_vec[129:66]),
    .buffer_read_ready(in_vec[65:65]),
    .buffer_read_data(in_vec[64:1]),
    .stream_write_ready(in_vec[0:0]),
    .stream_read_req(out_vec[66:66]),
    .buffer_read_req(out_vec[65:65]),
    .stream_write_req(out_vec[64:64]),
    .stream_write_data(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 132'hbc870143f15bcb5d286d4a221abfbf7f1;
    stim[1] = 132'hebb61709e503cc5f3b8ae94d0be1d13ee;
    stim[2] = 132'h0bdaf510201e4afd83b9064704a0f70e5;
    stim[3] = 132'h0a40d0c8abcc68dc2c451c701b57929d1;
    stim[4] = 132'h1c15c73110a91f4367875ded55a7504b8;
    stim[5] = 132'h36dc2dee28400963da648b69c4d8d22c7;
    stim[6] = 132'h4b8b39358e223d29b9d55c4ce9955d963;
    stim[7] = 132'h15d1553b0f21b25e05f50950b708ac3cb;
    stim[8] = 132'h60a3a41a3f16b595b914a5b839c023263;
    stim[9] = 132'h43ca40cfd5eb43e0e6c125a5eb3865cf4;
    stim[10] = 132'h5d303e74e6457fbae473f4fa56e1ea66b;
    stim[11] = 132'h516b0c71b1c561207b2872d04bcbe9997;
    stim[12] = 132'h7f241247967bd91c34afe677b41521af3;
    stim[13] = 132'h270263bec9dc7785c8fd7ca7095e8bcf1;
    stim[14] = 132'h4383906ed4edf8cd8ea1cd23d4de93afa;
    stim[15] = 132'h4d7d240b3d5c3ff5f35052bd39a310037;
    stim[16] = 132'h1028e3587e8decada6f5474e669780103;
    stim[17] = 132'h1d4b02aeb446b36e3cd4a9d7b148d6413;
    stim[18] = 132'h6a8cd42908ca8602504868f2eacc9eae4;
    stim[19] = 132'h04e49145fabcefde007b2fc1078009d68;
    stim[20] = 132'h2322af7e308097f4088a04100541f0a13;
    stim[21] = 132'h18b6233f20f607deae22e5e58adc3b67a;
    stim[22] = 132'h06421c2c7b95f42d6efa28ceb861482d9;
    stim[23] = 132'h1e6bbd484b596e8328e2c73493b9b64d0;
    stim[24] = 132'h7d3c20386f973c001898954c16cb1e582;
    stim[25] = 132'h375cfe9fac2f29028f31ba562e827bad8;
    stim[26] = 132'h2f9d0503c14e373e6dee156465f67d5c5;
    stim[27] = 132'h25ac3f9fa42c5050c349c1f405bca07fd;
    stim[28] = 132'h7fd701545f62c6803307a53fbb6bd97a6;
    stim[29] = 132'h4b427a13ad9e64186ad90599ef75d9793;
    stim[30] = 132'h17defd1d29eb14d53372a31560fcee283;
    stim[31] = 132'h260d58a58198a67645a4b2f26ec80151a;
    stim[32] = 132'h04f0fee81f905a0cde7c2f88287e33682;
    stim[33] = 132'h482400f0823afaa8a9fbe12b2ecb9b447;
    stim[34] = 132'h1188e0331898aa2dc39f68fa09982385e;
    stim[35] = 132'h783629e9b076d5310725ebbc36166322b;
    stim[36] = 132'h66b758eff0ebc5d7fed96e3a830d1b900;
    stim[37] = 132'h5cba8217b39b0f16eb9a2d79ca1c5c835;
    stim[38] = 132'h26d02f6c6ad23581d4913aaa853ce8219;
    stim[39] = 132'h641956bb81aaedd0ceb33bda0d9cadebb;
    stim[40] = 132'h0dbb8d3057890ba781228beca2f3a9ad0;
    stim[41] = 132'h0403dd0db02bcbc8a1635ddc8997502fa;
    stim[42] = 132'h132f60f7bf96d161a36c3f6433e689e4a;
    stim[43] = 132'h3feb50ac69161a77217a78cc5210dad08;
    stim[44] = 132'h2f3992351613a795d908639436f57f84a;
    stim[45] = 132'h6c327c02df9f1757d012860a86fb9b002;
    stim[46] = 132'h654d7b4e6033a2d14158fb1ba6fc94842;
    stim[47] = 132'h20c653dd21d27a03c203d47b58986ee66;
    stim[48] = 132'h351d9942b31825caeb097f360f65cbe09;
    stim[49] = 132'h48208fa330b984b9b41c67f57a6dfecea;
    stim[50] = 132'h70a380f500f93ade13e97336703ddc203;
    stim[51] = 132'h6fdd5b5dd5e79bfdc62de4cb1736b5e14;
    stim[52] = 132'h417e69723d1463eec00d4f4f0ea03ca33;
    stim[53] = 132'h56bf6377e70672edb67cfd92ff7a8d2a3;
    stim[54] = 132'h2728feca9b4381fe7fa43c22e233962e9;
    stim[55] = 132'h1be0006bd9b119f637d517ada8632f981;
    stim[56] = 132'he21cd4fcac2efb0214e1363e745d74014;
    stim[57] = 132'h7781ecc0e86140183a8255d6b2f3ceb80;
    stim[58] = 132'h1199ec7a2aae1ee1c1eecafe448d40519;
    stim[59] = 132'h0831094b40cceb9ced5e46d548831b529;
    stim[60] = 132'h49df6fd7186c00535c6b983000e4b35b7;
    stim[61] = 132'h38f3eabd664940f9feef52bec5e96824d;
    stim[62] = 132'h094e3bef7dabe9c101662b1f26f11b11f;
    stim[63] = 132'h61fa85cbca16f4a162d650f61ba0f10c0;
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
      expv[0] = 67'hxf21c050fc56f2d74;
      expv[1] = 67'h2aed85c27940f317c;
      expv[2] = 67'h02f6bd44080792bf6;
      expv[3] = 67'h229034322af31a370;
      expv[4] = 67'h270571cc442a47d0d;
      expv[5] = 67'h0db70b7b8a100258f;
      expv[6] = 67'h62e2ce4d63888f4a6;
      expv[7] = 67'h1574554ec3c86c978;
      expv[8] = 67'h6828e9068fc5ad656;
      expv[9] = 67'h30f29033f57ad0f83;
      expv[10] = 67'h674c0f9d39915feeb;
      expv[11] = 67'h745ac31c6c7158481;
      expv[12] = 67'h7fc90491e59ef6470;
      expv[13] = 67'h19c098efb2771de17;
      expv[14] = 67'h00e0e41bb53b7e336;
      expv[15] = 67'h635f4902cf570ffd7;
      expv[16] = 67'h340a38d61fa37b2b6;
      expv[17] = 67'h2752c0abad11acdb8;
      expv[18] = 67'h0aa3350a4232a1809;
      expv[19] = 67'h013924517eaf3bf78;
      expv[20] = 67'h08c8abdf8c2025fd0;
      expv[21] = 67'h262d88cfc83d81f7a;
      expv[22] = 67'h2190870b1ee57d0b5;
      expv[23] = 67'h279aef5212d65ba0c;
      expv[24] = 67'h0f4f080e1be5cf000;
      expv[25] = 67'h0dd73fa7eb0bca40a;
      expv[26] = 67'h2be74140f0538dcf9;
      expv[27] = 67'h096b0fe7e90b14143;
      expv[28] = 67'h2ff5c05517d8b1a00;
      expv[29] = 67'h62d09e84eb6799061;
      expv[30] = 67'h35f7bf474a7ac5354;
      expv[31] = 67'h098356296066299d9;
      expv[32] = 67'h013c3fba07e416833;
      expv[33] = 67'h6209003c208ebeaa2;
      expv[34] = 67'h1462380cc6262a8b7;
      expv[35] = 67'h4e0d8a7a6c1db54c4;
      expv[36] = 67'h39add63bfc3af175f;
      expv[37] = 67'h672ea085ece6c3c5b;
      expv[38] = 67'h19b40bdb1ab48d607;
      expv[39] = 67'h490655aee06abb743;
      expv[40] = 67'h136ee34c15e242e9e;
      expv[41] = 67'h2100f7436c0af2f22;
      expv[42] = 67'h24cbd83defe5b4586;
      expv[43] = 67'h2ffad42b1a45869dc;
      expv[44] = 67'h0bce648d4584e9e57;
      expv[45] = 67'h0b0c9f00b7e7c5d5f;
      expv[46] = 67'h09535ed3980ce8b45;
      expv[47] = 67'h083194f748749e80f;
      expv[48] = 67'h2d476650acc60972b;
      expv[49] = 67'h220823e8cc2e612e6;
      expv[50] = 67'h4c28e03d403e4eb78;
      expv[51] = 67'h1bf756d77579e6ff7;
      expv[52] = 67'h405f9a5c8f4518fbb;
      expv[53] = 67'h75afd8ddf9c19cbb6;
      expv[54] = 67'h39ca3fb2a6d0e07f9;
      expv[55] = 67'h26f8001af66c467d8;
      expv[56] = 67'h0887353f2b0bbec08;
      expv[57] = 67'h2de07b303a1850060;
      expv[58] = 67'h04667b1e8aab87b87;
      expv[59] = 67'h220c4252d0333ae73;
      expv[60] = 67'h4277dbf5c61b0014d;
      expv[61] = 67'h3e3cfaaf5992503e7;
      expv[62] = 67'h02538efbdf6afa704;
      expv[63] = 67'h287ea172f285bd285;
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
