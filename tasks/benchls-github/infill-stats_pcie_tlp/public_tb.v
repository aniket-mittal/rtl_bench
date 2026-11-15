// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 132;
  localparam OW = 46;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  stats_pcie_tlp dut (
    .clk(clk),
    .rst(in_vec[131:131]),
    .tlp_hdr(in_vec[130:3]),
    .tlp_valid(in_vec[2:2]),
    .tlp_sop(in_vec[1:1]),
    .tlp_eop(in_vec[0:0]),
    .stat_tlp_mem_rd(out_vec[45:45]),
    .stat_tlp_mem_wr(out_vec[44:44]),
    .stat_tlp_io(out_vec[43:43]),
    .stat_tlp_cfg(out_vec[42:42]),
    .stat_tlp_msg(out_vec[41:41]),
    .stat_tlp_cpl(out_vec[40:40]),
    .stat_tlp_cpl_ur(out_vec[39:39]),
    .stat_tlp_cpl_ca(out_vec[38:38]),
    .stat_tlp_atomic(out_vec[37:37]),
    .stat_tlp_ep(out_vec[36:36]),
    .stat_tlp_hdr_dw(out_vec[35:33]),
    .stat_tlp_req_dw(out_vec[32:22]),
    .stat_tlp_payload_dw(out_vec[21:11]),
    .stat_tlp_cpl_dw(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 132'hf2594e5e71e18a679b4a5a39d20acd251;
    stim[1] = 132'hbaf77d0c2954f469f3715c1449cf30fe9;
    stim[2] = 132'h78332e5bea781afe9c2bd94ed5fcea00b;
    stim[3] = 132'h68863efe6b8b6dec2f7c600e6c4b1e631;
    stim[4] = 132'h33da9bb78b2c2029d6085ca6755331865;
    stim[5] = 132'h31462e37302df3cc7592de38c920c5445;
    stim[6] = 132'h31a40f3bd78079159f5f6fad311b5e29e;
    stim[7] = 132'h00feebe11c1cd4a5e955a63a3e11faf62;
    stim[8] = 132'h2e08d9330aac59adde404bd77a4e214a3;
    stim[9] = 132'h4ff2e4f3ba847492340cef2afd510fdb7;
    stim[10] = 132'h7e35d67a007b4271cd35ec18155bf1b3c;
    stim[11] = 132'h0ae001a1e02635c3c7ea01cebf67be5cd;
    stim[12] = 132'h1a51dd9afa5b1b58ad81b4983cbbbe511;
    stim[13] = 132'h362fcee66a489ac00dca6d674c49f40a7;
    stim[14] = 132'h373dbbb13445dfe9d9e33cc0cd39d4ead;
    stim[15] = 132'h7889b1c53f77316e211238630b3139251;
    stim[16] = 132'h3d959a0c6d9afa52e8bbc15dc2984c5d5;
    stim[17] = 132'h17f6e5b19a1aadffbda6ed604ee0488bf;
    stim[18] = 132'h0da3c5ab27fd55fdeebe513f5f1a3b560;
    stim[19] = 132'h18b067dff9cc329f2139798e55c98e7c2;
    stim[20] = 132'h106a2f50bebd3743b8e2bd74ecdfa9c77;
    stim[21] = 132'h5886a7199a3e589aab9dcc56c17d197ad;
    stim[22] = 132'h63e54ff73957479a6985cb3cde3f2d6fa;
    stim[23] = 132'h2bb0cd83afc5bc3cce4d5daa284283fc7;
    stim[24] = 132'h0fbb780b475c3f648c00516bdb2b3a4ec;
    stim[25] = 132'h737e62b183f4d497936b99a558063ed03;
    stim[26] = 132'h5ec8e138289cb24a1ef59916b5808f0aa;
    stim[27] = 132'h33a4b20e654892fdea1290e4ee3242133;
    stim[28] = 132'h65ddbf52f8fb57f65c3a354f0f1d6ca2b;
    stim[29] = 132'h7f8a1240a886e8e0f8454d782e6edc350;
    stim[30] = 132'h24f536f313fd17acaacd5cdc5ad1183f8;
    stim[31] = 132'h14f89f44cd2a6c92256198fbe11cce51d;
    stim[32] = 132'h7829f6bad0998d5c9e22d027b435f7d4e;
    stim[33] = 132'h12e9750a5ce6e6aa2bfd02812ba06f685;
    stim[34] = 132'h4fac8a19766d1bd91ca7c50ceb0e03190;
    stim[35] = 132'h5be2ae02594ecbf7296e73990a335af02;
    stim[36] = 132'h45e4c0921c7e9a27d08c2cc00d4e779c5;
    stim[37] = 132'h2043439d935c079639395e10896fc5d01;
    stim[38] = 132'h1083e5194a6d5da10f647870ec2bc422a;
    stim[39] = 132'h33a362b69a5e69ffd3e19b2734d686359;
    stim[40] = 132'h4f435589b3c6f3efe09aeefd2ed194c34;
    stim[41] = 132'h1864f99cbdcc1593af8ea90f7027eefae;
    stim[42] = 132'h640b47316a97d1a9937f8067667eb71f4;
    stim[43] = 132'h61c4871bf74b99c5bb2a9f847b20b42b7;
    stim[44] = 132'h67ea543084b621723d2ddbfff8a2c6e67;
    stim[45] = 132'h0f807f1c1b21ced3dd369a5f8ca3c243a;
    stim[46] = 132'h268b75eeb766d709e740c23733ce8bb79;
    stim[47] = 132'h0a5b76a07a9744b4ba8dc460f902aab2a;
    stim[48] = 132'h12e1fd9d074ebeb66e2bbf6a4a9c85be5;
    stim[49] = 132'h494915760c4eaad7232ac69388c9aa0d8;
    stim[50] = 132'h5f174e75b48317972be8f689055834e31;
    stim[51] = 132'h1679e3bd705e6762b2c48ecc07ceb8e67;
    stim[52] = 132'h6eff8aa658f75a2d303e5c96278e86c81;
    stim[53] = 132'h220c4a5e15217df1ad83c63928820a559;
    stim[54] = 132'h25921c229f881b4712831a271d3b3e49a;
    stim[55] = 132'h395027eadc88df5e13b893e3da9f80e8f;
    stim[56] = 132'h10c06c7fa94fdacc28e62eff83e7d4694;
    stim[57] = 132'h3a4cfae60113e527e1acf8fb4b7903126;
    stim[58] = 132'h5e4263e4ae1afb048a3326528046f7d46;
    stim[59] = 132'h1f49c4faf7cb81e68da8f6ef9458b6015;
    stim[60] = 132'h34726890ee8c997cd7893a6918f4446d7;
    stim[61] = 132'h5d09e7faf0233bb563803d6558467adce;
    stim[62] = 132'h52cdb242fcd383c91034187861cec8995;
    stim[63] = 132'h668e3f3a45efa448acd385d6065ba3efd;
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
      expv[0] = 46'h000000000000;
      expv[1] = 46'h000000000000;
      expv[2] = 46'h000000000000;
      expv[3] = 46'h000000000000;
      expv[4] = 46'h000000000000;
      expv[5] = 46'h000000000000;
      expv[6] = 46'h000000000000;
      expv[7] = 46'h000000000000;
      expv[8] = 46'h00080013b800;
      expv[9] = 46'h000000000000;
      expv[10] = 46'h000000000000;
      expv[11] = 46'h001679c00000;
      expv[12] = 46'h000000000000;
      expv[13] = 46'h000000000000;
      expv[14] = 46'h000000000000;
      expv[15] = 46'h0028000e6000;
      expv[16] = 46'h000000000000;
      expv[17] = 46'h000000000000;
      expv[18] = 46'h000000000000;
      expv[19] = 46'h0018d8c00000;
      expv[20] = 46'h000000000000;
      expv[21] = 46'h000000000000;
      expv[22] = 46'h2018a8400000;
      expv[23] = 46'h000000000000;
      expv[24] = 46'h000000000000;
      expv[25] = 46'h000600183800;
      expv[26] = 46'h000000000000;
      expv[27] = 46'h000000000000;
      expv[28] = 46'h000000000000;
      expv[29] = 46'h000000000000;
      expv[30] = 46'h000000000000;
      expv[31] = 46'h000000000000;
      expv[32] = 46'h000000000000;
      expv[33] = 46'h000000000000;
      expv[34] = 46'h0018000ba800;
      expv[35] = 46'h000000000000;
      expv[36] = 46'h000000000000;
      expv[37] = 46'h000000000000;
      expv[38] = 46'h000000000000;
      expv[39] = 46'h000000000000;
      expv[40] = 46'h000000000000;
      expv[41] = 46'h000000000000;
      expv[42] = 46'h000000000000;
      expv[43] = 46'h0218ce400000;
      expv[44] = 46'h000000000000;
      expv[45] = 46'h00060011b800;
      expv[46] = 46'h000600030800;
      expv[47] = 46'h000000000000;
      expv[48] = 46'h000000000000;
      expv[49] = 46'h000000000000;
      expv[50] = 46'h000000000000;
      expv[51] = 46'h000000000000;
      expv[52] = 46'h000000000000;
      expv[53] = 46'h0018de800000;
      expv[54] = 46'h000000000000;
      expv[55] = 46'h000000000000;
      expv[56] = 46'h000000000000;
      expv[57] = 46'h0218001ea800;
      expv[58] = 46'h000000000000;
      expv[59] = 46'h0218000e6000;
      expv[60] = 46'h0018f2400000;
      expv[61] = 46'h000000000000;
      expv[62] = 46'h001800090800;
      expv[63] = 46'h0018fd400000;
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
