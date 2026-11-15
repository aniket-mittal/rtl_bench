// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 259;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_160839 dut (
    .clk(clk),
    .rstn(in_vec[258:258]),
    .enable(in_vec[257:257]),
    .finish(in_vec[256:256]),
    .md_data_i(in_vec[255:0]),
    .data(out_vec[66:35]),
    .control(out_vec[34:34]),
    .addr(out_vec[33:30]),
    .cnt(out_vec[29:24]),
    .blockcnt(out_vec[23:17]),
    .md_ren_o(out_vec[16:16]),
    .md_sel_o(out_vec[15:15]),
    .md_size_o(out_vec[14:13]),
    .md_4x4_x_o(out_vec[12:9]),
    .md_4x4_y_o(out_vec[8:5]),
    .md_idx_o(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 259'h222a5f759eb1d235d4810a8016804f46ba6a267960c221240da737e7caa3e2cdb;
    stim[1] = 259'h22af3a7c9fe4592a04e878735db9bff215997c4f4653a2a0e437e6a4b444c6360;
    stim[2] = 259'h6ae5e7ee52d6cd5e0fcca5c2618339aca787af54a8cac9a544cc4d5ca31155a1f;
    stim[3] = 259'h7e64ea1fad92ebc6c032638b0cf75966f26916c7f6fb4ae2378f01ad2c981b8de;
    stim[4] = 259'h42e46675c74eaa8f4919bf0806f7628897f4f219bea395a183f4778806efb4ef9;
    stim[5] = 259'h73699a100f2fb1251a6142331d32901844086f66b74dc80835c6865eae6ac1fdf;
    stim[6] = 259'h442672ad384bd36e4fc0efcce5dd1e17c9559badff98103ed065e85bfc6ae4278;
    stim[7] = 259'h76a5c9cbce3b42551f6e753cc34d94e45460725d6e8a4e81419f54ccfbe13a4bb;
    stim[8] = 259'h77852150ddf28b1248c7fa318893bdc006e36a120a7578dc88da59573e2d4f1bc;
    stim[9] = 259'h653f7a17f53d12c047ba2746f204228d4868f332166de551e7efb5c0810b50c6b;
    stim[10] = 259'h68d5f338010e73cfdb9813a9cc8c434fd01925cee5c61730669cea950dc02577a;
    stim[11] = 259'h4b25e691fd45105f40aa189bb8f4c1d1bf53ccb9083f6aaea78508e05ab6174d0;
    stim[12] = 259'h71e3494c522b2e8fbdf4cbdf3159e2a144f18a7eb20a011862ebdf8807469caa2;
    stim[13] = 259'h44391b5bd18220ac02d8b4d6b1bd72b95b9884d6c9833a14fa91199a72a9fbb1a;
    stim[14] = 259'h65f7fd0de362efc75a23c1a92506f874279e6f7fd8eece37d20cdfd10b6a13533;
    stim[15] = 259'h7d82e4ec66de6526655bd42d3e7f92e7216f76d6b312d19b6ea7516e822a94ff9;
    stim[16] = 259'h638382b3a8d0810dd8eb595ee142cd5b6c5647396d8d8cc156ce06acb5da3728a;
    stim[17] = 259'h60f334d9afb9e6b937fec1babe5ba09f43562cc508b9a413e7f81c55fa5f27b0a;
    stim[18] = 259'h717bab4b215369dd5089a0222b6d12ebe6100fd1cd0dcc764a9b75f5d62cd8617;
    stim[19] = 259'h6ed6b6827189df85ea0602a5b2db2ba9f0ef2ce9cd1c1f6b2dd7748035eb36a90;
    stim[20] = 259'h485c9ba1fb47ed1d228e472f71c89e716727107abd7c0e816d0e7b93ad37f8331;
    stim[21] = 259'h6fa7b27232f8aa1a2ea8a58dde70ce2ce6ed6fea11ed51c22d6dfd43095a3d645;
    stim[22] = 259'h48e9780b004714e968d6d8ef14b7857ca0c30944a682de45b597612cd3af0b121;
    stim[23] = 259'h7b97d7cc07b7c4aee94f36c697c2cca86a8ffd40100e95350e570954cee26c950;
    stim[24] = 259'h7d0717a77f87f90b4eeb22a1339466bb6d372477576291fde47cc9f84de4756b9;
    stim[25] = 259'h43198daa742052524fdec0bbf2d3a63a9cce028c95f08e658483174cf4675ce72;
    stim[26] = 259'h5ac8d4523a39b99487b5e8d8959ad7e336f16831a2dc317cb70804a9d3ddc9a1c;
    stim[27] = 259'h6de4e48d794b6bd37f74fda5e6bc7951dd10ef01db941b0f0d28e8c826006a9c7;
    stim[28] = 259'h5e3d68499d74ffe9bce136c6b33af741c2a1f5a9f569816df12d2cf0e73b81268;
    stim[29] = 259'h7d1b99094c93135d987a3ed7fd34ce19602074cd987ee0de67c39162838d738b0;
    stim[30] = 259'h724bc376ab00d0655ec01c8137707a034131bde956d81a1ef590eb03b5f96c9af;
    stim[31] = 259'h6ac3a795924a037a3284437e5ed5e9f989d775dcbb905fe12f8c0d970477e969c;
    stim[32] = 259'h7c61358dd747fb2774fc43a3d3e6514d38ef68aa5ff9a1a1fd432bb074fb9fc32;
    stim[33] = 259'h41a6b06838ffe7eeedc9b0ae979fc265ce48646bbdad66d1cefbd6788027315a6;
    stim[34] = 259'h4f35b17d7f0da0d4a6bb4d865187f9d045acd8dc807b2082a1ebcb74046580f58;
    stim[35] = 259'h71d08dea65c19be4dfcd5b6a476cb56939950dc8c54921be6876b1c84998242a1;
    stim[36] = 259'h4fd196ef96ca23bbe6ba6242b908314b8891fdac6186a6e77870ddcb2d9ce5519;
    stim[37] = 259'h5ddba600555f17f28c1ec0393d15fccdc9eac206ab6081894acbb451a0fbac102;
    stim[38] = 259'h7b3f11a0bff5e8a76978970939e482fa8476a3cac53f6edf31ae05c84e8a8fbf7;
    stim[39] = 259'h5f4fa6e5b75508cd197947a058202093192f5c369287db20d10db85a8e24dda06;
    stim[40] = 259'h79f610052f1d5326558dc51fc46f111b012571ae55a1133ce6a4821c39ccbef30;
    stim[41] = 259'h40237e13aea3d94fa560850bc725e80ae7f66fbd7f35ab4b209257227e2f531f7;
    stim[42] = 259'h4f16daab99a1248990ec07170b1e4152e5c87e0072ee88f62aad20ed95ea3ecb8;
    stim[43] = 259'h55410af882935ebcea8e8a125e14a214200e6ecc2ee28ddde5462517a4549fd76;
    stim[44] = 259'h55bf7bec3011ed3f9e5ef6ae12665f391e1406d93507d71691d5cdf96081d673b;
    stim[45] = 259'h4c297ad7428f308bca5fee87fe2d0ffd4278ef7366778c0f28c32ce18466e8def;
    stim[46] = 259'h7bf8d9e9bd2520767a0660e8ea3608b8b4536c0846d343d59934a088efde4a273;
    stim[47] = 259'h76c38217d6462c06c93c3e2a232c0a5ceb293991f855af51e2e4895290ccbc904;
    stim[48] = 259'h48d95c4577731549a20dd20bcde3c775c88ff3fedc701a3840965bfe701d9dda8;
    stim[49] = 259'h6b05cec52cf70cd88159c9ec2cd400d9757e1b34b4e225b28e88d924f2c1914f3;
    stim[50] = 259'h5c8550ca1c82a65bd43c9fc0067f566c3ef4ebeb0fe14d6f018e4b14672877e8c;
    stim[51] = 259'h7b2199e8618fdc0d9a0851b488b556365c9ff1b2eaa2fcc166ba7111b7f986fe4;
    stim[52] = 259'h799da671df150400fd619d26b6182da79946d459c6c822d8382446d12853057ba;
    stim[53] = 259'h413b599c169024ff209595cbba3f5d07624fef24ef39a4a9591af640d1f337a20;
    stim[54] = 259'h4108a560559646ccddff9fd2850b23c7ee1018c8280dafa44b3b3035183cab758;
    stim[55] = 259'h6b8175a2c6b13ea4640ce5c7629a314d69a65a858fd2321e427769f9ef404fb87;
    stim[56] = 259'h47a28411fdb2246858a5563a6fd7f0a0da9fe4b17348985c731e679ed169ca47b;
    stim[57] = 259'h4fa4b942d31eec55fc2c80ba494bc58045695d6b833d94225f318335b60f8477a;
    stim[58] = 259'h7a5c427f8c603ef408b666879c70a5e849d4d20af785b7646d40987df39c310b3;
    stim[59] = 259'h41386fa37fe3f73d037386000ddbf2f9776d1c0c1ce1e575546f1a5e18c4344d1;
    stim[60] = 259'h76c10f851721f49b5a66f285003c6a40c1ca7a0fe6b617f89be4450bb83938f07;
    stim[61] = 259'h6d934552c374621728a5339b8447d8215a17c306ab4afa6858c3d89c3634af0e4;
    stim[62] = 259'h5f4342f51a7cddb9d9962bff05182fd48c911193202cde28d31da88e4db7543ee;
    stim[63] = 259'h67b30b37ff078d6e46f0e680d47c1e323da6636bc9d8b1c0e39eede8f3140b8d9;
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
      expv[0] = 67'h00000000000000000;
      expv[1] = 67'h00000000000000000;
      expv[2] = 67'h00000000000000000;
      expv[3] = 67'h188aad0fc0003c000;
      expv[4] = 67'h64c0dc6f40005c000;
      expv[5] = 67'h732750fd44105c221;
      expv[6] = 67'h73560fefc0007c000;
      expv[7] = 67'h1b4cd08044107c221;
      expv[8] = 67'h5f09d25dc0009c000;
      expv[9] = 67'h716a78de4000bc000;
      expv[10] = 67'h085a8635c000dc000;
      expv[11] = 67'h6e012bbd4000fc000;
      expv[12] = 67'h46af99c04410fc221;
      expv[13] = 67'h3a34e55140011c000;
      expv[14] = 67'h0f1a4a62c4111c221;
      expv[15] = 67'h5b509a99c0013c000;
      expv[16] = 67'h1154a7fcc0015c000;
      expv[17] = 67'h2ed1b94540017c000;
      expv[18] = 67'h52f93d8540019c000;
      expv[19] = 67'h3166c30bc001bc000;
      expv[20] = 67'h2f59b5484001dc000;
      expv[21] = 67'h76b5b413c411dc221;
      expv[22] = 67'h4ad1eb22c001fc000;
      expv[23] = 67'h7d3d9391c411fc221;
      expv[24] = 67'h771364a840021c000;
      expv[25] = 67'h6f23ab5cc0023c000;
      expv[26] = 67'h6838bd3bc4123c221;
      expv[27] = 67'h6838bd3b841224221;
      expv[28] = 67'h300354e3c0025c000;
      expv[29] = 67'h300354e3800244000;
      expv[30] = 67'h1c6b9c5840027c000;
      expv[31] = 67'h2fcb64d7c0029c000;
      expv[32] = 67'h23bf4b4e4002bc000;
      expv[33] = 67'h27dcfe194002dc000;
      expv[34] = 67'h6309ac6ec412dc221;
      expv[35] = 67'h3a3fd93bc822dc442;
      expv[36] = 67'h4cc12150c002fc000;
      expv[37] = 67'h0e846f534412fc221;
      expv[38] = 67'h0e846f530412e4221;
      expv[39] = 67'h74547dfbc0031c000;
      expv[40] = 67'h74547dfb800304000;
      expv[41] = 67'h4e65f79840033c000;
      expv[42] = 67'h4fb0802944133c221;
      expv[43] = 67'h78ea9932c8233c442;
      expv[44] = 67'h78ea9932882324442;
      expv[45] = 67'h78ea9932882324442;
      expv[46] = 67'h2c6e28fe0c3324663;
      expv[47] = 67'h7ef25139c0035c000;
      expv[48] = 67'h0665e48240037c000;
      expv[49] = 67'h361c10bec4137c221;
      expv[50] = 67'h160c8a79c0039c000;
      expv[51] = 67'h160c8a79800384000;
      expv[52] = 67'h3fcc37f24003bc000;
      expv[53] = 67'h42982bdd4003dc000;
      expv[54] = 67'h4ced338ec413dc221;
      expv[55] = 67'h78a82007c823dc442;
      expv[56] = 67'h7a027dc3c003fc000;
      expv[57] = 67'h5c0bad164413fc221;
      expv[58] = 67'h3589f5234823fc442;
      expv[59] = 67'h1ce18859c0041c000;
      expv[60] = 67'h52e213fc44141c221;
      expv[61] = 67'h41c9c783c0043c000;
      expv[62] = 67'h31a5787240045c000;
      expv[63] = 67'h31a57872000444000;
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
