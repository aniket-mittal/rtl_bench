// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 162;
  localparam OW = 46;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_006381 dut (
    .ACLK(clk),
    .ARESETN(in_vec[161:161]),
    .M_AXI_AWID(in_vec[160:160]),
    .M_AXI_AWADDR(in_vec[159:128]),
    .M_AXI_AWLEN(in_vec[127:120]),
    .M_AXI_AWSIZE(in_vec[119:117]),
    .M_AXI_AWBURST(in_vec[116:115]),
    .M_AXI_AWLOCK(in_vec[114:114]),
    .M_AXI_AWCACHE(in_vec[113:110]),
    .M_AXI_AWPROT(in_vec[109:107]),
    .M_AXI_AWQOS(in_vec[106:103]),
    .M_AXI_AWUSER(in_vec[102:102]),
    .M_AXI_AWVALID(in_vec[101:101]),
    .M_AXI_WDATA(in_vec[100:69]),
    .M_AXI_WSTRB(in_vec[68:65]),
    .M_AXI_WLAST(in_vec[64:64]),
    .M_AXI_WUSER(in_vec[63:63]),
    .M_AXI_WVALID(in_vec[62:62]),
    .M_AXI_BREADY(in_vec[61:61]),
    .M_AXI_ARID(in_vec[60:60]),
    .M_AXI_ARADDR(in_vec[59:28]),
    .M_AXI_ARLEN(in_vec[27:20]),
    .M_AXI_ARSIZE(in_vec[19:17]),
    .M_AXI_ARBURST(in_vec[16:15]),
    .M_AXI_ARLOCK(in_vec[14:14]),
    .M_AXI_ARCACHE(in_vec[13:10]),
    .M_AXI_ARPROT(in_vec[9:7]),
    .M_AXI_ARQOS(in_vec[6:3]),
    .M_AXI_ARUSER(in_vec[2:2]),
    .M_AXI_ARVALID(in_vec[1:1]),
    .M_AXI_RREADY(in_vec[0:0]),
    .M_AXI_AWREADY(out_vec[45:45]),
    .M_AXI_WREADY(out_vec[44:44]),
    .M_AXI_BID(out_vec[43:43]),
    .M_AXI_BRESP(out_vec[42:41]),
    .M_AXI_BUSER(out_vec[40:40]),
    .M_AXI_BVALID(out_vec[39:39]),
    .M_AXI_ARREADY(out_vec[38:38]),
    .M_AXI_RID(out_vec[37:37]),
    .M_AXI_RDATA(out_vec[36:5]),
    .M_AXI_RRESP(out_vec[4:3]),
    .M_AXI_RLAST(out_vec[2:2]),
    .M_AXI_RUSER(out_vec[1:1]),
    .M_AXI_RVALID(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 162'h1716ebf2de0571619e14c995cfdfa1bc583e04db7;
    stim[1] = 162'h0ae5bacfc2e18bc3f720492b81be7871eabac5d8e;
    stim[2] = 162'h33e048aea538438fc615f820e95537b6587f9e3aa;
    stim[3] = 162'h3ff66b8bead7ad5cf939596552332bf0b284fdfa7;
    stim[4] = 162'h3b835efd74916aa3d445b9e98ea390fcc39934481;
    stim[5] = 162'h3642cc77fcb427b6be96ee8da821c9d2adf9cdcb9;
    stim[6] = 162'h222ad0d6dabdf87a3dd0fef5e17c15e0ba087c5f3;
    stim[7] = 162'h357e67a3b728d9ce2ee94faa6444a978b3f9fe65f;
    stim[8] = 162'h2acdd7890297f1afb1a57c3499e04e5635b04fab0;
    stim[9] = 162'h23e0419366551a80dd204526d1a43e9aca0db0d78;
    stim[10] = 162'h33043cd4db7ee753d0870495b8981256057247eac;
    stim[11] = 162'h2c6263e784845ab37a9bb844762b80aa99b07cc3c;
    stim[12] = 162'h260c53f2568f6296a412f998c3649318e5368be2b;
    stim[13] = 162'h2f7b56fd148f1d59d2a23efd03d7020170f65900a;
    stim[14] = 162'h2cc2fe69597faf82f988098e71fac964605e2d9ac;
    stim[15] = 162'h2b5b28792a0755c598996ebcfc4064c79e54e0c92;
    stim[16] = 162'h279ad844d87de771c84fcdec533c2f4fc5bdcc324;
    stim[17] = 162'h3d0e867b9af18e97b401e38cb91178a44c1a2acd6;
    stim[18] = 162'h2109bc830bcbebcfe3339719b84d40a77769d0b34;
    stim[19] = 162'h3e94837850857c4490a1869dba9cfc5a78cd34627;
    stim[20] = 162'h2f2694a7d3b2dbbd51b08b40362a9dea51589f961;
    stim[21] = 162'h3502fe1706daaed20b88c6bcd37d277f17e5f97fe;
    stim[22] = 162'h22020f16c03f2dc271b14873e8473f14e79f60c57;
    stim[23] = 162'h2dd8ab0a46226100af7c10fe64852ac35c68914a3;
    stim[24] = 162'h2947d1cd68ff63b50dab71018eb192692b9b14185;
    stim[25] = 162'h3ceb05f2dc4ea952b28793d51190714cd9e6e3ae5;
    stim[26] = 162'h2a9a5456e4e6fbb997908b914d9e9559edf0d291c;
    stim[27] = 162'h2f202a26f5e469fde672b9409513e1e4dd966e2f9;
    stim[28] = 162'h27ba94e2e7215b42a9567196246ae515b3bcb1f8f;
    stim[29] = 162'h321169984638a6d5318a9e707c777f1a938d20e7c;
    stim[30] = 162'h257604b96a63381b320c9cadfb87b21d9cc589390;
    stim[31] = 162'h2ee175027146f833e0c3c25d79e0f9fa397855d0d;
    stim[32] = 162'h26b3c62ada47b2b2181dce2bfe8aa56c692c942c9;
    stim[33] = 162'h24514521baad93b6779f6c8f87a6d5c9589ab2f60;
    stim[34] = 162'h245399d3648c93852a043e6251843bfc537f14acd;
    stim[35] = 162'h36c4aae8e9dd1dcf4d1357226c5e8fdd2bad55a19;
    stim[36] = 162'h3532b31875b857c866a4efb7625d8b037741a8e53;
    stim[37] = 162'h35014836bc9e77bcd4a6291e738a422751566ba82;
    stim[38] = 162'h373f8802c902a4e9ced439d2f7c8c6c22ef87b6b5;
    stim[39] = 162'h228d33a4d950e3ca788a7928033992d3b0be54f19;
    stim[40] = 162'h3190b3ede21bcfcdc0038efd03b581b8290756941;
    stim[41] = 162'h3caad885c72e09e775a2e3470dcb44f409d436cef;
    stim[42] = 162'h3bc487ed78efae5b5fd5a8c0ad3226c3be2dce450;
    stim[43] = 162'h20c803e64e90217c3bc3bd5818fc2cd6007e2c012;
    stim[44] = 162'h24a115a0a3611916719e5df50d6f17376415ae312;
    stim[45] = 162'h2e79c4a284e964c1511a0cfd6866ae1cc81c4d8bf;
    stim[46] = 162'h32c125502e86d8f012238ab6bed8b3bffee6bec63;
    stim[47] = 162'h205a31fb899371c7274c6af92c36df025c5ff6102;
    stim[48] = 162'h3b92ad0cb6e64acfd4f2908dcdd6e77bafde32271;
    stim[49] = 162'h212fb1d904b818c1fb65c52fc573ff979492457dd;
    stim[50] = 162'h22d96e70cbc08549e850db9945f038be3b5d414a4;
    stim[51] = 162'h23a2cff85ff006f630dc0790ad41bd296433f8917;
    stim[52] = 162'h35dc17844618f4e22e65b709f1ca4ce904f310bd4;
    stim[53] = 162'h377b406593a1e69e7adba597f698290223115bfe4;
    stim[54] = 162'h2de0a2a92e07d45429ef77efc273ad2675ec231eb;
    stim[55] = 162'h2bec747b82e57298e4e95eadc3e8256bc10853796;
    stim[56] = 162'h23107edd9c6436201b816041524e3195f18b35583;
    stim[57] = 162'h2c2f8205d6632dcb33256515a035a19d38c01191e;
    stim[58] = 162'h2802f9f309d3d8c28b518ca83dbfebd0c8f70c71b;
    stim[59] = 162'h23c41bb3484902a34c7b0c7bb1e96419aedb33ed4;
    stim[60] = 162'h3e2ba9e7d91da9bb50fa3e0851d23cfbda4f63561;
    stim[61] = 162'h36c7b8c4a39019e8ab9d7299dc7e2b807bed653fd;
    stim[62] = 162'h2fbe9505cc99f353f6c005226ad6107a10b5492be;
    stim[63] = 162'h2bcc9d50ea2344cee927033290833892606742fd2;
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
      expv[0] = 46'h304000000000;
      expv[1] = 46'h304000000000;
      expv[2] = 46'h304000000000;
      expv[3] = 46'h304000000001;
      expv[4] = 46'h304000000021;
      expv[5] = 46'h304000000041;
      expv[6] = 46'h304000000061;
      expv[7] = 46'h304000000081;
      expv[8] = 46'h3040000000a1;
      expv[9] = 46'h3040000000a1;
      expv[10] = 46'h3040000000a1;
      expv[11] = 46'h3040000000a1;
      expv[12] = 46'h3040000000a1;
      expv[13] = 46'h3040000000c1;
      expv[14] = 46'h3040000000c1;
      expv[15] = 46'h3040000000c1;
      expv[16] = 46'h30c0000000c1;
      expv[17] = 46'h3040000000c1;
      expv[18] = 46'h3040000000c1;
      expv[19] = 46'h3040000000c1;
      expv[20] = 46'h3040000000e1;
      expv[21] = 46'h304000000101;
      expv[22] = 46'h304000000101;
      expv[23] = 46'h304000000121;
      expv[24] = 46'h304000000141;
      expv[25] = 46'h304000000161;
      expv[26] = 46'h304000000181;
      expv[27] = 46'h304000000181;
      expv[28] = 46'h30c0000001a1;
      expv[29] = 46'h30c0000001c1;
      expv[30] = 46'h30c0000001c1;
      expv[31] = 46'h3040000001c1;
      expv[32] = 46'h3040000001e1;
      expv[33] = 46'h304000000201;
      expv[34] = 46'h304000000201;
      expv[35] = 46'h304000000221;
      expv[36] = 46'h304000000241;
      expv[37] = 46'h304000000261;
      expv[38] = 46'h304000000261;
      expv[39] = 46'h304000000281;
      expv[40] = 46'h3040000002a1;
      expv[41] = 46'h3040000002c1;
      expv[42] = 46'h3040000002e1;
      expv[43] = 46'h3040000002e1;
      expv[44] = 46'h3040000002e1;
      expv[45] = 46'h3040000002e1;
      expv[46] = 46'h304000000301;
      expv[47] = 46'h304000000321;
      expv[48] = 46'h304000000321;
      expv[49] = 46'h304000000341;
      expv[50] = 46'h304000000361;
      expv[51] = 46'h304000000361;
      expv[52] = 46'h304000000381;
      expv[53] = 46'h304000000381;
      expv[54] = 46'h304000000381;
      expv[55] = 46'h3040000003a1;
      expv[56] = 46'h3040000003a1;
      expv[57] = 46'h3040000003c1;
      expv[58] = 46'h3040000003c1;
      expv[59] = 46'h30c0000003e1;
      expv[60] = 46'h30c0000003e1;
      expv[61] = 46'h30c000000401;
      expv[62] = 46'h30c000000421;
      expv[63] = 46'h304000000421;
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
