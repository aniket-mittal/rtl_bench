// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 97;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01183 dut (
    .s_axi_lite_aclk(clk),
    .M_AXI_MM2S_arready(in_vec[129:129]),
    .M_AXI_MM2S_rdata(in_vec[128:97]),
    .M_AXI_MM2S_rlast(in_vec[96:96]),
    .M_AXI_MM2S_rresp(in_vec[95:94]),
    .M_AXI_MM2S_rvalid(in_vec[93:93]),
    .S_AXI_LITE_araddr(in_vec[92:83]),
    .S_AXI_LITE_arvalid(in_vec[82:82]),
    .S_AXI_LITE_awaddr(in_vec[81:72]),
    .S_AXI_LITE_awvalid(in_vec[71:71]),
    .S_AXI_LITE_bready(in_vec[70:70]),
    .S_AXI_LITE_rready(in_vec[69:69]),
    .S_AXI_LITE_wdata(in_vec[68:37]),
    .S_AXI_LITE_wvalid(in_vec[36:36]),
    .axi_resetn(in_vec[35:35]),
    .Lcl_M_AXIS_MM2S_TDATA(in_vec[34:3]),
    .Lcl_M_AXIS_MM2S_TLAST(in_vec[2:2]),
    .Lcl_M_AXIS_MM2S_TVALID(in_vec[1:1]),
    .useLcl(in_vec[0:0]),
    .M_AXI_MM2S_araddr(out_vec[96:65]),
    .M_AXI_MM2S_arburst(out_vec[64:63]),
    .M_AXI_MM2S_arcache(out_vec[62:59]),
    .M_AXI_MM2S_arlen(out_vec[58:51]),
    .M_AXI_MM2S_arprot(out_vec[50:48]),
    .M_AXI_MM2S_arsize(out_vec[47:45]),
    .M_AXI_MM2S_arvalid(out_vec[44:44]),
    .M_AXI_MM2S_rready(out_vec[43:43]),
    .S_AXI_LITE_arready(out_vec[42:42]),
    .S_AXI_LITE_awready(out_vec[41:41]),
    .S_AXI_LITE_bresp(out_vec[40:39]),
    .S_AXI_LITE_bvalid(out_vec[38:38]),
    .S_AXI_LITE_rdata(out_vec[37:6]),
    .S_AXI_LITE_rresp(out_vec[5:4]),
    .S_AXI_LITE_rvalid(out_vec[3:3]),
    .S_AXI_LITE_wready(out_vec[2:2]),
    .Lcl_M_AXIS_MM2S_TREADY(out_vec[1:1]),
    .mm2s_introut(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h0a610180c1e29200139dc2515d587095e;
    stim[1] = 130'h3f358e92e34b9a58d75df7583210545c1;
    stim[2] = 130'h33135d919fdb103c38921eaebece0ddb5;
    stim[3] = 130'h185df8fd6d5d95cf2ed9085a9d100ea6d;
    stim[4] = 130'h3693de8b3a5f5d6e442cdeebd5a7d17e0;
    stim[5] = 130'h218461434ce22ace01917ef7eed737bd2;
    stim[6] = 130'h0a31d8874caf0addd38090cfca2c02d78;
    stim[7] = 130'h1979fdd2561eea5015799c4d9e647ebd9;
    stim[8] = 130'h32c763c4d65ad0ca344b93039f5006fcb;
    stim[9] = 130'h17be5e69ce90811e363f60aac213472b0;
    stim[10] = 130'h0eb0838142a72246e2428e0b83db46690;
    stim[11] = 130'h2533dd40168b3caaf4b98ce38d9cb5170;
    stim[12] = 130'h1f33b715ae4bc641f317a246fc38dbc6e;
    stim[13] = 130'h2c577d632e91ec0800a35718d4c519b9f;
    stim[14] = 130'h361c365765f586568f582967308e4812a;
    stim[15] = 130'h032170a9c20e47c497ea7433e64238f4a;
    stim[16] = 130'h3ee8bf7cc5ee42005a3cca5db87406c34;
    stim[17] = 130'h2d8ab7be24fa030af822efaffeec0f409;
    stim[18] = 130'h2afb08799540798217441c33c0ae542b2;
    stim[19] = 130'h3e71504079b5fda6dac634f09b6b20b1b;
    stim[20] = 130'h191547c5c373b76c54075f27f5e88245c;
    stim[21] = 130'h1812a612c44de7735db1e727e84441927;
    stim[22] = 130'h1fcc6eddf9075f693d97926a987bbee1a;
    stim[23] = 130'h13be2a727a84708b6abe36afe78331825;
    stim[24] = 130'h2c19211f7d8b40d5a0f90e2a90b5bb793;
    stim[25] = 130'h07da44527113b312106fcb41b3898f264;
    stim[26] = 130'h32d05f3b74c085ceb8e9496aaf961eeef;
    stim[27] = 130'h2ebb02f3887c266b58e9a677c787ace60;
    stim[28] = 130'h368fce0a5b76b9a001cb77a6f2de0d24d;
    stim[29] = 130'h27a950015bb0fb66a25face49cfd2d32d;
    stim[30] = 130'h2652f073e0c805f59b7ebcccaff09a6a4;
    stim[31] = 130'h1eb9a6a7b1e7c44ff57b7317a37f23ef7;
    stim[32] = 130'h36a4f334d0190f198e17d5abaf9c1cb3f;
    stim[33] = 130'h2350502854ed7d63c6fff1278060baf94;
    stim[34] = 130'h0a51158b9c172fd718834936ab623f3f4;
    stim[35] = 130'h03c837eb85cc2f2ad582861691f51197a;
    stim[36] = 130'h11d175ca55d9dc2059b7f7d2b800de428;
    stim[37] = 130'h3d5a73f96be6422ea7ee82a5ea2b00ae9;
    stim[38] = 130'h32828ceeb3ebb2ea7664888f9b04a5267;
    stim[39] = 130'h00dde3117ab986c02fbd670586fc6d357;
    stim[40] = 130'h16a71acfa0bd25ba3b7edc22b6c3a8f36;
    stim[41] = 130'h0f91ea073d3cbb0f28e08b31aa70c01eb;
    stim[42] = 130'h0944e703c175830fdbfcb45dcabef65f7;
    stim[43] = 130'h29baa3d8af71d9156dc66babb79cc598d;
    stim[44] = 130'h398f11bc053d85f3a0c19311f94099fd2;
    stim[45] = 130'h072123c2f13e858458e0a18ce5815856a;
    stim[46] = 130'h23962a47ab812f00c149fc0d8d757a17c;
    stim[47] = 130'h2df3f3f1ea7537e8b4997c36e9f8f82f3;
    stim[48] = 130'h000948a37ab5689cd5c773988b89777db;
    stim[49] = 130'h045d51f206a961aad34150bdbb0b1ffab;
    stim[50] = 130'h332af72e186e9a9f684cf0d3c87af9c5e;
    stim[51] = 130'h2a096d69ea01069551769ca3ef439d2d7;
    stim[52] = 130'h340ea282dc797b4302effbbbc2bef203c;
    stim[53] = 130'h05110113febf7bcea0d828638cf747c0d;
    stim[54] = 130'h07132260f21c8fe650d416ee857d58331;
    stim[55] = 130'h0bbef7795dbfdc2256ab4a5ce7d666e75;
    stim[56] = 130'h37068a38a3d6b37001f286ba643b21f13;
    stim[57] = 130'h271d375d85f12c9d3fab8c5ad1304e6e0;
    stim[58] = 130'h2e042823a40026f82714a5609bc5f440a;
    stim[59] = 130'h3356e77371de66be4585c3d585b079bf0;
    stim[60] = 130'h3b7300d8a2a602a7c6a41e63ee5e0720c;
    stim[61] = 130'h22b9bc5da3b447516b94ec418bd6dca81;
    stim[62] = 130'h31c3891699bbbb6761305a19df50b82b8;
    stim[63] = 130'h18513a11d6874dacf2efccf6db8bc3b42;
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
      expv[0] = 97'h0000000008000400000000000;
      expv[1] = 97'h000000000800040000000000x;
      expv[2] = 97'h000000000800040000000000x;
      expv[3] = 97'h000000000800040000000000x;
      expv[4] = 97'h0000000008000400000000000;
      expv[5] = 97'h0000000008000400000000000;
      expv[6] = 97'h0000000008000400000000000;
      expv[7] = 97'h000000000800040000000000x;
      expv[8] = 97'h000000000800040000000000x;
      expv[9] = 97'h0000000008000400000000000;
      expv[10] = 97'h0000000008000400000000000;
      expv[11] = 97'h0000000008000400000000000;
      expv[12] = 97'h0000000008000400000000000;
      expv[13] = 97'h000000000800040000000000x;
      expv[14] = 97'h0000000008000400000000000;
      expv[15] = 97'h0000000008000400000000000;
      expv[16] = 97'h0000000008000400000000000;
      expv[17] = 97'h000000000800040000000000x;
      expv[18] = 97'h0000000008000400000000000;
      expv[19] = 97'h000000000800040000000000x;
      expv[20] = 97'h0000000008000400000000000;
      expv[21] = 97'h000000000800040000000000x;
      expv[22] = 97'h0000000008000400000000000;
      expv[23] = 97'h000000000800040000000000x;
      expv[24] = 97'h000000000800040000000000x;
      expv[25] = 97'h0000000008000400000000000;
      expv[26] = 97'h000000000800040000000000x;
      expv[27] = 97'h0000000008000400000000000;
      expv[28] = 97'h000000000800040000000000x;
      expv[29] = 97'h000000000800040000000000x;
      expv[30] = 97'h0000000008000400000000000;
      expv[31] = 97'h000000000800040000000000x;
      expv[32] = 97'h000000000800040000000000x;
      expv[33] = 97'h0000000008000400000000000;
      expv[34] = 97'h0000000008000400000000000;
      expv[35] = 97'h0000000008000400000000000;
      expv[36] = 97'h0000000008000400000000000;
      expv[37] = 97'h000000000800040000000000x;
      expv[38] = 97'h000000000800040000000000x;
      expv[39] = 97'h000000000800040000000000x;
      expv[40] = 97'h0000000008000400000000000;
      expv[41] = 97'h000000000800040000000000x;
      expv[42] = 97'h000000000800040000000000x;
      expv[43] = 97'h000000000800040000000000x;
      expv[44] = 97'h0000000008000400000000000;
      expv[45] = 97'h0000000008000400000000000;
      expv[46] = 97'h0000000008000400000000000;
      expv[47] = 97'h000000000800040000000000x;
      expv[48] = 97'h000000000800040000000000x;
      expv[49] = 97'h000000000800040000000000x;
      expv[50] = 97'h0000000008000400000000000;
      expv[51] = 97'h000000000800040000000000x;
      expv[52] = 97'h0000000008000400000000000;
      expv[53] = 97'h000000000800040000000000x;
      expv[54] = 97'h000000000800040000000000x;
      expv[55] = 97'h000000000800040000000000x;
      expv[56] = 97'h000000000800040000000000x;
      expv[57] = 97'h0000000008000400000000000;
      expv[58] = 97'h0000000008000400000000000;
      expv[59] = 97'h0000000008000400000000000;
      expv[60] = 97'h0000000008000400000000000;
      expv[61] = 97'h000000000800040000000000x;
      expv[62] = 97'h0000000008000400000000000;
      expv[63] = 97'h0000000008000400000000000;
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
