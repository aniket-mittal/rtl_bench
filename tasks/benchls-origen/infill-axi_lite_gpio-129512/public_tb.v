// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 106;
  localparam OW = 49;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_129512 dut (
    .s_axi_aclk(clk),
    .s_axi_aresetn(in_vec[105:105]),
    .s_axi_awaddr(in_vec[104:73]),
    .s_axi_awvalid(in_vec[72:72]),
    .s_axi_wdata(in_vec[71:40]),
    .s_axi_wstrb(in_vec[39:36]),
    .s_axi_wvalid(in_vec[35:35]),
    .s_axi_bready(in_vec[34:34]),
    .s_axi_araddr(in_vec[33:2]),
    .s_axi_arvalid(in_vec[1:1]),
    .s_axi_rready(in_vec[0:0]),
    .s_axi_awready(out_vec[48:48]),
    .s_axi_wready(out_vec[47:47]),
    .s_axi_bresp(out_vec[46:45]),
    .s_axi_bvalid(out_vec[44:44]),
    .s_axi_arready(out_vec[43:43]),
    .s_axi_rdata(out_vec[42:11]),
    .s_axi_rresp(out_vec[10:9]),
    .s_axi_rvalid(out_vec[8:8]),
    .gpio_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 106'h0982b2ed4733e30f0d3759e5889;
    stim[1] = 106'h13f23e5995442d8ec6c966c5bad;
    stim[2] = 106'h3b48bcf2342bdf56bdecc683707;
    stim[3] = 106'h20016ccadfb171fbaae0537e887;
    stim[4] = 106'h277cb436bd76839a7efe44d5c46;
    stim[5] = 106'h36eb8ca7497516142be8c74e29f;
    stim[6] = 106'h2eb6dcb6c0f02fa1ec162315c4e;
    stim[7] = 106'h2852fd8334ece955f93f37f1c4c;
    stim[8] = 106'h342f21a45e499de491ad0275668;
    stim[9] = 106'h3764055fdcc205a1d986f2cffa1;
    stim[10] = 106'h367c6732a2647a346a0a983511f;
    stim[11] = 106'h3db7ef73fb93cce5ed7acae2c7e;
    stim[12] = 106'h3c038e116a2d15c1bb812c75c06;
    stim[13] = 106'h347f798fc111520b7e7646e16c6;
    stim[14] = 106'h25e075dda71b790bfaa1a153605;
    stim[15] = 106'h3ed28c007d6bf74cb62ccc81463;
    stim[16] = 106'h2f7926a5387b88b416f04c08020;
    stim[17] = 106'h289383c641f55a6846bc02d87ad;
    stim[18] = 106'h25de56239acda5d9d2677585734;
    stim[19] = 106'h308e44cf70abc35e4d940cbdd48;
    stim[20] = 106'h37e04d9e37f7d17ab0cba42ea3b;
    stim[21] = 106'h2cee72770ce26c053dc0cf590eb;
    stim[22] = 106'h24a2c83d82049a5db7f7de2c266;
    stim[23] = 106'h25d926ff28b9d2dfcb16abbe739;
    stim[24] = 106'h3a27476f6588294567985c95c04;
    stim[25] = 106'h2209b74d8434a28d1e7a2f427e3;
    stim[26] = 106'h203a02e503378134ef0bd693ec1;
    stim[27] = 106'h282a33c6a4f068aae9310e41d5f;
    stim[28] = 106'h3a1141f368573f55388e4774084;
    stim[29] = 106'h393cd482a3b46b63d940fe60074;
    stim[30] = 106'h26f4cf7a98665bfdf479147de26;
    stim[31] = 106'h39bf5d157e017f56348fe46f381;
    stim[32] = 106'h2f0022f5356f74b2c7d079affc5;
    stim[33] = 106'h200ba4fd14d6aaf720dfb3b63a7;
    stim[34] = 106'h213e5538dfca069ba2495692392;
    stim[35] = 106'h378dbacfa62698e4d841c33f8bc;
    stim[36] = 106'h2803bcbd1d29f01fea05f4b42b2;
    stim[37] = 106'h2b0300df70612a3bacf3d27e9e3;
    stim[38] = 106'h25d2f73e863ea496869e01cee9c;
    stim[39] = 106'h29e05ef54793c5c93414e04bfbd;
    stim[40] = 106'h0aac8464abe1b5fb8daf3c66f9b;
    stim[41] = 106'h22a748637c9d628e14f0ea3f1e0;
    stim[42] = 106'h2970e8a11decbf3e8bf17e4fbac;
    stim[43] = 106'h239c4162fe7ae34ee68a7acbd96;
    stim[44] = 106'h293f4195277f9ecf68234a51279;
    stim[45] = 106'h39c0f145d6e807268d1a8a166d3;
    stim[46] = 106'h2f8c3b16f74aaa2f856ab551d3e;
    stim[47] = 106'h2002adb8deedeeccb5268779b73;
    stim[48] = 106'h29664ce0b6ee3a6f537cefc9ad9;
    stim[49] = 106'h3e072d49c8e0ab26d44bb6d7ded;
    stim[50] = 106'h255f78045d78e7032f6d9492c26;
    stim[51] = 106'h269b04d971836ab4e16414717ea;
    stim[52] = 106'h2bed3bb462f5892eee65397e0f2;
    stim[53] = 106'h3b225d471c658d9d9318ab1af71;
    stim[54] = 106'h2660ce256b71a063aca9302ddc3;
    stim[55] = 106'h2afc39e277be6b490c47ff4dce4;
    stim[56] = 106'h3b9a3f696359db985540dc0f826;
    stim[57] = 106'h26c3d6b8be25a92e92975e4f32d;
    stim[58] = 106'h29d82e8ddd7b8e78bc9dba35749;
    stim[59] = 106'h32e4cc7be35c48cdd4d38f01243;
    stim[60] = 106'h2b9b6f61b1f51cd6286a0119ca3;
    stim[61] = 106'h35308acf5b3f759cd86f45d6a20;
    stim[62] = 106'h33ba7a717192e5ae963cddb59dc;
    stim[63] = 106'h2c7884b0edeab54a7cecaa9b825;
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
      expv[0] = 49'h0000000000000;
      expv[1] = 49'h0000000000000;
      expv[2] = 49'h0000000000000;
      expv[3] = 49'h188000000006b;
      expv[4] = 49'h010000003596b;
      expv[5] = 49'h18800000359a7;
      expv[6] = 49'h01000000358a7;
      expv[7] = 49'h01800000358a7;
      expv[8] = 49'h11000000539a7;
      expv[9] = 49'h0900000053949;
      expv[10] = 49'h1100000053849;
      expv[11] = 49'h0180000053849;
      expv[12] = 49'h1000000024949;
      expv[13] = 49'h088000002491b;
      expv[14] = 49'h000000000d91b;
      expv[15] = 49'h080000000d8bf;
      expv[16] = 49'h108000000d8bf;
      expv[17] = 49'h080000005f941;
      expv[18] = 49'h000000005f841;
      expv[19] = 49'h100000005f841;
      expv[20] = 49'h080000005f8e4;
      expv[21] = 49'h108000005f8e4;
      expv[22] = 49'h0800000072153;
      expv[23] = 49'h0080000072153;
      expv[24] = 49'h0000000072053;
      expv[25] = 49'h0800000072056;
      expv[26] = 49'h0080000072056;
      expv[27] = 49'h000000002b156;
      expv[28] = 49'h008000002b056;
      expv[29] = 49'h080000002b153;
      expv[30] = 49'h000000002b153;
      expv[31] = 49'h108000002b153;
      expv[32] = 49'h080000002b063;
      expv[33] = 49'h100000002b063;
      expv[34] = 49'h088000002b072;
      expv[35] = 49'h1000000039172;
      expv[36] = 49'h0000000039172;
      expv[37] = 49'h1080000039172;
      expv[38] = 49'h08000000390ba;
      expv[39] = 49'h00000000390ba;
      expv[40] = 49'h0000000000000;
      expv[41] = 49'h0000000000000;
      expv[42] = 49'h18000000000e1;
      expv[43] = 49'h01000000000e1;
      expv[44] = 49'h19800000000ee;
      expv[45] = 49'h01000000771ee;
      expv[46] = 49'h11800000770ee;
      expv[47] = 49'h00000000771ee;
      expv[48] = 49'h10800000770ee;
      expv[49] = 49'h00000000771ee;
      expv[50] = 49'h00000000770ee;
      expv[51] = 49'h10800000770ee;
      expv[52] = 49'h00000000771ee;
      expv[53] = 49'h00800000771ee;
      expv[54] = 49'h10000000770ee;
      expv[55] = 49'h088000007703a;
      expv[56] = 49'h100000001d13a;
      expv[57] = 49'h008000001d13a;
      expv[58] = 49'h180000001d0e9;
      expv[59] = 49'h010000001d0e9;
      expv[60] = 49'h088000001d0dd;
      expv[61] = 49'h100000006e9dd;
      expv[62] = 49'h000000006e9dd;
      expv[63] = 49'h100000006e9dd;
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
