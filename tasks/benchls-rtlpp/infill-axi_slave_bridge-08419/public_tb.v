// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 228;
  localparam OW = 177;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08419 dut (
    .aclk(clk),
    .aresetn(in_vec[227:227]),
    .s_axi_awid(in_vec[226:215]),
    .s_axi_awaddr(in_vec[214:183]),
    .s_axi_awlen(in_vec[182:179]),
    .s_axi_awsize(in_vec[178:176]),
    .s_axi_awburst(in_vec[175:174]),
    .s_axi_awlock(in_vec[173:172]),
    .s_axi_awcache(in_vec[171:168]),
    .s_axi_awprot(in_vec[167:165]),
    .s_axi_awqos(in_vec[164:161]),
    .s_axi_awvalid(in_vec[160:160]),
    .s_axi_wid(in_vec[159:148]),
    .s_axi_wdata(in_vec[147:116]),
    .s_axi_wstrb(in_vec[115:112]),
    .s_axi_wlast(in_vec[111:111]),
    .s_axi_wvalid(in_vec[110:110]),
    .s_axi_bready(in_vec[109:109]),
    .s_axi_arid(in_vec[108:97]),
    .s_axi_araddr(in_vec[96:65]),
    .s_axi_arlen(in_vec[64:61]),
    .s_axi_arsize(in_vec[60:58]),
    .s_axi_arburst(in_vec[57:56]),
    .s_axi_arlock(in_vec[55:54]),
    .s_axi_arcache(in_vec[53:50]),
    .s_axi_arprot(in_vec[49:47]),
    .s_axi_arqos(in_vec[46:43]),
    .s_axi_arvalid(in_vec[42:42]),
    .s_axi_rready(in_vec[41:41]),
    .m_axi_awready(in_vec[40:40]),
    .m_axi_wready(in_vec[39:39]),
    .m_axi_bresp(in_vec[38:37]),
    .m_axi_bvalid(in_vec[36:36]),
    .m_axi_arready(in_vec[35:35]),
    .m_axi_rdata(in_vec[34:3]),
    .m_axi_rresp(in_vec[2:1]),
    .m_axi_rvalid(in_vec[0:0]),
    .s_axi_awready(out_vec[176:176]),
    .s_axi_wready(out_vec[175:175]),
    .s_axi_bid(out_vec[174:163]),
    .s_axi_bresp(out_vec[162:161]),
    .s_axi_bvalid(out_vec[160:160]),
    .s_axi_arready(out_vec[159:159]),
    .s_axi_rid(out_vec[158:147]),
    .s_axi_rdata(out_vec[146:115]),
    .s_axi_rresp(out_vec[114:113]),
    .s_axi_rlast(out_vec[112:112]),
    .s_axi_rvalid(out_vec[111:111]),
    .m_axi_awaddr(out_vec[110:79]),
    .m_axi_awprot(out_vec[78:76]),
    .m_axi_awvalid(out_vec[75:75]),
    .m_axi_wdata(out_vec[74:43]),
    .m_axi_wstrb(out_vec[42:39]),
    .m_axi_wvalid(out_vec[38:38]),
    .m_axi_bready(out_vec[37:37]),
    .m_axi_araddr(out_vec[36:5]),
    .m_axi_arprot(out_vec[4:2]),
    .m_axi_arvalid(out_vec[1:1]),
    .m_axi_rready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 228'h0e37d59a4bc3b837f0ce0ed99a64c9c6ee804a2df26c7eb12035447b7;
    stim[1] = 228'h2ec75853c518d74989a56931a5ce815ec9f78efbedc4bc1d64aa02c17;
    stim[2] = 228'h9d132fda082760658e8138216d83f463ede2af1c29e65e3317008ed7a;
    stim[3] = 228'hf054cfa8981ce3b402df7bca6b386e59ab1709010c50edd9b4e983a8e;
    stim[4] = 228'hc68721e74ba336453862d0b2257f8416dc967c897502c14c70f53c449;
    stim[5] = 228'hc27538de6a19900d8e4bd036097e0357a4955bf4136ff0e29b939c774;
    stim[6] = 228'hbac33f08aa0d7e0d02e282bcfdf7e9d01c7b781afe62dcf305aa48452;
    stim[7] = 228'hd645ec83ef5107bbc9fce743de01d1afabb9d250343ef251cac930a49;
    stim[8] = 228'h90dac14f821f9497e1c8dc4da2c070befe0a763f9bc2d9a44c4d87b0b;
    stim[9] = 228'hcd23e8b145442097c4b585106ae06e64924091e663ae58cc407607838;
    stim[10] = 228'hb678fc21981cc991208035031c51723b85797fbf99df3b6f261d853e1;
    stim[11] = 228'hf0626cf29d3b230318a8374f4451c30e7d07fd541273f32682ab91546;
    stim[12] = 228'h53bca61969fcd0b7f0f3beed3f0620afe2b66c2bce7f09426fada5d44;
    stim[13] = 228'ha8afd9c4a42c537adf14e05214f3280e9fcb6e71c32d43f35399434db;
    stim[14] = 228'hf91860d444f5923916d75b6d528624bdbbd3d89e4efb680fe4448fa21;
    stim[15] = 228'hb54e2881a63bc987f45f04f1b1f724c20ce2aa0a8919b73afc4b59f23;
    stim[16] = 228'hf735611a04a6edc78afc83de216523bc9091403c134a0b86b620e67b2;
    stim[17] = 228'h875743806eaa916238ad0e6174e6127872a1a79a7e0b5903dc93cc6dd;
    stim[18] = 228'h83118826d160784ce23c8b20f2985c054635d5711baff4146186f8f96;
    stim[19] = 228'h84ee21311d0ef8a1bf4477f9cadf83f2632b2a28fad39a6a9a7ddfc36;
    stim[20] = 228'hf69315a009c525543bd5f99071e8dec6258d037233e86fa446c309536;
    stim[21] = 228'hd2934798604280e6cd924ea571ef9b72cb90562ff37734a9fc08eeb8f;
    stim[22] = 228'hf86c26c970632f9817e661577b0f94a8c6019fc6dfdc30989bca70a75;
    stim[23] = 228'hab8a3193de074bf937d4e5406c51a4fce82b05931a5b1f2110fa1f3a2;
    stim[24] = 228'h93219c7b60fb98c7509306927b238f2e5bb5b7da09d79c20c7294836a;
    stim[25] = 228'hd0a41126eba7955cd2700397505edebf4e78f3e3bca59ccafa86c7f8e;
    stim[26] = 228'hd1dc35d49c8584e4c012a99556872ce8d44f7ac3c42ff8e34b06cb42d;
    stim[27] = 228'hb213a16de3e3c33bcc152fa05c4a096807fdcfa5c52d778a9eb249f3f;
    stim[28] = 228'hf68e4b87d498d09484c5ae9fe1bffaffd276183b29d610c637ce6d824;
    stim[29] = 228'hd7699240f8bf82710b6be0960bb96c2ff3e96729b9aab069435ba0dff;
    stim[30] = 228'hf8d20d541486478850dd35cb7c88bb079760eba1f90d119a6dc0bf752;
    stim[31] = 228'h96d52d160d4b78b6e21a386fe5499c798665a03626a8d67567c839870;
    stim[32] = 228'hf95d6261098895350adc85cc7a18fb6a09088641db71b8412b955dfe2;
    stim[33] = 228'h9d7e36b5ba8c4098aaf45d879ba21b07e4d4b9779e68fda8817a03d35;
    stim[34] = 228'hef5a2ff8b2ac26545287a0a15054631203bdf1fd31af0c3858f2856ff;
    stim[35] = 228'hbdda0aee52dd39fc9bef5d399fe1a1f5f10bcbf6443e5cbc0a728d3b9;
    stim[36] = 228'hc21f77f03448e39ecfc127d7377bf134a2705e4ef3211ec11f6c0e7b4;
    stim[37] = 228'hfc0763a9da14a0fef33b1674d07c1d20be76d768acc525e656e614799;
    stim[38] = 228'hd5db7efc64510710737a2dee9149f2b7b426ea9f2d27f7d2c9ff23d30;
    stim[39] = 228'hd8b51f425dbcbd20db61acbd0f342caa3b46580024f782dbaa5a73bb4;
    stim[40] = 228'hac01b1403cd8e00e26f48cc0bf09f4b52c0d863245f53b1961e99a328;
    stim[41] = 228'hd74b90848fa3d5d589aa5043ec694d5013a9dbd72b59e958c67ed6bcb;
    stim[42] = 228'h96a26b8d85f9165e40e206d7494a605c120441325c945aede5d0e5719;
    stim[43] = 228'hb76eae565d0f19605501cb6c59e5d5030a558a63e9ad444c0c3888cfc;
    stim[44] = 228'ha1acf11ebef7ed61a7ac61a8411847dd4a03684a037026f52424263f9;
    stim[45] = 228'hd9ba35fac05b403fbd846eaec5108b43b0933a585a612cf2b09b27c1b;
    stim[46] = 228'hd27574a0ff46bb6d89a74abd17582f32ab93c859780ed7d9ce553df31;
    stim[47] = 228'h8c05b3bb8c708478eac3da484553e46d0e48c2dcf9c4d6b55d1fde2a8;
    stim[48] = 228'ha85ae067051a12a3a5b29c2fd2694953ba01a79536390f85ba1f209a7;
    stim[49] = 228'ha032352ff7caf67f398f985ca0a70dbd3d35e275ac69234f3dbd7f372;
    stim[50] = 228'h9d6ad6d1477cb2fbc03491b4ceb0553cbb1a325d3ce7b65497709b97a;
    stim[51] = 228'hd7bc362b0b8843b1eae7051d24ebe5aa41cb3d3c40ff7c0620ec59100;
    stim[52] = 228'hd25677c0c06913d4220ed919873bd404047f146af6f57afe646096315;
    stim[53] = 228'h9a67348de6e0e244e13d3b593f1f9bf2d1ffee217225194bad1ad6d86;
    stim[54] = 228'h97e8473ccb122a9c303f927b5f563b4c2e3904205f74e06b8baf67083;
    stim[55] = 228'hf159ec31dd27dfd59b74ad79ff705d779f21b382ebb15526b6e97f863;
    stim[56] = 228'h82813186335b35ef4ade9615a061376b8cf7e75f7ebb5c64b03069478;
    stim[57] = 228'he95fe15fbe984630af9ea04b4852d0a21859dcf9e343ceec7f8867f0e;
    stim[58] = 228'h8af717b2c166820f399a95f9b57e46d782b90498bbccd3d62c478ee61;
    stim[59] = 228'hb4c39c874919f342650e7ab11ee8559853b1edabe87b672b164f3e2d9;
    stim[60] = 228'hb827a4b71ddfa47af438a14284475553e6cc1a81e8a2c6d7eb5de3686;
    stim[61] = 228'hd792be4a2b75e88823ed25c2e2da765536df60219afe71edc0d5b00c4;
    stim[62] = 228'hba430c184c09bd2bc05eb9ba5d8541df27232bd6c824712d2bffd3198;
    stim[63] = 228'hcefb4f5d4d2289b4daae081b75da3b49808267fb5cf9fdf981a1e2a1f;
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
      expv[0] = 177'h000000000000000000000000000000000000000000000;
      expv[1] = 177'h000000000000000000000000000000000000000000000;
      expv[2] = 177'h000000000000000000000000000000000000000000000;
      expv[3] = 177'h09d1018f800000001b2fda08221c10b6c1fcde2af1c2d;
      expv[4] = 177'h0f0519668000000014cfa8981a3de5359c36b17090116;
      expv[5] = 177'h1c68085b000000001721e74ba2e85912bfc5c967c8962;
      expv[6] = 177'h04271d5e800000001d38de6a1e681b04bf024955bf41b;
      expv[7] = 177'h03ac0f40000000001b3f08aa0e415e7efbf1c7b781aef;
      expv[8] = 177'h05640ebe8000000015ec83ef5573a1ef00e8bb9d2503a;
      expv[9] = 177'h010d82fb800000001ac14f821b6e26d16039e0a763f8d;
      expv[10] = 177'h0cd219920000000013e8b14543428835703724091e66e;
      expv[11] = 177'h036798ee0000000018fc2198181a818e28ba5797fbf9f;
      expv[12] = 177'h000000000000000000000000000000000000000000000;
      expv[13] = 177'h000000000000000000000000000000000000000000000;
      expv[14] = 177'h128a883a000000001fd9c4a42df0290a7991fcb6e71c3;
      expv[15] = 177'h1f9182f6800000001060d444f4adb6a94315bd3d89e54;
      expv[16] = 177'h1b548308000000001e2881a63b8278d8fb94ce2aa0a99;
      expv[17] = 177'h077316f20000000015611a04a341ef10b293091403c04;
      expv[18] = 177'h107511e1800000001743806ea98730ba730b2a1a79a6c;
      expv[19] = 177'h0831001500000000118826d1664590794c2c635d57118;
      expv[20] = 177'h104e9fc9800000001e21311d08bbfce56fc232b2a28ef;
      expv[21] = 177'h1f691318800000001b15a009c2fcc838f46e58d037235;
      expv[22] = 177'h052915cb000000001b479860432752b8f7cab90562ff9;
      expv[23] = 177'h1f8682a3000000001426c97064b0abbd87cc6019fc6d8;
      expv[24] = 177'h1ab883f3800000001a3193de04f2a03628d482b05930d;
      expv[25] = 177'h193214b900000000199c7b60fb83493d91c7bb5b7da0d;
      expv[26] = 177'h1d0a1afd00000000141126eba681cba82f6ee78f3e3ae;
      expv[27] = 177'h0d1d8ba3000000001c35d49c8254caab439544f7ac3df;
      expv[28] = 177'h032105a00000000013a16de3e517d02e25007fdcfa5d8;
      expv[29] = 177'h07689bff00000000164b87d49a574ff0dffb276183b2a;
      expv[30] = 177'h0d7688bf80000000199240f8b8704b05dcb53e96729bb;
      expv[31] = 177'h178d141e00000000120d5414849ae5be445b760eba1e8;
      expv[32] = 177'h096d09e6000000001d2d160d4b1c37f2a4cc665a0362b;
      expv[33] = 177'h07959da800000000156261098a42e63d0c7a9088641de;
      expv[34] = 177'h01d7941f800000001e36b5ba8c2ec3cdd10a4d4b9779d;
      expv[35] = 177'h16f59448000000001a2ff8b2aad050a82a323bdf1fd25;
      expv[36] = 177'h13dd87d7800000001a0aee52deae9ccff0d110bcbf64d;
      expv[37] = 177'h04218cd2800000001777f0344f13eb9bbdf82705e4eee;
      expv[38] = 177'h1fc00c82800000001f63a9da178b3a683e0de76d768b3;
      expv[39] = 177'h155d9ade80000000137efc645096f748a4fb426ea9f3a;
      expv[40] = 177'h1d8b0aa880000000151f425db8d65e879a15b46580022;
      expv[41] = 177'h0ac002d48000000011b1403cdf46605f84fcc0d86325c;
      expv[42] = 177'h0d748d40000000001390848fa22821f634a53a9dbd736;
      expv[43] = 177'h016a0970000000001a6b8d85ff036ba4a53120441324f;
      expv[44] = 177'h1b768c0c0000000016ae565d08e5b62cf2eca558a63e2;
      expv[45] = 177'h0a1a9f75000000001cf11ebef030d4208c26a03684a13;
      expv[46] = 177'h159b9d0e800000001a35fac05fb7576288430933a5857;
      expv[47] = 177'h0d271cca800000001574a0ff46255e8bac16b93c8596a;
      expv[48] = 177'h08c001b4000000001db3bb8c746d2422a9f4e48c2dce9;
      expv[49] = 177'h0285854e8000000012e06705194e17e934a1a01a79524;
      expv[50] = 177'h1a030ef48000000012352ff7cfcc2e505385d35e275b2;
      expv[51] = 177'h09d68cf28000000012d6d1477d48da67582db1a325d3a;
      expv[52] = 177'h0d7b86a90000000014362b0b88028e9275f41cb3d3c5c;
      expv[53] = 177'h0d250810000000001e77c0c06a6c8cc39dec47f146aff;
      expv[54] = 177'h01a61fcb0000000017348de6e21dac9f8fcb1ffee216e;
      expv[55] = 177'h117e9d308000000018473ccb16c93dafab1ae39042053;
      expv[56] = 177'h1f1585de0000000019ec31dd22d6bcffb82df21b382e9;
      expv[57] = 177'h08281dae00000000193186335f4b0ad0309ecf7e75f6f;
      expv[58] = 177'h06958a88000000001fe15fbe985025a42969859dcf9e7;
      expv[59] = 177'h18af1b5e000000001717b2c167cafcdabf262b90498aa;
      expv[60] = 177'h0b4c0661000000001b9c8749193d588f742d3b1edabf1;
      expv[61] = 177'h1b820d4f8000000017a4b71dddd0a14223ac6cc1a81e2;
      expv[62] = 177'h0d791954800000001abe4a2b7412e1716d3f6df60219b;
      expv[63] = 177'h03a4077c800000001b0c184c0d5cdd2ec2a07232bd6d9;
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
