// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 122;
  localparam OW = 154;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_134248 dut (
    .m_axi_aclk(clk),
    .m_axi_aresetn(in_vec[121:121]),
    .req_valid(in_vec[120:120]),
    .req_address(in_vec[119:88]),
    .req_last_burst_length(in_vec[87:80]),
    .req_last_beat_bytes(in_vec[79:77]),
    .enable(in_vec[76:76]),
    .pause(in_vec[75:75]),
    .sync_id(in_vec[74:71]),
    .fifo_valid(in_vec[70:70]),
    .fifo_data(in_vec[69:6]),
    .response_ready(in_vec[5:5]),
    .m_axi_awready(in_vec[4:4]),
    .m_axi_wready(in_vec[3:3]),
    .m_axi_bvalid(in_vec[2:2]),
    .m_axi_bresp(in_vec[1:0]),
    .req_ready(out_vec[153:153]),
    .enabled(out_vec[152:152]),
    .sync_id_ret(out_vec[151:148]),
    .response_valid(out_vec[147:147]),
    .response_resp(out_vec[146:145]),
    .response_resp_eot(out_vec[144:144]),
    .request_id(out_vec[143:140]),
    .response_id(out_vec[139:136]),
    .data_id(out_vec[135:132]),
    .address_id(out_vec[131:128]),
    .m_axi_awvalid(out_vec[127:127]),
    .m_axi_awaddr(out_vec[126:95]),
    .m_axi_awlen(out_vec[94:87]),
    .m_axi_awsize(out_vec[86:84]),
    .m_axi_awburst(out_vec[83:82]),
    .m_axi_awprot(out_vec[81:79]),
    .m_axi_awcache(out_vec[78:75]),
    .m_axi_wvalid(out_vec[74:74]),
    .m_axi_wdata(out_vec[73:10]),
    .m_axi_wstrb(out_vec[9:2]),
    .m_axi_wlast(out_vec[1:1]),
    .m_axi_bready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 122'h194a7dc4cc16b414022541f8de3b556;
    stim[1] = 122'h0f5e0b4cbcc76cd60b0d68113ed7619;
    stim[2] = 122'h3b87c46d9dc807bc53f9face3052f1e;
    stim[3] = 122'h2598a93761b0e8e5d91695434c61d4f;
    stim[4] = 122'h3ec72c209e3d234ad7ad47c041e5bfd;
    stim[5] = 122'h2db44048526f42bfbbdd15755f40349;
    stim[6] = 122'h3cb1df4ba042c841da01181f288bf80;
    stim[7] = 122'h2e1d2851cc47b06192d95976b537c05;
    stim[8] = 122'h3d3595ffb2928f69e9c87022ed36180;
    stim[9] = 122'h376f0d83813ac9f80c67163c38c99a3;
    stim[10] = 122'h177a8f667db60a404f575dff927cc44;
    stim[11] = 122'h2c081f65e3249d9b669e93188ee94ac;
    stim[12] = 122'h365ac8823cefc87730a00f2bcccba18;
    stim[13] = 122'h2a8c7e638b7661a72f9dad9f053f309;
    stim[14] = 122'h33f8844d40cd56329a35a1ac8ef1bc7;
    stim[15] = 122'h3e101b19405f15c3b7b776f18c8acd2;
    stim[16] = 122'h2adb4579ad8ed5a570c41e2c6655fe8;
    stim[17] = 122'h3a4bf23cbdde4e451d93ae98d23ab9c;
    stim[18] = 122'h3aaef46aac3b1b95c0dda8b77753506;
    stim[19] = 122'h34edb023af723a34c09075996a5528f;
    stim[20] = 122'h21ea452022c2ee4647e45372de0c522;
    stim[21] = 122'h297b8556ad599481698edcfda01ffd9;
    stim[22] = 122'h284242c7b6423ffffc5f93e0986fe8c;
    stim[23] = 122'h29a92fac0f5a25d406617127ecf80c3;
    stim[24] = 122'h335680babf0bf560ecbc0ff734d6013;
    stim[25] = 122'h3087e0c1622c8f2f32b47080681b43a;
    stim[26] = 122'h3e93f575728973ee66daedc2217914c;
    stim[27] = 122'h30c0afa1b58307bf9e7b01d1a2ba7ab;
    stim[28] = 122'h38a1193021e5ba7cfcbcb737f5db316;
    stim[29] = 122'h369bbc4a414fc470f87d10d99c32503;
    stim[30] = 122'h3a470ec77eb2eee83232b53f43c4031;
    stim[31] = 122'h29098ed237bca11778a486cc924a300;
    stim[32] = 122'h3c53c41ffb24812c8578970ecf0da99;
    stim[33] = 122'h16153b2ca6c1e246f863c84cd384f55;
    stim[34] = 122'h2b13f227354bd4b6969c3032540f76f;
    stim[35] = 122'h393e572fca68622fee8b9828a266729;
    stim[36] = 122'h259ac6534e3c884e5802ad8a6ebe0bd;
    stim[37] = 122'h3e606c76f0d20c5effc78f112b26b2f;
    stim[38] = 122'h3a264fabda625de8fb8e262e1ab87e3;
    stim[39] = 122'h286711cf911ce995ed7378ea9d08d91;
    stim[40] = 122'h29dbf3bc302680931a6bd09cc9fc6fe;
    stim[41] = 122'h2a5f24945054e8f7e303f7f28d9e588;
    stim[42] = 122'h25ee626031d4112e57e85c00d59c389;
    stim[43] = 122'h3ac9abb6b46f90c5fa2ec58c9de888e;
    stim[44] = 122'h373ef6ee8b7b73201b2a83171eb1e5e;
    stim[45] = 122'h298e6e2e774f9e69c8dc89b308798ba;
    stim[46] = 122'h29604c6a4aaf0182f29403416330b04;
    stim[47] = 122'h37d61787f0de1b5e4a7a3251094a8dc;
    stim[48] = 122'h20ba4ea8fd9a3af60a28582048a2dcc;
    stim[49] = 122'h2c158b41a18eb72ac92e70e9aa2ab7c;
    stim[50] = 122'h3d5c2ad15c5db8a590c6f64d738b65c;
    stim[51] = 122'h3a01b4b3d83921450f72bddef67eda1;
    stim[52] = 122'h2a610c51f5549c1259bfd4bd421fe20;
    stim[53] = 122'h2e6ef8a7c394fc1dc1e97af95123102;
    stim[54] = 122'h3c8bf7750266500b912c4997a002add;
    stim[55] = 122'h2369c13a1a26df952483aec5d956c6a;
    stim[56] = 122'h3aaa48fd5af34f4dfd941f9e358ef00;
    stim[57] = 122'h3d77f5c0c3cda48c935030e22c35336;
    stim[58] = 122'h2cc68f4bb743eabe887ca3373860176;
    stim[59] = 122'h354a113e7431d0c3e92b4d413e9aa1d;
    stim[60] = 122'h28ab7d2c79b5a558db52cd6feb42024;
    stim[61] = 122'h34b32062eaf5f4b9da4fa6475375ad8;
    stim[62] = 122'h2f7ba95ac1df1a4d66ed4b26fe49aec;
    stim[63] = 122'h321945308ff78a83bf94f61394a1ebf;
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
      expv[0] = 154'h06400000000000000341814022541f8de3b5402;
      expv[1] = 154'h3d2000000000000003418d60b0d68113ed76002;
      expv[2] = 154'h00400000000000000341bbc53f9face3052f002;
      expv[3] = 154'h0d6000000000000003418e5d91695434c61d402;
      expv[4] = 154'h34200000000000000341b4ad7ad47c041e5bc02;
      expv[5] = 154'h1831111f6396104f1b41abfbbdd15755f4037fc;
      expv[6] = 154'h0911111f6396104f1b41841da01181f288bfbfc;
      expv[7] = 154'h0631111f6396104f1b4186192d95976b537c3fc;
      expv[8] = 154'h0111111f6396104f1b41b69e9c87022ed361bfc;
      expv[9] = 154'h0971111f6396104f1b419f80c67163c38c99bfc;
      expv[10] = 154'h01000000000000000341a404f575dff927cc402;
      expv[11] = 154'h0300000000000000034199b669e93188ee94802;
      expv[12] = 154'h0900000000000000034187730a00f2bcccba002;
      expv[13] = 154'h0c2000000000000003419a72f9dad9f053f3002;
      expv[14] = 154'h3a600000000000000341a329a35a1ac8ef1bc02;
      expv[15] = 154'h12511119fc4226a063419c3b7b776f18c8acffc;
      expv[16] = 154'h0a111111fc4226a06341da570c41e2c6655fffc;
      expv[17] = 154'h09111111fc4226e05b41e451d93ae98d23abbfc;
      expv[18] = 154'h13511111fc4227205341b95c0dda8b7775353fc;
      expv[19] = 154'h07711111fc4227205341a34c09075996a552bfc;
      expv[20] = 154'h0d511111fc4227205341e4647e45372de0c53fc;
      expv[21] = 154'h02311111fc4227205341c81698edcfda01ffffc;
      expv[22] = 154'h07111111fc4227604b41ffffc5f93e0986febfc;
      expv[23] = 154'h04711111fc4227a04341dd406617127ecf80ffc;
      expv[24] = 154'h0e711111fc4227a04341d60ecbc0ff734d603fc;
      expv[25] = 154'h01511111fc4227a04341f2f32b47080681b43fc;
      expv[26] = 154'h1e111111fc4227e03b41bee66daedc2217917fc;
      expv[27] = 154'h10711111fc4227e03b41fbf9e7b01d1a2ba7bfc;
      expv[28] = 154'h07511111fc4228203341a7cfcbcb737f5db33fc;
      expv[29] = 154'h08711111fc4228203341c70f87d10d99c3253fc;
      expv[30] = 154'h0d311111fc4228203341ee83232b53f43c403fc;
      expv[31] = 154'h04111111fc422820334191778a486cc924a33fc;
      expv[32] = 154'h00311111fc422820334192c8578970ecf0dabfc;
      expv[33] = 154'h0c200000000000000341a46f863c84cd384f402;
      expv[34] = 154'h0a6000000000000003418b6969c3032540f7402;
      expv[35] = 154'h0c200000000000000341a2fee8b9828a2667002;
      expv[36] = 154'h0120000000000000034184e5802ad8a6ebe0802;
      expv[37] = 154'h0160000000000000034185effc78f112b26b002;
      expv[38] = 154'h0b6000000000000003419e8fb8e262e1ab87c02;
      expv[39] = 154'h0d200000000000000341995ed7378ea9d08d802;
      expv[40] = 154'h004000000000000003418931a6bd09cc9fc6c02;
      expv[41] = 154'h0d0000000000000003418f7e303f7f28d9e5802;
      expv[42] = 154'h0220000000000000034192e57e85c00d59c3802;
      expv[43] = 154'h024000000000000003418c5fa2ec58c9de88802;
      expv[44] = 154'h3e400000000000000341b201b2a83171eb1e402;
      expv[45] = 154'h0351111b9f7b7745bb41a69c8dc89b308798bfc;
      expv[46] = 154'h101111139f7b7745bb41982f29403416330b3fc;
      expv[47] = 154'h031111139f7b7745bb41b5e4a7a3251094a8ffc;
      expv[48] = 154'h071111139f7b7745bb41af60a28582048a2dffc;
      expv[49] = 154'h061111139f7b7745bb41f2ac92e70e9aa2ab7fc;
      expv[50] = 154'h071111139f7b7785b3418a590c6f64d738b67fc;
      expv[51] = 154'h143111139f7b7785b3419450f72bddef67edbfc;
      expv[52] = 154'h031111139f7b7785b341c1259bfd4bd421fe3fc;
      expv[53] = 154'h0f5111139f7b7785b341c1dc1e97af9512313fc;
      expv[54] = 154'h0a3111139f7b7785b34180b912c4997a002affc;
      expv[55] = 154'h0b5111139f7b7785b341f952483aec5d956c7fc;
      expv[56] = 154'h191111139f7b77c5ab41f4dfd941f9e358ef3fc;
      expv[57] = 154'h045111139f7b77c5ab41c8c935030e22c3533fc;
      expv[58] = 154'h0d5111139f7b77c5ab41abe887ca337386017fc;
      expv[59] = 154'h0a3111139f7b77c5ab418c3e92b4d413e9aa3fc;
      expv[60] = 154'h041111139f7b77c5ab41d58db52cd6feb4203fc;
      expv[61] = 154'h0e1111139f7b77c5ab41cb9da4fa6475375affc;
      expv[62] = 154'h131111139f7b7805a341a4d66ed4b26fe49affc;
      expv[63] = 154'h017111139f7b7805a341a83bf94f61394a1ebfc;
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
