// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 108;
  localparam OW = 110;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03915 dut (
    .clk(clk),
    .downstream_readdata(in_vec[107:76]),
    .downstream_readdatavalid(in_vec[75:75]),
    .downstream_waitrequest(in_vec[74:74]),
    .reset_n(in_vec[73:73]),
    .upstream_address(in_vec[72:55]),
    .upstream_byteenable(in_vec[54:51]),
    .upstream_debugaccess(in_vec[50:50]),
    .upstream_nativeaddress(in_vec[49:34]),
    .upstream_read(in_vec[33:33]),
    .upstream_write(in_vec[32:32]),
    .upstream_writedata(in_vec[31:0]),
    .reg_downstream_address(out_vec[109:94]),
    .reg_downstream_arbitrationshare(out_vec[93:90]),
    .reg_downstream_burstcount(out_vec[89:89]),
    .reg_downstream_byteenable(out_vec[88:85]),
    .reg_downstream_debugaccess(out_vec[84:84]),
    .reg_downstream_nativeaddress(out_vec[83:68]),
    .reg_downstream_read(out_vec[67:67]),
    .reg_downstream_write(out_vec[66:66]),
    .reg_downstream_writedata(out_vec[65:34]),
    .upstream_readdata(out_vec[33:2]),
    .upstream_readdatavalid(out_vec[1:1]),
    .upstream_waitrequest(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 108'h0c93b67b985ab8427c8eb94ec5b;
    stim[1] = 108'h793a367d14cb590db463d0c2bf3;
    stim[2] = 108'h47d43061fc59d8c3e399fd6402a;
    stim[3] = 108'h52f55910260afcfca48c476c4f9;
    stim[4] = 108'h6220a67675779d2f0ea177934e0;
    stim[5] = 108'hbb74c7b4f866bf30e87441921f4;
    stim[6] = 108'h56688a5e3f6d4566d904ebba9da;
    stim[7] = 108'h6de7ef00f47e461d84db38bdf32;
    stim[8] = 108'hf14b33e0319d83dd93d8c8987f7;
    stim[9] = 108'h2162099daf3960ad12b56d2c480;
    stim[10] = 108'h772b33bd2215a106b3ee892469d;
    stim[11] = 108'h85fcf167e179eaba356fbdd58d1;
    stim[12] = 108'h71fd14cb3764f96da19cd1b2b19;
    stim[13] = 108'h9ceb524fb5e1b7f034e9084a892;
    stim[14] = 108'hdf0c98eaf82593b0d5f8b08d102;
    stim[15] = 108'hed96f848217659d1080710ad3b6;
    stim[16] = 108'h807a1ec92360f50b6e1a9cc8132;
    stim[17] = 108'he070b04bb50adf9b69959deee9a;
    stim[18] = 108'h195c1471ffbbedf33ddbef6455a;
    stim[19] = 108'h9205517e06b15b91994ccdebf75;
    stim[20] = 108'h2d076d272f2b3a53862f8e4545c;
    stim[21] = 108'he5069041602957b3156bc383e26;
    stim[22] = 108'h85cad4c1ad652db0e33b2c9e9a0;
    stim[23] = 108'hba17eacfeb64b2db29bf020ab07;
    stim[24] = 108'h786607516f1a332d2451a8810f0;
    stim[25] = 108'h8a984445a705c18f3dfaf4b7189;
    stim[26] = 108'h3c0cbcb030ae634aac65bc9b96f;
    stim[27] = 108'hdb6f7cff6b595b713af926a0a0d;
    stim[28] = 108'hd07d272d796df90625564bc565d;
    stim[29] = 108'h65443011652f2913e15d23cc515;
    stim[30] = 108'hd70a88137365394d4ce5447e5ab;
    stim[31] = 108'hdf2fe20064bf6eb5257199b3f74;
    stim[32] = 108'hafab0c936e55c5c16525b44a27c;
    stim[33] = 108'h1206c903e9625835eb74e47742f;
    stim[34] = 108'h037903ec781d38d13aabdce9d43;
    stim[35] = 108'h6d3c3e82797a9bc751f14bafca4;
    stim[36] = 108'hd85cf462bbd57cf80a0fb5dbb26;
    stim[37] = 108'h1e86edca605660345c1ae89e519;
    stim[38] = 108'hecfa54a22cf9e60bf485fe8c60b;
    stim[39] = 108'h3d3d727a798cfc81d8037aa7c6d;
    stim[40] = 108'hac07618c3aede3162d5c67e57bc;
    stim[41] = 108'h229407a17978a0fae4d691b184f;
    stim[42] = 108'h101e28b024c9a7e1f7002386db1;
    stim[43] = 108'h53e006f238aa35eb218cda87cca;
    stim[44] = 108'hdd1ac13ae6440f4276faa02f4da;
    stim[45] = 108'hece7dedc7b27690aa8646f437d7;
    stim[46] = 108'h3f3259e2fa9a9033bbfdf6fce22;
    stim[47] = 108'ha6ef058d22128ed0adce19f35eb;
    stim[48] = 108'hcdb757d1abad921417dc1bb3ee0;
    stim[49] = 108'h79f24e713bfa63dd3f013db369a;
    stim[50] = 108'h63cb964b7a39381b351a2e472fe;
    stim[51] = 108'h31d3f8a7311b4597bf33503bc6c;
    stim[52] = 108'hfc9204baf164290fbe8660caed9;
    stim[53] = 108'hf4f2fa3771e825d56a924495c48;
    stim[54] = 108'he3956aa43fa49f6ff3fe49dc188;
    stim[55] = 108'hfcf393cd3fc11b60d20bc03280c;
    stim[56] = 108'h73142dd0bfeea5b2c5c0e6d9cb4;
    stim[57] = 108'hcc382a8d7026421044d0d451f97;
    stim[58] = 108'hde67945ab31b5b67280c2243948;
    stim[59] = 108'h6ea64b72701dc953d4a3d27e48d;
    stim[60] = 108'h432be55025f5848ba702293c23c;
    stim[61] = 108'h7e9b31a9fe174bbdefe85a2ecbf;
    stim[62] = 108'h8486f50ebef138cc66699c40c0c;
    stim[63] = 108'h5533b6236336c38db256a063236;
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
      expv[0] = 110'h0000000000000000000000000000;
      expv[1] = 110'h0000000000000000000000000000;
      expv[2] = 110'h0000000000000000000000000001;
      expv[3] = 110'h000000000000000000011f50c186;
      expv[4] = 110'h3057e33f292311db13e54bd56441;
      expv[5] = 110'h3057e33f292311db13e5888299d9;
      expv[6] = 110'h3057e33f292311db13e6edd31ed2;
      expv[7] = 110'h3b6a2359b6413aeea76959a22979;
      expv[8] = 110'h3b6a2359b6413aeea769b79fbc02;
      expv[9] = 110'h0cec22f764f632261fdfc52ccf80;
      expv[10] = 110'h39cb222b44a95b4b120085882677;
      expv[11] = 110'h39cb2241acfba2491a75dcaccef5;
      expv[12] = 110'h39cb2241acfba2491a7617f3c59f;
      expv[13] = 110'h39cb225b686b346cac65c7f4532d;
      expv[14] = 110'h39cb23fc0d3a4212a24a73ad493f;
      expv[15] = 110'h39cb23fc0d3a4212a24b7c3263ab;
      expv[16] = 110'h39cb22744209c42b4edbb65be121;
      expv[17] = 110'h39cb2342db8aa73204ca01e87b25;
      expv[18] = 110'h39cb23e6da69677bba6b81c2c12f;
      expv[19] = 110'h0000000000000000000000000000;
      expv[20] = 110'h0000000000000000000000000000;
      expv[21] = 110'h3959e294e18be3915170b41db49d;
      expv[22] = 110'h3959e294e18be3915173941a4105;
      expv[23] = 110'h3959e36c38cacb27a682172b5307;
      expv[24] = 110'h3959e36c38cacb27a682e85fab3f;
      expv[25] = 110'h3959e36c38cacb27a681e1981d45;
      expv[26] = 110'h3959e263cf7abd2dc6262a611117;
      expv[27] = 110'h3959e2d2ab196f26e5bcf032f2c1;
      expv[28] = 110'h3959e2d2ab196f26e5bf6dbdf3fd;
      expv[29] = 110'h3959e2d2ab196f26e5bf41f49cb5;
      expv[30] = 110'h3959e2d2ab196f26e5bd9510c045;
      expv[31] = 110'h3959e2d2ab196f26e5bf5c2a204d;
      expv[32] = 110'h3959e2d2ab196f26e5bf7cbf8801;
      expv[33] = 110'h3959e2d2ab196f26e5bebeac324d;
      expv[34] = 110'h3959e2d2ab196f26e5bc481b240f;
      expv[35] = 110'h3959e2d2ab196f26e5bc0de40fb1;
      expv[36] = 110'h3959e2d2ab196f26e5bdb4f0fa09;
      expv[37] = 110'h3959e33e028bed76ec9b6173d18b;
      expv[38] = 110'h3959e33e028bed76ec987a1bb729;
      expv[39] = 110'h3959e382fd297fa3182fb3e95289;
      expv[40] = 110'h3959e382fd297fa3182cf4f5c9e9;
      expv[41] = 110'h3959e2c58b5b19f95ef2b01d8631;
      expv[42] = 110'h3959e2c58b5b19f95ef08a501e85;
      expv[43] = 110'h3959e3f87dc808e1b6c44078a2c0;
      expv[44] = 110'h0551a37ac86336a1f3294f801bc9;
      expv[45] = 110'h0551a37ac86336a1f32b746b04eb;
      expv[46] = 110'h0551a37ac86336a1f32bb39f7b71;
      expv[47] = 110'h0551a37ac86336a1f328fcc9678a;
      expv[48] = 110'h109463b42b73867cd7ae9bbc1634;
      expv[49] = 110'h1d6ca28505f706ecfb8336dd5f46;
      expv[50] = 110'h1fd322f74fc04f6cda69e7c939c5;
      expv[51] = 110'h1fd322f74fc04f6cda698f2e592c;
      expv[52] = 110'h08da2365efc8d40ef1b0c74fe29d;
      expv[53] = 110'h08da2365efc8d40ef1b3f24812eb;
      expv[54] = 110'h08da2365efc8d40ef1b3d3cbe8dd;
      expv[55] = 110'h08da23dbfcfb927706238e55aa91;
      expv[56] = 110'h08da22d8348af00ca033f3ce4f35;
      expv[57] = 110'h08da236cb17839b672d1cc50b743;
      expv[58] = 110'h08da236cb17839b672d330e0aa35;
      expv[59] = 110'h08da22d9ca0b0890e523799e516b;
      expv[60] = 110'h08da22d9ca0b0890e521ba992dc9;
      expv[61] = 110'h08da2322e9c88a4f08f10caf9541;
      expv[62] = 110'h08da2322e9c88a4f08f1fa6cc6a7;
      expv[63] = 110'h08da2233199a67103032121bd43b;
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
