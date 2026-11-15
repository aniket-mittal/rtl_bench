// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 94;
  localparam OW = 87;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00513 dut (
    .clk(clk),
    .ff_tx_data(in_vec[93:62]),
    .ff_tx_eop(in_vec[61:61]),
    .ff_tx_err(in_vec[60:60]),
    .ff_tx_mod(in_vec[59:58]),
    .ff_tx_sop(in_vec[57:57]),
    .ff_tx_wren(in_vec[56:56]),
    .ff_tx_clk(in_vec[55:55]),
    .ff_rx_rdy(in_vec[54:54]),
    .ff_rx_clk(in_vec[53:53]),
    .address(in_vec[52:45]),
    .read(in_vec[44:44]),
    .writedata(in_vec[43:12]),
    .write(in_vec[11:11]),
    .reset(in_vec[10:10]),
    .rgmii_in(in_vec[9:6]),
    .rx_control(in_vec[5:5]),
    .tx_clk(in_vec[4:4]),
    .rx_clk(in_vec[3:3]),
    .set_10(in_vec[2:2]),
    .set_1000(in_vec[1:1]),
    .mdio_in(in_vec[0:0]),
    .ff_tx_rdy(out_vec[86:86]),
    .ff_rx_data(out_vec[85:54]),
    .ff_rx_dval(out_vec[53:53]),
    .ff_rx_eop(out_vec[52:52]),
    .ff_rx_mod(out_vec[51:50]),
    .ff_rx_sop(out_vec[49:49]),
    .rx_err(out_vec[48:43]),
    .readdata(out_vec[42:11]),
    .waitrequest(out_vec[10:10]),
    .rgmii_out(out_vec[9:6]),
    .tx_control(out_vec[5:5]),
    .ena_10(out_vec[4:4]),
    .eth_mode(out_vec[3:3]),
    .mdio_out(out_vec[2:2]),
    .mdio_oen(out_vec[1:1]),
    .mdc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 94'h0738f017c95ec8f50793468b;
    stim[1] = 94'h2c0fcad89d2db1002c43e57c;
    stim[2] = 94'h0046c9c3599afd2875614a6c;
    stim[3] = 94'h2e8a8668fef14f644412312a;
    stim[4] = 94'h138f68b1a7ae729c3d39b823;
    stim[5] = 94'h190c8db9a2289fe9251a82e7;
    stim[6] = 94'h220cd61ce17b384e17ea78a8;
    stim[7] = 94'h0ae576ecd6e018ecba074074;
    stim[8] = 94'h2ba1501d430844b9371c421b;
    stim[9] = 94'h0ee92f2bdb7b2bbdcc720117;
    stim[10] = 94'h0fc3de3646397c1b299dda29;
    stim[11] = 94'h18af4857f006d86c6ea34818;
    stim[12] = 94'h0463b00798843dcdf0490929;
    stim[13] = 94'h3e92ad2bebeb7a5338ff0a45;
    stim[14] = 94'h0bbfe52021e36c5a27ec4bbb;
    stim[15] = 94'h180f397925bcba71a150d9fd;
    stim[16] = 94'h07b6f00e59968911cfc4d11d;
    stim[17] = 94'h1794782ac2c5e3776b529bc3;
    stim[18] = 94'h084cdc95ff11ac25f42b816f;
    stim[19] = 94'h39b7c5e4f7575ec08a74796b;
    stim[20] = 94'h2bcc9af6ba1b2dfa468551ca;
    stim[21] = 94'h071118230b91cee84fbb3901;
    stim[22] = 94'h15ce4c804ee3e06a8c0c732f;
    stim[23] = 94'h0bbd2bf66bcf1e02b42e228b;
    stim[24] = 94'h033d5d5de308f919f3baf0fd;
    stim[25] = 94'h095fa901bf49969a30750b5f;
    stim[26] = 94'h0138cea9a9504144023fc150;
    stim[27] = 94'h2693c6857f39328d52ca11aa;
    stim[28] = 94'h0a5c49adf84fb38393285081;
    stim[29] = 94'h1c700b3f6b4cf1972f47f082;
    stim[30] = 94'h2b6f6bea881cc1b090121024;
    stim[31] = 94'h287014016ba54dbcbe86897c;
    stim[32] = 94'h2b8c8d56f980a648afa29826;
    stim[33] = 94'h07cd9fbfee9d29f42eb9e06c;
    stim[34] = 94'h008988f3523b5197ad00e146;
    stim[35] = 94'h3cd8f86b4693f3caa2a87232;
    stim[36] = 94'h314bbe645194d280043a99a5;
    stim[37] = 94'h2f10e53b3f710d7d837d32b1;
    stim[38] = 94'h1dc41d5610e23d3ac238707d;
    stim[39] = 94'h0fa00de91cdee32b8786529f;
    stim[40] = 94'h08d7844eef7e8fde7df200cf;
    stim[41] = 94'h1f9ace1d7ff7658e275413ea;
    stim[42] = 94'h319843078526d7a9e178c38e;
    stim[43] = 94'h2ccc04ec31854caedab63827;
    stim[44] = 94'h2887733b476233efaa1ea046;
    stim[45] = 94'h044a437897047553971122f1;
    stim[46] = 94'h30f4a5e59e82e4fd03ae7aef;
    stim[47] = 94'h39a2bf227dd132ce337a526b;
    stim[48] = 94'h0729881b60c45dfc138531d9;
    stim[49] = 94'h0bce25c5b3e4556f7fa59006;
    stim[50] = 94'h13a289e54bc6565ae715584c;
    stim[51] = 94'h15356d0c0cb552607c3d9bfb;
    stim[52] = 94'h2b1d98343dd19b09110a2939;
    stim[53] = 94'h0513abd2fdb0b797a4b73208;
    stim[54] = 94'h27c90b1f9fab4de564cbdaec;
    stim[55] = 94'h33e259b6abd17f2a27dcd31c;
    stim[56] = 94'h2333c38057a14ddfeb2debbd;
    stim[57] = 94'h0190a237834d3e8cdff72a6f;
    stim[58] = 94'h02c5163a4a8eb3493676fb1f;
    stim[59] = 94'h076ec42bfc36e41d15bf32fd;
    stim[60] = 94'h36a30c18e9fd3d469ff1f171;
    stim[61] = 94'h3891c5044867d5ca8f083249;
    stim[62] = 94'h1886d41d9f8409e7a48a58e0;
    stim[63] = 94'h26cba90ada556c894ab6612f;
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
      expv[0] = 87'h4000000000000000000000;
      expv[1] = 87'h4000000000000000000000;
      expv[2] = 87'h4000000000000000000000;
      expv[3] = 87'h4000000000000000000000;
      expv[4] = 87'h4000000000000000000000;
      expv[5] = 87'h4000000000000000000000;
      expv[6] = 87'h4000000000000000000000;
      expv[7] = 87'h4000000000000000000000;
      expv[8] = 87'h4000000000000000000000;
      expv[9] = 87'h4000000000000000000000;
      expv[10] = 87'h4000000000000000000000;
      expv[11] = 87'h4000000000000000000000;
      expv[12] = 87'h4000000000000000000000;
      expv[13] = 87'h4000000000000000000000;
      expv[14] = 87'h4000000000000000000000;
      expv[15] = 87'h4000000000000000000000;
      expv[16] = 87'h4000000000000000000000;
      expv[17] = 87'h4000000000000000000000;
      expv[18] = 87'h4000000000000000000000;
      expv[19] = 87'h4000000000000000000000;
      expv[20] = 87'h4000000000000000000000;
      expv[21] = 87'h4000000000000000000000;
      expv[22] = 87'h4000000000000000000000;
      expv[23] = 87'h4000000000000000000000;
      expv[24] = 87'h4000000000000000000000;
      expv[25] = 87'h4000000000000000000000;
      expv[26] = 87'h4000000000000000000000;
      expv[27] = 87'h4000000000000000000000;
      expv[28] = 87'h4000000000000000000000;
      expv[29] = 87'h4000000000000000000000;
      expv[30] = 87'h4000000000000000000000;
      expv[31] = 87'h4000000000000000000000;
      expv[32] = 87'h4000000000000000000000;
      expv[33] = 87'h4000000000000000000000;
      expv[34] = 87'h4000000000000000000000;
      expv[35] = 87'h4000000000000000000000;
      expv[36] = 87'h4000000000000000000000;
      expv[37] = 87'h4000000000000000000000;
      expv[38] = 87'h4000000000000000000000;
      expv[39] = 87'h4000000000000000000000;
      expv[40] = 87'h4000000000000000000000;
      expv[41] = 87'h4000000000000000000000;
      expv[42] = 87'h4000000000000000000000;
      expv[43] = 87'h4000000000000000000000;
      expv[44] = 87'h4000000000000000000000;
      expv[45] = 87'h4000000000000000000000;
      expv[46] = 87'h4000000000000000000000;
      expv[47] = 87'h4000000000000000000000;
      expv[48] = 87'h4000000000000000000000;
      expv[49] = 87'h4000000000000000000000;
      expv[50] = 87'h4000000000000000000000;
      expv[51] = 87'h4000000000000000000000;
      expv[52] = 87'h4000000000000000000000;
      expv[53] = 87'h4000000000000000000000;
      expv[54] = 87'h4000000000000000000000;
      expv[55] = 87'h4000000000000000000000;
      expv[56] = 87'h4000000000000000000000;
      expv[57] = 87'h4000000000000000000000;
      expv[58] = 87'h4000000000000000000000;
      expv[59] = 87'h4000000000000000000000;
      expv[60] = 87'h4000000000000000000000;
      expv[61] = 87'h4000000000000000000000;
      expv[62] = 87'h4000000000000000000000;
      expv[63] = 87'h4000000000000000000000;
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
