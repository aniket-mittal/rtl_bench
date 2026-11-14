// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 116;
  localparam OW = 150;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_137828 dut (
    .m_axi_aclk(clk),
    .m_axi_aresetn(in_vec[115:115]),
    .req_valid(in_vec[114:114]),
    .req_address(in_vec[113:82]),
    .req_last_burst_length(in_vec[81:74]),
    .req_last_beat_bytes(in_vec[73:71]),
    .enable(in_vec[70:70]),
    .pause(in_vec[69:69]),
    .sync_id(in_vec[68:68]),
    .fifo_valid(in_vec[67:67]),
    .fifo_data(in_vec[66:3]),
    .m_axi_bvalid(in_vec[2:2]),
    .m_axi_bresp(in_vec[1:0]),
    .req_ready(out_vec[149:149]),
    .enabled(out_vec[148:148]),
    .sync_id_ret(out_vec[147:147]),
    .response_valid(out_vec[146:146]),
    .response_ready(out_vec[145:145]),
    .response_resp(out_vec[144:143]),
    .response_resp_eot(out_vec[142:142]),
    .response_id(out_vec[141:138]),
    .data_id(out_vec[137:134]),
    .address_id(out_vec[133:130]),
    .data_eot(out_vec[129:129]),
    .address_eot(out_vec[128:128]),
    .m_axi_awvalid(out_vec[127:127]),
    .m_axi_awaddr(out_vec[126:95]),
    .m_axi_awlen(out_vec[94:87]),
    .m_axi_awsize(out_vec[86:84]),
    .m_axi_awburst(out_vec[83:82]),
    .m_axi_awprot(out_vec[81:79]),
    .m_axi_awcache(out_vec[78:75]),
    .m_axi_wdata(out_vec[74:11]),
    .m_axi_wstrb(out_vec[10:3]),
    .m_axi_wvalid(out_vec[2:2]),
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
    stim[0] = 116'h41c53400d7187d3b38c286c5362dc;
    stim[1] = 116'h2306ff38462b055b5f2379a27a8c0;
    stim[2] = 116'h99609527c347b915ac3a2f4f11d4b;
    stim[3] = 116'he6ff047bc478d01490872ef6bd1dd;
    stim[4] = 116'hf1d87d9451bb0ec1e5cf0cf8aa7b4;
    stim[5] = 116'hcf668cc3bcdd9d8a59e75d1e4db99;
    stim[6] = 116'hb1800b45166ce729353efa0562ef0;
    stim[7] = 116'hff9c3d6d0f274cf2aaf07febb908d;
    stim[8] = 116'h957edc5dfaa1675da947143efdbe3;
    stim[9] = 116'ha5440e392c7d8d606f358cba97c46;
    stim[10] = 116'hdac3d03aa5878f4d7c77d63346281;
    stim[11] = 116'hbf32844f2640eb7bf8bfebc6790a8;
    stim[12] = 116'hd7062dadce8b86c7b3da758230d49;
    stim[13] = 116'h9df769306ee2af77db78fdab220b8;
    stim[14] = 116'hd81c9968c8a7d98cc356fc8bfbdc5;
    stim[15] = 116'hb36790ed1459f612116a1482ff2e8;
    stim[16] = 116'hd7b6eb4bc236c4df57d0b10f0ddf5;
    stim[17] = 116'hb855848e07b2c90ee7c8a1633553d;
    stim[18] = 116'hc234daf2a27b253a57f83fcc9affd;
    stim[19] = 116'hcb9f2d6f45c1ace6f1381e2459be6;
    stim[20] = 116'hb7a935b8fdd14f7fdc471f3c0ea61;
    stim[21] = 116'h8124d57e7e6f23abf6cb7f30fbe80;
    stim[22] = 116'hef1d3c06a974265170dd3458368a6;
    stim[23] = 116'h802ed076b7901fb4b7c809a1e5609;
    stim[24] = 116'h810706e7020abb534c59665fdb1b5;
    stim[25] = 116'h9af2b5254f1d2fb2d5e89d6914acd;
    stim[26] = 116'hdf256f302f641c49211d0e87c3ba3;
    stim[27] = 116'hea12e7692bcbd593650b855c4002b;
    stim[28] = 116'h8de8c92c0f71ef4de83090202c10f;
    stim[29] = 116'hd72fda82eb1fccfa67e24358fe77e;
    stim[30] = 116'h8a6abd07f0e4f8affa8062b03dd10;
    stim[31] = 116'hd3f0301fade6bf023e73c2b75ab04;
    stim[32] = 116'hb69574d8fb6218ba495c6084b11ee;
    stim[33] = 116'h8741c6fc4d1070433f42e8ec1114c;
    stim[34] = 116'hbaf3207e9792e30426177ddf6aa14;
    stim[35] = 116'h969842dcfaea251d0ef75620599cd;
    stim[36] = 116'hb4766bc2a0dde7f016b0bd201e3dc;
    stim[37] = 116'hab66cece9719cf712a311e954e41d;
    stim[38] = 116'hca0a235a813bf39b7012a62de7bdd;
    stim[39] = 116'he608cd0657609903661829d35a476;
    stim[40] = 116'he2ff116ded77dfa9c0e30230fda46;
    stim[41] = 116'hf75850c8a420c69ca10e4d2dd767f;
    stim[42] = 116'haff22962d2ae171f1f8ed764b8622;
    stim[43] = 116'hc6b63efb3b3404e691da71bcf8084;
    stim[44] = 116'hced9d05cf85fe2e3bb6fb526a92c9;
    stim[45] = 116'hf5aa245249b5d0130e0156edbc3cf;
    stim[46] = 116'hcc5963d2af352063dd4330873ded3;
    stim[47] = 116'hd1e7f989a112decd89350c57e46d8;
    stim[48] = 116'h8a296f6f404b9d1171589dabad123;
    stim[49] = 116'he82d6c529f11f36c25605e22b7688;
    stim[50] = 116'hdf4fb69a52d002a66b640d8127eb8;
    stim[51] = 116'h8d6f174d1887c67443dbb8b79cd48;
    stim[52] = 116'hc81e1b5fe18d9097080f9ef4a8870;
    stim[53] = 116'hbb7d9fc3dd4e1f92e67adc2ed7c95;
    stim[54] = 116'hd839b770ef015370ea22e8df946d2;
    stim[55] = 116'hf3ea770d2e2fdfb348f7564bf5f7d;
    stim[56] = 116'he928842712e77b4cf9b27b6055277;
    stim[57] = 116'hbb696357bb854ed787361be7cf1ec;
    stim[58] = 116'ha35581af97e2942e1f5429d64c416;
    stim[59] = 116'hdd3fdf391e4c27586645d070131f4;
    stim[60] = 116'hf40c9129f71ed99c0d75d40e6c431;
    stim[61] = 116'hd61774a59a04540cf7f8f41b7f674;
    stim[62] = 116'hb5070ab7118e8fdabcd6f6281e14a;
    stim[63] = 116'h95ec6d349bf67d403fa04a20a8f59;
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
      expv[0] = 150'h20000000000000000418000000000000000000;
      expv[1] = 150'h20000000000000000418000000000000000000;
      expv[2] = 150'h20000000000000000418000000000000000000;
      expv[3] = 150'h20000000000000000418000000000000000000;
      expv[4] = 150'h20000000000000000418000000000000000000;
      expv[5] = 150'h20000000000000000418000000000000000000;
      expv[6] = 150'h1800001ecd1987798418000000000000000000;
      expv[7] = 150'h1800001ecd1987798418000000000000000000;
      expv[8] = 150'h1800001ecd1987798418000000000000000000;
      expv[9] = 150'h1800001ecd1987798418000000000000000000;
      expv[10] = 150'h1800001ecd1987798418000000000000000000;
      expv[11] = 150'h1800001ecd1987798418000000000000000000;
      expv[12] = 150'h1800001ecd1987798418000000000000000000;
      expv[13] = 150'h1800001ecd1987798418000000000000000000;
      expv[14] = 150'h1800001ecd1987798418000000000000000000;
      expv[15] = 150'h1800001ecd1987798418000000000000000000;
      expv[16] = 150'h1800001ecd1987798418000000000000000000;
      expv[17] = 150'h1800001ecd1987798418000000000000000000;
      expv[18] = 150'h1800001ecd1987798418000000000000000000;
      expv[19] = 150'h1800001ecd1987798418000000000000000000;
      expv[20] = 150'h1800001ecd1987798418000000000000000000;
      expv[21] = 150'h1800001ecd1987798418000000000000000000;
      expv[22] = 150'h1800001ecd1987798418000000000000000000;
      expv[23] = 150'h1000005e3a780d528418000000000000000000;
      expv[24] = 150'h100000de3a780d52b418000000000000000000;
      expv[25] = 150'h1000005e3a780d52b41bb534c59665fdb1b7fc;
      expv[26] = 150'h1000005e3a780d52b41bb534c59665fdb1b7fc;
      expv[27] = 150'h1000005e3a780d52b41bb534c59665fdb1b7fc;
      expv[28] = 150'h1000005e3a780d52b41d593650b855c4002ffc;
      expv[29] = 150'h1000005e3a780d52b41ef4de83090202c10ffc;
      expv[30] = 150'h1000005e3a780d52b41ccfa67e24358fe77ffc;
      expv[31] = 150'h1000005e3a780d52b41f8affa8062b03dd17fc;
      expv[32] = 150'h1000005e3a780d52b41bf023e73c2b75ab07fc;
      expv[33] = 150'h1000005e3a780d52b41bf023e73c2b75ab07fc;
      expv[34] = 150'h1000005e3a780d52b41bf023e73c2b75ab07fc;
      expv[35] = 150'h1000005e3a780d52b41e30426177ddf6aa17fc;
      expv[36] = 150'h1000005e3a780d52b41e30426177ddf6aa17fc;
      expv[37] = 150'h1000005e3a780d52b41e7f016b0bd201e3dffc;
      expv[38] = 150'h1000005e3a780d52b41cf712a311e954e41ffc;
      expv[39] = 150'h1000005e3a780d52b41f39b7012a62de7bdffc;
      expv[40] = 150'h1000005e3a780d52b419903661829d35a477fc;
      expv[41] = 150'h1000005e3a780d52b41dfa9c0e30230fda47fc;
      expv[42] = 150'h1000005e3a780d52b41c69ca10e4d2dd767ffc;
      expv[43] = 150'h1000005e3a780d52b41c69ca10e4d2dd767ffc;
      expv[44] = 150'h1000005e3a780d52b41c69ca10e4d2dd767ffc;
      expv[45] = 150'h1000005e3a780d52b41e2e3bb6fb526a92cffc;
      expv[46] = 150'h1000005e3a780d52b41d0130e0156edbc3cffc;
      expv[47] = 150'h1000005e3a780d52b41d0130e0156edbc3cffc;
      expv[48] = 150'h1000005e3a780d52b41decd89350c57e46dffc;
      expv[49] = 150'h1000005e3a780d52b419d1171589dabad127fc;
      expv[50] = 150'h1000005e3a780d52b41f36c25605e22b768ffc;
      expv[51] = 150'h1000005e3a780d52b41f36c25605e22b768ffc;
      expv[52] = 150'h1000005e3a780d52b41c67443dbb8b79cd4ffc;
      expv[53] = 150'h1000005e3a780d52b419097080f9ef4a8877fc;
      expv[54] = 150'h1000005e3a780d52b419097080f9ef4a8877fc;
      expv[55] = 150'h1000005e3a780d52b419097080f9ef4a8877fc;
      expv[56] = 150'h1000005e3a780d52b41dfb348f7564bf5f7ffc;
      expv[57] = 150'h1000005e3a780d52b41dfb348f7564bf5f7ffc;
      expv[58] = 150'h1000005e3a780d52b41dfb348f7564bf5f7ffc;
      expv[59] = 150'h1000005e3a780d52b41942e1f5429d64c417fc;
      expv[60] = 150'h1000005e3a780d52b41942e1f5429d64c417fc;
      expv[61] = 150'h1000005e3a780d52b41d99c0d75d40e6c437fc;
      expv[62] = 150'h1000005e3a780d52b41d99c0d75d40e6c437fc;
      expv[63] = 150'h1000005e3a780d52b418fdabcd6f6281e14ffc;
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
