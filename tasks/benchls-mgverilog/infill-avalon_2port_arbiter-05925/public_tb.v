// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 150;
  localparam OW = 130;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05925 dut (
    .clk(clk),
    .reset(in_vec[149:149]),
    .s0_address(in_vec[148:131]),
    .s0_write(in_vec[130:130]),
    .s0_read(in_vec[129:129]),
    .s0_writedata(in_vec[128:93]),
    .s1_address(in_vec[92:75]),
    .s1_write(in_vec[74:74]),
    .s1_read(in_vec[73:73]),
    .s1_writedata(in_vec[72:37]),
    .m_readdata(in_vec[36:1]),
    .m_waitrequest(in_vec[0:0]),
    .s0_readdata(out_vec[129:94]),
    .s0_waitrequest(out_vec[93:93]),
    .s1_readdata(out_vec[92:57]),
    .s1_waitrequest(out_vec[56:56]),
    .m_address(out_vec[55:38]),
    .m_write(out_vec[37:37]),
    .m_read(out_vec[36:36]),
    .m_writedata(out_vec[35:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 150'h3e62393b0893aae155d5b49dddd212d2d40cc9;
    stim[1] = 150'h2e2ef7cef1ceffcbca7156af7f1e244e46c74f;
    stim[2] = 150'h0d62389558ba661776c8ed2d465bd5109ef7c7;
    stim[3] = 150'h0b3b392dbb1bfd82ff27917aa749d62879b45d;
    stim[4] = 150'h10c6241113767124d4be46cf9774e014d2352d;
    stim[5] = 150'h01406a70818c20b114bd4f4e08a6541e62df9d;
    stim[6] = 150'h044f6c8445a2c357cc6688ebca7a7817e51eba;
    stim[7] = 150'h09e8ad9b4d81a341a83a91f44c1451db82cdd1;
    stim[8] = 150'h02201b1dd519b8306131af01fe3231753a56b6;
    stim[9] = 150'h1d9963e3e3c6fba9caef1dd4cad5a9cf1e8147;
    stim[10] = 150'h0064166866a0e75af4ba607c2916bd459d1300;
    stim[11] = 150'h0e11860f7de2ae000376af43e763527996b3cc;
    stim[12] = 150'h1c656b29e9e37af1e9ecdb6e988d6523773033;
    stim[13] = 150'h2a9bfebb12707af84503e1cb1bad0bbbbfc999;
    stim[14] = 150'h081e5a67ef38e89a461f9db745212d52b0967f;
    stim[15] = 150'h12e801d04bd68849606230764e79411dec90a0;
    stim[16] = 150'h07cc09c826c76a8b89a3f9e3fc4e7e9ee5b102;
    stim[17] = 150'h07fcf375be861b43e951370e738f4b00f5acc1;
    stim[18] = 150'h1eec34a49bc31f8f94f79bda40ba93fa91103f;
    stim[19] = 150'h3305afe107f4fb447aa3b0d7da1f6bcf0a88e7;
    stim[20] = 150'h0c48c4dbe2cb6f9002c477702499ed01c3e3b7;
    stim[21] = 150'h02a400b6778d29613f3bf43dc6a9360cdfa20a;
    stim[22] = 150'h076663c4465d1a4e37a137f0258d71c8c70f66;
    stim[23] = 150'h0d393feea628dbd5ef32a1720967b81de399ee;
    stim[24] = 150'h02152cf84b0b7aa02ac42911d12e869b99a67c;
    stim[25] = 150'h0699bf0b5ce472e4d6290ca1d1bc9f56fc5538;
    stim[26] = 150'h0cd5e30e3a97d42d3857e116af35c6cc80b2eb;
    stim[27] = 150'h15321514f75a5d41b05ed234842d5365b2cfaa;
    stim[28] = 150'h07ad24d06c187b76f99c90aac4756b0dee9bfd;
    stim[29] = 150'h0e7e811ba4872880fb74e70776aba769c5e4d7;
    stim[30] = 150'h1ba4e44155a2e324c472bdff22ad830fb063b1;
    stim[31] = 150'h1ba9ca0e6921ffdc3d37836930aeb85b0d56f1;
    stim[32] = 150'h0c75b43cb802afe7780081a216ec1da02bf36d;
    stim[33] = 150'h0acffc3d26d52ea43581e07395a16e45a26482;
    stim[34] = 150'h0161c2da351bc66a7ccef36b44b40a006c394d;
    stim[35] = 150'h0db524f15e109128c6f4987a87cd1ba1c8cbf3;
    stim[36] = 150'h13a73c22361f925c6a3a7e04182b375b492f5b;
    stim[37] = 150'h0dcb04661d21ce2ae619a4964ee4e7f196654f;
    stim[38] = 150'h099786e0531b552dee7d0e5732c42ab06fba8b;
    stim[39] = 150'h076d0df05a6465ed95d89048f911ed5890ef83;
    stim[40] = 150'h0cff8972dd48974269f536b8f3c0582e0dde45;
    stim[41] = 150'h16d62bb2c92911a16d57b1b3ccca10ad309e99;
    stim[42] = 150'h0d1087c21ed02188f91cc145492cf838af112c;
    stim[43] = 150'h10355906af088ac0238d106a4a495d8430f0f3;
    stim[44] = 150'h09ae5503c1862e310e2a3e005459b26b933c11;
    stim[45] = 150'h0a9c9ee5edb03e9d13aaed4730e2ac0e6fa614;
    stim[46] = 150'h10d73b89db97f1a394c815bfdb048ae6522c64;
    stim[47] = 150'h0b3db36cfc9dba4eb413a68ee582f7a3fe327f;
    stim[48] = 150'h17ee2ce3aae61ad972adca3946b4a695f25f46;
    stim[49] = 150'h0920460bd98745cd2a1ff02225b9dddad67fd5;
    stim[50] = 150'h1bd98459004e22d251465faa2949c8d3ea5949;
    stim[51] = 150'h09936e8f88a5d8724069a7ca20e8dce20ec86a;
    stim[52] = 150'h1841681e5921f262d42bf4ce40f338de087b3a;
    stim[53] = 150'h1872992d99fb1fb3252cf9d7012fcfefaabe26;
    stim[54] = 150'h0970f7460cf8fe92c08c276e6ccca29273e77b;
    stim[55] = 150'h1c4151c6f18cc05857ffa18a6c87bd93c50095;
    stim[56] = 150'h0787f6c794d7dff99d66cc685bf80d6a4dc185;
    stim[57] = 150'h10d1014c0b5e3334033575d6c595b4f78f3899;
    stim[58] = 150'h0a7aa16678b018ebb7361175988bce1371df47;
    stim[59] = 150'h1ec8d2ff78d2a1774052bda2e304635a3bacd4;
    stim[60] = 150'h182671708ba6217366c0915305a538c5280ce5;
    stim[61] = 150'h024af0c457ceb92d581a9d748949caea2c710a;
    stim[62] = 150'h01b8741500ce8bfe0ea8d305ca837a4f4cabfc;
    stim[63] = 150'h29b8108137a8c7f0bb3b3df07351a592764c20;
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
      expv[0] = 130'h000000000200000000100000000000000;
      expv[1] = 130'h000000000244e46c74f5e538ab57bf8f1;
      expv[2] = 130'h000000000200000000100000000000000;
      expv[3] = 130'h000000000200000000100000000000000;
      expv[4] = 130'h000000000200000000100000000000000;
      expv[5] = 130'h000000000200000000100000000000000;
      expv[6] = 130'h000000000200000000100000000000000;
      expv[7] = 130'h000000000200000000100000000000000;
      expv[8] = 130'h000000000200000000100000000000000;
      expv[9] = 130'h000000000200000000100000000000000;
      expv[10] = 130'h000000000200000000100000000000000;
      expv[11] = 130'h000000000200000000100000000000000;
      expv[12] = 130'h000000000200000000100000000000000;
      expv[13] = 130'h000000000200000000100000000000000;
      expv[14] = 130'h000000000200000000100000000000000;
      expv[15] = 130'h000000000200000000100000000000000;
      expv[16] = 130'h000000000200000000100000000000000;
      expv[17] = 130'h000000000200000000100000000000000;
      expv[18] = 130'h000000000200000000100000000000000;
      expv[19] = 130'h000000000200000000100000000000000;
      expv[20] = 130'h000000000200000000100000000000000;
      expv[21] = 130'h000000000200000000100000000000000;
      expv[22] = 130'h000000000200000000100000000000000;
      expv[23] = 130'h000000000200000000100000000000000;
      expv[24] = 130'h000000000200000000100000000000000;
      expv[25] = 130'h000000000200000000100000000000000;
      expv[26] = 130'h000000000200000000100000000000000;
      expv[27] = 130'h000000000200000000100000000000000;
      expv[28] = 130'h000000000200000000100000000000000;
      expv[29] = 130'h000000000200000000100000000000000;
      expv[30] = 130'h000000000200000000100000000000000;
      expv[31] = 130'h000000000200000000100000000000000;
      expv[32] = 130'h000000000200000000100000000000000;
      expv[33] = 130'h000000000200000000100000000000000;
      expv[34] = 130'h000000000200000000100000000000000;
      expv[35] = 130'h000000000200000000100000000000000;
      expv[36] = 130'h000000000200000000100000000000000;
      expv[37] = 130'h000000000200000000100000000000000;
      expv[38] = 130'h000000000200000000100000000000000;
      expv[39] = 130'h000000000200000000100000000000000;
      expv[40] = 130'h000000000200000000100000000000000;
      expv[41] = 130'h000000000200000000100000000000000;
      expv[42] = 130'h000000000200000000100000000000000;
      expv[43] = 130'h000000000200000000100000000000000;
      expv[44] = 130'h000000000200000000100000000000000;
      expv[45] = 130'h000000000200000000100000000000000;
      expv[46] = 130'h000000000200000000100000000000000;
      expv[47] = 130'h000000000200000000100000000000000;
      expv[48] = 130'h000000000200000000100000000000000;
      expv[49] = 130'h000000000200000000100000000000000;
      expv[50] = 130'h000000000200000000100000000000000;
      expv[51] = 130'h000000000200000000100000000000000;
      expv[52] = 130'h000000000200000000100000000000000;
      expv[53] = 130'h000000000200000000100000000000000;
      expv[54] = 130'h000000000200000000100000000000000;
      expv[55] = 130'h000000000200000000100000000000000;
      expv[56] = 130'h000000000200000000100000000000000;
      expv[57] = 130'h000000000200000000100000000000000;
      expv[58] = 130'h000000000200000000100000000000000;
      expv[59] = 130'h000000000200000000100000000000000;
      expv[60] = 130'h000000000200000000100000000000000;
      expv[61] = 130'h000000000200000000100000000000000;
      expv[62] = 130'h000000000200000000100000000000000;
      expv[63] = 130'h000000000200000000100000000000000;
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
