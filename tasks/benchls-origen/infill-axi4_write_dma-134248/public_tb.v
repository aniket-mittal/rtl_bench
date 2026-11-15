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
    stim[0] = 122'h1f2dd3d012fe60d01d5b6455713a672;
    stim[1] = 122'h073521d1c12630bb1bb7c388824578c;
    stim[2] = 122'h27a4fdb36120e265a8ffff2835b28b2;
    stim[3] = 122'h392072e3c8a332c7324c99a58538f01;
    stim[4] = 122'h21ebd8575cc69bc7e61ba9d696cec25;
    stim[5] = 122'h2bf3a075364f9fa6cfa6134e707ac7e;
    stim[6] = 122'h2fafc7c40ecc2bb40937a0c759d9a52;
    stim[7] = 122'h21665a2a07f7ac74810a8927f439041;
    stim[8] = 122'h24ebf5ede80ff2e6df96326dac6e50c;
    stim[9] = 122'h26d1cc0e26d08edcdd8023cc3d801f4;
    stim[10] = 122'h3adbee2a8aa83f9555ed93fb8109f7b;
    stim[11] = 122'h27d63dff65b37ea0aeaf5761dbc3199;
    stim[12] = 122'h35b76cafbc8c0c96541ccce238eb66f;
    stim[13] = 122'h35d87ff33b8e56141d238371f638764;
    stim[14] = 122'h2b6eb9f218ab169c316331d4d9d95e0;
    stim[15] = 122'h289c700c892c90d4f5ef2cb809bbddf;
    stim[16] = 122'h356aab9dd5005fa25d4e07df8b4508b;
    stim[17] = 122'h29e707cb78f20bef9568372135fcefd;
    stim[18] = 122'h2beb894a60aa69112395817e21a00d3;
    stim[19] = 122'h297ad1247462d223a69a3e2534629c4;
    stim[20] = 122'h36bb66c1b921910a4f4a48ae9cccb68;
    stim[21] = 122'h2d7a34eea18e3247cb53f27b6bb18aa;
    stim[22] = 122'h3bc8b5826f214979c217e917ce7c1b8;
    stim[23] = 122'h293e43bc27afd5116a25911755c3a0e;
    stim[24] = 122'h30a2a5ac4c13345edba8dfc66ee1d9d;
    stim[25] = 122'h050b8044dbf0485b3addb0eef4524fd;
    stim[26] = 122'h243d1993915c7aaac074d26e79ebcff;
    stim[27] = 122'h29497bcd1206ed71b32db9805eeb1c0;
    stim[28] = 122'h3d1a4e51741c511436972e765921571;
    stim[29] = 122'h1f1b6fc0ca0615e9e818a1f4e91ba00;
    stim[30] = 122'h331e7572da995b5e8527b7aee3f675d;
    stim[31] = 122'h2b4acb8f3a27e8e6ad4f0f679dd4ba1;
    stim[32] = 122'h319f88b292444f53dd538bc3bc11934;
    stim[33] = 122'h308e9acf3e21accacfc193db519a83c;
    stim[34] = 122'h33c0d2cd3e72a41482d63ad999e2498;
    stim[35] = 122'h3b5c5cda4c4bec7b2a63de535319637;
    stim[36] = 122'h2e3093b17c9bf6f06b50dd393097a55;
    stim[37] = 122'h1d380ac4424b69fc7bf8710d9b08482;
    stim[38] = 122'h2259a456d9ed82dc07ccf0fc04a9de5;
    stim[39] = 122'h243b91a24953c80e116f9fb9561c8ae;
    stim[40] = 122'h2c618bf7f58501a484d41b5953743fa;
    stim[41] = 122'h2467a6ba60551dde8d2818c8d2664ff;
    stim[42] = 122'h28ad14c848d5c959e9a60c6f605899d;
    stim[43] = 122'h33a4edf0604cfe6c413d6d30a5da25d;
    stim[44] = 122'h2c66f4853fe648f96b2c07b0aa555a2;
    stim[45] = 122'h23fb2e2005602785c45ec07439ef7ed;
    stim[46] = 122'h3b82f8d19c0f223396689025d450cbc;
    stim[47] = 122'h231b61e386f7f4f6e9396e480948470;
    stim[48] = 122'h3fb565b58d715023d65698beb07fda9;
    stim[49] = 122'h3edde406b2d04074ab2d0f6930faece;
    stim[50] = 122'h3be6fba65a44bed9ffd610b9cf53a07;
    stim[51] = 122'h3d39fc7c97c25e42bd6fa24d07c3836;
    stim[52] = 122'h3db274d1b6acbf5777e6eb120942469;
    stim[53] = 122'h21e35be6793919068c6ada8d510f071;
    stim[54] = 122'h31a6f415d924611540c61dcf4172535;
    stim[55] = 122'h39039407437ac2cd24311b2f39f1a29;
    stim[56] = 122'h253ecc4e3e383d11872b5857f6ea131;
    stim[57] = 122'h3fb3182b15391bea6a31e23c16e5225;
    stim[58] = 122'h255abdb6d641c65c7a6e1f814cc269c;
    stim[59] = 122'h3b86c773cfb994a155d73e283f35ace;
    stim[60] = 122'h3cf8e225598f4398a30c811cbc9ad29;
    stim[61] = 122'h2d1f2a48965b2e744d94a63c51c37d3;
    stim[62] = 122'h21b5ad5a3b42c515740d7ce2edd822d;
    stim[63] = 122'h1b78827531b4b4fe80478faac387664;
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
      expv[0] = 154'h0c4000000000000003418d01d5b6455713a6402;
      expv[1] = 154'h060000000000000003418bb1bb7c38882457802;
      expv[2] = 154'h0c400000000000000341a65a8ffff2835b28802;
      expv[3] = 154'h36200000000000000341ac7324c99a58538f002;
      expv[4] = 154'h0331111c903971e45341bc7e61ba9d696cec3fc;
      expv[5] = 154'h0351111c903971e45341ba6cfa6134e707ac7fc;
      expv[6] = 154'h05511114903971e45341bb40937a0c759d9a7fc;
      expv[7] = 154'h05311114903971e45341c74810a8927f43907fc;
      expv[8] = 154'h0e111114903971e45341ae6df96326dac6e53fc;
      expv[9] = 154'h01111114903971e45341edcdd8023cc3d801ffc;
      expv[10] = 154'h07711114903971e45341f9555ed93fb8109f7fc;
      expv[11] = 154'h1f311114903972244b41ea0aeaf5761dbc31bfc;
      expv[12] = 154'h01711114903972644341c96541ccce238eb67fc;
      expv[13] = 154'h0a111114903972a43b41e141d238371f63877fc;
      expv[14] = 154'h12111114903972a43b41e9c316331d4d9d95ffc;
      expv[15] = 154'h02711114903972a43b418d4f5ef2cb809bbdffc;
      expv[16] = 154'h0b711114903972a43b41fa25d4e07df8b450bfc;
      expv[17] = 154'h01311114903972e43341bef9568372135fceffc;
      expv[18] = 154'h0d711114903972e433419112395817e21a00ffc;
      expv[19] = 154'h0a111114903972e43341a23a69a3e2534629ffc;
      expv[20] = 154'h02111114903972e4334190a4f4a48ae9cccb7fc;
      expv[21] = 154'h06511114903972e43341a47cb53f27b6bb18bfc;
      expv[22] = 154'h19111114903972e43341979c217e917ce7c1bfc;
      expv[23] = 154'h0a511114903972e43341d116a25911755c3a3fc;
      expv[24] = 154'h16311114903973242b41c5edba8dfc66ee1dbfc;
      expv[25] = 154'h0920000000000000034185b3addb0eef4524c02;
      expv[26] = 154'h0f600000000000000341aaac074d26e79ebcc02;
      expv[27] = 154'h0d000000000000000341971b32db9805eeb1c02;
      expv[28] = 154'h0a20000000000000034191436972e7659215402;
      expv[29] = 154'h020000000000000003419e9e818a1f4e91ba002;
      expv[30] = 154'h3b200000000000000341b5e8527b7aee3f67402;
      expv[31] = 154'h0d3111198f3ab96d4b418e6ad4f0f679dd4bbfc;
      expv[32] = 154'h091111198f3ab96d4b41b53dd538bc3bc1193fc;
      expv[33] = 154'h051111118f3ab96d4b41ccacfc193db519a83fc;
      expv[34] = 154'h041111118f3ab9ad4341c1482d63ad999e24bfc;
      expv[35] = 154'h0d7111118f3ab9ed3b41c7b2a63de53531963fc;
      expv[36] = 154'h0e3111118f3ab9ed3b41ef06b50dd393097a7fc;
      expv[37] = 154'h3d4000000000000003419fc7bf8710d9b084802;
      expv[38] = 154'h00200000000000000341adc07ccf0fc04a9dc02;
      expv[39] = 154'h0940000000000000034180e116f9fb9561c8802;
      expv[40] = 154'h304000000000000003419a484d41b5953743c02;
      expv[41] = 154'h336000000000000003419de8d2818c8d2664c02;
      expv[42] = 154'h09200000000000000341959e9a60c6f60589802;
      expv[43] = 154'h0f200000000000000341a6c413d6d30a5da2402;
      expv[44] = 154'h094000000000000003418f96b2c07b0aa555802;
      expv[45] = 154'h04200000000000000341b85c45ec07439ef7c02;
      expv[46] = 154'h34000000000000000341a3396689025d450c802;
      expv[47] = 154'h0e11111dc17c68ce03418f6e9396e48094847fc;
      expv[48] = 154'h1a311115c17c68ce0341823d65698beb07fdbfc;
      expv[49] = 154'h08511115c17c68ce0341874ab2d0f6930faeffc;
      expv[50] = 154'h07711115c17c68ce0341ed9ffd610b9cf53a3fc;
      expv[51] = 154'h0b511115c17c68ce0341e42bd6fa24d07c383fc;
      expv[52] = 154'h07311115c17c68ce0341f5777e6eb12094247fc;
      expv[53] = 154'h13311115c17c690dfb419068c6ada8d510f07fc;
      expv[54] = 154'h0c311115c17c690dfb4191540c61dcf417253fc;
      expv[55] = 154'h08311115c17c690dfb41acd24311b2f39f1a3fc;
      expv[56] = 154'h07311115c17c690dfb41d11872b5857f6ea13fc;
      expv[57] = 154'h13311115c17c690dfb41bea6a31e23c16e523fc;
      expv[58] = 154'h08111115c17c690dfb41e5c7a6e1f814cc26bfc;
      expv[59] = 154'h02511115c17c694df341ca155d73e283f35affc;
      expv[60] = 154'h18311115c17c698deb41b98a30c811cbc9ad3fc;
      expv[61] = 154'h15711115c17c698deb41e744d94a63c51c37ffc;
      expv[62] = 154'h08311115c17c698deb41d15740d7ce2edd823fc;
      expv[63] = 154'h060000000000000003418fe80478faac3876402;
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
