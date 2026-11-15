// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 114;
  localparam OW = 88;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04253 dut (
    .ap_clk(clk),
    .s_axi_CTRL_AWADDR(in_vec[113:101]),
    .s_axi_CTRL_AWVALID(in_vec[100:100]),
    .s_axi_CTRL_WDATA(in_vec[99:68]),
    .s_axi_CTRL_WSTRB(in_vec[67:64]),
    .s_axi_CTRL_WVALID(in_vec[63:63]),
    .s_axi_CTRL_BREADY(in_vec[62:62]),
    .s_axi_CTRL_ARADDR(in_vec[61:49]),
    .s_axi_CTRL_ARVALID(in_vec[48:48]),
    .s_axi_CTRL_RREADY(in_vec[47:47]),
    .ap_rst_n(in_vec[46:46]),
    .s_axis_video_TVALID(in_vec[45:45]),
    .s_axis_video_TDATA(in_vec[44:13]),
    .s_axis_video_TKEEP(in_vec[12:9]),
    .s_axis_video_TSTRB(in_vec[8:5]),
    .s_axis_video_TUSER(in_vec[4:4]),
    .s_axis_video_TLAST(in_vec[3:3]),
    .s_axis_video_TID(in_vec[2:2]),
    .s_axis_video_TDEST(in_vec[1:1]),
    .m_axis_video_TREADY(in_vec[0:0]),
    .s_axi_CTRL_AWREADY(out_vec[87:87]),
    .s_axi_CTRL_WREADY(out_vec[86:86]),
    .s_axi_CTRL_BRESP(out_vec[85:84]),
    .s_axi_CTRL_BVALID(out_vec[83:83]),
    .s_axi_CTRL_ARREADY(out_vec[82:82]),
    .s_axi_CTRL_RDATA(out_vec[81:50]),
    .s_axi_CTRL_RRESP(out_vec[49:48]),
    .s_axi_CTRL_RVALID(out_vec[47:47]),
    .interrupt(out_vec[46:46]),
    .s_axis_video_TREADY(out_vec[45:45]),
    .m_axis_video_TVALID(out_vec[44:44]),
    .m_axis_video_TDATA(out_vec[43:12]),
    .m_axis_video_TKEEP(out_vec[11:8]),
    .m_axis_video_TSTRB(out_vec[7:4]),
    .m_axis_video_TUSER(out_vec[3:3]),
    .m_axis_video_TLAST(out_vec[2:2]),
    .m_axis_video_TID(out_vec[1:1]),
    .m_axis_video_TDEST(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 114'h3cb890423c7e40a2d83cd9d7e1354;
    stim[1] = 114'h1b7f1ef228fcf4e13b4958fc922b4;
    stim[2] = 114'h2451c08de1878cd3a78d73f27f55e;
    stim[3] = 114'h1771b48366b8177be58962af1bc47;
    stim[4] = 114'h0f70b7331c663bb7b6e5e9ed1ef47;
    stim[5] = 114'h1566875b72c6680446b1649e5d8d1;
    stim[6] = 114'h3620b8a226416cc246f9739fb71f1;
    stim[7] = 114'h195083c22ff246d534c6a1d5b8ce7;
    stim[8] = 114'h233282ea3df1d9f86616eef1068e7;
    stim[9] = 114'h357bfb6fc82284c616ded12dc796e;
    stim[10] = 114'h15f99e00507da56ddc59852f3fcb7;
    stim[11] = 114'h0ee2155bdd803b8254d31bbe6eb78;
    stim[12] = 114'h20703bc513c10eda878e810bfe139;
    stim[13] = 114'h316b936e9287dd1114148586053f4;
    stim[14] = 114'h1484d2a1c0fcdefc450e9e2f74c54;
    stim[15] = 114'h1f6ac1f8fb0ea603cd86ffcaeaf97;
    stim[16] = 114'h1177fd1754a6bc0174f1049935ee2;
    stim[17] = 114'h1b8a7067a703b5400f2132448ae06;
    stim[18] = 114'h121217c262e57392cd1d525f03d0e;
    stim[19] = 114'h37841847bc3f441c04a1e11221639;
    stim[20] = 114'h32b9aae9e67ff97adc10a7b367c0d;
    stim[21] = 114'h29f4b546479cbff516a68dbb09be2;
    stim[22] = 114'h19f84b59741f70392cd0ce61a96b3;
    stim[23] = 114'h2b2800020d1c67666cf07f9852da3;
    stim[24] = 114'h07ffc4eea357ccd7ce3d15fb4fe6c;
    stim[25] = 114'h16695e78be402a85843dce4f9e0b3;
    stim[26] = 114'h20c31946dd001228645a6ff1ad50f;
    stim[27] = 114'h32b5c1a6fb7d1492ec378ba59877f;
    stim[28] = 114'h0116cccd4562465806fbaacd5d899;
    stim[29] = 114'h253cb7e7d2deff5e65146b864dc27;
    stim[30] = 114'h10f5f6128b24d0ca4404c7270c6f4;
    stim[31] = 114'h14fa2c38757f248f1588231f51381;
    stim[32] = 114'h310a20b524ac8f85550084d3649e0;
    stim[33] = 114'h0bfade8d29327e47aed2f893c788b;
    stim[34] = 114'h337e34c9dc8e2799ce92239be5747;
    stim[35] = 114'h274ead9417e278a22e36891a94f55;
    stim[36] = 114'h1e80a145dd590073d5410ef2a999b;
    stim[37] = 114'h154e5c43013a061e4d5e3ea3f75a3;
    stim[38] = 114'h2b0af9336df409e26e1db8ecb3b89;
    stim[39] = 114'h19a72bf592ceb221e7b906cf2fea8;
    stim[40] = 114'h1a6bd1856475f67bf7cef4720e3a1;
    stim[41] = 114'h258642c757bacf395d04f91ada51f;
    stim[42] = 114'h1b3b476b0278e05dc5fa24213aa07;
    stim[43] = 114'h1b6e3754110c82d30d13e78c23dc6;
    stim[44] = 114'h0e1e6daa3b58d9d2c5ac2e48d91fa;
    stim[45] = 114'h3085aea9bdbfb94cd5fa57ed9b4ea;
    stim[46] = 114'h3844e18aeb5958cde754580fafdb5;
    stim[47] = 114'h0718ce2306894615af63b32aef8e3;
    stim[48] = 114'h1999807b5bab5ed44cb1d6bae099c;
    stim[49] = 114'h342b437d0af9b35ef7f1d7f0ccb0f;
    stim[50] = 114'h1a8ae008df3a99e35da7fb926a17e;
    stim[51] = 114'h35ec7fa8a95e87fafdd9bf94a4236;
    stim[52] = 114'h010a1fbce2143610752f91959e4d7;
    stim[53] = 114'h174ca59a184cba08dca9da51d564f;
    stim[54] = 114'h0f25b8a28633133e1da0ab1b1aa90;
    stim[55] = 114'h206400987046ad63fee1b3d62047f;
    stim[56] = 114'h2772a9835c3ca6a654f60d959bf42;
    stim[57] = 114'h1d69f3cf5757bc0ef52e0d3d2441d;
    stim[58] = 114'h256b5237e324cb739619f5b39780d;
    stim[59] = 114'h159efdcccbbe5e128ffab67690ab9;
    stim[60] = 114'h336fed55486e6b8765bea52274c4e;
    stim[61] = 114'h19e40a7fc6f4a344a50ddc6d6cdec;
    stim[62] = 114'h31f64c84f9a8a6eb563b1b9d540f1;
    stim[63] = 114'h10b6bab2e01f8129ff68d05e3f571;
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
      expv[0] = 88'h040000000081e6cebf09aa;
      expv[1] = 88'h84000000009a4ac7e4915a;
      expv[2] = 88'hc8000000001c6b9f93faaf;
      expv[3] = 88'h80000000002c4b1578de23;
      expv[4] = 88'h4400000000b72f4f68f7a3;
      expv[5] = 88'h4000000000358b24f2ec68;
      expv[6] = 88'h400000000037cb9cfdb8f8;
      expv[7] = 88'h0400000000a6350eadc673;
      expv[8] = 88'h400000000030b777883473;
      expv[9] = 88'h840000000096f6896e3cb7;
      expv[10] = 88'h8400000000a2cc2979fe5b;
      expv[11] = 88'h44000000008698ddf375bc;
      expv[12] = 88'h40000000003c74085ff09c;
      expv[13] = 88'hcc0000000080a42c3029fa;
      expv[14] = 88'h40000000000874f17ba62a;
      expv[15] = 88'h00000000002c37fe5757cb;
      expv[16] = 88'hcc00000000878824c9af71;
      expv[17] = 88'h0000000000190992245703;
      expv[18] = 88'h000000000008ea92f81e87;
      expv[19] = 88'h0000000000250f08910b1c;
      expv[20] = 88'hcc00000000a0853d9b3e06;
      expv[21] = 88'h440000000095346dd84df1;
      expv[22] = 88'h00000000002686730d4b59;
      expv[23] = 88'h00000000002783fcc296d1;
      expv[24] = 88'hc80000000011e8afda7f36;
      expv[25] = 88'hc80000000021ee727cf059;
      expv[26] = 88'h800000000022d37f8d6a87;
      expv[27] = 88'h800000000021bc5d2cc3bf;
      expv[28] = 88'h000000000037dd566aec4c;
      expv[29] = 88'h400000000028a35c326e13;
      expv[30] = 88'h800000000000263938637a;
      expv[31] = 88'h0400000000ac4118fa89c0;
      expv[32] = 88'h44000000008804269b24f0;
      expv[33] = 88'h40000000003697c49e3c45;
      expv[34] = 88'h000000000034911cdf2ba3;
      expv[35] = 88'h400000000031b448d4a7aa;
      expv[36] = 88'h0400000000aa0877954ccd;
      expv[37] = 88'h00000000002af1f51fbad1;
      expv[38] = 88'h400000000030edc7659dc4;
      expv[39] = 88'h80000000001dc836797f54;
      expv[40] = 88'h8400000000be77a39071d0;
      expv[41] = 88'h4400000000a827c8d6d28f;
      expv[42] = 88'h80000000002fd12109d503;
      expv[43] = 88'h0000000000089f3c611ee3;
      expv[44] = 88'h40000000000d617246c8fd;
      expv[45] = 88'hcc000000008fd2bf6cda75;
      expv[46] = 88'h40000000003aa2c07d7eda;
      expv[47] = 88'h00000000003b1d99577c71;
      expv[48] = 88'hc800000000058eb5d704ce;
      expv[49] = 88'h8400000000bf8ebf866587;
      expv[50] = 88'h44000000008d3fdc9350bf;
      expv[51] = 88'h04000000008ecdfca5211b;
      expv[52] = 88'h0400000000a97c8cacf26b;
      expv[53] = 88'h4400000000a54ed28eab27;
      expv[54] = 88'h84000000008d0558d8d548;
      expv[55] = 88'h4400000000b70d9eb1023f;
      expv[56] = 88'h040000000087b06cacdfa1;
      expv[57] = 88'hcc00000000a97069e9220e;
      expv[58] = 88'hcc00000000b0cfad9cbc06;
      expv[59] = 88'h40000000003fd5b3b4855c;
      expv[60] = 88'hc8000000000df52913a627;
      expv[61] = 88'h0000000000086ee36b66f6;
      expv[62] = 88'h0400000000b1d8dceaa078;
      expv[63] = 88'h0400000000bb4682f1fab8;
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
