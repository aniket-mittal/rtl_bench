// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 95;
  localparam OW = 93;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06902 dut (
    .clk(clk),
    .rst(in_vec[94:94]),
    .read_req(in_vec[93:93]),
    .write_data(in_vec[92:2]),
    .write_enable(in_vec[1:1]),
    .rollover_write(in_vec[0:0]),
    .read_data(out_vec[92:2]),
    .fifo_empty(out_vec[1:1]),
    .rdata_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 95'h413143e62483efa80cebb29f;
    stim[1] = 95'h6d54835c993772a5ca1bbb79;
    stim[2] = 95'h0a7976a80bbe7f707dd6c48d;
    stim[3] = 95'h16d7619dd0ed8d58bfec350d;
    stim[4] = 95'h0927c742e5edcc217946b5e3;
    stim[5] = 95'h0ab1edc0cdc581f6617523e3;
    stim[6] = 95'h167480ec2991019034e7a280;
    stim[7] = 95'h1bc05574faa59e6fa5d070da;
    stim[8] = 95'h2a944be2f5131e5fac257bbd;
    stim[9] = 95'h0510b4d3180ec60533f5a58a;
    stim[10] = 95'h08bb75a940b93161d377cd34;
    stim[11] = 95'h0a412ff293319a14ec9d8a38;
    stim[12] = 95'h34be1bd29a3d9d37e03c531d;
    stim[13] = 95'h1177cecf1667b06b414c94e4;
    stim[14] = 95'h1c67f85325773be1b787f077;
    stim[15] = 95'h0bb176c5e92872ebd5c4bde7;
    stim[16] = 95'h38dd11d06f0f686c2a188444;
    stim[17] = 95'h0ffa028b0ee6bee42c3d9d95;
    stim[18] = 95'h0c0b58703c6482e0dc68902f;
    stim[19] = 95'h3e170dd6ac5c323360e8b567;
    stim[20] = 95'h2d38b817bfe06619cc4a1bca;
    stim[21] = 95'h06977bef065551234d799099;
    stim[22] = 95'h2cd395f0e1b81d59b386ce9b;
    stim[23] = 95'h389177106849ca4559705de3;
    stim[24] = 95'h16bb6032511d5cc4318511cf;
    stim[25] = 95'h022eafb5c5ad2ebeca935da6;
    stim[26] = 95'h3afa392cc732247d95f9896c;
    stim[27] = 95'h387b83c267f7b295bd92983a;
    stim[28] = 95'h1a9dd3546990ba60546e87bd;
    stim[29] = 95'h2144d03846689482efb0e874;
    stim[30] = 95'h0a2d4ba2f333c89bb6d622ae;
    stim[31] = 95'h3d14eeb8e8ddc9238f3ee0d4;
    stim[32] = 95'h21750b52c124d03c2dfcca96;
    stim[33] = 95'h0b63c8d5c0acf244f1010cbd;
    stim[34] = 95'h2b1b6522c340f46c7cf55bc0;
    stim[35] = 95'h12f7148b8bfa0477b47ba485;
    stim[36] = 95'h176ff91ad06d4f5a6d98d44c;
    stim[37] = 95'h2dcc28f5fd18f4c701d02e9b;
    stim[38] = 95'h347de0b88b40e98859def4ad;
    stim[39] = 95'h1a715f977c85e28ebea749b8;
    stim[40] = 95'h10c8af70a1d344207e94b939;
    stim[41] = 95'h273177636ad6ed3dfa79dac3;
    stim[42] = 95'h0a7cb3f54a28ef21a880b395;
    stim[43] = 95'h0c46c2abf7c5a1d84caf1641;
    stim[44] = 95'h1e8e1e9447d4750a36bc3ca0;
    stim[45] = 95'h26b768943345ff233288ca33;
    stim[46] = 95'h066d2a66a11211f3d66f2cba;
    stim[47] = 95'h0b669be1c7484962a3e0082b;
    stim[48] = 95'h05bf6182f0ff7350de3fd876;
    stim[49] = 95'h299b9ce19acb3001b2b977e3;
    stim[50] = 95'h1674ea7f241b6559c1db4532;
    stim[51] = 95'h2f0bfaf9e559743402aa4dbc;
    stim[52] = 95'h2e672bd2ed5686639294569b;
    stim[53] = 95'h2c12ab5662fe7e2a969c141c;
    stim[54] = 95'h0a368a49fda24354c04c62ef;
    stim[55] = 95'h0384f8962b546261b8a5a7cd;
    stim[56] = 95'h18595a27b75f1be92df00084;
    stim[57] = 95'h3e410d7fe9490f7f4bfbba11;
    stim[58] = 95'h0e7b1f6aad5c53331f7d6d06;
    stim[59] = 95'h3e865073896bd7d335cae9e3;
    stim[60] = 95'h274a0ac925993ac304eb0de8;
    stim[61] = 95'h33ce566d03ffeef4563ad129;
    stim[62] = 95'h0289c78dfd20f327760e55b2;
    stim[63] = 95'h27fc74e2b0b60e0c496e20ba;
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
      expv[0] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 93'h0927c742e5edcc217946b5e1;
      expv[10] = 93'h0927c742e5edcc217946b5e0;
      expv[11] = 93'h0927c742e5edcc217946b5e0;
      expv[12] = 93'h0927c742e5edcc217946b5e0;
      expv[13] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 93'h0ab1edc0cdc581f6617523e1;
      expv[18] = 93'h0ab1edc0cdc581f6617523e0;
      expv[19] = 93'h0ab1edc0cdc581f6617523e0;
      expv[20] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 93'h1bc05574faa59e6fa5d070d9;
      expv[22] = 93'h1bc05574faa59e6fa5d070d8;
      expv[23] = 93'h0510b4d3180ec60533f5a589;
      expv[24] = 93'h1c67f85325773be1b787f075;
      expv[25] = 93'h1c67f85325773be1b787f074;
      expv[26] = 93'h1c67f85325773be1b787f074;
      expv[27] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 93'h0bb176c5e92872ebd5c4bde5;
      expv[29] = 93'h0bb176c5e92872ebd5c4bde4;
      expv[30] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 93'h0c0b58703c6482e0dc68902d;
      expv[33] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 93'h1e170dd6ac5c323360e8b565;
      expv[36] = 93'h1e170dd6ac5c323360e8b564;
      expv[37] = 93'h1e170dd6ac5c323360e8b564;
      expv[38] = 93'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 93'h0d38b817bfe06619cc4a1bc9;
      expv[40] = 93'h0d38b817bfe06619cc4a1bc8;
      expv[41] = 93'h0d38b817bfe06619cc4a1bc8;
      expv[42] = 93'h0cd395f0e1b81d59b386ce99;
      expv[43] = 93'h0cd395f0e1b81d59b386ce98;
      expv[44] = 93'h0cd395f0e1b81d59b386ce98;
      expv[45] = 93'h0cd395f0e1b81d59b386ce98;
      expv[46] = 93'h0927c742e5edcc217946b5e1;
      expv[47] = 93'h0927c742e5edcc217946b5e0;
      expv[48] = 93'h0927c742e5edcc217946b5e0;
      expv[49] = 93'h0927c742e5edcc217946b5e0;
      expv[50] = 93'h189177106849ca4559705de1;
      expv[51] = 93'h189177106849ca4559705de0;
      expv[52] = 93'h05bf6182f0ff7350de3fd875;
      expv[53] = 93'h099b9ce19acb3001b2b977e1;
      expv[54] = 93'h1bc05574faa59e6fa5d070d9;
      expv[55] = 93'h1bc05574faa59e6fa5d070d8;
      expv[56] = 93'h1bc05574faa59e6fa5d070d8;
      expv[57] = 93'h1bc05574faa59e6fa5d070d8;
      expv[58] = 93'h1674ea7f241b6559c1db4531;
      expv[59] = 93'h1674ea7f241b6559c1db4530;
      expv[60] = 93'h0e672bd2ed56866392945699;
      expv[61] = 93'h0a2d4ba2f333c89bb6d622ad;
      expv[62] = 93'h0a368a49fda24354c04c62ed;
      expv[63] = 93'h0a368a49fda24354c04c62ec;
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
