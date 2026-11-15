// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 168;
  localparam OW = 87;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02271 dut (
    .clk(clk),
    .Ax(in_vec[167:140]),
    .Ay(in_vec[139:112]),
    .Az(in_vec[111:84]),
    .Bx(in_vec[83:56]),
    .By(in_vec[55:28]),
    .Bz(in_vec[27:0]),
    .Cx(out_vec[86:58]),
    .Cy(out_vec[57:29]),
    .Cz(out_vec[28:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 168'ha09618528acddef7663753478c4b170da96758fb8e;
    stim[1] = 168'h8eb732ee2e13bf637166005c830814ac6797864a96;
    stim[2] = 168'heb9cc26c5cf97a11fd1375df3b2eee4e7e2f93dbeb;
    stim[3] = 168'h560ed3e581264e70d1edc5dd86940c812a1c3eaa01;
    stim[4] = 168'hbbae76100156340aae95134ed69fbeec2ce8eb62b6;
    stim[5] = 168'h304966dcfb631661bb1b1795a37472e51e8aa908ee;
    stim[6] = 168'h547542c80c741cde11f8c344e8cc14918bfe2dc848;
    stim[7] = 168'h8d36fbe18d6e46394c188cf029feabf8a0e33a58e6;
    stim[8] = 168'he86ae4f42548c85d8e98a52e2a74b5e9b8e28ca218;
    stim[9] = 168'hca5d6914ba445b39ba2fbea563bb7c3cae0ece60ae;
    stim[10] = 168'h74569dba0201b7d002abb8c8e17b15f476ac828dc4;
    stim[11] = 168'h4a3275fe53284b2ed5d1d02d0aa6d17120fad82ff5;
    stim[12] = 168'h134106122b1d1175dca998e516878efc8c6436165e;
    stim[13] = 168'h75fdffd2045f523f6c0205c178a9a24ebf6e6b9513;
    stim[14] = 168'hec67e15af9357e961860f1cb4da5de4bc81fdd9ddb;
    stim[15] = 168'hb5bb601719a4060c3851538c32b65483ce46b4a5fc;
    stim[16] = 168'h7f8815bb04ecc8a79dbaa95c2d1952abea9af53464;
    stim[17] = 168'he00903932f9f530de577099d83b7c53d8a8379162b;
    stim[18] = 168'h83f55c2b91bf71e1df88ee1887ba1f055908527022;
    stim[19] = 168'h6f9ee03a35d719faba11e8739eea9cb4cae568923c;
    stim[20] = 168'h7d7545e707ef3ae919e4eaed0be29e0801bdbb0072;
    stim[21] = 168'h77d74299421b10f8b1a4e8c04dab6d5698421c6a03;
    stim[22] = 168'hebeac1d9a2d75687e44f80704bb745195174b4632f;
    stim[23] = 168'hd499ed1d5d2c5889cf5c6a62b5994a5f56c2aa7af1;
    stim[24] = 168'haea4304f4275a468601e34699d1c9d0f4cd7546a11;
    stim[25] = 168'h4e94404ce1c652e662c1bb4d868be4be24b0990316;
    stim[26] = 168'hca5ffcada7fcbeb50bc3785fdb3c539b7e3a4acc95;
    stim[27] = 168'h0b2962a19cc91ed214a1ca102a110ea74f0317c060;
    stim[28] = 168'h8666c335fe5df7aef71097434413834b3833b5faa8;
    stim[29] = 168'h3a88998770de6e9572759f4274bb013588b46b6501;
    stim[30] = 168'he97ab38e0d209fa7ccfa3862b568f45da0d21244e7;
    stim[31] = 168'h1139c7bd68da14133a5838cd560507dbc3a4e079ab;
    stim[32] = 168'h13a1532c5fbd422b384742b337e3a2d005d82d7bbb;
    stim[33] = 168'h74f89c0daa429916cd7216f17c5179002f783435ac;
    stim[34] = 168'hcecd304184b1be06edb4bb512e0f695b287e5e42b8;
    stim[35] = 168'hc7547ec1d2cd8e03e2a9d2a9e92fcd90f2e0ff08f8;
    stim[36] = 168'h7cd81621acb9c5569e38ef431f4d70b4da18c8947b;
    stim[37] = 168'h57d45a716295850ab9cccbf2837c4606a4c88940fd;
    stim[38] = 168'h924019c8bc499ee9877229ae534b536939bef05fbe;
    stim[39] = 168'h8e5c573c2b2966e51c3b2f2ca5cf187607bf454ac7;
    stim[40] = 168'hbe756355db1fda7dfe349109976079677a97c73f1c;
    stim[41] = 168'hf87b70bea03c6a2856cd63f4b0e603be50e6b69ef6;
    stim[42] = 168'hc9a1d2f11f5ac74d56cae5d757c979b216e178fb80;
    stim[43] = 168'hd2b11e095e154bd05ebc25734067bd5427ad617577;
    stim[44] = 168'habd96b645ef344d47f5cdc3f00150e1b4e44bc28a8;
    stim[45] = 168'h287aad871fff6f53e0e8b2612249b4100b4b625bb1;
    stim[46] = 168'hc01e09e26a7c54bfc0d28e2b3bae9499510c9d2d24;
    stim[47] = 168'h7cc8005f9d15d5a50b4dc18cce2afc8f36093283af;
    stim[48] = 168'h45e089e2e69c70c113406e609a8e72cf762bc6ad14;
    stim[49] = 168'hd044b73f936ffb651f98ef829e77cbf13de04d4740;
    stim[50] = 168'hed49b063f4d3b8bdfc486b8714194c2566b9388ef0;
    stim[51] = 168'h88ec801fad506069e4c6526c63c69ec5dec9225f63;
    stim[52] = 168'h9118fdfaa21781a9e7e0ac3fa79478cb7adf78c5a9;
    stim[53] = 168'h8ce812529566435c5b529f3425031eaf062b92dfaf;
    stim[54] = 168'ha282ea878164327433512d3a86f6139523d71baced;
    stim[55] = 168'h7af5fe5febea352ad1b1890379fca7509b42e082f4;
    stim[56] = 168'ha7f57efeacf7790ecfb7d8721a9ce62badfd276dea;
    stim[57] = 168'h646e02ef94e3d4937850dfe937296b15af74777fd0;
    stim[58] = 168'h4f891227c9853cabcc14651f727de5875fdbe2e0ea;
    stim[59] = 168'hb7c38d8c93e7f856dd850049dc0ffe9acd984dea93;
    stim[60] = 168'h7749004a8036db887dd30bf9a1efc6ed815fbd950f;
    stim[61] = 168'h68412958c0cfb76df9dce4c03e2ef3f62218147e36;
    stim[62] = 168'h78c54fa18c74e2c98d18c65a7d1f4c9201e83bd397;
    stim[63] = 168'hb33ebba564dc3685345ff0347c8f9e45cbc2f7b337;
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
      expv[0] = 87'hxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 87'h5b0754e8233e69181d67e7;
      expv[2] = 87'h623bc09b9c69a8deb0cbca;
      expv[3] = 87'h636a43e3af0233018bf54c;
      expv[4] = 87'h7e0d9aa8972275aace74db;
      expv[5] = 87'h61b0430882526cc7bf869b;
      expv[6] = 87'h6dbbcbe6b9a225cb72a8c3;
      expv[7] = 87'h0809ad82d86b6bbfb35744;
      expv[8] = 87'h6f8d1700d9bc87005a68a2;
      expv[9] = 87'h65620f6d18d5a7434c4772;
      expv[10] = 87'h7801cb5b9ecf2f64cd424d;
      expv[11] = 87'h39f22183145749a07d9cf7;
      expv[12] = 87'h11d872e42782c788152d28;
      expv[13] = 87'h213be769276a896327b43b;
      expv[14] = 87'h06799d50fbee6b858b2b0d;
      expv[15] = 87'h73ecc1c3a28f1fb983e834;
      expv[16] = 87'h5f3e0d2c3a2ce45a0edf19;
      expv[17] = 87'h3a71510abb45c3ff84a746;
      expv[18] = 87'h118c3208db78d57d654145;
      expv[19] = 87'h689b3823342d3c25cb886c;
      expv[20] = 87'h3a193c640d514d7a430ee2;
      expv[21] = 87'h33a921f1a4ede3e0d69ddc;
      expv[22] = 87'h3af499fa4d96319d6eb04b;
      expv[23] = 87'h7939819aaa2847f3c9e1c9;
      expv[24] = 87'h0b9ba4e316e6dd95f27ad5;
      expv[25] = 87'h5a0297a0ae301aff3197d2;
      expv[26] = 87'h266ef5e7d2bc80fdcd2905;
      expv[27] = 87'h1118923b0dc89b6105efa2;
      expv[28] = 87'h1a89b064164a85da0989bc;
      expv[29] = 87'h448ca081b9354e97397661;
      expv[30] = 87'h11985374ebb0bc74ebc258;
      expv[31] = 87'h18d3d743d8e8d2586a8abc;
      expv[32] = 87'h211919db9d63bb5c532bd8;
      expv[33] = 87'h7a1b753c46579caa8608b9;
      expv[34] = 87'h017835bec347f44938a175;
      expv[35] = 87'h066e93d75ddfe6e2109893;
      expv[36] = 87'h672d7af49f37cc1f3f21a5;
      expv[37] = 87'h22298857542d848ca14f13;
      expv[38] = 87'h262b08afa0456728225bcf;
      expv[39] = 87'h7dd6b94670b6c07fa81764;
      expv[40] = 87'h66e47e9354791d7f0c78eb;
      expv[41] = 87'h6b76fb57c895062018a42d;
      expv[42] = 87'h6e4c1897cc8aeb9bcecde0;
      expv[43] = 87'h5b0b159b30872b235c712e;
      expv[44] = 87'h5edf45e7b11a5a3fa4764b;
      expv[45] = 87'h79fa5a846fa7cc188bcd25;
      expv[46] = 87'h009a223d7bdfd769dbb2da;
      expv[47] = 87'h775a93c1241ce89f5ee004;
      expv[48] = 87'h18fec76ffa844ea11e312d;
      expv[49] = 87'h17f5b8437734a1c04a86f2;
      expv[50] = 87'h7606b3f05a8b83a604b24e;
      expv[51] = 87'h0d361bb7e64fa9a2a73596;
      expv[52] = 87'h588990ecb81e4e8d7bed02;
      expv[53] = 87'h7347a12e62abfa9b25b861;
      expv[54] = 87'h66697088154ebc2a32d57a;
      expv[55] = 87'h73b69ec8c9023ea0278825;
      expv[56] = 87'h3aaf97a4aedc103fcc9824;
      expv[57] = 87'h0834f54c09479343c58d93;
      expv[58] = 87'h1976a4171c711bb4c0053d;
      expv[59] = 87'h7f647a952e21e7fed9e05c;
      expv[60] = 87'h6cc97327954763ed1fedbd;
      expv[61] = 87'h2debb857c22bd8d8ca4821;
      expv[62] = 87'h070f519f302db2cecb1f98;
      expv[63] = 87'h04c75f6f986a98845cfdf5;
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
