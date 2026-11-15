// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 81;
  localparam OW = 76;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02533 dut (
    .sys_clk(clk),
    .sys_rst_n(in_vec[80:80]),
    .accu_en(in_vec[79:79]),
    .s_axis_aresetn(in_vec[78:78]),
    .s_axis_aclk(in_vec[77:77]),
    .s_axis_tvalid(in_vec[76:76]),
    .s_axis_tdata(in_vec[75:12]),
    .s_axis_tkeep(in_vec[11:4]),
    .s_axis_tlast(in_vec[3:3]),
    .m_axis_aresetn(in_vec[2:2]),
    .m_axis_aclk(in_vec[1:1]),
    .m_axis_tready(in_vec[0:0]),
    .accu_finished(out_vec[75:75]),
    .s_axis_tready(out_vec[74:74]),
    .m_axis_tvalid(out_vec[73:73]),
    .m_axis_tdata(out_vec[72:9]),
    .m_axis_tkeep(out_vec[8:1]),
    .m_axis_tlast(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 81'h00a46a2d0656e57adec06;
    stim[1] = 81'h0d5a43e9751c6a6b12623;
    stim[2] = 81'h162672415358f35258d84;
    stim[3] = 81'h11caf3b8ed7569f94cf17;
    stim[4] = 81'h126da64ed31208a3355ae;
    stim[5] = 81'h180f5c458a02c39fa9600;
    stim[6] = 81'h1a1cc6d81119876a37477;
    stim[7] = 81'h1188e97edcc0cc95b3100;
    stim[8] = 81'h1713cbb695f7175cf1c20;
    stim[9] = 81'h166f457918d7d6f7dac9b;
    stim[10] = 81'h141088f6091bfcb2fc9c0;
    stim[11] = 81'h12917e04e20a555eca68b;
    stim[12] = 81'h1fa51ef101cd884f912f6;
    stim[13] = 81'h15fd0031127b795c52f1f;
    stim[14] = 81'h141e544385d1f82ede3b2;
    stim[15] = 81'h1d50362155a54b9e5cc26;
    stim[16] = 81'h1ec0bb933235752730bb8;
    stim[17] = 81'h1aaab825bc8cbf56cfc9d;
    stim[18] = 81'h16384dfb38f2206854724;
    stim[19] = 81'h156b3f231548dfcfd7ef3;
    stim[20] = 81'h1def587b7a82ed972a714;
    stim[21] = 81'h1377fe1368f33c8286c74;
    stim[22] = 81'h14788187f60af62b1f133;
    stim[23] = 81'h188219818a4d1e52810ef;
    stim[24] = 81'h1a26c1924b650c37d34c2;
    stim[25] = 81'h181cdcc9bd939bed173a3;
    stim[26] = 81'h13d5ce8574f83c4dd94bc;
    stim[27] = 81'h163d374a1a32b9bf4d909;
    stim[28] = 81'h1bb22d746c04d484c27bc;
    stim[29] = 81'h10549de63bae81e910a0e;
    stim[30] = 81'h1929160e7f09084586d0c;
    stim[31] = 81'h1529c9f53129bf5836b26;
    stim[32] = 81'h1063c40564afe760f4ec3;
    stim[33] = 81'h1bbcab9d8ecf8112ccbfd;
    stim[34] = 81'h1e038e06f15a95da7213e;
    stim[35] = 81'h109f7ae13071585435479;
    stim[36] = 81'h17668d861e39ed6e8121a;
    stim[37] = 81'h11f9628044ab562256390;
    stim[38] = 81'h18112e23f47a8780623d3;
    stim[39] = 81'h1fb30cae42be3df96a461;
    stim[40] = 81'h194b28179569b55eacd6c;
    stim[41] = 81'h1df65006203f9ea0cd3fd;
    stim[42] = 81'h1a262f69da4cf52b8037d;
    stim[43] = 81'h11776e7966297955d872e;
    stim[44] = 81'h1dc7474a4708e8c223029;
    stim[45] = 81'h19b17cc6ff4dbf60bac9e;
    stim[46] = 81'h1c145a9c87b46823a07ac;
    stim[47] = 81'h18529587f1c9b564ae61a;
    stim[48] = 81'h18b7833d50c5dd7ffc329;
    stim[49] = 81'h1c2d50322a5a89b4558a7;
    stim[50] = 81'h15eb2420de4b2b2dae8fd;
    stim[51] = 81'h1ae955b2fcf773d142b1a;
    stim[52] = 81'h17c034410f84bccd2980a;
    stim[53] = 81'h11757e1ce10c390c7c8f6;
    stim[54] = 81'h1097ca0f998bce96f8d0a;
    stim[55] = 81'h1b30a13ec2eeb7dbb63b0;
    stim[56] = 81'h143e0553d57cd9a13a287;
    stim[57] = 81'h1636fc7a2007d55da892b;
    stim[58] = 81'h1e8eb44e0b16878867afc;
    stim[59] = 81'h1b9849c94eeb935ca5034;
    stim[60] = 81'h15830c9f14c70f924150f;
    stim[61] = 81'h16de17b75b546403ef74c;
    stim[62] = 81'h1e88a577539517843630f;
    stim[63] = 81'h1a394fabfd57215ce4a4d;
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
      expv[0] = 76'h4000000000000000000;
      expv[1] = 76'h4000000000000000000;
      expv[2] = 76'h4000000000000000000;
      expv[3] = 76'h4000000000000000000;
      expv[4] = 76'h4000000000000000000;
      expv[5] = 76'h4000000000000000000;
      expv[6] = 76'h4000000000000000000;
      expv[7] = 76'h4000000000000000000;
      expv[8] = 76'h4000000000000000000;
      expv[9] = 76'h4000000000000000000;
      expv[10] = 76'h4000000000000000000;
      expv[11] = 76'h4000000000000000000;
      expv[12] = 76'h4000000000000000000;
      expv[13] = 76'h74a3de2039b109f225e;
      expv[14] = 76'h74a3de2039b109f225e;
      expv[15] = 76'h74a3de2039b109f225e;
      expv[16] = 76'h7eaaa24aee5a7dbdb84;
      expv[17] = 76'h7eaaa24aee5a7dbdb84;
      expv[18] = 76'h7eaaa24aee5a7dbdb84;
      expv[19] = 76'h7eaaa24aee5a7dbdb84;
      expv[20] = 76'h7eaaa24aee5a7dbdb84;
      expv[21] = 76'h7c95b1ba3eb830a2ee2;
      expv[22] = 76'h7c95b1ba3eb830a2ee2;
      expv[23] = 76'h7c95b1ba3eb830a2ee2;
      expv[24] = 76'h7c95b1ba3eb830a2ee2;
      expv[25] = 76'h7c95b1ba3eb830a2ee2;
      expv[26] = 76'h7c95b1ba3eb830a2ee2;
      expv[27] = 76'h7c95b1ba3eb830a2ee2;
      expv[28] = 76'h7c95b1ba3eb830a2ee2;
      expv[29] = 76'hb2db6047bf52c13b2f7;
      expv[30] = 76'hb2db6047bf52c13b2f7;
      expv[31] = 76'hb2db6047bf52c13b2f7;
      expv[32] = 76'hb2db6047bf52c13b2f7;
      expv[33] = 76'hb2db6047bf52c13b2f7;
      expv[34] = 76'hb2db6047bf52c13b2f7;
      expv[35] = 76'hb2db6047bf52c13b2f7;
      expv[36] = 76'hb2db6047bf52c13b2f7;
      expv[37] = 76'hb2db6047bf52c13b2f7;
      expv[38] = 76'hb2db6047bf52c13b2f7;
      expv[39] = 76'hb2db6047bf52c13b2f7;
      expv[40] = 76'hb2db6047bf52c13b2f7;
      expv[41] = 76'hb2db6047bf52c13b2f7;
      expv[42] = 76'hb2db6047bf52c13b2f7;
      expv[43] = 76'hb2db6047bf52c13b2f7;
      expv[44] = 76'hb2db6047bf52c13b2f7;
      expv[45] = 76'hb2db6047bf52c13b2f7;
      expv[46] = 76'hb2db6047bf52c13b2f7;
      expv[47] = 76'hb2db6047bf52c13b2f7;
      expv[48] = 76'hb2db6047bf52c13b2f7;
      expv[49] = 76'hb2db6047bf52c13b2f7;
      expv[50] = 76'hb2db6047bf52c13b2f7;
      expv[51] = 76'hb2db6047bf52c13b2f7;
      expv[52] = 76'hb2db6047bf52c13b2f7;
      expv[53] = 76'hb2db6047bf52c13b2f7;
      expv[54] = 76'hb2db6047bf52c13b2f7;
      expv[55] = 76'hb2db6047bf52c13b2f7;
      expv[56] = 76'hb2db6047bf52c13b2f7;
      expv[57] = 76'hb2db6047bf52c13b2f7;
      expv[58] = 76'hb2db6047bf52c13b2f7;
      expv[59] = 76'hb2db6047bf52c13b2f7;
      expv[60] = 76'hb2db6047bf52c13b2f7;
      expv[61] = 76'hb2db6047bf52c13b2f7;
      expv[62] = 76'hb2db6047bf52c13b2f7;
      expv[63] = 76'hb2db6047bf52c13b2f7;
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
