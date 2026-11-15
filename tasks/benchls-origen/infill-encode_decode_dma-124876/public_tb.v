// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 95;
  localparam OW = 76;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_124876 dut (
    .wb_clk_i(clk),
    .m_reset(in_vec[94:94]),
    .m_enable(in_vec[93:93]),
    .dc(in_vec[92:69]),
    .m_src(in_vec[68:5]),
    .m_src_last(in_vec[4:4]),
    .m_src_almost_empty(in_vec[3:3]),
    .m_src_empty(in_vec[2:2]),
    .m_dst_almost_full(in_vec[1:1]),
    .m_dst_full(in_vec[0:0]),
    .m_src_getn(out_vec[75:75]),
    .m_dst_putn(out_vec[74:74]),
    .m_dst(out_vec[73:10]),
    .m_dst_last(out_vec[9:9]),
    .m_endn(out_vec[8:8]),
    .m_cap(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 95'h7fc3ad0bf29729e0bc26048a;
    stim[1] = 95'h6d17a07c3eea8fe590d63e33;
    stim[2] = 95'h16a18fbcce86ade42378164c;
    stim[3] = 95'h12f7317fa134f62062679277;
    stim[4] = 95'h3105e9102f38abc232c1e460;
    stim[5] = 95'h0972cf6f806cf9d73d53cbbb;
    stim[6] = 95'h37273c340649dad0ce3e74dc;
    stim[7] = 95'h180a04c21517016f7a9713fe;
    stim[8] = 95'h2bfbb78ee1cbba5e4f87d8f8;
    stim[9] = 95'h1176e9867fe770103439a671;
    stim[10] = 95'h3a1747e349b41f7cc76513d1;
    stim[11] = 95'h2fd89c8180ea3685066471dc;
    stim[12] = 95'h05948482b3ce4fb9138714a3;
    stim[13] = 95'h0224c50f008aac6664f71698;
    stim[14] = 95'h24c41f140755ff97cdaaea73;
    stim[15] = 95'h23a34d2259f860cbfe8a0775;
    stim[16] = 95'h33b8c5c2e8906fdd9fea870d;
    stim[17] = 95'h17b2833074e7b1903b9253b2;
    stim[18] = 95'h3855cd3c446dace00102e23e;
    stim[19] = 95'h0e61bc4cc42051af8047d6a3;
    stim[20] = 95'h38ce154cb23edea1a64dfc20;
    stim[21] = 95'h365fb322d9930577127b527f;
    stim[22] = 95'h0ebc7f37c473a85ef3730c27;
    stim[23] = 95'h177321313fba6860bfc203d8;
    stim[24] = 95'h1ec6ca691d2bf8451b5a154d;
    stim[25] = 95'h3bca4aa3cf1939058f7194fc;
    stim[26] = 95'h12e75fbd6cdbd4f6ee0dc194;
    stim[27] = 95'h22204046181723fd8f5f9a8f;
    stim[28] = 95'h03f0a9852cb2f3292131e4d7;
    stim[29] = 95'h0a2163726f8e92b96da31f10;
    stim[30] = 95'h28f60ba28032a1731516c641;
    stim[31] = 95'h1ad831ebe36f08792a0a32bd;
    stim[32] = 95'h0231a85c63db9925a856f987;
    stim[33] = 95'h155d9821dbeeb3715f0d94e5;
    stim[34] = 95'h21a8faf3aa55bf652b2221bd;
    stim[35] = 95'h3a0478666e2909f8f127025b;
    stim[36] = 95'h1572501c53fd78764f372b53;
    stim[37] = 95'h17c1c8bd06b855ce3d71fb4c;
    stim[38] = 95'h1840ac2747c897a2aeb27182;
    stim[39] = 95'h328a745547bfe3814b5a92d3;
    stim[40] = 95'h20b9a4eb3fc12358cdf9335b;
    stim[41] = 95'h01026520b6e3b791c0aabe24;
    stim[42] = 95'h32289210cb178c7b385b7305;
    stim[43] = 95'h0f383ecfd1664e8e741649dd;
    stim[44] = 95'h2c4ece709553d598dedafd6a;
    stim[45] = 95'h165167d4896febfe7c5a2e81;
    stim[46] = 95'h11cb7df0290d6a5593b6f46f;
    stim[47] = 95'h2b373aa443dd33efed977543;
    stim[48] = 95'h2e00064b9f673cfddc13127f;
    stim[49] = 95'h3329cf25a8c1f59bf6c22e92;
    stim[50] = 95'h247f32b70381b43f8e16b38f;
    stim[51] = 95'h2b81155cc3f0517301b91b83;
    stim[52] = 95'h16bffbf8f2ecfeca3bf2883e;
    stim[53] = 95'h13a7c63ba164e614d8947c92;
    stim[54] = 95'h159274b2b5257775dd752d09;
    stim[55] = 95'h1061bcf22715ef7f8dc96a28;
    stim[56] = 95'h015fe3bcffb874f482d91349;
    stim[57] = 95'h2beae82b509d4866adbfb7a3;
    stim[58] = 95'h230c8ec55f5a7e78460347d1;
    stim[59] = 95'h31c96b9112bda31e546fd8f9;
    stim[60] = 95'h0ddd13a4ca9c66e89a25717e;
    stim[61] = 95'h0854a6eb01f60b0bc6ea4709;
    stim[62] = 95'h23849add86f8e0eeeeef6b62;
    stim[63] = 95'h1878de93650ae6dd2c50f194;
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
      expv[0] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[1] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[2] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[3] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[4] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[5] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[6] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[7] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[8] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[9] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[10] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[11] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[12] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[13] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[14] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[15] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[16] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[17] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[18] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[19] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[20] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[21] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[22] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[23] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[24] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[25] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[26] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[27] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[28] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[29] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[30] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[31] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[32] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[33] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[34] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[35] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[36] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[37] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[38] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[39] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[40] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[41] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[42] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[43] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[44] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[45] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[46] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[47] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[48] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[49] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[50] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[51] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[52] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[53] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[54] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[55] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[56] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[57] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[58] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[59] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[60] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[61] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[62] = 76'hxxxxxxxxxxxxxxxxx00;
      expv[63] = 76'hxxxxxxxxxxxxxxxxx00;
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
