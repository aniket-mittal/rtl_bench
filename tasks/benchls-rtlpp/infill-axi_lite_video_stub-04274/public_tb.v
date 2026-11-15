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

  rtlpp_04274 dut (
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
    stim[0] = 114'h30c1b79a7c1fa0f22b55a68bbf74c;
    stim[1] = 114'h33b559c14b53de2e722ba087e44de;
    stim[2] = 114'h25a85a15ac5202dc04083efc37c5a;
    stim[3] = 114'h151123f00fae3c1676341c7c0a466;
    stim[4] = 114'h15da0f634dd01c86bcdb64e264f52;
    stim[5] = 114'h3ee98cf4fa39c0090fa3463b93673;
    stim[6] = 114'h3c5e85c8fe64973625f85c7e202d5;
    stim[7] = 114'h1fd2614adaec783b47ec60ba2f874;
    stim[8] = 114'h2f6ae6cecd72872f8eece2f20748d;
    stim[9] = 114'h16aca976a863a37b35a85f624c8c3;
    stim[10] = 114'h0208a643d5f3ffc36efc767ada947;
    stim[11] = 114'h2c405ec6b16629a3ed5bed4cf335b;
    stim[12] = 114'h1bafa27fda352980ed7bb79ce9018;
    stim[13] = 114'h159a248ce5290308ef5e5bbe71f3f;
    stim[14] = 114'h13a5d48fda303b9f062388f0c24fd;
    stim[15] = 114'h33b54b66e7636cacad388d88ce134;
    stim[16] = 114'h3f290e09fbdf7d57bdc2ceb918e77;
    stim[17] = 114'h37cbce923dced77cd5027fa3e293e;
    stim[18] = 114'h2d0b08bf5f99aeaf8e66c9d2cfc1a;
    stim[19] = 114'h0224262f882ea474b7c3f94e744fa;
    stim[20] = 114'h1b940615f50fc111e78bb99a13b36;
    stim[21] = 114'h3fe7a1d3c2f9e7a09f02714bfc0be;
    stim[22] = 114'h2a8a33e53949b5681e345a3e0eba3;
    stim[23] = 114'h1c5e6b9406a778e83701dd931a831;
    stim[24] = 114'h33c8f9bb07bbfec83d50c85cc5732;
    stim[25] = 114'h08f59f2ad8287e67f51f9c8f55755;
    stim[26] = 114'h1bb73b021a8ca3ec8747616f60a19;
    stim[27] = 114'h34ba66496d16db32944097204772b;
    stim[28] = 114'h2623ee73a625e96405edf28ffebcb;
    stim[29] = 114'h088823888c424fb2ce79d4a1607a6;
    stim[30] = 114'h2bfaf03ff2ef872ec5f1d3f3cdadf;
    stim[31] = 114'h1502a7842de2cbafe77e29a514961;
    stim[32] = 114'h32ede3638c9e3e1f570e0c4c013f8;
    stim[33] = 114'h03cc014f00037b1f04369eb43a8cf;
    stim[34] = 114'h08d480aee13c0fa5077251670fcfa;
    stim[35] = 114'h3f27e526c87804c865d674e8f1dc0;
    stim[36] = 114'h05cf9c93d1dee4d25dd1c97b840dd;
    stim[37] = 114'h133b3675a5008038eed221a0b11f0;
    stim[38] = 114'h0f20c2926f25dc81c6c0563be566a;
    stim[39] = 114'h090369e9dfda203de710c096117a7;
    stim[40] = 114'h1c57822316f00bc85758d45196bf8;
    stim[41] = 114'h30c12e14616d03b82751ae604b3b8;
    stim[42] = 114'h2fdb7fc510510acd34941e99b1de0;
    stim[43] = 114'h1e27292e0ceed209bc364db7728f0;
    stim[44] = 114'h2a904cf59461140eee7d6c45434ba;
    stim[45] = 114'h1f81930b751e268e6dddbb46c38c6;
    stim[46] = 114'h2f05379222776336b44737dc15fd1;
    stim[47] = 114'h33b0047f1d18763cb25e4e26c5403;
    stim[48] = 114'h110147c87146858546cbf1771311e;
    stim[49] = 114'h0984679d038f88e4c45ec040fb7d0;
    stim[50] = 114'h0a9b4edf664ab6800f8c17ab1b83f;
    stim[51] = 114'h0beb855ed1651384c7b167b4ee215;
    stim[52] = 114'h122c51498b8b855b877abde46851b;
    stim[53] = 114'h3a92cdfee31f9fad571ddefe183d6;
    stim[54] = 114'h183c7d3887c43df03f66f8b2aa78d;
    stim[55] = 114'h10a08a52d4bf13969fb63d4a2e872;
    stim[56] = 114'h2fdd932dba5aaae98e8f7d4897a42;
    stim[57] = 114'h10231d54be3852cadf7acd51770b5;
    stim[58] = 114'h1b8219c0fc85fd9d75aba463dd557;
    stim[59] = 114'h3fda6bb2432712c4973a6a87a7c65;
    stim[60] = 114'h2640e5a2b1e0eceadd8e08f8233bd;
    stim[61] = 114'h3e676f63f86628ec5ca5f8e766a78;
    stim[62] = 114'h35fb021084fe0d0d26c8ac4fe4505;
    stim[63] = 114'h2ee42ab7fc522eaa3630d155bc4ff;
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
      expv[0] = 88'hxxxxxxxxxxx00000000xxx;
      expv[1] = 88'hxxxxxxxxxxx00000000xxx;
      expv[2] = 88'hxxxxxxxxxxx00000000xxx;
      expv[3] = 88'hxxxxxxxxxxx00000000xxx;
      expv[4] = 88'hxxxxxxxxxxx1a0e3e05xxx;
      expv[5] = 88'hxxxxxxxxxxx1a0e3e05xxx;
      expv[6] = 88'hxxxxxxxxxxxd1a31dc9xxx;
      expv[7] = 88'hxxxxxxxxxxxd1a31dc9xxx;
      expv[8] = 88'hxxxxxxxxxxxf6305d17xxx;
      expv[9] = 88'hxxxxxxxxxxx76717903xxx;
      expv[10] = 88'hxxxxxxxxxxx76717903xxx;
      expv[11] = 88'hxxxxxxxxxxx7e3b3d6dxxx;
      expv[12] = 88'hxxxxxxxxxxx7e3b3d6dxxx;
      expv[13] = 88'hxxxxxxxxxxx7e3b3d6dxxx;
      expv[14] = 88'hxxxxxxxxxxxaf2ddf38xxx;
      expv[15] = 88'hxxxxxxxxxxx11c47861xxx;
      expv[16] = 88'hxxxxxxxxxxx11c47861xxx;
      expv[17] = 88'hxxxxxxxxxxx11c47861xxx;
      expv[18] = 88'hxxxxxxxxxxx11c47861xxx;
      expv[19] = 88'hxxxxxxxxxxx3364e967xxx;
      expv[20] = 88'hxxxxxxxxxxxe1fca73axxx;
      expv[21] = 88'hxxxxxxxxxxxc5dccd09xxx;
      expv[22] = 88'hxxxxxxxxxxx8138a5fexxx;
      expv[23] = 88'hxxxxxxxxxxx1a2d1f07xxx;
      expv[24] = 88'hxxxxxxxxxxx80eec98dxxx;
      expv[25] = 88'hxxxxxxxxxxx80eec98dxxx;
      expv[26] = 88'hxxxxxxxxxxx80eec98dxxx;
      expv[27] = 88'hxxxxxxxxxxxa3b0b7b0xxx;
      expv[28] = 88'hxxxxxxxxxxxa3b0b7b0xxx;
      expv[29] = 88'hxxxxxxxxxxxa3b0b7b0xxx;
      expv[30] = 88'hxxxxxxxxxxx3cea50b0xxx;
      expv[31] = 88'hxxxxxxxxxxx3cea50b0xxx;
      expv[32] = 88'hxxxxxxxxxxxbf14d28axxx;
      expv[33] = 88'hxxxxxxxxxxx87062600xxx;
      expv[34] = 88'hxxxxxxxxxxx87062600xxx;
      expv[35] = 88'hxxxxxxxxxxxb928b387xxx;
      expv[36] = 88'hxxxxxxxxxxxb928b387xxx;
      expv[37] = 88'hxxxxxxxxxxxb928b387xxx;
      expv[38] = 88'hxxxxxxxxxxx6910d058xxx;
      expv[39] = 88'hxxxxxxxxxxx602b1df2xxx;
      expv[40] = 88'hxxxxxxxxxxx88604b08xxx;
      expv[41] = 88'hxxxxxxxxxxxac6a28cbxxx;
      expv[42] = 88'hxxxxxxxxxxxa8d73025xxx;
      expv[43] = 88'hxxxxxxxxxxxa8d73025xxx;
      expv[44] = 88'hxxxxxxxxxxxa8d73025xxx;
      expv[45] = 88'hxxxxxxxxxxx3eb622a1xxx;
      expv[46] = 88'hxxxxxxxxxxx3eb622a1xxx;
      expv[47] = 88'hxxxxxxxxxxx00000000xxx;
      expv[48] = 88'hxxxxxxxxxxx00000000xxx;
      expv[49] = 88'hxxxxxxxxxxx65f8bb89xxx;
      expv[50] = 88'hxxxxxxxxxxx65f8bb89xxx;
      expv[51] = 88'hxxxxxxxxxxxc60bd58dxxx;
      expv[52] = 88'hxxxxxxxxxxxd8b3da77xxx;
      expv[53] = 88'hxxxxxxxxxxxbd5ef234xxx;
      expv[54] = 88'hxxxxxxxxxxx8eef7f0cxxx;
      expv[55] = 88'hxxxxxxxxxxxb37c5955xxx;
      expv[56] = 88'hxxxxxxxxxxxdb1ea517xxx;
      expv[57] = 88'hxxxxxxxxxxx47bea44bxxx;
      expv[58] = 88'hxxxxxxxxxxxbd66a8bbxxx;
      expv[59] = 88'hxxxxxxxxxxxbd66a8bbxxx;
      expv[60] = 88'hxxxxxxxxxxx9d3543d3xxx;
      expv[61] = 88'hxxxxxxxxxxx9d3543d3xxx;
      expv[62] = 88'hxxxxxxxxxxx9d3543d3xxx;
      expv[63] = 88'hxxxxxxxxxxx645627f2xxx;
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
