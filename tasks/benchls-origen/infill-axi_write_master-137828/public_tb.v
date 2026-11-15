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
    stim[0] = 116'h3b789e6a817e013c6c7873248bf5c;
    stim[1] = 116'h47d7fa064a4b3746c5628df820282;
    stim[2] = 116'h9943bb4ccb43da001548bfb0db6a2;
    stim[3] = 116'h997c9a1036db0440d45a3a02e96d3;
    stim[4] = 116'hdedea522f8983e72cec3a65b87053;
    stim[5] = 116'hbf3a7f98cf72d7bc2eea85837825b;
    stim[6] = 116'hb2d4c59819ed6e03c52282541b3b3;
    stim[7] = 116'hcd20e7ab81f77279038e4a2ca1994;
    stim[8] = 116'hb2a91b09d7bd4043a4e25e1a70d0a;
    stim[9] = 116'h8b75132efc5bc4dbe5bb58881e4bf;
    stim[10] = 116'h90efa96415c58f1026c4bc10e07c9;
    stim[11] = 116'h8aafcf617a52b344b3cd0e84f010b;
    stim[12] = 116'hd5532028d6950742547e027f5877d;
    stim[13] = 116'hcc4fb227d730303f01c63bd75571a;
    stim[14] = 116'hea4b1ee1e17cb5e7a44812de17d42;
    stim[15] = 116'hbaeae989b69b87e0e2e9bc094214a;
    stim[16] = 116'h95c633069a5332f3e15231363be11;
    stim[17] = 116'hec54fc3c3ee31daae635c2cc6ab04;
    stim[18] = 116'h9762389e03f81f5f5ea482ff45c8f;
    stim[19] = 116'h854bfd6a2b5730711810397a7a410;
    stim[20] = 116'hffd7129743288140f6f95036e47d3;
    stim[21] = 116'hbad9669b5a377bb9ce76645d25e17;
    stim[22] = 116'ha32f6b64f81b703957a55dde3511c;
    stim[23] = 116'h92f0adbea5288b729001565f14f66;
    stim[24] = 116'hea45c3c9caac8c48b5811d524dde8;
    stim[25] = 116'hce0fa274d8f01aee68b2100099bc5;
    stim[26] = 116'hceca5129eb5f5d2daf55f9ef0004f;
    stim[27] = 116'h9064e4f4d9515b6a95a806f41288d;
    stim[28] = 116'h827aa9d4149a8c83369099aa4f2c8;
    stim[29] = 116'hdf1aa9c38f097b4ea857ec2d3563c;
    stim[30] = 116'h81b61580c920beb2442e0340e2ca1;
    stim[31] = 116'hdbcaf092ddf53addf18dddbe9215b;
    stim[32] = 116'hd3a662e30d6a91228ae5f63f1e3e0;
    stim[33] = 116'h9c560f09f6abdbd085f9d8a70faf9;
    stim[34] = 116'hd302176f84ddc92b62aae6ce204bc;
    stim[35] = 116'hf6d2a1512ca509cb61433bb6f16a5;
    stim[36] = 116'hd0abf6f8b22ed7f243f334c92a0c6;
    stim[37] = 116'hb05c7a8959d46f66c04a0589b8b76;
    stim[38] = 116'h8acb6d7d77f1261b3a04459272bd2;
    stim[39] = 116'ha305dd1d824b52f2c70a58327f1e6;
    stim[40] = 116'hd75f5a57b2c3eb0e7087350ec7cee;
    stim[41] = 116'he497329f0f823001e555b7647f500;
    stim[42] = 116'h958040266851da3e3ea649539995a;
    stim[43] = 116'hf9c9f3d45454f25117669f7d6ca97;
    stim[44] = 116'h872cb8217b3766087dce4f700d87b;
    stim[45] = 116'h8dead1cd548978d3a58c73164c862;
    stim[46] = 116'hbc83947d785a2378a66c9bcb1d839;
    stim[47] = 116'hae5b30383596a5c39f81ec3000095;
    stim[48] = 116'h4f037e46b661a8b07e4c58d1b8fea;
    stim[49] = 116'hd681d131dfd72b530a7143030787e;
    stim[50] = 116'hbba0624d3b4e476b5f3bbfaa1ba74;
    stim[51] = 116'ha457c4d35d7b72f1ca897a2dab311;
    stim[52] = 116'h9c7560b0c5fc247e11e783547c973;
    stim[53] = 116'hc0ae5b8be3ec5c7d6480938c065ea;
    stim[54] = 116'hf72610f55a133bd80bebc0fe1411c;
    stim[55] = 116'hdf8554028e932fb34676a58b9784d;
    stim[56] = 116'h9c7ea0fc99691cdda4ab83aef1587;
    stim[57] = 116'hae88c6bab44497ac1c503bd92fd1c;
    stim[58] = 116'h8b414c6c5c6aa3f60348352e42ef4;
    stim[59] = 116'he26b85a28d60f7ee4d5534aa21b64;
    stim[60] = 116'hba2844334cb095dac2e64422704fb;
    stim[61] = 116'hfe6eeb43759beef110ca2a46803ed;
    stim[62] = 116'h9a542903a7ba41e86e02a7587efb6;
    stim[63] = 116'hc5e50628b9578a35253384ed4ebad;
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
      expv[6] = 150'h20000000000000000418000000000000000000;
      expv[7] = 150'h20000000000000000418000000000000000000;
      expv[8] = 150'h20000000000000000418000000000000000000;
      expv[9] = 150'h20000000000000000418000000000000000000;
      expv[10] = 150'h20000000000000000418000000000000000000;
      expv[11] = 150'h20000000000000000418000000000000000000;
      expv[12] = 150'h20000000000000000418000000000000000000;
      expv[13] = 150'h1800002aa64051ad0418000000000000000000;
      expv[14] = 150'h1800002aa64051ad0418000000000000000000;
      expv[15] = 150'h1800002aa64051ad0418000000000000000000;
      expv[16] = 150'h1800002aa64051ad0418000000000000000000;
      expv[17] = 150'h1800002aa64051ad0418000000000000000000;
      expv[18] = 150'h1800002aa64051ad0418000000000000000000;
      expv[19] = 150'h1800002aa64051ad0418000000000000000000;
      expv[20] = 150'h1800002aa64051ad0418000000000000000000;
      expv[21] = 150'h1800002aa64051ad0418000000000000000000;
      expv[22] = 150'h1800002aa64051ad0418000000000000000000;
      expv[23] = 150'h1800002aa64051ad0418000000000000000000;
      expv[24] = 150'h1800002aa64051ad0418000000000000000000;
      expv[25] = 150'h100000548b8793950418000000000000000000;
      expv[26] = 150'h100000548b8793950418000000000000000000;
      expv[27] = 150'h100000548b8793950418000000000000000000;
      expv[28] = 150'h100000548b8793950418000000000000000000;
      expv[29] = 150'h100000548b8793950418000000000000000000;
      expv[30] = 150'h100000548b8793950418000000000000000000;
      expv[31] = 150'h100000548b8793950418000000000000000000;
      expv[32] = 150'h1800003795e125bb8418000000000000000000;
      expv[33] = 150'h180000b795e125bbb418000000000000000000;
      expv[34] = 150'h1800003795e125bbb41dbd085f9d8a70fafffc;
      expv[35] = 150'h1800003795e125bbb41c92b62aae6ce204bffc;
      expv[36] = 150'h1800003795e125bbb41c92b62aae6ce204bffc;
      expv[37] = 150'h1800003795e125bbb41d7f243f334c92a0c7fc;
      expv[38] = 150'h1800003795e125bbb41d7f243f334c92a0c7fc;
      expv[39] = 150'h1800003795e125bbb41d7f243f334c92a0c7fc;
      expv[40] = 150'h1800003795e125bbb41d7f243f334c92a0c7fc;
      expv[41] = 150'h1800003795e125bbb41eb0e7087350ec7ceffc;
      expv[42] = 150'h1800003795e125bbb41eb0e7087350ec7ceffc;
      expv[43] = 150'h1800003795e125bbb41da3e3ea649539995ffc;
      expv[44] = 150'h1800003795e125bbb41f25117669f7d6ca97fc;
      expv[45] = 150'h1800003795e125bbb41f25117669f7d6ca97fc;
      expv[46] = 150'h1800003795e125bbb41f25117669f7d6ca97fc;
      expv[47] = 150'h1800003795e125bbb41f25117669f7d6ca97fc;
      expv[48] = 150'h20000000000000000418000000000000000000;
      expv[49] = 150'h20000000000000000418000000000000000000;
      expv[50] = 150'h20000000000000000418000000000000000000;
      expv[51] = 150'h20000000000000000418000000000000000000;
      expv[52] = 150'h20000000000000000418000000000000000000;
      expv[53] = 150'h20000000000000000418000000000000000000;
      expv[54] = 150'h100000015cb717c78418000000000000000000;
      expv[55] = 150'h100000015cb717c78418000000000000000000;
      expv[56] = 150'h100000015cb717c78418000000000000000000;
      expv[57] = 150'h100000015cb717c78418000000000000000000;
      expv[58] = 150'h100000015cb717c78418000000000000000000;
      expv[59] = 150'h100000015cb717c78418000000000000000000;
      expv[60] = 150'h100000015cb717c78418000000000000000000;
      expv[61] = 150'h100000015cb717c78418000000000000000000;
      expv[62] = 150'h100000015cb717c78418000000000000000000;
      expv[63] = 150'h100000015cb717c78418000000000000000000;
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
