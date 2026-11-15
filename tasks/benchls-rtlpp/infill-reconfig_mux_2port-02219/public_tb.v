// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 155;
  localparam OW = 154;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02219 dut (
    .rcfg_clk(clk),
    .rcfg_reset_n(in_vec[154:154]),
    .rcfg_in_read_0(in_vec[153:153]),
    .rcfg_in_write_0(in_vec[152:152]),
    .rcfg_in_address_0(in_vec[151:142]),
    .rcfg_in_writedata_0(in_vec[141:110]),
    .rcfg_in_read_1(in_vec[109:109]),
    .rcfg_in_write_1(in_vec[108:108]),
    .rcfg_in_address_1(in_vec[107:98]),
    .rcfg_in_writedata_1(in_vec[97:66]),
    .rcfg_out_readdata_0(in_vec[65:34]),
    .rcfg_out_waitrequest_0(in_vec[33:33]),
    .rcfg_out_readdata_1(in_vec[32:1]),
    .rcfg_out_waitrequest_1(in_vec[0:0]),
    .rcfg_in_readdata_0(out_vec[153:122]),
    .rcfg_in_waitrequest_0(out_vec[121:121]),
    .rcfg_in_readdata_1(out_vec[120:89]),
    .rcfg_in_waitrequest_1(out_vec[88:88]),
    .rcfg_out_read_0(out_vec[87:87]),
    .rcfg_out_write_0(out_vec[86:86]),
    .rcfg_out_address_0(out_vec[85:76]),
    .rcfg_out_writedata_0(out_vec[75:44]),
    .rcfg_out_read_1(out_vec[43:43]),
    .rcfg_out_write_1(out_vec[42:42]),
    .rcfg_out_address_1(out_vec[41:32]),
    .rcfg_out_writedata_1(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 155'h1d52c3b3b3624da744f8640d200b382433d1ed7;
    stim[1] = 155'h2fa9f4b98ea3cf58f8e0d3c32ade383267c9afa;
    stim[2] = 155'h464811c241a1687cac7807c758ef6925a64c30a;
    stim[3] = 155'h7d35d3eeaa21448378fbb837e1172be450d5685;
    stim[4] = 155'h628a79dab8584be818bd85a91319f95b63e0a7c;
    stim[5] = 155'h7d10860dadc1225de779da804a4c99965511ed0;
    stim[6] = 155'h51f4e22620ec595b1068bde7d0af6bb6ac797f9;
    stim[7] = 155'h5f81d7abe94c29e768e8067c778ddfe3de130b1;
    stim[8] = 155'h6c7ddaa15acc41e69d45a8fdd10ec969f316d32;
    stim[9] = 155'h5825ad0c5366709b75a90eff0729adcc4af78e6;
    stim[10] = 155'h4197626b23a1f57745549443196b6397e9e77b8;
    stim[11] = 155'h6450730c47aa92bc1038bfbdae613775cbf497a;
    stim[12] = 155'h423d9dd1e7de45de08e633c93e022af1af2da8b;
    stim[13] = 155'h52931c807ab3175c193d30e836db03311314d25;
    stim[14] = 155'h54db19559b47ca0a70b428209f357f82d2a2689;
    stim[15] = 155'h79cdaa323f9c4f8c9a9342428a18962c17b0284;
    stim[16] = 155'h740cdefc0b0a4e6def97e2198c42ed37a4ad24f;
    stim[17] = 155'h43b1e0dec886cf0b7c38ebd8e37bc740c4fd1a5;
    stim[18] = 155'h73aad62837e829237b5341c09bbb81ddff97c78;
    stim[19] = 155'h62582e0095dcb72f021db92655e514ff4d86ff3;
    stim[20] = 155'h71a430f8aae65dc0ae029eea003b9139509f4b8;
    stim[21] = 155'h50f8da7804c13949c748dc4e604ec71a4067689;
    stim[22] = 155'h61bcb3cb322d667be54e9ad71865894704ad4ea;
    stim[23] = 155'h50f2408753a2a929ae4f379f2bf3c0efa0cf407;
    stim[24] = 155'h777240e07a435b97647ca0e8fa8fe89dbcd5bfc;
    stim[25] = 155'h447766a6815ab41fe0b801bd5b467023fc10ec6;
    stim[26] = 155'h759ccdb3712e9111dec518c41ff028e7ed6c978;
    stim[27] = 155'h465a3bed72bfac88f1b0690bac9499a54ea2de0;
    stim[28] = 155'h6dd08addc62f67e2c0a64d53ceb6e088f02045f;
    stim[29] = 155'h5a6843a38ed91418f5d358c77de3064f7a15679;
    stim[30] = 155'h59bd3c950c9e7cfa7cd5e5cbd966098a1db8177;
    stim[31] = 155'h477433c30814caa771fb055d0c850b095d60bad;
    stim[32] = 155'h79ec8b8eb4546bc2417a014a4955f0c80f73661;
    stim[33] = 155'h536521a514537afec4170f3cd2ee0f41d851233;
    stim[34] = 155'h427c5981dd64fba93b2d0b4d84567b60772d250;
    stim[35] = 155'h4e7403baa613c7f07693165b892931a308bd6f2;
    stim[36] = 155'h72fb4fa22b995c9d48fe4beb74de24da553cb32;
    stim[37] = 155'h590d8e84cb2a2921354dff360adce4e750825d6;
    stim[38] = 155'h6d5e13ffd3e5bf8b0f3cb71f70781aa0a616933;
    stim[39] = 155'h4fafe96e5f4451d1e1789a37cd906613185f053;
    stim[40] = 155'h5c8bbb1c9d900dddeb550cf332162045c395493;
    stim[41] = 155'h59ffe4bc0916d62d2552193097e7795c1d20388;
    stim[42] = 155'h7b75176b55c4db3d28e2caab8d3fe9a4bff8e3c;
    stim[43] = 155'h73d0126c0f6d40d902b2404287eab58c19cc8d4;
    stim[44] = 155'h6b3b83714c740771767b073a41e8b27dd734eb2;
    stim[45] = 155'h7a976a575700fd204eab8d3056b41b94a5b1e4a;
    stim[46] = 155'h42c5832bf838a2d218b40ab13021201d6f32f8d;
    stim[47] = 155'h5065b850cb43d21fba71d3d23dac1de1edefdc9;
    stim[48] = 155'h550ee440668438018dc4b743b617a38c7e9ed78;
    stim[49] = 155'h54b1dde4e40a65dc0d4be4fa0368a20229b2646;
    stim[50] = 155'h5359fad74cf30fa3153952df0fe26df0e171da2;
    stim[51] = 155'h71fa65167987b88d6fb62f8224db57ba51ea6b0;
    stim[52] = 155'h7a87cc5f371a550cb943a4e80925153f4f3366b;
    stim[53] = 155'h6ea59a996278be013e82ea88f8e52b53ee28630;
    stim[54] = 155'h65736d2741c2603acfeb25a230a504189650c31;
    stim[55] = 155'h7765a41b0164e9f123fe4f119cf79da8020b8c0;
    stim[56] = 155'h50df635414155654160e40d891ff1d661a15061;
    stim[57] = 155'h59cc107920546f5576078246fb4b81b9d339a39;
    stim[58] = 155'h6a9d27fe87fe289a54ce1d0f205652d841f52d5;
    stim[59] = 155'h469b0cb34d79e804f0acb2ee84f53f7f8cbe970;
    stim[60] = 155'h633100c2bea6cc3594222603c9d61e37f3a38b7;
    stim[61] = 155'h4a4b7329c5efe3eabf03b4233777c9d102b4c41;
    stim[62] = 155'h4c114ce28691c8e7ca9b0cd56e9894863085eac;
    stim[63] = 155'h7842cce9a83b06a6c7f5289588f396502895d5f;
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
      expv[0] = 154'h000000002000000010000000000000000000000;
      expv[1] = 154'h000000002000000010000000000000000000000;
      expv[2] = 154'h000000002000000010000000000000000000000;
      expv[3] = 154'h000000002000000015a1f2b1e01f5a1f2b1e01f;
      expv[4] = 154'h00a10200a050810055a1f2b1e01f5a1f2b1e01f;
      expv[5] = 154'h20030149300180a480000000000000000000000;
      expv[6] = 154'h00000000200000001f4421836b70f4421836b70;
      expv[7] = 154'h2550a26b32a851359f4421836b70f4421836b70;
      expv[8] = 154'h04340416221a020b1f4421836b70f4421836b70;
      expv[9] = 154'h11c00c8048e0064030000000000000000000000;
      expv[10] = 154'h000000002000000016096b4314d96096b4314d9;
      expv[11] = 154'h03114a630188a53190000000000000000000000;
      expv[12] = 154'h000000002000000019141cc311ea9141cc311ea;
      expv[13] = 154'h011e0200608f010039141cc311ea9141cc311ea;
      expv[14] = 154'h202609003013048019141cc311ea9141cc311ea;
      expv[15] = 154'h008504510042822890000000000000000000000;
      expv[16] = 154'h00000000200000001e736a8c8fe7e736a8c8fe7;
      expv[17] = 154'h09084249248421249e736a8c8fe7e736a8c8fe7;
      expv[18] = 154'h00817a040040bd0210000000000000000000000;
      expv[19] = 154'h00000000200000001ceab58a0dfaceab58a0dfa;
      expv[20] = 154'h261105147308828a3ceab58a0dfaceab58a0dfa;
      expv[21] = 154'h22003a9111001d4890000000000000000000000;
      expv[22] = 154'h0000000020000000143e369e013043e369e0130;
      expv[23] = 154'h0608408943042044b0000000000000000000000;
      expv[24] = 154'h0000000020000000143c9021d4e843c9021d4e8;
      expv[25] = 154'h28788b68943c45b450000000000000000000000;
      expv[26] = 154'h00000000200000001ad07f82e006ad07f82e006;
      expv[27] = 154'h041ad028220d681400000000000000000000000;
      expv[28] = 154'h00000000200000001eb223c6c1a4eb223c6c1a4;
      expv[29] = 154'h11c00080a8e0004040000000000000000000000;
      expv[30] = 154'h0000000020000000169a10e8e3b669a10e8e3b6;
      expv[31] = 154'h00196008800cb00450000000000000000000000;
      expv[32] = 154'h000000002000000010000000000000000000000;
      expv[33] = 154'h00000000200000001e7b22e3ad15e7b22e3ad15;
      expv[34] = 154'h0090a2064048510330000000000000000000000;
      expv[35] = 154'h000000002000000010000000000000000000000;
      expv[36] = 154'h00000000200000001f1fc1da4c59f1fc1da4c59;
      expv[37] = 154'h2020582470102c1220000000000000000000000;
      expv[38] = 154'h0000000020000000164363a132ca64363a132ca;
      expv[39] = 154'h0140280220a01401164363a132ca64363a132ca;
      expv[40] = 154'h260090021300480110000000000000000000000;
      expv[41] = 154'h00000000200000001722eec72764722eec72764;
      expv[42] = 154'h301240711809203890000000000000000000000;
      expv[43] = 154'h00000000200000001edd45dad571edd45dad571;
      expv[44] = 154'h000388108001c40850000000000000000000000;
      expv[45] = 154'h00000000200000001acee0dc531dacee0dc531d;
      expv[46] = 154'h204220091021100490000000000000000000000;
      expv[47] = 154'h000000002000000010000000000000000000000;
      expv[48] = 154'h000000002000000014196e1432d04196e1432d0;
      expv[49] = 154'h00b415a3005a0ad190000000000000000000000;
      expv[50] = 154'h0000000020000000152c7779390252c77793902;
      expv[51] = 154'h0102e2244081711230000000000000000000000;
      expv[52] = 154'h00000000200000001c7e99459e61c7e99459e61;
      expv[53] = 154'h28082405340412029c7e99459e61c7e99459e61;
      expv[54] = 154'h00d84002006c200110000000000000000000000;
      expv[55] = 154'h0000000020000000195cdb49d07095cdb49d070;
      expv[56] = 154'h1004171808020b8c10000000000000000000000;
      expv[57] = 154'h00000000200000001437d8d50505437d8d50505;
      expv[58] = 154'h02a24301215121809437d8d50505437d8d50505;
      expv[59] = 154'h000042528000212950000000000000000000000;
      expv[60] = 154'h000000002000000017a013c2b2cb7a013c2b2cb;
      expv[61] = 154'h03c1461621e0a30b17a013c2b2cb7a013c2b2cb;
      expv[62] = 154'h220561883102b0c400000000000000000000000;
      expv[63] = 154'h000000002000000017239f2a6c337239f2a6c33;
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
