// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 148;
  localparam OW = 81;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01166 dut (
    .clk_memory(clk),
    .bram_dout(in_vec[147:84]),
    .addr(in_vec[83:66]),
    .cache(in_vec[65:2]),
    .cready(in_vec[1:1]),
    .aresetn(in_vec[0:0]),
    .bram_addr(out_vec[80:68]),
    .bram_clk(out_vec[67:67]),
    .bram_rst(out_vec[66:66]),
    .bram_din(out_vec[65:2]),
    .bram_en(out_vec[1:1]),
    .bram_we(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 148'hce7a6567cb7e5ff9cd53248d088a9b7d82146;
    stim[1] = 148'h246f115799f216dd6f6e765b416272d937a42;
    stim[2] = 148'hf560fbf588058e93c6433ef378af9bd878cf5;
    stim[3] = 148'he10cb5271eeacd9f318d7e7e723b1751643ad;
    stim[4] = 148'h8abe27ca19989b76a913f5bd501504a5b3ab3;
    stim[5] = 148'h334805b15dee2dd4bdf6918696d6cb89e2a15;
    stim[6] = 148'h92d451057b5bcdfb3259418a9b38177b783f3;
    stim[7] = 148'h42b47011c29b9dce4df22e6cedd421c44e98f;
    stim[8] = 148'h693de026f5130336b09797d62c4653f6fb635;
    stim[9] = 148'hcf1f846a7f2cd4a1d00a6226b74d0cf93c86d;
    stim[10] = 148'hbf33d4471703d1ef35040ed54d19ff489c3fb;
    stim[11] = 148'hcea2a9d8f8b1063e26c5e2ce35e06b69eab31;
    stim[12] = 148'h6a559b4a358e245906c9f9ae073358130dfd7;
    stim[13] = 148'hbf694ce6f9cc1b15d7114ece3155189993945;
    stim[14] = 148'h3a97df3ceaca1feb1a5788cb5712a55cddfd9;
    stim[15] = 148'h943eac80676bb2adc0de73cf74444425f402d;
    stim[16] = 148'h9c1d58e38a4f731dfb4bbd6a2644c68050849;
    stim[17] = 148'h46bbd7aebbf4a1037de181ca01a6ea93d4219;
    stim[18] = 148'h28eee7ba4f387996cff0a3be392f38c1fae2f;
    stim[19] = 148'h194e4bbedd45ed2febae5cf6f160912ae571b;
    stim[20] = 148'h23974d1b59c02d9ae1abe6047e7805a36b445;
    stim[21] = 148'hadfdfbf816dd788dc2d37501984f768e26639;
    stim[22] = 148'h748c07a83dff36255dcfa9822022a7f076d65;
    stim[23] = 148'h25d7b59340dcb92d3d3950c24da0a0f36f807;
    stim[24] = 148'hb8c3f10c1a4ec06da34c39719a3d725da8195;
    stim[25] = 148'hc6bab4cb9c43d840d90549e134265962a354b;
    stim[26] = 148'hc50ccb4c97acb246f86a4f4ed4c46b91424b9;
    stim[27] = 148'h6808fb5a5d6f474602f5dfe3028c6840057e9;
    stim[28] = 148'hd731301d68638e819aca1a9179fc6d80a94c3;
    stim[29] = 148'h1542fa379cc2689b51351356e10f23c5f7e89;
    stim[30] = 148'h7f2dc45517b792e4f854bd7fa5001c93cdced;
    stim[31] = 148'h55b01cf05bd19a8c98fd06709f3f5d1c78a4d;
    stim[32] = 148'hfe8a7e359772b7876f6c92f01e8a4b31b73bb;
    stim[33] = 148'hea1f60f8111e6ac9375b03d2711dc952faf93;
    stim[34] = 148'h035f8c5de99bef3897c87a8cb246908bb7163;
    stim[35] = 148'hee8b4d92f0a55104bacd1234dccb1fcac511b;
    stim[36] = 148'hc1df3d17fa846b665f24f045e236b9f352a77;
    stim[37] = 148'h2ad06c07138c62ca32be53aecef9dad55d64b;
    stim[38] = 148'h46680e804adc105eb9a5ff8884c3bb9cbee5b;
    stim[39] = 148'hbf1882b4e024fb2cc4c498681db680c907259;
    stim[40] = 148'hdf28e0176ae354343a2b9ffdec2365116cef3;
    stim[41] = 148'h7f19caec5b2b70b2e4596754ab89fbfb3bb95;
    stim[42] = 148'ha06cddf9c84b8e1d12fc15578ab9b93bc595d;
    stim[43] = 148'h9a73ed29107f9068535c04757883c1a5cc135;
    stim[44] = 148'haf8bbd7477da2d165f8b99a997f9e9c3eecc5;
    stim[45] = 148'h0cb7c243058cf78f2300526b5e80e3ce5e3c3;
    stim[46] = 148'ha613bcce88845ef3bc4b3ed1d34265646e4c9;
    stim[47] = 148'hfa3f7c38f946180364a95df5d07e0cf9f482d;
    stim[48] = 148'h0e7f29753703714f543fd8a5487087519a6bf;
    stim[49] = 148'h281f840cf644e8ccee4852801d97e186e10d3;
    stim[50] = 148'h7b066b08af957eeae3895668693722e79eb21;
    stim[51] = 148'h83161dc0d13ca539731addb385ad7a8db6e9d;
    stim[52] = 148'heed52a602d58915e0148c99cafecc308e957d;
    stim[53] = 148'h7482494982389ab8ccac49e4616259715c921;
    stim[54] = 148'hd0334c7827710f2a1f7b76be1f60eafd57383;
    stim[55] = 148'h1d148dc379008dfc9d875a5878934ad780a11;
    stim[56] = 148'h2ad5e29e1cbcfb230cd42829b49a5a2f955a3;
    stim[57] = 148'h8cf946e69f10937ed66e696cbc21aa3bd42cd;
    stim[58] = 148'ha5cee3c4af4d06f07d7e899cb2443b698089f;
    stim[59] = 148'h61f4e8405a7ab40347c40f7d97ad51a5fdecb;
    stim[60] = 148'h663f9e58e0717f26e3790af0e7df4406d105b;
    stim[61] = 148'h4d3e628d4d208ad7d786b95d2d010fdf78987;
    stim[62] = 148'h71638fdd75280675470d4c87f5172c743008d;
    stim[63] = 148'hfe5ad0d4f97668d2e2b7e0c1bc23b54515a21;
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
      expv[0] = 81'h000000000000000000000;
      expv[1] = 81'h000000000000000000000;
      expv[2] = 81'h000000000000000000000;
      expv[3] = 81'h000000000000000000000;
      expv[4] = 81'h000000000000000000000;
      expv[5] = 81'h044fb5bd501504a5b3ab3;
      expv[6] = 81'h044fb5bd501504a5b3ab3;
      expv[7] = 81'h0965818a9b38177b783f3;
      expv[8] = 81'h17c8ae6cedd421c44e98f;
      expv[9] = 81'h17c8ae6cedd421c44e98f;
      expv[10] = 81'h17c8ae6cedd421c44e98f;
      expv[11] = 81'h14108ed54d19ff489c3fb;
      expv[12] = 81'h14108ed54d19ff489c3fb;
      expv[13] = 81'h1b27b9ae073358130dfd7;
      expv[14] = 81'h1b27b9ae073358130dfd7;
      expv[15] = 81'h1b27b9ae073358130dfd7;
      expv[16] = 81'h1b27b9ae073358130dfd7;
      expv[17] = 81'h1b27b9ae073358130dfd7;
      expv[18] = 81'h1b27b9ae073358130dfd7;
      expv[19] = 81'h1fc2a3be392f38c1fae2f;
      expv[20] = 81'h0eb99cf6f160912ae571b;
      expv[21] = 81'h0eb99cf6f160912ae571b;
      expv[22] = 81'h0eb99cf6f160912ae571b;
      expv[23] = 81'h0eb99cf6f160912ae571b;
      expv[24] = 81'h14e590c24da0a0f36f807;
      expv[25] = 81'h14e590c24da0a0f36f807;
      expv[26] = 81'h041589e134265962a354b;
      expv[27] = 81'h041589e134265962a354b;
      expv[28] = 81'h041589e134265962a354b;
      expv[29] = 81'h0b289a9179fc6d80a94c3;
      expv[30] = 81'h0b289a9179fc6d80a94c3;
      expv[31] = 81'h0b289a9179fc6d80a94c3;
      expv[32] = 81'h0b289a9179fc6d80a94c3;
      expv[33] = 81'h1db292f01e8a4b31b73bb;
      expv[34] = 81'h1d6c83d2711dc952faf93;
      expv[35] = 81'h1f21ba8cb246908bb7163;
      expv[36] = 81'h0b349234dccb1fcac511b;
      expv[37] = 81'h1c93b045e236b9f352a77;
      expv[38] = 81'h0af993aecef9dad55d64b;
      expv[39] = 81'h0697bf8884c3bb9cbee5b;
      expv[40] = 81'h0697bf8884c3bb9cbee5b;
      expv[41] = 81'h08ae9ffdec2365116cef3;
      expv[42] = 81'h08ae9ffdec2365116cef3;
      expv[43] = 81'h08ae9ffdec2365116cef3;
      expv[44] = 81'h08ae9ffdec2365116cef3;
      expv[45] = 81'h08ae9ffdec2365116cef3;
      expv[46] = 81'h0c01926b5e80e3ce5e3c3;
      expv[47] = 81'h0c01926b5e80e3ce5e3c3;
      expv[48] = 81'h0c01926b5e80e3ce5e3c3;
      expv[49] = 81'h10ff98a5487087519a6bf;
      expv[50] = 81'h192192801d97e186e10d3;
      expv[51] = 81'h192192801d97e186e10d3;
      expv[52] = 81'h192192801d97e186e10d3;
      expv[53] = 81'h192192801d97e186e10d3;
      expv[54] = 81'h192192801d97e186e10d3;
      expv[55] = 81'h1dedb6be1f60eafd57383;
      expv[56] = 81'h1dedb6be1f60eafd57383;
      expv[57] = 81'h1350a829b49a5a2f955a3;
      expv[58] = 81'h1350a829b49a5a2f955a3;
      expv[59] = 81'h15fa899cb2443b698089f;
      expv[60] = 81'h1f108f7d97ad51a5fdecb;
      expv[61] = 81'h0de48af0e7df4406d105b;
      expv[62] = 81'h1e1ab95d2d010fdf78987;
      expv[63] = 81'h1e1ab95d2d010fdf78987;
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
