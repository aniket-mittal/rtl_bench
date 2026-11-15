// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 134;
  localparam OW = 121;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_215945 dut (
    .ACLK(clk),
    .ARESETN(in_vec[133:133]),
    .CONFIG_VALID(in_vec[132:132]),
    .CONFIG_START_ADDR(in_vec[131:100]),
    .CONFIG_NBYTES(in_vec[99:68]),
    .DATA(in_vec[67:4]),
    .DATA_VALID(in_vec[3:3]),
    .M_AXI_BRESP(in_vec[2:1]),
    .M_AXI_BVALID(in_vec[0:0]),
    .M_AXI_AWADDR(out_vec[120:89]),
    .M_AXI_AWREADY(out_vec[88:88]),
    .M_AXI_AWVALID(out_vec[87:87]),
    .M_AXI_WDATA(out_vec[86:23]),
    .M_AXI_WSTRB(out_vec[22:15]),
    .M_AXI_WREADY(out_vec[14:14]),
    .M_AXI_WVALID(out_vec[13:13]),
    .M_AXI_WLAST(out_vec[12:12]),
    .M_AXI_BREADY(out_vec[11:11]),
    .M_AXI_AWLEN(out_vec[10:7]),
    .M_AXI_AWSIZE(out_vec[6:4]),
    .M_AXI_AWBURST(out_vec[3:2]),
    .CONFIG_READY(out_vec[1:1]),
    .DATA_READY(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 134'h08fba746f00e3f13b65f6a40273acc27da;
    stim[1] = 134'h12cdf7f310d65261aed648b318dfebc3da;
    stim[2] = 134'h22038659ba9c429193be3e1ef289130f29;
    stim[3] = 134'h2e6f99fca7718ebbe2bb957a40f62d5cb4;
    stim[4] = 134'h3400597ff034908cc456bacad575478c8c;
    stim[5] = 134'h2e222f2680a67c52f497e6e0328a5120d3;
    stim[6] = 134'h3e19d992d61fcd76c6f9f254ac8d0db550;
    stim[7] = 134'h3e69d6358df76001defc3915c9ff0473ba;
    stim[8] = 134'h3686ac4750322013ddb9559ee65a5683fb;
    stim[9] = 134'h14b9fe35d2cb772718142ea709f45d3498;
    stim[10] = 134'h3a04d8f6a935b3b88bfde7de72aada38e9;
    stim[11] = 134'h2f859db45b53634a5eadd98063cd1a4e75;
    stim[12] = 134'h2093e244459287bd43907317b124b0b844;
    stim[13] = 134'h270b0990e557e25a88f8ab115f0d107ffb;
    stim[14] = 134'h3f3a4c38e41dc51b91ddcb9f5a1c6524df;
    stim[15] = 134'h3e55fbace8179eb81f24d8bc9efb99f8e6;
    stim[16] = 134'h35d735de9e144796eb12639fc48c09f732;
    stim[17] = 134'h379c45d372fa8063bc8cf92ad8a011e4d3;
    stim[18] = 134'h288791c97d54e2435f00e10dab3f4b32da;
    stim[19] = 134'h3cc7ca5d96048a8317607cb926e8e645e6;
    stim[20] = 134'h339c9ad9bc58f73e3850fa38a36ee28458;
    stim[21] = 134'h2de7cdc74b410995f95104fc0d607cbe18;
    stim[22] = 134'h246de7ed08afb4ca0939e9f87e521de76c;
    stim[23] = 134'h2ffe5a872d8a45734b581bd2aec6235fbb;
    stim[24] = 134'h3378473c5841948f0102421877129b1fc8;
    stim[25] = 134'h25dd261c490c938495980419cda67b1d05;
    stim[26] = 134'h3028f76b7b1359434e69d1818a6c081a74;
    stim[27] = 134'h3487c155c51b68926619bfc03ba0085981;
    stim[28] = 134'h3dd5d1a3d4c12b3d5dc4041498174cab1d;
    stim[29] = 134'h3538f30551b90ee1cbad4139aff742385f;
    stim[30] = 134'h2555cd5075a2715c751070bd3f1e57bc87;
    stim[31] = 134'h276f4fd9a84cad58d1d51a1414c1c728f6;
    stim[32] = 134'h3bc2b72584f10a56b15ca00cd9e8ff8155;
    stim[33] = 134'h36a51e58fed8e1105cfc610694f8f3ae81;
    stim[34] = 134'h2bfcbbe744609559df8f4b984cb58a5cac;
    stim[35] = 134'h33d4b5583d544e37b43a1cf026b941d9ae;
    stim[36] = 134'h2b2482630d839dd8f99f708d3707cf5b1d;
    stim[37] = 134'h29cf3e1c2730042a95b65c19ad50baa099;
    stim[38] = 134'h2463cf6d70a13594deca716c59c8f4fa95;
    stim[39] = 134'h392942e18bb952ea7558aa78d3b0ef0c43;
    stim[40] = 134'h2f6716de78e8941b719adde417ad859443;
    stim[41] = 134'h26720e347f3eb7954a47c6895cb3ab645b;
    stim[42] = 134'h039ff982e875d24f0ca19ed9b5bfc37baa;
    stim[43] = 134'h31c43e230562897f2fb42be4194a4e05f4;
    stim[44] = 134'h3eb600e67359cbead683b753c0cf563429;
    stim[45] = 134'h3aa716978167cc4e9155931c77ac95e4aa;
    stim[46] = 134'h3f2bda3d0c69e468fbb3105a5c9cd4dd99;
    stim[47] = 134'h384e6d58b5fe0c4179acd1325191543948;
    stim[48] = 134'h37aa0e55888864daef2eb76e9611a17fbf;
    stim[49] = 134'h2d45ef138ac0898b2bebd93681d5419d01;
    stim[50] = 134'h388394c3834a01f3d78d5f3c76961ac3fe;
    stim[51] = 134'h364dc5de8ba58aa6871a3ba59e0ffaa613;
    stim[52] = 134'h29c2b2e21aaa6d6099627adeee39c8e326;
    stim[53] = 134'h361adcf1d8231539e8ca8c047fb073d299;
    stim[54] = 134'h3538dfc890eab6d8f771fe1a201ea24a7d;
    stim[55] = 134'h3df5179a8e6209f0a111c847d297074ea0;
    stim[56] = 134'h24f5d82255857e7675766bbb0685c6937e;
    stim[57] = 134'h3ce6e8dc888f4e148a78dcdb9d8dda82c0;
    stim[58] = 134'h3aea56749cac5f5f8aa907f86c3b4afce2;
    stim[59] = 134'h2cf7274ed97e3cdba72272df2dd99f7a21;
    stim[60] = 134'h3fc906742a4efd695ce34ea190a8cff521;
    stim[61] = 134'h26ebce97582ca821d554dc7c2db179a984;
    stim[62] = 134'h3b4400f7fc65b7456158c8bee356899461;
    stim[63] = 134'h36cb673b0b3a23897c0ca023606ea4ee69;
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
      expv[0] = 121'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 121'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 121'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 121'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 121'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 121'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 121'h0800b2fffxxxxxxxxxxxxxxxxxxx834;
      expv[7] = 121'h0800b300fxxxxxxxxxxxxxxxxxxx034;
      expv[8] = 121'h0800b301ff7e1c8ae4ff8239dffe034;
      expv[9] = 121'h0800b302fedcaacf732d2b41fffe837;
      expv[10] = 121'h0800b302fedcaacf732d2b41fffe837;
      expv[11] = 121'h0800b302fedcaacf732d2b41fffe834;
      expv[12] = 121'h1409b1ed5edcaacf732d2b41fffc834;
      expv[13] = 121'h1409b1ee5edcaacf732d2b41fffc034;
      expv[14] = 121'h1409b1ef5c7c5588af86883ffffe834;
      expv[15] = 121'h1409b1f058eee5cfad0e32926ffe834;
      expv[16] = 121'h1409b1f158eee5cfad0e32926ffc034;
      expv[17] = 121'h1409b1f258eee5cfad0e32926ffc034;
      expv[18] = 121'h1409b1f358eee5cfad0e32926ffc834;
      expv[19] = 121'h1409b1f45f807086d59fa5996ffe034;
      expv[20] = 121'h1409b1f55f807086d59fa5996ffc034;
      expv[21] = 121'h1409b1f65c287d1c51b771422ffe034;
      expv[22] = 121'h1409b1f75ca8827e06b03e5f0ffe034;
      expv[23] = 121'h1409b1f85c9cf4fc3f290ef3b7fe034;
      expv[24] = 121'h1409b1f95dac0de9576311afdffe834;
      expv[25] = 121'h1409b1fa5881210c3b894d8fe7ff034;
      expv[26] = 121'h1409b1fb5881210c3b894d8fe7fd834;
      expv[27] = 121'h1409b1fc5881210c3b894d8fe7fd034;
      expv[28] = 121'h1409b1fd5881210c3b894d8fe7fd834;
      expv[29] = 121'h1409b1fe5ee2020a4c0ba6558ffe834;
      expv[30] = 121'h1409b1ff5dd6a09cd7fba11c2ffe834;
      expv[31] = 121'h1409b2005dd6a09cd7fba11c2ffc834;
      expv[32] = 121'h1409b2015dd6a09cd7fba11c2ffc034;
      expv[33] = 121'h1409b2025dd6a09cd7fba11c2ffc834;
      expv[34] = 121'h1409b2035dd6a09cd7fba11c2ffc834;
      expv[35] = 121'h1409b2045fc7a5cc265ac52e57fe034;
      expv[36] = 121'h1409b2055a1d0e78135ca0ecd7fe034;
      expv[37] = 121'h1409b2065ccfb8469b83e7ad8ffe834;
      expv[38] = 121'h1409b2075adb2e0cd6a85d504ffe834;
      expv[39] = 121'h1409b2085adb2e0cd6a85d504ffc834;
      expv[40] = 121'h1409b2095adb2e0cd6a85d504ffc834;
      expv[41] = 121'h1409b20a5adb2e0cd6a85d504ffc834;
      expv[42] = 121'h1409b20b5d23e344ae59d5b22ffe837;
      expv[43] = 121'h1409b20b5d23e344ae59d5b22ffe837;
      expv[44] = 121'h1409b20b5d23e344ae59d5b22ffe834;
      expv[45] = 121'h03887c461b41dba9e067ab1a17fe834;
      expv[46] = 121'h03887c4718aac98e3bd64af257fe034;
      expv[47] = 121'h03887c481dd9882d2e4e6a6ecffe834;
      expv[48] = 121'h03887c491cd6689928c8aa1ca7fe034;
      expv[49] = 121'h03887c4a1f975bb74b08d0bfdffe834;
      expv[50] = 121'h03887c4b1f975bb74b08d0bfdffc834;
      expv[51] = 121'h03887c4c1bc6af9e3b4b0d61fffe034;
      expv[52] = 121'h03887c4d1bc6af9e3b4b0d61fffc834;
      expv[53] = 121'h03887c4e1bc6af9e3b4b0d61fffc034;
      expv[54] = 121'h03887c4f1c6546023fd839e94ffe834;
      expv[55] = 121'h03887c501bb8ff0d100f51253fff834;
      expv[56] = 121'h03887c511bb8ff0d100f51253ffd034;
      expv[57] = 121'h03887c521abb35dd8342e349bffe034;
      expv[58] = 121'h03887c531abb35dd8342e349bffc034;
      expv[59] = 121'h03887c541abb35dd8342e349bffc034;
      expv[60] = 121'h03887c551abb35dd8342e349bffc834;
      expv[61] = 121'h03887c561abb35dd8342e349bffc834;
      expv[62] = 121'h03887c571abb35dd8342e349bffc034;
      expv[63] = 121'h03887c581abb35dd8342e349bffc834;
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
