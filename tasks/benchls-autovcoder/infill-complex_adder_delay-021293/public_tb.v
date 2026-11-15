// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 150;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_021293 dut (
    .clk(clk),
    .reset_x(in_vec[149:149]),
    .enb(in_vec[148:148]),
    .In1_re(in_vec[147:111]),
    .In1_im(in_vec[110:74]),
    .In2_re(in_vec[73:37]),
    .In2_im(in_vec[36:0]),
    .Out1_re(out_vec[73:37]),
    .Out1_im(out_vec[36:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 150'h206f2c809ce98623fd0119903edf304a49164a;
    stim[1] = 150'h2351c39a005d5fc20be329a5ada04cd4e9008d;
    stim[2] = 150'h04b486d771defe805259479383b036f7098b7b;
    stim[3] = 150'h06de543acb8b1aa6932bc49b792e2e123373bb;
    stim[4] = 150'h1d3cfc8b5c014bf30409f96e53cccf5ce4ea0d;
    stim[5] = 150'h1aca6cca5c9206c3a7d1d87e451b0d3d9f7f5a;
    stim[6] = 150'h007f3a8ebe518421675df2096761bbc9910fb4;
    stim[7] = 150'h1939d838fc280bfabf66a62a08bebeeb07af4b;
    stim[8] = 150'h1dbfba353018ebd3e7c8131a2a8c7b53f1a899;
    stim[9] = 150'h0d5e4eabc54a34b04dafeb1721bf7c0c514bdf;
    stim[10] = 150'h175b1472b3900649eab8c7b97c14e1ad5c840d;
    stim[11] = 150'h174db2ca5489e5e0c6897c3cbf35fbcb9c3857;
    stim[12] = 150'h14953b5e9e3b8276872a6e2ecb91da23e808e7;
    stim[13] = 150'h1a4203068a9e44e1da98fa9d17a15cc56821a0;
    stim[14] = 150'h07bf870b3c3b8534994789a375543187923e52;
    stim[15] = 150'h1f44e70dbf97c03bb7c0e868e95e695d2091fd;
    stim[16] = 150'h0c96ca0a028708725d8723cc71ac5ee88ccfca;
    stim[17] = 150'h0f96d14c722aeb3149e5ad65eb2daeb99473a0;
    stim[18] = 150'h045433d4fd8be314d4af9ec7e5a3e27f19dc9a;
    stim[19] = 150'h004c92aff5f13944b5b5259e75f72705c908cc;
    stim[20] = 150'h01cf1d85ae5bec7c8a98d465889c4d9290d49d;
    stim[21] = 150'h1969a78c00023627ae0c44211a98da5bef9e7c;
    stim[22] = 150'h0e5b89f266ca12451d52832f48594805e638d1;
    stim[23] = 150'h06be2c4dfac13303ab752077e6160011b3fd25;
    stim[24] = 150'h153b67b626ac9189acf2c3560c2739b373199f;
    stim[25] = 150'h0b2a61beb227203392ec55fd02e43a3431bd96;
    stim[26] = 150'h3416db32c27556e3cd7784a9b0fc74253be3cb;
    stim[27] = 150'h12a0fd89a0e7471a3926d663404a47423b76b6;
    stim[28] = 150'h0655abc961bfc51ef42397bf1f5072ad6ad082;
    stim[29] = 150'h1204fe0b19cba8d5f66735f961e870f9e8604d;
    stim[30] = 150'h13c2fb0baa427d4763c21eec47c0ef64b8f6a5;
    stim[31] = 150'h0d60f905bd7e412d39b54afe5943cb41bb53c0;
    stim[32] = 150'h16301d0884e38d2d41593c8d321f5d1f67e1e1;
    stim[33] = 150'h03545451100041e4aa973cdecbb6f8f96c9c68;
    stim[34] = 150'h1299535b2862c5737e3f1b2033210915284dc1;
    stim[35] = 150'h0a384fb17cf1428c10e01d0177e2e17f4b7b2e;
    stim[36] = 150'h03c149cc4de47a3662bffddeeb9131ca434ee9;
    stim[37] = 150'h0192c8d49ed077b72cabc91f980756c5aa673f;
    stim[38] = 150'h1e9b392df18236c366ab0d1a89d54eb4c45323;
    stim[39] = 150'h155b9948bc89a1a31881c5999ac30c1bd71e2b;
    stim[40] = 150'h1531d6d569b00809f3a2cf642bb7c7505799aa;
    stim[41] = 150'h0f3b5649a010d5ad580456a10c81d003553a6b;
    stim[42] = 150'h0702853c3d89c33e04d10064920040b09905ef;
    stim[43] = 150'h15ebdece3694dcf92007ac1844bf34dfc1e5ab;
    stim[44] = 150'h06e3b78f725819fd4c926299fedb667269436b;
    stim[45] = 150'h05d1f7b7081925ed1919163af02cb53e0a156a;
    stim[46] = 150'h136307b47fa63c9ec25e74d173ffdf5443fd0e;
    stim[47] = 150'h0c958c4849ceda0a5bab2ede66d74c457e7540;
    stim[48] = 150'h0ce79fbb88bd380b153a4300f4113729f03a35;
    stim[49] = 150'h071185e7bbae15f78d505425df780596d34b13;
    stim[50] = 150'h133dfa70ef1376363fa8a13354f9575d5c99ed;
    stim[51] = 150'h1321462d9dd362c8a1305981d3c7e40225f890;
    stim[52] = 150'h1df0d97486e2932ad1af02225e7c3a960700a2;
    stim[53] = 150'h02c501f74b94d2cba2a9956ad1acb8473b92dc;
    stim[54] = 150'h09d6af6d9d2224f542d887750d16b9c86bcc27;
    stim[55] = 150'h04d5f687f3acda19ebb9e3b9a00e7f8b3d96bf;
    stim[56] = 150'h05d0c1fbc6b96944a65a46e175741477a1016f;
    stim[57] = 150'h13b125a25bb41c5f2c436b6dabb24ae9d6b8c4;
    stim[58] = 150'h13ddb439ddfcf4916d3b022ee6a344ca4afb66;
    stim[59] = 150'h03adba5bec1f4932767626bc4d895a343dbc3a;
    stim[60] = 150'h003824086d235a70b9ae075c82d1c5d229f934;
    stim[61] = 150'h1d3668fbeb20406ae88c001631ea8d403ffae4;
    stim[62] = 150'h1980b926010bee21112f95f15d4a6056d33920;
    stim[63] = 150'h0681a4d78fe1859f6de16b4584f2d5f5e7e5d3;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h329a5ada04cd4e9008d;
      expv[2] = 74'h1479383b036f7098b7b;
      expv[3] = 74'h3c49b792e2e123373bb;
      expv[4] = 74'h1f96e53cccf5ce4ea0d;
      expv[5] = 74'h127bd67f20d909c405c;
      expv[6] = 74'h0a4a499f8c04b41f9a8;
      expv[7] = 74'h158c53b55c36cb8993f;
      expv[8] = 74'h2619038cb6556f05872;
      expv[9] = 74'h35b05af0b62474645d1;
      expv[10] = 74'h037a80960e7e8517dff;
      expv[11] = 74'h35301dbe2dfcd2eb305;
      expv[12] = 74'h0419b7e26fc9d603a89;
      expv[13] = 74'h21febef48cba605c36a;
      expv[14] = 74'h21a2436f6d918cab4f8;
      expv[15] = 74'h378e9ab0110ee5908a3;
      expv[16] = 74'h2f506351c24d89bbdba;
      expv[17] = 74'h17e9fae9d94a9a36190;
      expv[18] = 74'h37001a913c86f28ca8a;
      expv[19] = 74'h0f6d839670cf5d7f6bc;
      expv[20] = 74'h0a59f4c0c33829fc28d;
      expv[21] = 74'h0155ade08a04bfe8c6c;
      expv[22] = 74'h0dd992b594893702454;
      expv[23] = 74'h37ae1c916009f3de8a8;
      expv[24] = 74'h11dbfef273a40fd0522;
      expv[25] = 74'h1a4d6f06dc5589428d2;
      expv[26] = 74'h0d3839e861f499e4f07;
      expv[27] = 74'h2d663404a47423b76b6;
      expv[28] = 74'h03ffe81b88c7f315ecb;
      expv[29] = 74'h3de38c4508acbaeee96;
      expv[30] = 74'h2a02bca87424eee743e;
      expv[31] = 74'h23bbd1c2e5be10d2cb0;
      expv[32] = 74'h22d4bf509cdbeb9bad1;
      expv[33] = 74'h0c8e60dd811dcb7ecbe;
      expv[34] = 74'h0a727754221f8739e17;
      expv[35] = 74'h0c3564eacfa30a85abd;
      expv[36] = 74'h0a433c25b2a7ba02e78;
      expv[37] = 74'h06f746ed14f770746ce;
      expv[38] = 74'h3b36f609f47662132b2;
      expv[39] = 74'h16c67e63f6ca987f7d5;
      expv[40] = 74'h0264a7de6e9b8c05fca;
      expv[41] = 74'h1a316c1dc3c0557b753;
      expv[42] = 74'h24cda475aacb29b82d7;
      expv[43] = 74'h0f88dfa1980e1c46293;
      expv[44] = 74'h3dd91b2690ba9a78b6c;
      expv[45] = 74'h29132a3ba5a75485d6b;
      expv[46] = 74'h3efc9278d648b82450f;
      expv[47] = 74'h007a053f735d4a625d7;
      expv[48] = 74'h31bc2e13100b917eacc;
      expv[49] = 74'h12ce7cc97ef25fafbaa;
      expv[50] = 74'h179f5421920ec844a84;
      expv[51] = 74'h129007003a8dfb3887a;
      expv[52] = 74'h3ca73e9e38f6eb928ee;
      expv[53] = 74'h111a12ece50ec064747;
      expv[54] = 74'h003ab6a38526d368092;
      expv[55] = 74'h15feffd301830084b2a;
      expv[56] = 74'h1c317d295ad1c6bb5da;
      expv[57] = 74'h2e7a408d3e38ea16d2f;
      expv[58] = 74'h3ee784f3a31d162c676;
      expv[59] = 74'h31e295c00b971621788;
      expv[60] = 74'h2fec99149250f4e5482;
      expv[61] = 74'h0f7834061ec7d645632;
      expv[62] = 74'h2e38b9c452866edf343;
      expv[63] = 74'h3cb73ce7318f1702a1e;
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
