// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 108;
  localparam OW = 109;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_087176 dut (
    .InA(in_vec[107:72]),
    .InB(in_vec[71:36]),
    .InC(in_vec[35:0]),
    .OutA(out_vec[108:73]),
    .OutB(out_vec[72:37]),
    .OutC(out_vec[36:1]),
    .swap(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 108'h432835f7e15c2034981c224695a;
    stim[1] = 108'h343d818fbfb2a61cf47da61a533;
    stim[2] = 108'h6f69f548067dd955042ee7189d9;
    stim[3] = 108'h168fc520c58a71ade333fc753e1;
    stim[4] = 108'h10bf29461d104c59e8de24d0862;
    stim[5] = 108'h83e341cbe06eaa7996b7f14ab6d;
    stim[6] = 108'h9cbb485113d77748b3ee8dd6340;
    stim[7] = 108'h8331d166a8f8af4edca769cf57c;
    stim[8] = 108'hd6c8409826dee6d324764ba1801;
    stim[9] = 108'h9dcb9bf0768d62fc3590d4934cc;
    stim[10] = 108'h52a4220eb6f63e7809f08117dab;
    stim[11] = 108'h7ab0e5a4b73a341a92769f7af1d;
    stim[12] = 108'h23f76e711d4d15963944d63ef27;
    stim[13] = 108'h0c730059a1d157a6a3cf46ee80d;
    stim[14] = 108'h96090e224239d237b729eacf110;
    stim[15] = 108'hf8b9512cbb720a12d54307c08e6;
    stim[16] = 108'hecdcaa3e8dc99d57b870027a5cf;
    stim[17] = 108'h056d065a621110779b3e4d61fb0;
    stim[18] = 108'h2eb9f4fe9e6646e859ec8c7589c;
    stim[19] = 108'had42affc1c03b7b63d88401090c;
    stim[20] = 108'h09fc6632f207ca6a3b93fb32b91;
    stim[21] = 108'he9ea3dd94836ea0713013f4cee8;
    stim[22] = 108'h4282325519edd59e65afd27f03a;
    stim[23] = 108'hf0501298d95db220606735fbd87;
    stim[24] = 108'hc2b314a735113bfb6cf036f5fb6;
    stim[25] = 108'h0a8f6540d9ebb73ff1c1a4d79e7;
    stim[26] = 108'h3f3acbf9ee7261d2df4c3acf961;
    stim[27] = 108'hcb5b21673c09e5e58b57853c268;
    stim[28] = 108'hd3c7477d75dfa364188adfd0551;
    stim[29] = 108'ha94b9ac3162ca97d3f0daf40b69;
    stim[30] = 108'h92a42a9fa61c1011c452bdaaa3a;
    stim[31] = 108'hc1fbdef329933a1c27847011c5a;
    stim[32] = 108'h0d4bcd969439c5852a2040c6d80;
    stim[33] = 108'haee2de352bce659934f9addec44;
    stim[34] = 108'hec92bd82d91ac4510847e919ce2;
    stim[35] = 108'hed01441615cec8af133b529f793;
    stim[36] = 108'hd8c20ebd77a6a21ff63461d16a8;
    stim[37] = 108'he5eb70466ec417361722f80a6df;
    stim[38] = 108'hb56811be0aaa53f3abf09b03117;
    stim[39] = 108'hcdb28fb80679f6733ee3ffb10e7;
    stim[40] = 108'h52d53f443aba8245a20179ec497;
    stim[41] = 108'hf9c9eb8c071b2e564c6c1f6f30c;
    stim[42] = 108'h74fd6b07cfbb0f49b14210f02e5;
    stim[43] = 108'hdca2d37a4f193eb7c7e780fad0d;
    stim[44] = 108'h783edcfe2ccde9a6933ed7abceb;
    stim[45] = 108'he22ba4b4c54a4bda7f0349a03cd;
    stim[46] = 108'hf9b235b4ea57d149f9aebcecf1e;
    stim[47] = 108'h3969f81649ff644cf09ca06c7cc;
    stim[48] = 108'hb09668aca4828df8e50e6e58e92;
    stim[49] = 108'h4bc709a1f7d0e6f08fad70c893e;
    stim[50] = 108'h3809469872dbfc93dfcb6a18f5d;
    stim[51] = 108'h2af6d83972daa9bc9285d231b96;
    stim[52] = 108'h90e7aa8361a27ff53d6109c2032;
    stim[53] = 108'h59aaa4ac99e8277f7f56214465f;
    stim[54] = 108'h3359b9d6f93ffbe932c8f2b8a39;
    stim[55] = 108'hbb635d715c9767d38ffc916e6ae;
    stim[56] = 108'h55b7ef74f57a188800e25735fda;
    stim[57] = 108'hb3043994c82309b27ebbddf5e03;
    stim[58] = 108'h94260a7a53ed66d118395cd489f;
    stim[59] = 108'he732061d23c3492296d570fa47b;
    stim[60] = 108'h17eadf40853be3f07944fa6369d;
    stim[61] = 108'h46b61365d8c9a36dff27e34b813;
    stim[62] = 108'h240e15b11cd36b498e8c1ada0db;
    stim[63] = 108'he26a384eac718ce099718c2bfbb;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 109'h038448d2b486506befc2b8406930;
      expv[1] = 109'h0687b031f7f654c39e8fb4c34a66;
      expv[2] = 109'h05dce313b2cfbb2aa08ded3ea900;
      expv[3] = 109'h02d1f8a418b14e35bc667f8ea7c2;
      expv[4] = 109'h0217e528c3a2098b3d1bc49a10c4;
      expv[5] = 109'h00dd54f32d07c68397d6fe2956da;
      expv[6] = 109'h07aeee9167397690a23dd1bac680;
      expv[7] = 109'h10663a2cd51f15e9db94ed39eaf8;
      expv[8] = 109'h0ec9743003ad9081304dbdcda648;
      expv[9] = 109'h121a9269993b9737e0ed1ac5f86a;
      expv[10] = 109'h0a548441d6dec7cf013e1022fb56;
      expv[11] = 109'h0ed3ef5e3af561cb496e74683524;
      expv[12] = 109'h047eedce23a9a2b2c7289ac7de4e;
      expv[13] = 109'h018e600b343a2af4d479e8ddd01a;
      expv[14] = 109'h053d59e2212c121c448473a46f6e;
      expv[15] = 109'h0860f811cd6e41425abf172a2596;
      expv[16] = 109'h0e004f4b9fb933aaf71d9b9547d0;
      expv[17] = 109'h00ada0cb4c42220ef367c9ac3f60;
      expv[18] = 109'h05d73e9fd3ccc8dd0b3d918eb138;
      expv[19] = 109'h15a855ff831080212198076f6c7a;
      expv[20] = 109'h013f8cc65e40f94d47727f665722;
      expv[21] = 109'h0027e99dd106dd40e27d3d47bb28;
      expv[22] = 109'h0850464aa33dbab3ccb5fa4fe074;
      expv[23] = 109'h0ce6bf7b0f2bb6440c1e0a02531a;
      expv[24] = 109'h0a2277f6d98566294e7e06debf6c;
      expv[25] = 109'h0151eca81b3d76e7fe38349af3ce;
      expv[26] = 109'h07e7597f3dce4c3a5be98759f2c2;
      expv[27] = 109'h0af0a784d1813cbcb1796b642ce6;
      expv[28] = 109'h115bfa0aa3a78e8efaebbf46c830;
      expv[29] = 109'h01b5e816d2c5952fa7f529735862;
      expv[30] = 109'h0a57b55474c382023892548553f4;
      expv[31] = 109'h108e0238b532674384f83f7bde64;
      expv[32] = 109'h01a979b2d28738b0a5440818db00;
      expv[33] = 109'h15dc5bc6a579ccb3269f35bbd888;
      expv[34] = 109'h08fd2339c523588a211d9257b05a;
      expv[35] = 109'h076a53ef26b9d915e27da02882c2;
      expv[36] = 109'h068c3a2d50f4d443fedb1841d7ae;
      expv[37] = 109'h1cbd6e08cc45f014dbfd882e6c2e;
      expv[38] = 109'h1554a7e7576ad0237c1e1360622e;
      expv[39] = 109'h0cf3ece67d9b651f701c7ff621ce;
      expv[40] = 109'h0a5aa7e88602f3d892f575048b44;
      expv[41] = 109'h0d83ede618e365cac99f393d7180;
      expv[42] = 109'h0e9fad60f88421e05cbf761e9362;
      expv[43] = 109'h1b945a6f49e327d6f8fcf01f5a1a;
      expv[44] = 109'h0f07db9fc47daf579d799bd34d26;
      expv[45] = 109'h006934079aa9497b4ffc45749698;
      expv[46] = 109'h15d79d9e3df3646b69d4afa293f2;
      expv[47] = 109'h072d3f02c93fec899e13940d8f98;
      expv[48] = 109'h01cdcb1d249051bf1cb612cd1594;
      expv[49] = 109'h0978e1343efa1cde11f5ae19127c;
      expv[50] = 109'h05b7f927be70128d30f96d431eba;
      expv[51] = 109'h055edb072e5b55379250ba46372c;
      expv[52] = 109'h0c2138406521cf5506c344ffea7a;
      expv[53] = 109'h0b35549592ac4288cbf3d04efefe;
      expv[54] = 109'h066b373adf27ff7d26591e571472;
      expv[55] = 109'h176c6bae2b92ecfa71ff922dcd5c;
      expv[56] = 109'h0ab6fdee9eaf4311001c4ae6bfb4;
      expv[57] = 109'h10461364fd66087329977bbebc06;
      expv[58] = 109'h072b9a913e7dacda231284c14f4a;
      expv[59] = 109'h1aae1f48f7ce640c3a478692452c;
      expv[60] = 109'h02fd5be810a77c7e0f289f4c6d3a;
      expv[61] = 109'h08d6c26cba4fc69702719346dbfe;
      expv[62] = 109'h0481c2b6239a6d6931d1835b41b6;
      expv[63] = 109'h0e31857f778e319c133c4d4709d4;
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
