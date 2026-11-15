// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 206;
  localparam OW = 153;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03091 dut (
    .aclk(clk),
    .aresetn(in_vec[205:205]),
    .s_axi_awaddr(in_vec[204:173]),
    .s_axi_awlen(in_vec[172:165]),
    .s_axi_awsize(in_vec[164:162]),
    .s_axi_awburst(in_vec[161:160]),
    .s_axi_awlock(in_vec[159:159]),
    .s_axi_awcache(in_vec[158:155]),
    .s_axi_awprot(in_vec[154:152]),
    .s_axi_awregion(in_vec[151:148]),
    .s_axi_awqos(in_vec[147:144]),
    .s_axi_awvalid(in_vec[143:143]),
    .s_axi_wdata(in_vec[142:111]),
    .s_axi_wstrb(in_vec[110:107]),
    .s_axi_wlast(in_vec[106:106]),
    .s_axi_wvalid(in_vec[105:105]),
    .s_axi_bready(in_vec[104:104]),
    .s_axi_araddr(in_vec[103:72]),
    .s_axi_arlen(in_vec[71:64]),
    .s_axi_arsize(in_vec[63:61]),
    .s_axi_arburst(in_vec[60:59]),
    .s_axi_arlock(in_vec[58:58]),
    .s_axi_arcache(in_vec[57:54]),
    .s_axi_arprot(in_vec[53:51]),
    .s_axi_arregion(in_vec[50:47]),
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
    .s_axi_awready(out_vec[152:152]),
    .s_axi_wready(out_vec[151:151]),
    .s_axi_bresp(out_vec[150:149]),
    .s_axi_bvalid(out_vec[148:148]),
    .s_axi_arready(out_vec[147:147]),
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
    stim[0] = 206'h05599cdce76d4252ffb7668c4c462d87f320840334c2806852de;
    stim[1] = 206'h0db99d82d67ff03a640f88f74113ad00559aece648cda8b6d6bf;
    stim[2] = 206'h3bffd50cea11cd43657719093b0a4cba1715b6f1ae5aa51fd686;
    stim[3] = 206'h2f931af0e6341284d0fcfc9e625790af26ec397e5162d06dac9a;
    stim[4] = 206'h2c8a16dbb742f98a8155aa3ece7b205cbf31f5863c4fb5e5ae75;
    stim[5] = 206'h26c5b8cd14c7eb399460cab0a638219ca29382f7402d9b8ef8f6;
    stim[6] = 206'h3f75cb8b847b2703420b8d6b17aafec3517ca0103d74511aa2fb;
    stim[7] = 206'h315968cfe8ff3067932540925213612ac2cb48ddda12c66bdf68;
    stim[8] = 206'h364290da813b3f9c0385d04cbd3994d85767ee877fec460e0c9d;
    stim[9] = 206'h2de389266830dde50c13b8f7729337cb3edbe1859f7dcb67bbe6;
    stim[10] = 206'h2f976a4438659929058c5f9351e25bb6d90b1ffb40b4e5a11aef;
    stim[11] = 206'h28a64a96c67e20dbba2bd98be5143718fbdbcfb68c7f732f363d;
    stim[12] = 206'h29b5d80d3f8b1bb12c8174f2477584ca30a6341c50bf840fb9b9;
    stim[13] = 206'h3cd4120e11a8c5683b9ee29772ba9cb95e8aef97bf774ec49e9a;
    stim[14] = 206'h24902bad6953e94ca30be3bdacbba83a4b94f5042be34d04c64e;
    stim[15] = 206'h2730d59ec6e6f0c9ef7fda9641ffc15e6d9751eef69a30761233;
    stim[16] = 206'h35e306e969426306f2a74bb6de520ed1d87c875de18e260529da;
    stim[17] = 206'h2e974b210ffe339cb3bad28f7d3b53fd9acc129ebadd262f4c72;
    stim[18] = 206'h341136e268988d8f525a04102ed79804449716727ad46bb42f6c;
    stim[19] = 206'h36e520fc5b0a494367bf2325cfc134738a66e63de66e118c821b;
    stim[20] = 206'h37d12198caec7d04cadd8956d7fb56e714a190243231056e6bd0;
    stim[21] = 206'h2a2a90d1be5617047b654589d1ac5169b55dbd3610e5446dae29;
    stim[22] = 206'h33f31776e68fddbb8320adbef14a008605f640fffdf7159f25ad;
    stim[23] = 206'h2fca34192d6c696b9aac69b4c0a266b3af23998b6c64c0fbcae3;
    stim[24] = 206'h250b7c3aad1c57ce1c75b9b2a40018d1257741a7b13f38e415df;
    stim[25] = 206'h35b912946ff5b9fa6d1d663f33afd52d7be767c16aad0297ee79;
    stim[26] = 206'h3138bdcaf181da73a0f193679e7b8fabcc5f6d5eab6187bfec60;
    stim[27] = 206'h37ef625b62a7f30fff3d65a54ab9601e894954e6cc2d23090fa9;
    stim[28] = 206'h370dc48127b859925a4e1fc8b26e757e1a2de6986b23b1a0546d;
    stim[29] = 206'h29c9b599101c63f61a42821bf27308fc4b14a5392d354980f1fb;
    stim[30] = 206'h3a894b5d026d0a5164cc628bf0c60fa9ecee52091013a213c3ba;
    stim[31] = 206'h3b08414c9645f37bfea12ca14c9ac092cc7334d73deb1ffbde55;
    stim[32] = 206'h29ef2c0a0089dc34e8c5235641436b28da1b177477a21640ef66;
    stim[33] = 206'h201b6e60640f27d7f3b6b7d865091a9a0b598bc405eb37ac7a8e;
    stim[34] = 206'h2290d9dfd03f4074ba5db73d2c05ef726f4e57b39c896cf778f2;
    stim[35] = 206'h3d6811cbf6b1a2ee65752f6b5d5904c609e6d91d92fdaae4421b;
    stim[36] = 206'h3b7284bdc3cbcd6bf7968f675f9a17656a4fa6a216a3c92f81c8;
    stim[37] = 206'h27cdd6ea02e0aa9cdc70083ef3806154806a90a33758f76a27e5;
    stim[38] = 206'h2d4b40e4495b235da0bc5f0190b939570bb871e009945759a79e;
    stim[39] = 206'h2eec90031769117d2d36363b04607a0b1da30338b3388b280914;
    stim[40] = 206'h32666a997dd016dbaadac040b4af2671d45ad1b73d8a60bfda64;
    stim[41] = 206'h34e71898adb3886385ad211ba48442bf9672c6f7e3359184bea4;
    stim[42] = 206'h2b91868f8c17e290228cef00347aae6eda7aafa22aee8317d6ca;
    stim[43] = 206'h3f72d1aa41eeade5a5b35deb3d80900f1cc4d0f8b87a3f823382;
    stim[44] = 206'h315d8defea8aa8270cdd48bfde4cf200761e25196096de3dfd2c;
    stim[45] = 206'h36b3c1cb9c9d00e7fd16a96effd3382af6c9d8da42639efeadd0;
    stim[46] = 206'h369886078a7f5ab9f1dbd413be9d2bea715ca441aaee2e6a727f;
    stim[47] = 206'h36471da9218791a9c92a3a0920441825ee41a70e76abde0b7b32;
    stim[48] = 206'h3dd2ec481d94a18a80167cebd6da6ccf1fa36f651a2161521cb7;
    stim[49] = 206'h3eaae2acfa417865061292d0f470e8b06b3fca67ad2891e440d8;
    stim[50] = 206'h25ca5d8bfca3844a0ccdc4a3f26039e18fe0329c66e6a54dfb7d;
    stim[51] = 206'h3ad410168a70bb90373995d0b3587435b788f46834e511f91bcf;
    stim[52] = 206'h308d6e2e18b8b67891af280b7fc5888f386695b0630c4f448b5e;
    stim[53] = 206'h31b63c7aaab082b6e66ba8cbc4c8c9e53f0547ba155890f4a721;
    stim[54] = 206'h31d629d7a15023e950351d4c593f6e055e5cf93b0269b6926b1d;
    stim[55] = 206'h2ddbf70b2c5fb8dcb2da2c288aa0b0d4e358cca4612c18e0ba46;
    stim[56] = 206'h2dcfb120c585f452d60168e5bd265b9ff8a0d49821c43c6e3ad0;
    stim[57] = 206'h27419e0363974b1ddf05b8965de40d551a48ca70a9a60d36cd54;
    stim[58] = 206'h3d3974d1ea50f05754dacc8cf16bc298635eae72fbe5af8a4ea8;
    stim[59] = 206'h2e3ebbeae40e4cca572eb3977b44bd2188fc430dfe017546c440;
    stim[60] = 206'h35eb9b2593a741857526856701179090062fe932b8ff11c4169a;
    stim[61] = 206'h3f8c98cbdea2f78d1012fbe817a5a97ccdabaae9bd752827e201;
    stim[62] = 206'h20d6d7328fd97a33fd12b54516af4cfd734843fdafc7175464e7;
    stim[63] = 206'h2aface39225d4f0929e9734576660025947b479f29436038fa3e;
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
      expv[0] = 153'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 153'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 153'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 153'h0x2a51fd686xxxxxxxxxxxxxxxxxxx1499742f8;
      expv[4] = 153'h1x2a51fd6863e4c6bc3axxxxxxxxxx1499742f8;
      expv[5] = 153'h1x7b5e5ae75be4c6bc3axxxxxxxxxx1499742f8;
      expv[6] = 153'h1x59b8ef8f73e4c6bc3axxxxxxxxxx1499742f8;
      expv[7] = 153'h0x59b8ef8f73e4c6bc3axxxxxxxxxx1499742f8;
      expv[8] = 153'h0x59b8ef8f73e4c6bc3a13254092541499742f8;
      expv[9] = 153'h0x4460e0c9c3e4c6bc3a13254092541499742f8;
      expv[10] = 153'h075cb67bbe63e4c6bc3a13254092561499742f8;
      expv[11] = 153'h025cb67bbe63e4c6bc3a13254092541499742f8;
      expv[12] = 153'h127732f363da2992a5b093254092541499742f8;
      expv[13] = 153'h127840fb9b9a2992a5b093254092541499742f8;
      expv[14] = 153'h0a7840fb9b9a2992a5b013254092541499742f8;
      expv[15] = 153'h0a7840fb9b9a2992a5b013254092541499742f8;
      expv[16] = 153'h0a23076123222992a5b013254092541499742f8;
      expv[17] = 153'h026260529db22992a5b072a74bb6dc1499742f8;
      expv[18] = 153'h045262f4c7222992a5b072a74bb6dc1499742f8;
      expv[19] = 153'h045262f4c7222992a5b072a74bb6dc1499742f8;
      expv[20] = 153'h046118c821a22992a5b072a74bb6dd8268e715c;
      expv[21] = 153'h146118c821a5f4486635f2a74bb6dd8268e715c;
      expv[22] = 153'h146118c821a5f4486635f2a74bb6dd8268e715c;
      expv[23] = 153'h0c6118c821a5f448663572a74bb6dd8268e715c;
      expv[24] = 153'h0c6118c821a5f448663572a74bb6dd8268e715c;
      expv[25] = 153'h0c738e415dfdf448663572a74bb6dd8268e715c;
      expv[26] = 153'h0450297ee785f44866356d1d663f358268e715c;
      expv[27] = 153'h0450297ee785f44866356d1d663f358268e715c;
      expv[28] = 153'h04523090fa9df44866356d1d663f358268e715c;
      expv[29] = 153'h04523090fa9df44866356d1d663f358268e715c;
      expv[30] = 153'h03523090fa9df44866356d1d663f378268e715c;
      expv[31] = 153'h01523090fa9df44866356d1d663f378268e715c;
      expv[32] = 153'h0131ffbde55df44866356d1d663f378268e715c;
      expv[33] = 153'h0131ffbde55df44866356d1d663f378268e715c;
      expv[34] = 153'h01337ac7a8f5f44866356d1d663f378268e715c;
      expv[35] = 153'h0116cf778f35f44866356d1d663f378268e715c;
      expv[36] = 153'h065aae4421a5f44866356d1d663f358268e715c;
      expv[37] = 153'h165aae4421a6dca12f75ed1d663f358268e715c;
      expv[38] = 153'h0e0f76a27e46dca12f756d1d663f358268e715c;
      expv[39] = 153'h0e0f76a27e46dca12f756d1d663f358268e715c;
      expv[40] = 153'h0e08b2809146dca12f756d1d663f358268e715c;
      expv[41] = 153'h0e260bfda656dca12f756d1d663f358268e715c;
      expv[42] = 153'h0e260bfda656dca12f756d1d663f358268e715c;
      expv[43] = 153'h0e68317d6ca6dca12f756d1d663f358268e715c;
      expv[44] = 153'h0e23f8233836dca12f756d1d663f358268e715c;
      expv[45] = 153'h0623f8233836dca12f750cdd48bfdd8268e715c;
      expv[46] = 153'h0623f8233836dca12f750cdd48bfdd8268e715c;
      expv[47] = 153'h0662e6a727e6dca12f750cdd48bfdd8268e715c;
      expv[48] = 153'h063de0b7b326dca12f750cdd48bfdd8268e715c;
      expv[49] = 153'h063de0b7b326dca12f750cdd48bfdd8268e715c;
      expv[50] = 153'h06091e440d96dca12f750cdd48bfdd8268e715c;
      expv[51] = 153'h06091e440d96dca12f750cdd48bfdd8268e715c;
      expv[52] = 153'h06091e440d96dca12f750cdd48bfdd8268e715c;
      expv[53] = 153'h0644f448b5e6dca12f750cdd48bfdd8268e715c;
      expv[54] = 153'h05090f4a721edca12f750cdd48bfdf8268e715c;
      expv[55] = 153'h051b6926b1c6dca12f750cdd48bfdf8268e715c;
      expv[56] = 153'h05418e0ba476dca12f750cdd48bfdf8268e715c;
      expv[57] = 153'h05418e0ba476dca12f750cdd48bfdf8268e715c;
      expv[58] = 153'h05418e0ba476dca12f750cdd48bfdf8268e715c;
      expv[59] = 153'h05418e0ba476dca12f750cdd48bfdf8268e715c;
      expv[60] = 153'h05418e0ba476dca12f750cdd48bfdf8268e715c;
      expv[61] = 153'h06711c4169b6dca12f750cdd48bfdd8268e715c;
      expv[62] = 153'h06f11c4169b6dca12f750cdd48bfdd4b52f99b6;
      expv[63] = 153'h16f11c4169b035b5cca28cdd48bfdd4b52f99b6;
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
