// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 147;
  localparam OW = 75;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_141007 dut (
    .sw_clk(clk),
    .rstn(in_vec[146:146]),
    .qos1(in_vec[145:142]),
    .qos2(in_vec[141:138]),
    .prt_dv1(in_vec[137:137]),
    .prt_dv2(in_vec[136:136]),
    .prt_data1(in_vec[135:104]),
    .prt_data2(in_vec[103:72]),
    .prt_addr1(in_vec[71:40]),
    .prt_addr2(in_vec[39:8]),
    .prt_bytes1(in_vec[7:4]),
    .prt_bytes2(in_vec[3:0]),
    .prt_ack1(out_vec[74:74]),
    .prt_ack2(out_vec[73:73]),
    .prt_req(out_vec[72:72]),
    .prt_data(out_vec[71:40]),
    .prt_addr(out_vec[39:8]),
    .prt_bytes(out_vec[7:4]),
    .prt_qos(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 147'h2977fed1144d02f0dc533acaecc2b06d9fe7e;
    stim[1] = 147'h155e68c0f5ce38dce57d3e07d5d316ccdfa4a;
    stim[2] = 147'h4e6248ec411964ffa286c1b47990ed881691f;
    stim[3] = 147'h417ddda0a5a627f2559493d007b74240be39f;
    stim[4] = 147'h47c5cda85780b1c5ade4411618e71ccfc128b;
    stim[5] = 147'h5b9db955902c42985dbdd693f998274777337;
    stim[6] = 147'h5e194a04f7d232f92a60d253dc351fedd08ec;
    stim[7] = 147'h62254e4316a04fd0b8e9fb60b3b47ee7123a4;
    stim[8] = 147'h5e6f7190592be7b4ff7b4fc7e20972682d634;
    stim[9] = 147'h5696439038766e314dc22c663e23b4f91c7c6;
    stim[10] = 147'h7e7141ee4fa0092877abe2f139f8b67b4a804;
    stim[11] = 147'h78db39a6cc9202743ca9bdfffe9e40a55e66e;
    stim[12] = 147'h7a1c69cb9598d0ea8ec63c9bbd1e8fa728984;
    stim[13] = 147'h547574c0427b9a0d178d39ee028028b5211e5;
    stim[14] = 147'h6c6c9daf72b617218de7748563e164c3aced5;
    stim[15] = 147'h72f82f70105590aba0db34e5e5dccb4dd3afe;
    stim[16] = 147'h7daaba1dccf3418fa24dd1f9a67dd7d6820cd;
    stim[17] = 147'h68e9bd0c29b6a0884d26c024e1b4fe94e46f2;
    stim[18] = 147'h7aee870d34186c3fc013f61e76a02cced40b8;
    stim[19] = 147'h488fc8f5f91b076dadd785899582089b35711;
    stim[20] = 147'h48c1a0a281cc320947f26837106fe9e3cc8f1;
    stim[21] = 147'h2b1e4d7dc3f67ed778848ed0ca07327150efa;
    stim[22] = 147'h56b8969cfb829aeb871ce41d2ef0f9f3c6a5e;
    stim[23] = 147'h4cee8a1dde3732221de7bf5250da1319e1397;
    stim[24] = 147'h46dce4d18704090421747d759a156724de489;
    stim[25] = 147'h467c69b5c4ffc36ef00943783a57260b3ba80;
    stim[26] = 147'h7a0221ee1302e766aa537c36519e83cbdb553;
    stim[27] = 147'h7a0c831ae9a9ba54c0c89ee2fa6ea2ea1f84d;
    stim[28] = 147'h60debc03ec14239d7ec337c5158cd9a86b76e;
    stim[29] = 147'h602b0f10546f3435340cd8870f8ad8d32a462;
    stim[30] = 147'h5eb0c5f96f6d676f2a1bc933ea6be4b61cef6;
    stim[31] = 147'h7aabce77f1c7b8322fdb1ba6317f0e992b767;
    stim[32] = 147'h515f147138022fb17667be109b8e151d4f05d;
    stim[33] = 147'h4385b5d5c7c2a1656bf881416cb95b5786667;
    stim[34] = 147'h6cfbf87fe32bfc20d30be684f7bb28f2e6992;
    stim[35] = 147'h63740b572648875bd4ec408a15ea13fd91757;
    stim[36] = 147'h476006acdace66084c53f92377d9b3f87f3f1;
    stim[37] = 147'h5ee253cf45f8b9109a808d49c39684f387e9d;
    stim[38] = 147'h593c8725192db1c5f5cb8aad42b4655c335ce;
    stim[39] = 147'h612fcbae4b1bd0cafba29f669468fde08a91a;
    stim[40] = 147'h638a2ee61266b65dc64fb4d69da73a591c0fa;
    stim[41] = 147'h7c98cbd32b99f9c1de451a7d6aa677a717f1c;
    stim[42] = 147'h63e773200741384d5a90611ebb3957c494f8d;
    stim[43] = 147'h43dac7573134315566b97ade37699866cc328;
    stim[44] = 147'h5e20b6d0049e3883b852d81b8d4462bf7d351;
    stim[45] = 147'h5ef1e724851614efdea340ea28cd5e5d9c42a;
    stim[46] = 147'h5f79a269beee909efc57f1f6c8d8fb88114ee;
    stim[47] = 147'h64dc97f47bdd903df0d18e40bf44ad5209be6;
    stim[48] = 147'h6bbd6a61e2980236ab46803e25b82e48020cb;
    stim[49] = 147'h49d243ec2228b936b66b3d38be631d8338f83;
    stim[50] = 147'h4febe9632862b60519658def5ac7a529690b6;
    stim[51] = 147'h3199b2359b38b00dd32c0b864e5b68a6286c4;
    stim[52] = 147'h7023bbc6d4f7085a270cc59837a82c173b76a;
    stim[53] = 147'h65cfd9e1eb4e0ab355921bef77c958f5008f9;
    stim[54] = 147'h6c5328c30edca6ddc01158975dcb921d5c6e1;
    stim[55] = 147'h6b14d3b94399a019a03c7c276703c6456fcd4;
    stim[56] = 147'h79f5d193446df23e44815816f7df0e80fb3ba;
    stim[57] = 147'h7376f0cbc70d97458fdbb0eae1460012ce3d6;
    stim[58] = 147'h6d623287c45b41ef1f93751eab8a8d1a969cd;
    stim[59] = 147'h59c2f3d446ae6694d7840fe997a2d9f8319c6;
    stim[60] = 147'h772c121823fa99ca4ebf883b587e81e3866f6;
    stim[61] = 147'h63b5b7e18258f235ddffe74d90733493e5e8d;
    stim[62] = 147'h5d1ecb16bad78aa96f44789ac386374525cf3;
    stim[63] = 147'h710e1f61b7283993a5db185c54a02e9386193;
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
      expv[0] = 75'h0000000000000000000;
      expv[1] = 75'h0000000000000000000;
      expv[2] = 75'h0000000000000000000;
      expv[3] = 75'h5ddda0a5a493d007b90;
      expv[4] = 75'h55cda85784411618e81;
      expv[5] = 75'h0000000000000000000;
      expv[6] = 75'h3232f92a651fedd08c8;
      expv[7] = 75'h304fd0b8e47ee712348;
      expv[8] = 75'h0000000000000000000;
      expv[9] = 75'h56439038722c663e2c5;
      expv[10] = 75'h0000000000000000000;
      expv[11] = 75'h5b39a6cc99bdfffe96e;
      expv[12] = 75'h0000000000000000000;
      expv[13] = 75'h3b9a0d178028b521151;
      expv[14] = 75'h3617218de164c3ace51;
      expv[15] = 75'h0000000000000000000;
      expv[16] = 75'h5aba1dccfdd1f9a67cf;
      expv[17] = 75'h59bd0c29b6c024e1bfa;
      expv[18] = 75'h5e870d3413f61e76abe;
      expv[19] = 75'h5fc8f5f917858995812;
      expv[20] = 75'h0000000000000000000;
      expv[21] = 75'h0000000000000000000;
      expv[22] = 75'h0000000000000000000;
      expv[23] = 75'h3732221dea1319e1373;
      expv[24] = 75'h0000000000000000000;
      expv[25] = 75'h3fc36ef007260b3ba09;
      expv[26] = 75'h32e766aa5e83cbdb538;
      expv[27] = 75'h0000000000000000000;
      expv[28] = 75'h0000000000000000000;
      expv[29] = 75'h3f3435340ad8d32a420;
      expv[30] = 75'h0000000000000000000;
      expv[31] = 75'h37b8322fdf0e992b77a;
      expv[32] = 75'h0000000000000000000;
      expv[33] = 75'h32a1656bf95b578667e;
      expv[34] = 75'h0000000000000000000;
      expv[35] = 75'h540b57264c408a15e58;
      expv[36] = 75'h5006acdac3f92377df1;
      expv[37] = 75'h5253cf45f08d49c3997;
      expv[38] = 75'h5c8725192b8aad42bc6;
      expv[39] = 75'h5fcbae4b129f6694618;
      expv[40] = 75'h5a2ee6126fb4d69daf8;
      expv[41] = 75'h0000000000000000000;
      expv[42] = 75'h31384d5a9957c494fdf;
      expv[43] = 75'h0000000000000000000;
      expv[44] = 75'h3e3883b85462bf7d318;
      expv[45] = 75'h0000000000000000000;
      expv[46] = 75'h3e909efc58fb88114ed;
      expv[47] = 75'h3d903df0d4ad5209b63;
      expv[48] = 75'h380236ab482e48020be;
      expv[49] = 75'h38b936b6631d8338f37;
      expv[50] = 75'h32b6051967a5296906f;
      expv[51] = 75'h0000000000000000000;
      expv[52] = 75'h0000000000000000000;
      expv[53] = 75'h5fd9e1eb421bef77cf9;
      expv[54] = 75'h0000000000000000000;
      expv[55] = 75'h39a019a033c6456fc4c;
      expv[56] = 75'h3df23e448f0e80fb3a7;
      expv[57] = 75'h3d97458fd60012ce36d;
      expv[58] = 75'h3b41ef1f9a8d1a969d5;
      expv[59] = 75'h0000000000000000000;
      expv[60] = 75'h0000000000000000000;
      expv[61] = 75'h55b7e1825fe74d90788;
      expv[62] = 75'h5ecb16bad4789ac38f7;
      expv[63] = 75'h0000000000000000000;
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
