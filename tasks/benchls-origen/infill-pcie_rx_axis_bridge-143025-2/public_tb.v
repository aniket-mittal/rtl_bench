// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 87;
  localparam OW = 105;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_143025 dut (
    .user_clk(clk),
    .trn_rd(in_vec[86:23]),
    .trn_rsof(in_vec[22:22]),
    .trn_reof(in_vec[21:21]),
    .trn_rsrc_rdy(in_vec[20:20]),
    .trn_rsrc_dsc(in_vec[19:19]),
    .trn_rrem(in_vec[18:11]),
    .trn_rerrfwd(in_vec[10:10]),
    .trn_rbar_hit(in_vec[9:3]),
    .trn_recrc_err(in_vec[2:2]),
    .user_rst(in_vec[1:1]),
    .m_axis_rx_tready(in_vec[0:0]),
    .m_axis_rx_tdata(out_vec[104:41]),
    .m_axis_rx_tvalid(out_vec[40:40]),
    .m_axis_rx_tkeep(out_vec[39:32]),
    .m_axis_rx_tlast(out_vec[31:31]),
    .m_axis_rx_tuser(out_vec[30:9]),
    .trn_rdst_rdy(out_vec[8:8]),
    .np_counter(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 87'h61602e7f9b953e87f2825f;
    stim[1] = 87'h6c04b3cd149cdd2d9d4663;
    stim[2] = 87'h20a63f5753bf011bd09e69;
    stim[3] = 87'h5a32acd489f859e6c04bc0;
    stim[4] = 87'h059a9478c31e0aafc99c0c;
    stim[5] = 87'h3a9fc322c755192f05bd68;
    stim[6] = 87'h64957666100e4365c0cc28;
    stim[7] = 87'h3e0fd0932d2cfa1277cec0;
    stim[8] = 87'h5c08109bdfaf229947cab4;
    stim[9] = 87'h36c3c6f47ad76311645d39;
    stim[10] = 87'h16bebb782b5f2befb449f9;
    stim[11] = 87'h592b8a731851de112e0d94;
    stim[12] = 87'h741b2ee9c04a0f043ca6d4;
    stim[13] = 87'h5d54eba160c2f18e5fc104;
    stim[14] = 87'h48619ff408b7230da68a24;
    stim[15] = 87'h0ae4ab089520f2a38b7305;
    stim[16] = 87'h2388b06cfab2c9a1e6d514;
    stim[17] = 87'h1b1019539e06580dc0ae91;
    stim[18] = 87'h440e936c8478d7322bd53d;
    stim[19] = 87'h0a46b2380d293f966f2225;
    stim[20] = 87'h748deae783381ee6fb7499;
    stim[21] = 87'h6a3031e8b330821c889e70;
    stim[22] = 87'h7148e354b796e990d1c608;
    stim[23] = 87'h7928ee93c99f23b9d17080;
    stim[24] = 87'h212bb63d646086850eaa28;
    stim[25] = 87'h6010bca81ab8a5e71f21e1;
    stim[26] = 87'h60e15b10d481616d1c8d55;
    stim[27] = 87'h7917fc87c554addeb27e60;
    stim[28] = 87'h37908e4bddb936ff92e020;
    stim[29] = 87'h596b11a5ee29a247a077e5;
    stim[30] = 87'h2c1ea2689c364ab68e49f9;
    stim[31] = 87'h51a17f4c6088c50a96a714;
    stim[32] = 87'h4acc884323f0cbf09dc4d1;
    stim[33] = 87'h43ca9577e3e6c050f03c59;
    stim[34] = 87'h0e90b310d5958f775c403d;
    stim[35] = 87'h3761bd81a3f161b2830fcc;
    stim[36] = 87'h64caabc24b9c0c2c81f939;
    stim[37] = 87'h6d4f55715cc9f8925d22fc;
    stim[38] = 87'h496e3ab1a1ccaa51120ec0;
    stim[39] = 87'h69742066986b2f62fdcc60;
    stim[40] = 87'h63975176f7a682566e537c;
    stim[41] = 87'h022712315e15738508b1bd;
    stim[42] = 87'h6dfb2a1ee96452f3bfe0e5;
    stim[43] = 87'h6db5b528cb72f714955e84;
    stim[44] = 87'h447dd367a515a5536c2735;
    stim[45] = 87'h185e977e6b72a39a05d71d;
    stim[46] = 87'h2c80bc992a075bd894b3d5;
    stim[47] = 87'h341ae56a51a51536c46179;
    stim[48] = 87'h70efbcdb95b318810d207c;
    stim[49] = 87'h3d9f46ee903e6bf3261f11;
    stim[50] = 87'h5a4cf744cabbb2e985ae4c;
    stim[51] = 87'h2fa3ca3da05a9042d303a1;
    stim[52] = 87'h43310141f7c6c3dc700cf0;
    stim[53] = 87'h14f4920874a5d42605b7c8;
    stim[54] = 87'h187a50a94e392500e1335c;
    stim[55] = 87'h50dd4fda0ec8d00872e3bc;
    stim[56] = 87'h07290a533e9f6f9e70614c;
    stim[57] = 87'h363231a66cebebae3ae068;
    stim[58] = 87'h1216d1be95d0bef7d40948;
    stim[59] = 87'h572fb2e96473371dbbaf15;
    stim[60] = 87'h4f82431b9f62495f3e40d8;
    stim[61] = 87'h54c3b34e1b4130aecb8428;
    stim[62] = 87'h1f844832c6506c0b3e35ec;
    stim[63] = 87'h0553317a78466929edc0c4;
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
      expv[0] = 105'hxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 105'hxxxxxxxxxxxxxxxxxxxxxxxxx00;
      expv[2] = 105'hxxxxxxxxxxxxxxxxxxxxxxxxx00;
      expv[3] = 105'h08298fd5d4efc046fff66800101;
      expv[4] = 105'h08298fd5d4efc046eff66800101;
      expv[5] = 105'h08298fd5d4efc046eff66800101;
      expv[6] = 105'h08298fd5d4efc046eff66800101;
      expv[7] = 105'h08298fd5d4efc046eff66800101;
      expv[8] = 105'h08298fd5d4efc046ef9e6800102;
      expv[9] = 105'h08298fd5d4efc046ef9e6800102;
      expv[10] = 105'h08298fd5d4efc046ef966800102;
      expv[11] = 105'h08298fd5d4efc046ef966800102;
      expv[12] = 105'h08298fd5d4efc046ef966800102;
      expv[13] = 105'h08298fd5d4efc046ef966800102;
      expv[14] = 105'h17553ae85830bc639ff10400102;
      expv[15] = 105'h17553ae85830bc638ff10400102;
      expv[16] = 105'h17553ae85830bc638ff10400102;
      expv[17] = 105'h17553ae85830bc638ff10400102;
      expv[18] = 105'h17553ae85830bc638ff10400102;
      expv[19] = 105'h17553ae85830bc638ff10400102;
      expv[20] = 105'h17553ae85830bc638ff10400102;
      expv[21] = 105'h17553ae85830bc6386e90400102;
      expv[22] = 105'h17553ae85830bc6386e90400102;
      expv[23] = 105'h17553ae85830bc6386e90400103;
      expv[24] = 105'h17553ae85830bc6386e90400104;
      expv[25] = 105'h17553ae85830bc6386e90400104;
      expv[26] = 105'h17553ae85830bc6386e10400104;
      expv[27] = 105'h17553ae85830bc6386e10400104;
      expv[28] = 105'h17553ae85830bc6386e10400104;
      expv[29] = 105'h17553ae85830bc6386e10400104;
      expv[30] = 105'h17553ae85830bc6386e10400104;
      expv[31] = 105'h17553ae85830bc6386e10400104;
      expv[32] = 105'h17553ae85830bc6386e10400104;
      expv[33] = 105'h17553ae85830bc6386e10400104;
      expv[34] = 105'h10f2a55df8f9b0143ff45800105;
      expv[35] = 105'h03a42cc4356563dddff45800105;
      expv[36] = 105'h03a42cc4356563ddcff45800105;
      expv[37] = 105'h03a42cc4356563ddcff45800105;
      expv[38] = 105'h1b53d55c57327e248ff45800105;
      expv[39] = 105'h125b8eac68732a944ff45800105;
      expv[40] = 105'h125b8eac68732a944b9c5800105;
      expv[41] = 105'h125b8eac68732a944b9c5800105;
      expv[42] = 105'h125b8eac68732a944b945800105;
      expv[43] = 105'h125b8eac68732a944b945800105;
      expv[44] = 105'h125b8eac68732a944b945800105;
      expv[45] = 105'h125b8eac68732a944b945800105;
      expv[46] = 105'h125b8eac68732a944b945800105;
      expv[47] = 105'h125b8eac68732a944b945800105;
      expv[48] = 105'h125b8eac68732a944b945800105;
      expv[49] = 105'h125b8eac68732a944b945800105;
      expv[50] = 105'h125b8eac68732a944b945800105;
      expv[51] = 105'h125b8eac68732a944b945800105;
      expv[52] = 105'h0be8f28f6816a410bff3a000106;
      expv[53] = 105'h0be8f28f6816a410b01ba000107;
      expv[54] = 105'h0be8f28f6816a410b01ba000107;
      expv[55] = 105'h0be8f28f6816a410b01ba000107;
      expv[56] = 105'h0be8f28f6816a410b01ba000108;
      expv[57] = 105'h0be8f28f6816a410b01ba000109;
      expv[58] = 105'h0be8f28f6816a410b01ba000109;
      expv[59] = 105'h0be8f28f6816a410b01ba00010a;
      expv[60] = 105'h0be8f28f6816a410a013a00010a;
      expv[61] = 105'h0be8f28f6816a410a013a00010a;
      expv[62] = 105'h0be8f28f6816a410a013a00010a;
      expv[63] = 105'h0be8f28f6816a410a013a00010a;
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
