// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 146;
  localparam OW = 144;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04137 dut (
    .clk(clk),
    .writerege(in_vec[145:141]),
    .writerege2(in_vec[140:136]),
    .aluoute(in_vec[135:104]),
    .aluoute2(in_vec[103:72]),
    .writedatae(in_vec[71:40]),
    .writedatae2(in_vec[39:8]),
    .memwritee(in_vec[7:7]),
    .memwritee2(in_vec[6:6]),
    .regwritee(in_vec[5:5]),
    .regwritee2(in_vec[4:4]),
    .memtorege(in_vec[3:3]),
    .memtorege2(in_vec[2:2]),
    .stallm(in_vec[1:1]),
    .stallm2(in_vec[0:0]),
    .regwritem(out_vec[143:143]),
    .regwritem2(out_vec[142:142]),
    .memtoregm(out_vec[141:141]),
    .memtoregm2(out_vec[140:140]),
    .memwritem(out_vec[139:139]),
    .memwritem2(out_vec[138:138]),
    .writeregm(out_vec[137:133]),
    .writeregm2(out_vec[132:128]),
    .aluoutm(out_vec[127:96]),
    .aluoutm2(out_vec[95:64]),
    .writedatam(out_vec[63:32]),
    .writedatam2(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 146'h178f2c313bdeb0c3bf305c4f0869a4777dd3e;
    stim[1] = 146'h08f6cf43221189c0ec39df931f1264876e0e8;
    stim[2] = 146'h3baabed8e9a9e667ccdbc3cd3e14b042fb9aa;
    stim[3] = 146'h1aa585e2c410efb30dba2071aa679bed745d5;
    stim[4] = 146'h1ea040138b238d41214e9ee3a8d217a61fb87;
    stim[5] = 146'h33b8c9b73ab7a348c7af97904b7fdd884fc82;
    stim[6] = 146'h01a340837823c7b51f76e6bfa0bc6744a43d7;
    stim[7] = 146'h318ab5b09ada924635eb8a5d70ccddc48bf8c;
    stim[8] = 146'h341a33b1d93be3ac704281297ac21b2aff71c;
    stim[9] = 146'h2a39041474276be03f1475a16dc4212431479;
    stim[10] = 146'h35c6c2c4463a3daf5df8946333249eb98f921;
    stim[11] = 146'h226ce02da39daeb2781f82967003c98a3aa9a;
    stim[12] = 146'h0735e94da9a150035b8837a79cfd4ecb16ecf;
    stim[13] = 146'h142d4d1da3b57822d1d9ff3d8ed6918f1a4e8;
    stim[14] = 146'h0ee0582f093c277227e6e01f12f8f88bb0364;
    stim[15] = 146'h1528d10d079681000f534ac4569179682866c;
    stim[16] = 146'h38bf95b4e1cf5eeb8a6da0b76efb3ab3147a0;
    stim[17] = 146'h3aa07535e518995171381374bccabd5333939;
    stim[18] = 146'h3fd340bbf61a28a3d90e9ffbc0f2016340179;
    stim[19] = 146'h0df11dea2d7d64959fd39e4fcd115fe0b5a0e;
    stim[20] = 146'h296157ca33ba2ed91032a22acdeadf6c38172;
    stim[21] = 146'h3a60ed10043a9c82560f6e5193afb48fb40e6;
    stim[22] = 146'h2e33edd6ccd1e99968a68d84d6b6dd4d27683;
    stim[23] = 146'h2fdfaaffca2c4ad37ae88e5568427c37bbd53;
    stim[24] = 146'h0cc7728343ae34f15d32935d947255bbb7da7;
    stim[25] = 146'h12956aaa26edff7a632beb3744a234f43959f;
    stim[26] = 146'h04e1f1a6f0a4d1e57d4c417a88e2374dc52c1;
    stim[27] = 146'h286951f96a8e33e89a059867cd962fc15bace;
    stim[28] = 146'h09834b1c6b8aa9b33772851fdcafcb1b8e22a;
    stim[29] = 146'h04edaa1a0eeb4f82929fe591990949572ecfe;
    stim[30] = 146'h21e76e2cd3f18023e9abef0642218e56425fe;
    stim[31] = 146'h0fbcbae50040ed93ad71cd31eb4acb66368e3;
    stim[32] = 146'h32861440526f9e9ea28f798ba4f92937e74f2;
    stim[33] = 146'h2517325ce6f2bc30812c7f83c02266674abed;
    stim[34] = 146'h1c0e4d29a7e769d818516980d059f513ec35e;
    stim[35] = 146'h0a5da5ab9b2715e47e4020a2ba77977d172af;
    stim[36] = 146'h34511641f8cf2a35c453c59991fd3b0556e67;
    stim[37] = 146'h2a57e152cd12caf61c3c1ccfa41f07a350911;
    stim[38] = 146'h2005b245963700caad649effa11f305da9076;
    stim[39] = 146'h382cb3fdb10cfe4f12d1da8cfe724108531fd;
    stim[40] = 146'h3f1f52694b850952ff2e2f15f1d6b2644b8fd;
    stim[41] = 146'h2fe8b063fa1784d126c197da38ac9a9d6ff3f;
    stim[42] = 146'h118b45ab43537c4ae7f6f37f277400e1924b1;
    stim[43] = 146'h21de248042d0c44e77e94966aaa9935dc39b6;
    stim[44] = 146'h0b0a4c29db8ad84e983a05dabe37f27841cbd;
    stim[45] = 146'h0da92911a5bbba34afd9e33b8c1e41e962583;
    stim[46] = 146'h18a7c607fcc0ecff73159ebea93f544e89114;
    stim[47] = 146'h39da6493ba252d6044e897ee5ee17fb6bbb34;
    stim[48] = 146'h3890cb06d4b8082779580ab8c4b0fd025a13e;
    stim[49] = 146'h03690ab72b035de9dcc5d3221a4f8049b455f;
    stim[50] = 146'h1ee2ee1c2ade8efff74bcd7afcb99248e570c;
    stim[51] = 146'h2de819d60dca9a3c686a77c244b51679b9b3a;
    stim[52] = 146'h02f1fe1b94b89120ce0bdd6ed4ef348c82f7d;
    stim[53] = 146'h27a8774a8ba6799d106cf51f550b9b8fa5839;
    stim[54] = 146'h17a0c4a07dc26b4605b4391751ed9bfd911e8;
    stim[55] = 146'h1c91863484ff03771380c3689006c3194788a;
    stim[56] = 146'h0822684c011b772e47439471da6221d79d103;
    stim[57] = 146'h2da595eac71241eab06cbd6e8f9fdec72c077;
    stim[58] = 146'h04e7f574a39ab90b610390af011d16ba0d9ea;
    stim[59] = 146'h334f47620368ab4259d35e174ec8495f6205b;
    stim[60] = 146'h1914375c2d25932507f43bb5d01dcea3bcf95;
    stim[61] = 146'h2cbe6baba8d650befec9aa9a4723ffa3b4bf3;
    stim[62] = 146'h1d33c9b1bb3c891a0729c801459c58951f1af;
    stim[63] = 146'h075d45234c8733ca543e59afcb22c0419c266;
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
      expv[0] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 144'hac8f6cf43221189c0ec39df931f1264876e0;
      expv[3] = 144'hac8f6cf43221189c0ec39df931f1264876e0;
      expv[4] = 144'h5daa585e2c410efb30dba2071aa679bed745;
      expv[5] = 144'h5daa585e2c410efb30dba2071aa679bed745;
      expv[6] = 144'h5daa585e2c410efb30dba2071aa679bed745;
      expv[7] = 144'h5daa585e2c410efb30dba2071aa679bed745;
      expv[8] = 144'h3b18ab5b09ada924635eb8a5d70ccddc48bf;
      expv[9] = 144'h7341a33b1d93be3ac704281297ac21b2aff7;
      expv[10] = 144'he6a39041474276be03f1475a16dc42124314;
      expv[11] = 144'h835c6c2c4463a3daf5df8946333249eb98f9;
      expv[12] = 144'h835c6c2c4463a3daf5df8946333249eb98f9;
      expv[13] = 144'h835c6c2c4463a3daf5df8946333249eb98f9;
      expv[14] = 144'had42d4d1da3b57822d1d9ff3d8ed6918f1a4;
      expv[15] = 144'h94ee0582f093c277227e6e01f12f8f88bb03;
      expv[16] = 144'hb5528d10d079681000f534ac456917968286;
      expv[17] = 144'h8b8bf95b4e1cf5eeb8a6da0b76efb3ab3147;
      expv[18] = 144'he3aa07535e518995171381374bccabd53339;
      expv[19] = 144'he7fd340bbf61a28a3d90e9ffbc0f20163401;
      expv[20] = 144'he7fd340bbf61a28a3d90e9ffbc0f20163401;
      expv[21] = 144'he7fd340bbf61a28a3d90e9ffbc0f20163401;
      expv[22] = 144'he7fd340bbf61a28a3d90e9ffbc0f20163401;
      expv[23] = 144'he7fd340bbf61a28a3d90e9ffbc0f20163401;
      expv[24] = 144'he7fd340bbf61a28a3d90e9ffbc0f20163401;
      expv[25] = 144'he7fd340bbf61a28a3d90e9ffbc0f20163401;
      expv[26] = 144'he7fd340bbf61a28a3d90e9ffbc0f20163401;
      expv[27] = 144'h0c4e1f1a6f0a4d1e57d4c417a88e2374dc52;
      expv[28] = 144'h0c4e1f1a6f0a4d1e57d4c417a88e2374dc52;
      expv[29] = 144'h0c4e1f1a6f0a4d1e57d4c417a88e2374dc52;
      expv[30] = 144'h0c4e1f1a6f0a4d1e57d4c417a88e2374dc52;
      expv[31] = 144'h0c4e1f1a6f0a4d1e57d4c417a88e2374dc52;
      expv[32] = 144'h0c4e1f1a6f0a4d1e57d4c417a88e2374dc52;
      expv[33] = 144'h0c4e1f1a6f0a4d1e57d4c417a88e2374dc52;
      expv[34] = 144'hbe517325ce6f2bc30812c7f83c02266674ab;
      expv[35] = 144'hbe517325ce6f2bc30812c7f83c02266674ab;
      expv[36] = 144'hbe517325ce6f2bc30812c7f83c02266674ab;
      expv[37] = 144'hbe517325ce6f2bc30812c7f83c02266674ab;
      expv[38] = 144'h42a57e152cd12caf61c3c1ccfa41f07a3509;
      expv[39] = 144'h42a57e152cd12caf61c3c1ccfa41f07a3509;
      expv[40] = 144'hff82cb3fdb10cfe4f12d1da8cfe724108531;
      expv[41] = 144'hfff1f52694b850952ff2e2f15f1d6b2644b8;
      expv[42] = 144'hfff1f52694b850952ff2e2f15f1d6b2644b8;
      expv[43] = 144'hc918b45ab43537c4ae7f6f37f277400e1924;
      expv[44] = 144'hc918b45ab43537c4ae7f6f37f277400e1924;
      expv[45] = 144'hf8b0a4c29db8ad84e983a05dabe37f27841c;
      expv[46] = 144'hf8b0a4c29db8ad84e983a05dabe37f27841c;
      expv[47] = 144'h518a7c607fcc0ecff73159ebea93f544e891;
      expv[48] = 144'hd39da6493ba252d6044e897ee5ee17fb6bbb;
      expv[49] = 144'hd39da6493ba252d6044e897ee5ee17fb6bbb;
      expv[50] = 144'hd39da6493ba252d6044e897ee5ee17fb6bbb;
      expv[51] = 144'h31ee2ee1c2ade8efff74bcd7afcb99248e57;
      expv[52] = 144'h31ee2ee1c2ade8efff74bcd7afcb99248e57;
      expv[53] = 144'hf42f1fe1b94b89120ce0bdd6ed4ef348c82f;
      expv[54] = 144'he27a8774a8ba6799d106cf51f550b9b8fa58;
      expv[55] = 144'had7a0c4a07dc26b4605b4391751ed9bfd911;
      expv[56] = 144'had7a0c4a07dc26b4605b4391751ed9bfd911;
      expv[57] = 144'had7a0c4a07dc26b4605b4391751ed9bfd911;
      expv[58] = 144'had7a0c4a07dc26b4605b4391751ed9bfd911;
      expv[59] = 144'had7a0c4a07dc26b4605b4391751ed9bfd911;
      expv[60] = 144'had7a0c4a07dc26b4605b4391751ed9bfd911;
      expv[61] = 144'h59914375c2d25932507f43bb5d01dcea3bcf;
      expv[62] = 144'h59914375c2d25932507f43bb5d01dcea3bcf;
      expv[63] = 144'h59914375c2d25932507f43bb5d01dcea3bcf;
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
