// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 291;
  localparam OW = 257;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02621 dut (
    .clk_i(clk),
    .rst_i(in_vec[290:290]),
    .addr_i(in_vec[289:258]),
    .data_i(in_vec[257:2]),
    .enable_i(in_vec[1:1]),
    .write_i(in_vec[0:0]),
    .ack_o(out_vec[256:256]),
    .data_o(out_vec[255:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 291'h53222c72689d6656ccaf2bd7ada0240b7cc35fe9a2495c56a8f874d0dae63c89f2eedca9a;
    stim[1] = 291'h4f293e4307890473b2c20e3d92caaecf0b6faa5329485c16714f86db51612c19d991cd6d4;
    stim[2] = 291'h02353be7405fe110d4e5b6dd2235e10ce3ff3591489a0cdcd95adaf6cc3fea2e769818e9d;
    stim[3] = 291'h2ecb051981806b629303a5bcfb0d1aa1b6936b2d8b5e98c35822d654880e3fed77a0dace1;
    stim[4] = 291'h2a8204a2e4261c05de662253c70986ecd855dc450f729c1b00e0971e693bebb5ce249e416;
    stim[5] = 291'h3f9c8938094f1e2cda29f29cdb361070875cfbbce1daa66591be20d754c581158699897c0;
    stim[6] = 291'h0152cd9347666288f810b799c6de90222e0f6a7fb9b63395edfb4f098085dba21819c6b92;
    stim[7] = 291'h0c5abd59d38888274dbf7340d1c298628b3e78d33edb559a28be2747399e456e3c9fd830e;
    stim[8] = 291'h3bf2c7249f6b9962e9ee267dac51ae1e3dca64c836be83c39e85594dfc2a2f121dc10361f;
    stim[9] = 291'h28dea53abda5d3c5ad7196b4cf6aaa451417482517da49e7eec3a46d2006253eb72308b8a;
    stim[10] = 291'h215155222ab988f4e68438b4c51cc44b6ca4f889f2931b97ce4fabf3761c224dde4e27679;
    stim[11] = 291'h01f40575d7770dbfd685290abe0557cc04e5ab3bef97f9563575ef92c9333c11d85841a1c;
    stim[12] = 291'h12094dc3e304217a0ed7f916d5f190b05e87cc774f4d6558e710c954bfcd624d07f542e9a;
    stim[13] = 291'h27b9b4c2399babc966cc83cc1c42e54c3145465cdc20f123e01fb3da9a77fee0d2d0ad6b2;
    stim[14] = 291'h3b3fed6f0de802c11a30f788d763394b23b21485f8f6270f69e3d1e7280ca5473b9f595be;
    stim[15] = 291'h0fc122846372dd37e5207939e8e60fc39fc866b9e8d696725f180869672cfef6b50b5daee;
    stim[16] = 291'h29ef385b36b52ac16811b950bcb5ee3ec5cb30f1c0d7e8c9d5fae44b5b6d1acf6eac3f3b2;
    stim[17] = 291'h008ffa4ba37604843978c1bd763537fd8ba9fd8125560f2d075ea35ace91d1c33f7a9bdc4;
    stim[18] = 291'h09229f04942d90afeb50fc6ab1f949b398197b336ece3d95fc6dae5038831f59c22352ebb;
    stim[19] = 291'h1766e0f3a6c7b6b0c2da15e1b15af9f642e053749196a65daa73a004f9678cb5c7520ca47;
    stim[20] = 291'h2dcbd21c9ae74caed3496a8b9934ca660456e87fa9b7a48910dfbf4d8cee490e7ac7645d9;
    stim[21] = 291'h1af1071e5b0999c1c1b92c3ab15d4e458fbeb78e55e8f1d6299e7bae5ee7a712ad5c5d53d;
    stim[22] = 291'h06aa58df4cc23922892c6277ce75a48ccde6e011f17ffa8009ad6b75f7dcc6afcacc315a9;
    stim[23] = 291'h12d10034c1c6a595ee03add2505151a7b92ad06cd2cb97b6ddd6deaef0fb4ec932305ea3d;
    stim[24] = 291'h0a34b4497e8b4330550a819bc470447a0049b50e8b2c5b5a1d8c7e8fbf3301e17ed61bf24;
    stim[25] = 291'h0c5d863990147e577d90e1196714bdc860e2f75c6b737e7abff16ee9483bb1f15d6c84b50;
    stim[26] = 291'h121edc1179cfd2672b28bba8e19a7c190b2f35c2f368dd292cb795fbc35424f193df504d7;
    stim[27] = 291'h0f56046e90f6143de2a29f9a6fb589755952870ef250680dfe1d8a57e57155ec2063d3ada;
    stim[28] = 291'h2649e758b5bb4902e9cb1e35a9bc6f64ca5c279c4bf948ed698ea63dc07545f11dcaa19ba;
    stim[29] = 291'h18330a77eb907788fd8d85e1cfa9fb565b515ac3253910be2d443b70aed72d1e01569de36;
    stim[30] = 291'h29759edc435593091c825f505da6c7d1daf0006c3df0a88db442e086bd81b7e95197599ba;
    stim[31] = 291'h3434262d10c722f57350100356ad39e323d62f89a58c2d03d9cccd4b4edf70b5d3f33aa2a;
    stim[32] = 291'h29355fb474277239b076bd53e39e6257692e6a6513c5e6b70b1149e61bce5cbaf81f4bec4;
    stim[33] = 291'h23c4471d0b2ae542ddfdee79883fc6a72f904fc178df4dc641571e7773d09b88937af01d1;
    stim[34] = 291'h28a85b759be6c5c8884b5197ca7420467abc287a30f30018184ade20b324805ee4530a510;
    stim[35] = 291'h3aca8cb389fd12efd998afc7e805448766a26c846ec0e3d00aa54e32ad9bdfe2c0c8a306e;
    stim[36] = 291'h2f1d16fa4d00633544937b820e62bd49b3d70e569d6022f99f2307115809f5abbf52a21c8;
    stim[37] = 291'h37877be48d0bcf7d029a8addb25b42035abb2b7e3a9cf806cfae213a9d9d3c883e8cf8e4b;
    stim[38] = 291'h06b531b4e51f6fd9100e673742feec5ed3273e1bc4474d4cd8977de5731e9f748c77df5bf;
    stim[39] = 291'h244a3d8ae239950a68faa09b9c625a1fbd78dc9bf25b843013eed0526746f5977af79efbd;
    stim[40] = 291'h24af59fc34fc4d8365da5bd4bba48656fd752fde8526400c10072615d1381ba0035ac97b3;
    stim[41] = 291'h05b829062e30a58af03ce39d03e1bc84f91cd5e19fe2ed12bdf472045d9037c0c161e5771;
    stim[42] = 291'h381d1731b40ce96113ffeed34d47b48e919845337b58f8fbff2c0e26ce87fcf55ef519d9f;
    stim[43] = 291'h3f03dafd3db38becc96b19b363f00a3d61fe7a6f00ed3c1a221c01c2af1302ffa1d1b1835;
    stim[44] = 291'h0983d25dbcf1f43390646b3923c2a022162743f35e4ea43ff58b32e27cbbb1b05b9d43b1f;
    stim[45] = 291'h05a08ea3518a42132ad0a160808bf2842451d51a2eaf44124f1aaaef50e6142e1f3338c16;
    stim[46] = 291'h1c73ee58418ac54ee31431a678208a69714564eb296ec8d5d5d1c2876cb48b33ac3b74679;
    stim[47] = 291'h036627fe215b414231c75afa5e520d0ac29573a48055e5e9c2bdc4452f87d0b973b293f48;
    stim[48] = 291'h3c9fd20fe449f97e550609ac1bb22ea2576c423d957105fa1ebf875ee1cbc5259f9686549;
    stim[49] = 291'h2938315df96ac839a6aa77ab8f3261614885a9415d252c71d44096d9b1d10415232fea4fa;
    stim[50] = 291'h12ebe4234e84e80909dbb224aeb6f9f1cc72e1cc19a38f9634bfc7d78115dc40c1ccc3b39;
    stim[51] = 291'h270602544483d488592c45fdc1696be9b3dbfe70dcd0667dadbed282b0f902ad747ae751a;
    stim[52] = 291'h2edcf9944d27669ed97d51aff2927302e27f654cf931db64a04b3f960c9e98f0255d64dbd;
    stim[53] = 291'h177276007a45a16a2d5b82b31434e71b5f878df960c6a835b9ca55ade262247647e6d24b4;
    stim[54] = 291'h351125bf772500fbe6f113035ab463169696a037c663a80ca4ced6462ad5926e5b20432cc;
    stim[55] = 291'h0f32a77c0f789c1bd133326a15ebc634f8fba4059548a7ec8b02b045e833cc3af794263e1;
    stim[56] = 291'h0d3ca6131950ab21d5ead460937427465821e6a8020db95cc6c615bc49ce43eba9107af6b;
    stim[57] = 291'h0c213f05532fccbc1e7723562d6d8f58ead9dc996ba96b6672bed22ed8a9caa889da337f7;
    stim[58] = 291'h0a5fa81da5f802b70bcdb0d15fc68f31240425e8cce8bf22669f1d1c2ea4f1f7af4933e92;
    stim[59] = 291'h3f0b06fb071719e91ec285e5254fc440fcee3b294585a309118e982283107e6a82a4e6c17;
    stim[60] = 291'h39353d89fb479d990a3014b4e12f1d35f4d0e350628540a9ec7b1e27ee57b63d6e695e375;
    stim[61] = 291'h32cde1a708f9421fd665d97836c847f0f8dc9723070387fdd2636c0bc0e170946d6b2ca46;
    stim[62] = 291'h3405b3ad3f73644780ac84e94903fc39e4c47df2fa28271dd38198fc2f2f080adc3bcff14;
    stim[63] = 291'h1639e87eaa8d5ffa7ec9bd2cf4f78831b8c0f8fb5ee56210a6d6b00975c4b5c2b0effeb48;
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
      expv[0] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
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
