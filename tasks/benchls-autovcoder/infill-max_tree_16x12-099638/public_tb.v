// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 192;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_099638 dut (
    .clk_i(clk),
    .corr_i(in_vec[191:0]),
    .max_o(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 192'h962d3879ff3eb696660ca3d7c6fc29ff0fe0429b584899ea;
    stim[1] = 192'he43639765621b90cb8e9d16b1bfd9e016894c1e083f82ad6;
    stim[2] = 192'h0e0ad66d02efd380206fc5fffbd8c6199d8ec187b4af3138;
    stim[3] = 192'ha93a772a7e245053a3fe24beeabb0333c52f14c1ca7a30f6;
    stim[4] = 192'h6d828a64037dca1585943b89006fe834b9926b20ed76d709;
    stim[5] = 192'h5f1ebbd8c83de204a379d1b836f9857f2f01dc5f050931e3;
    stim[6] = 192'h69c4613ef27dfca362af7a4f125b03961a9cb8d9440f5183;
    stim[7] = 192'hca16143defdd7451f894ccd3c89805b702c64b5f67ea279e;
    stim[8] = 192'h9143b2359006384828d970412fd3a562a99599c65439af62;
    stim[9] = 192'h9e5d9175544e4a973a400922b0f58e4cb8185467fa100a7f;
    stim[10] = 192'h2a4547a515563ea6db5139792967ecad7bf85785aa078f95;
    stim[11] = 192'h195a12ecfeb79cc0ed350a4b54b992324bca6b1d216a18bf;
    stim[12] = 192'h123237ea3d006a1892ee419578cff9bd8dfa68347b561774;
    stim[13] = 192'h2aba26f649908cb228b02ef2014bf20c1f43f231c81743ce;
    stim[14] = 192'h0c587bb46e0014680c61770d8e204557a6293901c3058b8e;
    stim[15] = 192'h5d5ef99c80551ce11729adf585e586d2c76b1b08071c8f43;
    stim[16] = 192'h9c0dbf4bcf75b4c5718195dc76d592aa53e4aa20b6dd9aec;
    stim[17] = 192'h9d3a37ad2b6190f0c2a8f891dc89f526f053348aae05a145;
    stim[18] = 192'h8e85ffe4c8fb9ac86441603da379e51c49c7da376fec702e;
    stim[19] = 192'h08ab3a237a01d3dc66791fda20df5a0304af2e42f02981ee;
    stim[20] = 192'hd19d64f073b1655b9254bebd7004cfda419b7cc23992de32;
    stim[21] = 192'h30d252f18a5b81d0216242d0935f3837fc3fc1c76ae31ac5;
    stim[22] = 192'hb3fa5e5681507dae7d8462a0d67a3b03b1540cb37ee1d386;
    stim[23] = 192'h96841e0c8906e3d97af35f723c52fa91b3fcdf98de24f0ac;
    stim[24] = 192'hacc1f9a5890638c858e602d7bd466325778bad32e1fd74ca;
    stim[25] = 192'h0c0f90f65c7579ad811847187ae6c5874a4f5ab2cd8a3a3b;
    stim[26] = 192'hfee54df2fb3cefec3c92b382c0ee08a4e6be7185d5516e6a;
    stim[27] = 192'hb2dc98d394fad96d76be8044c42f8541bd6275614e29148b;
    stim[28] = 192'h241fdaf89120fc8dc70a2e63d32c89fab7c858f3e2f65123;
    stim[29] = 192'hbdc9f81b491a61f3a97e6ffc53755f891cf3d106656facea;
    stim[30] = 192'hdf2af81ff4cd03a45cfb9c2d255553840463b3183d507d22;
    stim[31] = 192'hcccbf5125ffe7ef737aece8e32d13335d40b55a40e09477f;
    stim[32] = 192'h89983ce78da33665c85e8392f85efb8540ec30648a350aa5;
    stim[33] = 192'hd441187dd0f6a59ca8450e3cac55c7bb6f0e975f9bcdd78f;
    stim[34] = 192'h3808106df71788520d3ff825344d8df1c01b289f96eb9cd7;
    stim[35] = 192'h412919dd12693c19913b2e1a4a4d05c84d22c708edd4e3ff;
    stim[36] = 192'h4e9564faeb686e21c2cf6e235811fe21c4dc054dd5e5177b;
    stim[37] = 192'hb4ea8437a0a02487c949f5f3436acae4f93f1e41dc82d1b0;
    stim[38] = 192'h7719e56ce9c53d68f8d176851bccb752f8d89f1ba37228f5;
    stim[39] = 192'h55cd69d8185ac152b52faefa5796280e58a7bbbb136366c8;
    stim[40] = 192'hdc703eb368f22c57cd07c8d7978b75b1c111873694385837;
    stim[41] = 192'hcb0c82ca04409486cea651109a47a4e7ba174a9be47a6e47;
    stim[42] = 192'hb266cd72a978091bf49b7abb408c4a2613daa5eacea582c6;
    stim[43] = 192'hbc58c4eeb39fc6d0975b577c2e21e6ee8e77d31e7301fd5b;
    stim[44] = 192'hdf43f97c97556a5363e9e65b96091f5bb1882e3833d3256b;
    stim[45] = 192'hcd9808c493771e7a25127363158fc7ab14a5504a7d9d24a4;
    stim[46] = 192'h5b88591d5ac841e4a25a1a1eb0a9a436d44acd2cafb9b7d5;
    stim[47] = 192'hb08f07335fc95ee17ca82c800d4b32efe56f09e8a3e21421;
    stim[48] = 192'h30a36973b40b49d9043d04cdf8ac2dcb2cba3c7cb47d5d78;
    stim[49] = 192'h386b4a8ad93d964516a1608ad273f19d6abf7b133ab47f37;
    stim[50] = 192'h7aebfdb9e3e2794c63ae9a9d223e8c36fa3232518d89bdd3;
    stim[51] = 192'hbe9c223e294661a9f00240a1a8251857e63c1e477d071b33;
    stim[52] = 192'h62298d46b258f632ab010eb47cdfc3bbb4168e5bb9a8aa26;
    stim[53] = 192'heb93f124ecd6e2ee0ee15836b974f9df6e84e7a84a04be75;
    stim[54] = 192'he6df892200be9538bd031ae8a761b5b5e54b50833b8dbf6c;
    stim[55] = 192'h4a08afedefb599d50624550b2fb811f1c3b51d38858eed9e;
    stim[56] = 192'h95ea1380a99495ce6bcbbb212aa87fb8ac3f3ca3572e9cae;
    stim[57] = 192'hf22088e4360d798bde65ccfb2575bd913a1aa49c17e9641f;
    stim[58] = 192'h5826fa53b8ffe428ff1955222816a5ecfab4164c1af7f21a;
    stim[59] = 192'hb5791d1b73a423e8b01eefb706d0cc3c5566ca972a4997b8;
    stim[60] = 192'hfda7a03d13d88b55cc6846228e9ec745b1d97a0a49c16818;
    stim[61] = 192'hb83f0385c69c5540f69bc73176222995d97b9401bb75812f;
    stim[62] = 192'h7a782b806423be5769c1832099c8fbccaa17e3d94b7c19cb;
    stim[63] = 192'h5e06e5512820095c478f19ec6bbed46d31fd71ba6cd1618c;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h000;
      expv[4] = 12'hff0;
      expv[5] = 12'hf82;
      expv[6] = 12'hfbd;
      expv[7] = 12'hfe2;
      expv[8] = 12'hfe8;
      expv[9] = 12'hf05;
      expv[10] = 12'hfca;
      expv[11] = 12'hfdd;
      expv[12] = 12'hf62;
      expv[13] = 12'hd91;
      expv[14] = 12'hf95;
      expv[15] = 12'hecf;
      expv[16] = 12'hff9;
      expv[17] = 12'hf64;
      expv[18] = 12'he00;
      expv[19] = 12'hf43;
      expv[20] = 12'hf75;
      expv[21] = 12'hdc8;
      expv[22] = 12'hec7;
      expv[23] = 12'hfda;
      expv[24] = 12'hf07;
      expv[25] = 12'hf38;
      expv[26] = 12'he7d;
      expv[27] = 12'hf72;
      expv[28] = 12'hfd7;
      expv[29] = 12'hf90;
      expv[30] = 12'hfee;
      expv[31] = 12'hf85;
      expv[32] = 12'hfda;
      expv[33] = 12'hffc;
      expv[34] = 12'hfb9;
      expv[35] = 12'hffe;
      expv[36] = 12'hf85;
      expv[37] = 12'hf9b;
      expv[38] = 12'hf96;
      expv[39] = 12'he1a;
      expv[40] = 12'hfae;
      expv[41] = 12'he4f;
      expv[42] = 12'hd17;
      expv[43] = 12'hefa;
      expv[44] = 12'hdc7;
      expv[45] = 12'he7b;
      expv[46] = 12'hc4a;
      expv[47] = 12'heeb;
      expv[48] = 12'he9e;
      expv[49] = 12'hfc7;
      expv[50] = 12'hcd2;
      expv[51] = 12'hfc9;
      expv[52] = 12'hf8a;
      expv[53] = 12'hf37;
      expv[54] = 12'he8c;
      expv[55] = 12'hc22;
      expv[56] = 12'hfc3;
      expv[57] = 12'heb9;
      expv[58] = 12'hf89;
      expv[59] = 12'hfb5;
      expv[60] = 12'he6b;
      expv[61] = 12'hf22;
      expv[62] = 12'hf7f;
      expv[63] = 12'hfb7;
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
