// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 147;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02941 dut (
    .s_axi_aclk_0(clk),
    .BRAM_PORTA_0_dout(in_vec[146:115]),
    .S_AXI_0_araddr(in_vec[114:100]),
    .S_AXI_0_arburst(in_vec[99:98]),
    .S_AXI_0_arcache(in_vec[97:94]),
    .S_AXI_0_arlen(in_vec[93:86]),
    .S_AXI_0_arlock(in_vec[85:85]),
    .S_AXI_0_arprot(in_vec[84:82]),
    .S_AXI_0_arsize(in_vec[81:79]),
    .S_AXI_0_arvalid(in_vec[78:78]),
    .S_AXI_0_awaddr(in_vec[77:63]),
    .S_AXI_0_awburst(in_vec[62:61]),
    .S_AXI_0_awcache(in_vec[60:57]),
    .S_AXI_0_awlen(in_vec[56:49]),
    .S_AXI_0_awlock(in_vec[48:48]),
    .S_AXI_0_awprot(in_vec[47:45]),
    .S_AXI_0_awsize(in_vec[44:42]),
    .S_AXI_0_awvalid(in_vec[41:41]),
    .S_AXI_0_bready(in_vec[40:40]),
    .S_AXI_0_rready(in_vec[39:39]),
    .S_AXI_0_wdata(in_vec[38:7]),
    .S_AXI_0_wlast(in_vec[6:6]),
    .S_AXI_0_wstrb(in_vec[5:2]),
    .S_AXI_0_wvalid(in_vec[1:1]),
    .s_axi_aresetn_0(in_vec[0:0]),
    .BRAM_PORTA_0_addr(out_vec[95:81]),
    .BRAM_PORTA_0_clk(out_vec[80:80]),
    .BRAM_PORTA_0_din(out_vec[79:48]),
    .BRAM_PORTA_0_en(out_vec[47:47]),
    .BRAM_PORTA_0_rst(out_vec[46:46]),
    .BRAM_PORTA_0_we(out_vec[45:42]),
    .S_AXI_0_arready(out_vec[41:41]),
    .S_AXI_0_awready(out_vec[40:40]),
    .S_AXI_0_bresp(out_vec[39:38]),
    .S_AXI_0_bvalid(out_vec[37:37]),
    .S_AXI_0_rdata(out_vec[36:5]),
    .S_AXI_0_rlast(out_vec[4:4]),
    .S_AXI_0_rresp(out_vec[3:2]),
    .S_AXI_0_rvalid(out_vec[1:1]),
    .S_AXI_0_wready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 147'h5d9579df040ba60a36e978004dd181bb99383;
    stim[1] = 147'h22390b1d9150ef853e75cf647ccc83ae4bd83;
    stim[2] = 147'h18e8b482101d6a30904def240dc2a1e8f23d0;
    stim[3] = 147'h05a8571c2502544ebc0f813df02aacb8d401c;
    stim[4] = 147'h60104f6c3158cff2714241e99f2dd72d73bc8;
    stim[5] = 147'h5c38d4176c40b134b6a911cb6e544771a54c6;
    stim[6] = 147'h1014a7edbdc6967198df3fc9d2b1fc513a478;
    stim[7] = 147'h462ab005ccf61aa1b9beefcc990cdeafead18;
    stim[8] = 147'h13e35be52e5b21a9cfbffada21e9824451016;
    stim[9] = 147'h3377f0f4a19525141f01a357057b30bff061a;
    stim[10] = 147'h07867cbb4fd24318f74b97961f9a64baa5fa6;
    stim[11] = 147'h784b18bdb40d45246245602972ebda0c5a486;
    stim[12] = 147'h7927575962169a33e03e98d21c86353ab3892;
    stim[13] = 147'h5afd89c0eeb58f8b7d643840ca2eb1fa7220e;
    stim[14] = 147'h551a5a5b4d6b57d4c40d132087b73cc6ff428;
    stim[15] = 147'h1bd3d2e2b565cabef6872d11749a0d0a234a2;
    stim[16] = 147'h2817d30b10cd42dd203fa2401536193f27c22;
    stim[17] = 147'h4a607b486e9580a9556ac326d6a9a4ae248c2;
    stim[18] = 147'h153349858eb238cb65f4709ea9e605568b0d8;
    stim[19] = 147'h4c8fb2f365e5b17514310e79687c183b975c2;
    stim[20] = 147'h0e9510aa975059c1ed6afd7a59a05a15d1caa;
    stim[21] = 147'h7bd05dc4b9d1196dfea6dd4c776b965b0efa8;
    stim[22] = 147'h7437d60d2f5d11156a7fb907161ca343ae1b8;
    stim[23] = 147'h023322fe35f976d0bf215f46ed3b5d9656452;
    stim[24] = 147'h3e4c551a698eeb43491353aa31abb7c7e6dbe;
    stim[25] = 147'h556e713893fa2efc6e705091875a04e3639dc;
    stim[26] = 147'h56a7599511c563a76d5856c4aeee8ba39f650;
    stim[27] = 147'h75c845f607231781339c86feb3821f53fb3ae;
    stim[28] = 147'h039feb0d6a050a0d68e2fb5e968e6e95fcbba;
    stim[29] = 147'h68f2a17d633a441aaf0e39870ed3c12d5a556;
    stim[30] = 147'h048dcd696be03c68fead4dab2e76f54f90fe2;
    stim[31] = 147'h4a035fe97764b317054024adc9c16a4e73aa8;
    stim[32] = 147'h14d3cc22cb462fc97e3b603b78920ef3d0736;
    stim[33] = 147'h2f8b7a565522d9f8f3b570573d5b50cf5c9e0;
    stim[34] = 147'h60001ae90acc900f4a02cb8d29c50ca0d9c1c;
    stim[35] = 147'h1336c491dde7cda70d9b8b64f93da1ee76d88;
    stim[36] = 147'h1a80e080e6f534135944897ee7620d86df688;
    stim[37] = 147'h43d13aeb99d13261019e14b5d9483ca6e86f2;
    stim[38] = 147'h564cd3586036778502d1034aae981440410c2;
    stim[39] = 147'h6a73fbd151993b44d210fd8fd117a2d02e0aa;
    stim[40] = 147'h72ea2adfe5e766d8aefb44eeda31e97b8effe;
    stim[41] = 147'h48b9a8852ecace928606beb3fc49236d077d2;
    stim[42] = 147'h07dc087dae2d58b68cf689f475e29834d7da6;
    stim[43] = 147'h1b0f06d73e28d5547d90ad6009165d98d794c;
    stim[44] = 147'h7cbbf70ff3d220b9b7e7bd49e515b0f22aebe;
    stim[45] = 147'h6ade21f05bf13e44aec3497b79970fe8f696e;
    stim[46] = 147'h1cdb0e1e5740d35eca27ca0f1b867b43241f2;
    stim[47] = 147'h7d92f16548272531dd02834996334dd3330ca;
    stim[48] = 147'h5615248ad74a6ee1c16d75ccce848249f7f2e;
    stim[49] = 147'h6ebf53befab2b115a5cebd4cfc4a1420ba6da;
    stim[50] = 147'h3682f03eb39b5d9c08b895c0dc55cd8ad491c;
    stim[51] = 147'h7680165460d174111af2c2862112da83925a8;
    stim[52] = 147'h634be6281d889be4a94bcd431691c21dbe0fa;
    stim[53] = 147'h18d623a2e932f2e620a2ec1a217976f20bf7e;
    stim[54] = 147'h04753ea8d6975407a56767aac135113aad120;
    stim[55] = 147'h79c519ef1fe9f300f5380694aecc67b1f741c;
    stim[56] = 147'h7ffc86df72f6c42f320e121cbee027b2e8e4c;
    stim[57] = 147'h0fbb3cb1b20b0fc09cccd2b20aa11db473fd0;
    stim[58] = 147'h24a12d1eab541720101405872a7b293e1e600;
    stim[59] = 147'h01be5dc87a45fc975e1a85893c4c8609a3a2e;
    stim[60] = 147'h46497a335dd6779820b08383df7063476c670;
    stim[61] = 147'h1363db1a8aeaea6d991f34e9bddc7c9566334;
    stim[62] = 147'h1d76a22c24027f5c1ae2d8e46cd1e985f42cc;
    stim[63] = 147'h3935dca645312db2814184250595553920b4a;
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
      expv[0] = 96'h000000000000000000000000;
      expv[1] = 96'h000100000000020000000000;
      expv[2] = 96'h000000000000000000000000;
      expv[3] = 96'h000000000000000000000000;
      expv[4] = 96'h000000000000000000000000;
      expv[5] = 96'h000000000000000000000000;
      expv[6] = 96'h000000000000000000000000;
      expv[7] = 96'h000000000000000000000000;
      expv[8] = 96'h000000000000000000000000;
      expv[9] = 96'h000000000000000000000000;
      expv[10] = 96'h000000000000000000000000;
      expv[11] = 96'h000000000000000000000000;
      expv[12] = 96'h000000000000000000000000;
      expv[13] = 96'h000000000000000000000000;
      expv[14] = 96'h000000000000000000000000;
      expv[15] = 96'h000000000000000000000000;
      expv[16] = 96'h000000000000000000000000;
      expv[17] = 96'h000000000000000000000000;
      expv[18] = 96'h000000000000000000000000;
      expv[19] = 96'h000000000000000000000000;
      expv[20] = 96'h000000000000000000000000;
      expv[21] = 96'h000000000000000000000000;
      expv[22] = 96'h000000000000000000000000;
      expv[23] = 96'h000000000000000000000000;
      expv[24] = 96'h000000000000000000000000;
      expv[25] = 96'h000000000000000000000000;
      expv[26] = 96'h000000000000000000000000;
      expv[27] = 96'h000000000000000000000000;
      expv[28] = 96'h000000000000000000000000;
      expv[29] = 96'h000000000000000000000000;
      expv[30] = 96'h000000000000000000000000;
      expv[31] = 96'h000000000000000000000000;
      expv[32] = 96'h000000000000000000000000;
      expv[33] = 96'h000000000000000000000000;
      expv[34] = 96'h000000000000000000000000;
      expv[35] = 96'h000000000000000000000000;
      expv[36] = 96'h000000000000000000000000;
      expv[37] = 96'h000000000000000000000000;
      expv[38] = 96'h000000000000000000000000;
      expv[39] = 96'h000000000000000000000000;
      expv[40] = 96'h000000000000000000000000;
      expv[41] = 96'h000000000000000000000000;
      expv[42] = 96'h000000000000000000000000;
      expv[43] = 96'h000000000000000000000000;
      expv[44] = 96'h000000000000000000000000;
      expv[45] = 96'h000000000000000000000000;
      expv[46] = 96'h000000000000000000000000;
      expv[47] = 96'h000000000000000000000000;
      expv[48] = 96'h000000000000000000000000;
      expv[49] = 96'h000000000000000000000000;
      expv[50] = 96'h000000000000000000000000;
      expv[51] = 96'h000000000000000000000000;
      expv[52] = 96'h000000000000000000000000;
      expv[53] = 96'h000000000000000000000000;
      expv[54] = 96'h000000000000000000000000;
      expv[55] = 96'h000000000000000000000000;
      expv[56] = 96'h000000000000000000000000;
      expv[57] = 96'h000000000000000000000000;
      expv[58] = 96'h000000000000000000000000;
      expv[59] = 96'h000000000000000000000000;
      expv[60] = 96'h000000000000000000000000;
      expv[61] = 96'h000000000000000000000000;
      expv[62] = 96'h000000000000000000000000;
      expv[63] = 96'h000000000000000000000000;
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
