// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 266;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_134628 dut (
    .clk(clk),
    .rst(in_vec[265:265]),
    .mux_in(in_vec[264:9]),
    .mux_sel(in_vec[8:1]),
    .counter_dir(in_vec[0:0]),
    .system_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 266'h3660624702569279e6f6d4d99d843d6a9566e61e3024138fadfaeef0689d71c2a02;
    stim[1] = 266'h225738818b51adee60283e1e228598bb5c82772604c6d562b0f483dbfbddf7a6ff5;
    stim[2] = 266'h03bb86df264cc2cf808490713ae193cdeabe1b162f28582e164763a109cba874cc4;
    stim[3] = 266'h0496c3632852d44512c7da82cd250376897e4a2a532c50cb833b72b2ec9e67a7e23;
    stim[4] = 266'h1a10b9c6a70c56af6d35f6a89ff13c595406602acfd591df63970789d30b94dc723;
    stim[5] = 266'h0dc826bc28168f37003c83e0476780f579131d84812b919aa0802996e4a9d54182b;
    stim[6] = 266'h188122cae9ab75f306fdff6a798a27f481bb1fcf50c1965cb30a571360935185917;
    stim[7] = 266'h09188ce4978320cea28f67098bb87f93b7022cf294d3f8e08874d7d803c22b6082d;
    stim[8] = 266'h02929f5dbb6e7a26e1f762f5320aaee19dee7a83bda2abb8873ff73f0e81c73bb83;
    stim[9] = 266'h0e5e131055dca8a08fb15d4669f76bfd98f680d16c4b8c9f5b2c14102964ea6512d;
    stim[10] = 266'h0bb3e21587bbcb46b47fbb97bc6a10b4eb4b7978fc35cbc74934383c95ada9e67ab;
    stim[11] = 266'h0950e85eb9363a68acdfa270e2c953a1a6ac8456f48a0769f7189839b74ab5bb1c8;
    stim[12] = 266'h06dfcdd7b7118351d23a41eac770b596ab90debe0de40f112dcd3d5058749f32864;
    stim[13] = 266'h18b700452a9d2de604895bf8c08dc10c700a0e56931053fccb8841000bff9373f77;
    stim[14] = 266'h003c3e7eb8b74dc0129ae192daca934a5c1cd86d8372144a005072060072f06c5c7;
    stim[15] = 266'h0e665ca82f2bb7c852f14f17c6a2f0fe17e1c7272bf2d38207a13b79f5dfa5afb11;
    stim[16] = 266'h0762f36586e473e8895d9286a55cc2de3612cc9b0200e7be8ab691e9dd9045a12f0;
    stim[17] = 266'h0c6a97f00b8aa30d7e00b7c9966e747b6c5e6db03faad38d9d1bcde2d2757f5a0ae;
    stim[18] = 266'h0d255f14b456d4a545f67d36ca9581392b610fb00c74100119b70438b5312cab23f;
    stim[19] = 266'h14dd82707a6e472b64f173dedbfe4be9704a3fde10795aed88537538bff7504de20;
    stim[20] = 266'h1dfa2fe746ee2455fbeeace6289b864b29168d37f6d72e1889e92581db23a0fb42e;
    stim[21] = 266'h08687e141f67a0cffd31811e282414cd37c92516ecd4c9eb08f20eeab0f10d876fa;
    stim[22] = 266'h02e7871738be263631aabefde65963d440623348a0e5182fde7015bdd3d0daa6d51;
    stim[23] = 266'h1837d860626367655e6471477589d460316f0e9e92744f0eecb117402bc8753471b;
    stim[24] = 266'h07fe14646343aea30175d20dd9d1f626d2fcc4d9daa3243da1b31bd09476818b433;
    stim[25] = 266'h1a1652f13c52c35e20db5b3e99bf489cfff405512511a09d6768fa51c58fda3c3ad;
    stim[26] = 266'h0430fb3c4782853f8114fec028bb6a640dd178a721ba9fd2d2196cecee91057792a;
    stim[27] = 266'h09fc4483c9e76fc0dddfcbf772e6724e56f0b7d79f0b90ad5e7390ea099d4f99443;
    stim[28] = 266'h1765502c9ecb7a2a5b7241b4ca8d2c456c58515a7a477746a5a5d9ed8910c961dbf;
    stim[29] = 266'h146e5152433fbe386a1c420108bdc787b887551dc9b0c52f21ba2573b654178cb8e;
    stim[30] = 266'h1d053bf00d5bbf4b73cac5ff16c1fad431336e8b8bbf2ca817472a7942f9575645e;
    stim[31] = 266'h0167c0800eb489df9c7a507fe71360436c1cd0efae00e683c9172af350c8c64c80c;
    stim[32] = 266'h021ecd6ba52bf90ff45c61ae4ca70f00f4e44d5e212fd0b1170351963a50a2ad726;
    stim[33] = 266'h0a9b809608ae9bd83d24acf9e9059bbb4e1a9544fb292ac2734d2fac1cff7f0bbaf;
    stim[34] = 266'h08ce124bbf8da44b1d814111ceb248ea18d4508b6248874cbf590946faa42bd8803;
    stim[35] = 266'h1a6fd3ab109f5d0aea006d0cc0bee5a9fbaf943472e6fde8024ee0590e1c5131595;
    stim[36] = 266'h059b41f0509a8e98ccdfaff8b449591ef0f26e3cf37ab809b70606e270402f4d6df;
    stim[37] = 266'h1772c42dc3a67637a5d1182bc3a20e6ce995d2a2517fc812941a1d7e3e929b6b0f9;
    stim[38] = 266'h0097a085a852966982d44638b8257e63887d0be0aa7cb05ff13bc8779571fade4b2;
    stim[39] = 266'h104f23ca4a151b635c9a700ec749301dd838933038d76a4a978d1c397aa25fa482e;
    stim[40] = 266'h1b37df5b88f4ad89d46ca66d07730e4955e69dd887528c87dfc08bb956a3290c652;
    stim[41] = 266'h09391f0d3519e07f06e3daf23cff20b96bf4d9df13d9f81cfdd8ef9b9b224b92c92;
    stim[42] = 266'h1e227c76659c6af2cb584184526d870997e57c193d9d8aa0e584ce63c54a26ee6f6;
    stim[43] = 266'h1dbda163e04ae1e2b66b931f92a2e3d5f07b8939800eed335164a91429d9d4acd99;
    stim[44] = 266'h15412fb46e7b4d50defac41bbf0cb2b12714048756880fe691a40d2e0deaeee93c3;
    stim[45] = 266'h1187aaa7c572f6ffbc91ca1c0d6c8b5339cdb71ba4ddfd9b037241f4be1b4805225;
    stim[46] = 266'h12c176406e57ce8d66ff71e04e5f935e50718b42ecdafc1b8069f4962d868ba9af1;
    stim[47] = 266'h025e94be336520a3d522e6a1233dc322e531026430621b49cee004a4814abc93fee;
    stim[48] = 266'h0f162cd0cd5bb307de0358857f9434c51f787e1e61e3484d52af17ab49ebff885eb;
    stim[49] = 266'h06e091e27b2bc4c0ea141419d47a2d140967037d31cd372c4465a04f6a5ed857fec;
    stim[50] = 266'h09ddfddb8e4eecaa12ce33057c64c189e5ac7165f5ffc3e42898ef2296f8729d596;
    stim[51] = 266'h0c25d3081f90bee162f18bf3e5e94114ee2a5f3d1ad826dc3a07786df0c54128d37;
    stim[52] = 266'h16736fc34437a48715cb23249034c5170871758d207c03aa3e6b05f12d4ddbd586f;
    stim[53] = 266'h022a753946bf7264e6e1bb0d09c4a0ab8ed206771601ca9d5caa94f49db95914b04;
    stim[54] = 266'h0c0b9c30663c3b970a2d59203733dcc1026d4287d173f077b14599f2c92187038e3;
    stim[55] = 266'h1f0e996eef2083dde763c06648efc9653ae78fb382b163a6ce2b4fd4b4994e9a814;
    stim[56] = 266'h0644340356af81f2e1cce8aa16f48b285d4e27ac489cd04c8b708d044e6329ff475;
    stim[57] = 266'h15ffd1b83b838986864dc1762af230f7a1c42904a1083ee4e571c5cda207cb72cd4;
    stim[58] = 266'h0002c68187dee05a49093cf184358c4fa4f81f13b56377961dda890f8ed153be8ce;
    stim[59] = 266'h0aa85bb8ba1b34e9e7def34c73d3dec7ecfd593c1a034638ebf3caf4820da32083d;
    stim[60] = 266'h1a39a801f41119bbb1062eb77851b08bf9faf84193b1ab3a44aeaba13c2dc60f830;
    stim[61] = 266'h1518cd08f4f22d98bcd5dbe37d869f47d3bf89040fb6124b9c8bd0a286e0bff677f;
    stim[62] = 266'h02c3afc0b73859a631fef062a328b1b24daadaf1f778010d5bf771891ecd614fa6e;
    stim[63] = 266'h0f93a0bd82dbfdf79a56a1e80275d21be6b1fdef9ffed5da3f668a208bda5047606;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h1;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h1;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h1;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h1;
      expv[22] = 1'h0;
      expv[23] = 1'h1;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h1;
      expv[30] = 1'h0;
      expv[31] = 1'h1;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h1;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h1;
      expv[52] = 1'h0;
      expv[53] = 1'h1;
      expv[54] = 1'h0;
      expv[55] = 1'h1;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h1;
      expv[62] = 1'h0;
      expv[63] = 1'h1;
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
