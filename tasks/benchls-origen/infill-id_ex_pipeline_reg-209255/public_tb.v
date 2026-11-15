// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 121;
  localparam OW = 119;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_209255 dut (
    .clk_i(clk),
    .rst_i(in_vec[120:120]),
    .halt_i(in_vec[119:119]),
    .WB_i(in_vec[118:117]),
    .M_i(in_vec[116:115]),
    .EX_i(in_vec[114:111]),
    .data1_i(in_vec[110:79]),
    .data2_i(in_vec[78:47]),
    .signextend_i(in_vec[46:15]),
    .rs_i(in_vec[14:10]),
    .rt_i(in_vec[9:5]),
    .rd_i(in_vec[4:0]),
    .WB_o(out_vec[118:117]),
    .M_o(out_vec[116:115]),
    .EX_o(out_vec[114:111]),
    .data1_o(out_vec[110:79]),
    .data2_o(out_vec[78:47]),
    .signextend_o(out_vec[46:15]),
    .rs_o(out_vec[14:10]),
    .rt_o(out_vec[9:5]),
    .rd_o(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 121'h17dfdffd318e7b737ff38fb588dfb89;
    stim[1] = 121'h1522d9dde6bfaaed1b0cdde4340f890;
    stim[2] = 121'h00d06a365a2ab550af34ec38d722c6f;
    stim[3] = 121'h06760fe7f04930f0fcccf18dbe5cd7d;
    stim[4] = 121'h0f0551b335c8848f6be9688cb3513ce;
    stim[5] = 121'h0b79510c77598fc7bb37ec61b0c63e4;
    stim[6] = 121'h060bfe14626632a3736b83ef8546791;
    stim[7] = 121'h04fa80767d91b563a548085eb589ca9;
    stim[8] = 121'h0549a3edb629f897bec4317fcb8a8dc;
    stim[9] = 121'h059842b07b237a8808b8ca5425b36cb;
    stim[10] = 121'h09a4a2d5cde7ffa994c7418c86e8a56;
    stim[11] = 121'h015cff3a023b5aba342238288fc297f;
    stim[12] = 121'h0ad806f7fe3bc045339571424950676;
    stim[13] = 121'h05d1ae2cf524cd896a2dfb0a669afff;
    stim[14] = 121'h03e9518009cd88e48254541eb0aebca;
    stim[15] = 121'h0f0ab2f462ba81536cbae8953ac3b81;
    stim[16] = 121'h0a0af3bbc9ef65e2329918f20c6a62c;
    stim[17] = 121'h0fcd901875b65c24e9e7fc9f7b5fc7a;
    stim[18] = 121'h045f0897681157340b565596c659ef4;
    stim[19] = 121'h0cd25685b53e76701bd7f12de15f0fe;
    stim[20] = 121'h0fdb1dc3cc58182505429b4a4f6b639;
    stim[21] = 121'h09e654e7abbf43a388964311ad8fae9;
    stim[22] = 121'h05239fd67c92a479e054993dbf9a738;
    stim[23] = 121'h0f7adbc03e892529429ca6e38d8e29d;
    stim[24] = 121'h0a6ad8c930c9ec5d5e1a6109b3a4e18;
    stim[25] = 121'h063c145f049bba65837f7bed8cd288e;
    stim[26] = 121'h0c945605d9fe2ea8731e7a02e661ad8;
    stim[27] = 121'h09ea8a7682bd25c37c139c90bb141ac;
    stim[28] = 121'h0c955548f509751dd4d689b6d37eff3;
    stim[29] = 121'h0f7ee4c63d40068a48b50328628ed65;
    stim[30] = 121'h00cdbd3a4c001e992dd9f637df660f7;
    stim[31] = 121'h0b4e44b7019397617b6b8aa94aa05a1;
    stim[32] = 121'h0f15a7960bf6370b89dea714f410053;
    stim[33] = 121'h089ac9359a2a6c4c8f5e9afb428bc11;
    stim[34] = 121'h0bb5ea3292f3e822f66dd5fd2547562;
    stim[35] = 121'h0756a1f307d104ff5ca4e7d6fb3780c;
    stim[36] = 121'h08a0061bfa92187c6893f4c6cb72ce0;
    stim[37] = 121'h0e3d75bca9f8aed665ad826bdcfafcc;
    stim[38] = 121'h03b3a020ae6529fe2f138b4d41596be;
    stim[39] = 121'h0579b60fae823e7d85f2442a7b01762;
    stim[40] = 121'h0dc1eeaed7efd48057337adda3dc672;
    stim[41] = 121'h095466d8e9055ea4322e7c33d748aff;
    stim[42] = 121'h09adfcd1d70d0317cf9153e735f060b;
    stim[43] = 121'h0b5848bb15c033d9db54e57562bd35b;
    stim[44] = 121'h074574295d108539e0393743053c232;
    stim[45] = 121'h0e8f5d0ed233ecb8206451ba67c8b4d;
    stim[46] = 121'h0e6501b72e0d85111924f20f00556a1;
    stim[47] = 121'h1876c8f4fafcfb26e6c66b40d1e5322;
    stim[48] = 121'h0122badd7c604e2641709431b6d5768;
    stim[49] = 121'h0f5029c1c23135cd00b809471d1f04f;
    stim[50] = 121'h0eb89b283154a660889fda0f3c388c2;
    stim[51] = 121'h0a620a043dc8a7fccd46d7b0bc88f78;
    stim[52] = 121'h03b6f696501eef621a9f2765055c5f5;
    stim[53] = 121'h0068be2c37379847fb93e745598fbab;
    stim[54] = 121'h0f6e221e1c2c906eb086f5c898f8411;
    stim[55] = 121'h00b2b66c376c2b3659db3bb8b59267e;
    stim[56] = 121'h05297de21603e188d6f3e0924c2f493;
    stim[57] = 121'h076e9faf0ee307cea19081d6eb8fe2c;
    stim[58] = 121'h08f52aa0756977256b1ad4ced5f140c;
    stim[59] = 121'h0305385da641185286b10d834be06bb;
    stim[60] = 121'h0306b3e9ab460abd4d010eaa4d618f4;
    stim[61] = 121'h0798e5425b0b72047e1f43fd34910c7;
    stim[62] = 121'h0659c828f070093cfaa6b018184e932;
    stim[63] = 121'h0868b8ab9653df087782a011925e497;
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
      expv[0] = 119'h000000000000000000000000000000;
      expv[1] = 119'h000000000000000000000000000000;
      expv[2] = 119'h000000000000000000000000000000;
      expv[3] = 119'h0d06a365a2ab550af34ec38d722c6f;
      expv[4] = 119'h6760fe7f04930f0fcccf18dbe5cd7d;
      expv[5] = 119'h6760fe7f04930f0fcccf18dbe5cd7d;
      expv[6] = 119'h6760fe7f04930f0fcccf18dbe5cd7d;
      expv[7] = 119'h60bfe14626632a3736b83ef8546791;
      expv[8] = 119'h4fa80767d91b563a548085eb589ca9;
      expv[9] = 119'h549a3edb629f897bec4317fcb8a8dc;
      expv[10] = 119'h59842b07b237a8808b8ca5425b36cb;
      expv[11] = 119'h59842b07b237a8808b8ca5425b36cb;
      expv[12] = 119'h15cff3a023b5aba342238288fc297f;
      expv[13] = 119'h15cff3a023b5aba342238288fc297f;
      expv[14] = 119'h5d1ae2cf524cd896a2dfb0a669afff;
      expv[15] = 119'h3e9518009cd88e48254541eb0aebca;
      expv[16] = 119'h3e9518009cd88e48254541eb0aebca;
      expv[17] = 119'h3e9518009cd88e48254541eb0aebca;
      expv[18] = 119'h3e9518009cd88e48254541eb0aebca;
      expv[19] = 119'h45f0897681157340b565596c659ef4;
      expv[20] = 119'h45f0897681157340b565596c659ef4;
      expv[21] = 119'h45f0897681157340b565596c659ef4;
      expv[22] = 119'h45f0897681157340b565596c659ef4;
      expv[23] = 119'h5239fd67c92a479e054993dbf9a738;
      expv[24] = 119'h5239fd67c92a479e054993dbf9a738;
      expv[25] = 119'h5239fd67c92a479e054993dbf9a738;
      expv[26] = 119'h63c145f049bba65837f7bed8cd288e;
      expv[27] = 119'h63c145f049bba65837f7bed8cd288e;
      expv[28] = 119'h63c145f049bba65837f7bed8cd288e;
      expv[29] = 119'h63c145f049bba65837f7bed8cd288e;
      expv[30] = 119'h63c145f049bba65837f7bed8cd288e;
      expv[31] = 119'h0cdbd3a4c001e992dd9f637df660f7;
      expv[32] = 119'h0cdbd3a4c001e992dd9f637df660f7;
      expv[33] = 119'h0cdbd3a4c001e992dd9f637df660f7;
      expv[34] = 119'h0cdbd3a4c001e992dd9f637df660f7;
      expv[35] = 119'h0cdbd3a4c001e992dd9f637df660f7;
      expv[36] = 119'h756a1f307d104ff5ca4e7d6fb3780c;
      expv[37] = 119'h756a1f307d104ff5ca4e7d6fb3780c;
      expv[38] = 119'h756a1f307d104ff5ca4e7d6fb3780c;
      expv[39] = 119'h3b3a020ae6529fe2f138b4d41596be;
      expv[40] = 119'h579b60fae823e7d85f2442a7b01762;
      expv[41] = 119'h579b60fae823e7d85f2442a7b01762;
      expv[42] = 119'h579b60fae823e7d85f2442a7b01762;
      expv[43] = 119'h579b60fae823e7d85f2442a7b01762;
      expv[44] = 119'h579b60fae823e7d85f2442a7b01762;
      expv[45] = 119'h74574295d108539e0393743053c232;
      expv[46] = 119'h74574295d108539e0393743053c232;
      expv[47] = 119'h000000000000000000000000000000;
      expv[48] = 119'h000000000000000000000000000000;
      expv[49] = 119'h122badd7c604e2641709431b6d5768;
      expv[50] = 119'h122badd7c604e2641709431b6d5768;
      expv[51] = 119'h122badd7c604e2641709431b6d5768;
      expv[52] = 119'h122badd7c604e2641709431b6d5768;
      expv[53] = 119'h3b6f696501eef621a9f2765055c5f5;
      expv[54] = 119'h068be2c37379847fb93e745598fbab;
      expv[55] = 119'h068be2c37379847fb93e745598fbab;
      expv[56] = 119'h0b2b66c376c2b3659db3bb8b59267e;
      expv[57] = 119'h5297de21603e188d6f3e0924c2f493;
      expv[58] = 119'h76e9faf0ee307cea19081d6eb8fe2c;
      expv[59] = 119'h76e9faf0ee307cea19081d6eb8fe2c;
      expv[60] = 119'h305385da641185286b10d834be06bb;
      expv[61] = 119'h306b3e9ab460abd4d010eaa4d618f4;
      expv[62] = 119'h798e5425b0b72047e1f43fd34910c7;
      expv[63] = 119'h659c828f070093cfaa6b018184e932;
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
