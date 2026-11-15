// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 82;
  localparam OW = 52;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00445 dut (
    .clk(clk),
    .rst(in_vec[81:81]),
    .flush_i(in_vec[80:80]),
    .adv_i(in_vec[79:79]),
    .start_i(in_vec[78:78]),
    .is_sub_i(in_vec[77:77]),
    .signa_i(in_vec[76:76]),
    .exp10a_i(in_vec[75:66]),
    .fract24a_i(in_vec[65:42]),
    .infa_i(in_vec[41:41]),
    .signb_i(in_vec[40:40]),
    .exp10b_i(in_vec[39:30]),
    .fract24b_i(in_vec[29:6]),
    .infb_i(in_vec[5:5]),
    .snan_i(in_vec[4:4]),
    .qnan_i(in_vec[3:3]),
    .anan_sign_i(in_vec[2:2]),
    .addsub_agtb_i(in_vec[1:1]),
    .addsub_aeqb_i(in_vec[0:0]),
    .add_rdy_o(out_vec[51:51]),
    .add_sign_o(out_vec[50:50]),
    .add_sub_0_o(out_vec[49:49]),
    .add_shr_o(out_vec[48:48]),
    .add_shl_o(out_vec[47:43]),
    .add_exp10sh0_o(out_vec[42:33]),
    .add_fract28_o(out_vec[32:5]),
    .add_inv_o(out_vec[4:4]),
    .add_inf_o(out_vec[3:3]),
    .add_snan_o(out_vec[2:2]),
    .add_qnan_o(out_vec[1:1]),
    .add_anan_sign_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 82'h3214046061d04a7c9d0a6;
    stim[1] = 82'h2d2e31611a312a07759d4;
    stim[2] = 82'h03fd3cf73c799e416b173;
    stim[3] = 82'h1cbe27f0c579dc38aa3a1;
    stim[4] = 82'h0f00eddba6d82536e2200;
    stim[5] = 82'h096fe7db96d82a8c65234;
    stim[6] = 82'h19f739d2067b54f2d2bb2;
    stim[7] = 82'h12b2811f4259148876866;
    stim[8] = 82'h14ec2c52e9601171cc328;
    stim[9] = 82'h16c3c9650e7eda93617cf;
    stim[10] = 82'h15a09341a2b7ed43647e3;
    stim[11] = 82'h1f2cc25aa081fe85b85ac;
    stim[12] = 82'h1b4d40d18f3b05edd2012;
    stim[13] = 82'h0e4eb994f5ff6a7390441;
    stim[14] = 82'h0e9aeb38a25db29747da4;
    stim[15] = 82'h074862ef7742bd832231e;
    stim[16] = 82'h1bc0aa2a44a55787db165;
    stim[17] = 82'h1db766808ec722ca8dd8c;
    stim[18] = 82'h1e3c87b47cd045eab7ce3;
    stim[19] = 82'h1bbb31f7b090a39315a2c;
    stim[20] = 82'h043ecaf8ff9df3bec9f93;
    stim[21] = 82'h0b744deb918b82a402aac;
    stim[22] = 82'h1eae7f3025b122bffd36a;
    stim[23] = 82'h1e8853e8083683a31fac8;
    stim[24] = 82'h0b32530b3e19b0923aa5c;
    stim[25] = 82'h0763801019c0f86721ef0;
    stim[26] = 82'h02540706c530af8df4057;
    stim[27] = 82'h0f6f78a490063e7b0cc6b;
    stim[28] = 82'h0b18b2f5b7448533b6ce0;
    stim[29] = 82'h0084a0b70c6c29ea31665;
    stim[30] = 82'h07374746df92849cff316;
    stim[31] = 82'h12316a2f19c1d33e0e00d;
    stim[32] = 82'h147f55288e9458925631f;
    stim[33] = 82'h1bcd8ec58c608e860327e;
    stim[34] = 82'h15626e5e6e80289b5e648;
    stim[35] = 82'h0b71c16ffa411b7f91773;
    stim[36] = 82'h17103f793e04144f79749;
    stim[37] = 82'h1ebbb9a0ee41e0acaa218;
    stim[38] = 82'h019cb4da544c3ecd405a1;
    stim[39] = 82'h1cb35c97d1b29ae53897f;
    stim[40] = 82'h11b431ed3bd459d712d62;
    stim[41] = 82'h0c8f51a07024bd2846fe5;
    stim[42] = 82'h320b7d94e806087e11822;
    stim[43] = 82'h046e236e1b5ac8a3c09a1;
    stim[44] = 82'h16bb232d0531b84c11e63;
    stim[45] = 82'h020c93c81c8db1a426097;
    stim[46] = 82'h005e642b8549f02365165;
    stim[47] = 82'h1eef391bee39dd65056b9;
    stim[48] = 82'h143b1f8d5d3b975fcd9a0;
    stim[49] = 82'h1d82c1b0d6588ed9cd161;
    stim[50] = 82'h1ea5bbc2160d4e6ec22bf;
    stim[51] = 82'h1abafc5261e44443c34c4;
    stim[52] = 82'h1abb53e2b10824027fae8;
    stim[53] = 82'h0680c941f48a2c118cfd1;
    stim[54] = 82'h059d0cca42de9af2eba52;
    stim[55] = 82'h133745779ef4ca765f0c1;
    stim[56] = 82'h12bdcff548bc2ae046393;
    stim[57] = 82'h1210d46a1e91588831e22;
    stim[58] = 82'h18f98248847101a2afdd7;
    stim[59] = 82'h0c8d42f1382993fd72306;
    stim[60] = 82'h1c22b0638881be4ca2515;
    stim[61] = 82'h081ab008d895d712874e5;
    stim[62] = 82'h140e19086a984656766fd;
    stim[63] = 82'h01685def5de0c01debdb0;
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
      expv[0] = 52'hxxxxxxxxxxxxx;
      expv[1] = 52'hxxxxxxxxxxxxx;
      expv[2] = 52'hxxxxxxxxxxxxx;
      expv[3] = 52'hxxxxxxxxxxxxx;
      expv[4] = 52'hxxxxxxxxxxxxx;
      expv[5] = 52'h400940000000d;
      expv[6] = 52'h604ee00000018;
      expv[7] = 52'h00c124db887e0;
      expv[8] = 52'h00c124db887e0;
      expv[9] = 52'h00c124db887e0;
      expv[10] = 52'h00c124db887e0;
      expv[11] = 52'h00c124db887e0;
      expv[12] = 52'h404140000000d;
      expv[13] = 52'h407b80000000c;
      expv[14] = 52'h400fe0000000b;
      expv[15] = 52'h4026a0000000c;
      expv[16] = 52'h4026a0000000c;
      expv[17] = 52'h007b400000008;
      expv[18] = 52'h006d800000009;
      expv[19] = 52'h402aa00000009;
      expv[20] = 52'h00390b2a375e3;
      expv[21] = 52'h00390b2a375e3;
      expv[22] = 52'h001e400000008;
      expv[23] = 52'h000500000000b;
      expv[24] = 52'h405c00000000b;
      expv[25] = 52'h005720000000a;
      expv[26] = 52'h005720000000a;
      expv[27] = 52'h005720000000a;
      expv[28] = 52'h003400000000a;
      expv[29] = 52'h014d8248ea8e7;
      expv[30] = 52'h014d8248ea8e7;
      expv[31] = 52'h014d8248ea8e7;
      expv[32] = 52'h014d8248ea8e7;
      expv[33] = 52'h014d8248ea8e7;
      expv[34] = 52'h4037a0000000a;
      expv[35] = 52'h4037a0000000a;
      expv[36] = 52'h4024200000008;
      expv[37] = 52'h4024200000008;
      expv[38] = 52'h4066c0000000f;
      expv[39] = 52'h4066c0000000f;
      expv[40] = 52'h4038e0000000c;
      expv[41] = 52'h4038e0000000c;
      expv[42] = 52'h410f02b2a87e6;
      expv[43] = 52'h410f02b2a87e6;
      expv[44] = 52'h410f02b2a87e6;
      expv[45] = 52'h410f02b2a87e6;
      expv[46] = 52'h410f02b2a87e6;
      expv[47] = 52'h410f02b2a87e6;
      expv[48] = 52'h2059a0000001f;
      expv[49] = 52'h2059a0000001f;
      expv[50] = 52'h0025e00000009;
      expv[51] = 52'h004ee0000000e;
      expv[52] = 52'h4044600000008;
      expv[53] = 52'h2052c0000000f;
      expv[54] = 52'h2052c0000000f;
      expv[55] = 52'h2052c0000000f;
      expv[56] = 52'h2052c0000000f;
      expv[57] = 52'h2052c0000000f;
      expv[58] = 52'h2052c0000000f;
      expv[59] = 52'h4022200000009;
      expv[60] = 52'h404120000000a;
      expv[61] = 52'h207cc0000000d;
      expv[62] = 52'h0046a00000009;
      expv[63] = 52'h0046a00000009;
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
