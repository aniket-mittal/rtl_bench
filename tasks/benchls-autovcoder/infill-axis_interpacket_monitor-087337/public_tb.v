// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 102;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_087337 dut (
    .clk156(clk),
    .rstn156(in_vec[101:101]),
    .rst_sw156(in_vec[100:100]),
    .s_axis_tdata(in_vec[99:36]),
    .s_axis_tkeep(in_vec[35:28]),
    .s_axis_tvalid(in_vec[27:27]),
    .s_axis_tlast(in_vec[26:26]),
    .s_axis_tuser(in_vec[25:1]),
    .m_axis_tready(in_vec[0:0]),
    .s_axis_tready(out_vec[127:127]),
    .m_axis_tdata(out_vec[126:63]),
    .m_axis_tkeep(out_vec[62:55]),
    .m_axis_tvalid(out_vec[54:54]),
    .m_axis_tlast(out_vec[53:53]),
    .m_axis_tuser(out_vec[52:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 102'h212fcfd069b8b58645864f83e7;
    stim[1] = 102'h28c762122a2c6761d54930a8e1;
    stim[2] = 102'h14b4bdced9e0d3f48b13d65d9c;
    stim[3] = 102'h0799b1592c550eaabbd5f5cc2f;
    stim[4] = 102'h03b318c1d5acae930e0ddcd7f8;
    stim[5] = 102'h048d78c42c52abd6bf537b0f60;
    stim[6] = 102'h12c2be91d8e87d8e2b055543f8;
    stim[7] = 102'h063c804cbadc5d2dd2df12879c;
    stim[8] = 102'h0ef0936ac40ee084f77efff140;
    stim[9] = 102'h0747381093220d6171c12e4020;
    stim[10] = 102'h000d7c5dad06d2b82882f56406;
    stim[11] = 102'h00172f6b4729c60a0aeaa1f3e8;
    stim[12] = 102'h147f09701462dd9b9791dd63ac;
    stim[13] = 102'h053112ce07bd7518754fd97dde;
    stim[14] = 102'h179a3e8dab8be6f78267669980;
    stim[15] = 102'h1238e23222080453e8086a7330;
    stim[16] = 102'h1b59c6ec672f72bcfc40473f1d;
    stim[17] = 102'h1cbfcc9b03ca099d58a1e9fb50;
    stim[18] = 102'h04d4097db659695ca32d1d5ceb;
    stim[19] = 102'h1f85504fb9919a333ec8a36c98;
    stim[20] = 102'h00aa8ffec26abcb1d0dd07e548;
    stim[21] = 102'h16b42fba927cc345afe76f86fc;
    stim[22] = 102'h1326197b3a8ae6adf6b5df409e;
    stim[23] = 102'h0b801f5a5e29b8aab17a009ca5;
    stim[24] = 102'h27e6dcc2ebc4084ed7a69e5e4d;
    stim[25] = 102'h0c197a68aaa2c5a3d06c295bcc;
    stim[26] = 102'h1789bf66a748faa2b2cc6b1903;
    stim[27] = 102'h1cb1a5e24aade0a1805cee451c;
    stim[28] = 102'h0b533bf2b4e927ad6e723858ca;
    stim[29] = 102'h0d9fa2b96e2c883f9e8a913db7;
    stim[30] = 102'h0f5beae1f78f3780201c7a393e;
    stim[31] = 102'h090f93c2e856f07aa514b193c2;
    stim[32] = 102'h14ad6ebf6441a0cc5e07ab86f5;
    stim[33] = 102'h053e3914742fbca0ce787bf2fe;
    stim[34] = 102'h0b45ad07b710e0a53ffc041898;
    stim[35] = 102'h159b0f4034ed50c138151c616c;
    stim[36] = 102'h07b6ec48a3761041a5e8bc60dc;
    stim[37] = 102'h13d166cac5c492cf02e15d49da;
    stim[38] = 102'h1ab977a9108c60ed365b2c57a6;
    stim[39] = 102'h0c2eb72dfd9934d890ba12c3ce;
    stim[40] = 102'h1fd5b87d508693e1224d27bcb7;
    stim[41] = 102'h1a9910008ee445d7867f2423ab;
    stim[42] = 102'h1898b169d8c5ed16dd72f7535e;
    stim[43] = 102'h1b95bdf16809da86f5fb66b807;
    stim[44] = 102'h0056b7a0072e330456f4fd7386;
    stim[45] = 102'h03cbd19c241075f917e44de79f;
    stim[46] = 102'h12589b5f4293d6e6fdeb22a340;
    stim[47] = 102'h0a9e5c0943dc89c3e5ce32715f;
    stim[48] = 102'h0b0fd93e461a9dd2f2d17b5f7c;
    stim[49] = 102'h1f9c22caaba8151376cbcf14e8;
    stim[50] = 102'h1cae223feed9da9ce9d54c5e69;
    stim[51] = 102'h087055a8ba169f3f88a224e71a;
    stim[52] = 102'h0898d9958ac1fbf27eec6745b6;
    stim[53] = 102'h17f14ca3ddfec2704e46cbf3fd;
    stim[54] = 102'h11f2e7721b3590c46ad3012429;
    stim[55] = 102'h0451f1156053af329e11da7e62;
    stim[56] = 102'h02fd77f7a9e45115f12d1e9f0f;
    stim[57] = 102'h0e305d54291f303c20c6530de4;
    stim[58] = 102'h0c595eeb94e1a83f5bee0f93d8;
    stim[59] = 102'h0f6fbb11648d899caed8794a85;
    stim[60] = 102'h17be811f2adbd20a30acc38005;
    stim[61] = 102'h00a4de29c1a4f3888e2e917668;
    stim[62] = 102'h0688cb834430c93bd4ff2023a6;
    stim[63] = 102'h176216fb1a17cb69ad42f2f503;
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
      expv[0] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 128'h897e7e834dc5ac322cxxxxxxxx27c1f3;
      expv[2] = 128'h463b109151633b0eaa40000000000000;
      expv[3] = 128'h80000000000000000000000000000000;
      expv[4] = 128'h00000000000000000000000000000000;
      expv[5] = 128'h00000000000000000000000000000000;
      expv[6] = 128'h00000000000000000000000000000000;
      expv[7] = 128'h00000000000000000000000000000000;
      expv[8] = 128'h00000000000000000000000000000000;
      expv[9] = 128'h00000000000000000000000000000000;
      expv[10] = 128'h00000000000000000000000000000000;
      expv[11] = 128'h00000000000000000000000000000000;
      expv[12] = 128'h00000000000000000000000000000000;
      expv[13] = 128'h00000000000000000000000000000000;
      expv[14] = 128'h00000000000000000000000000000000;
      expv[15] = 128'h00000000000000000000000000000000;
      expv[16] = 128'h80000000000000000000000000000000;
      expv[17] = 128'h00000000000000000000000000000000;
      expv[18] = 128'h80000000000000000000000000000000;
      expv[19] = 128'h00000000000000000000000000000000;
      expv[20] = 128'h00000000000000000000000000000000;
      expv[21] = 128'h00000000000000000000000000000000;
      expv[22] = 128'h00000000000000000000000000000000;
      expv[23] = 128'h80000000000000000000000000000000;
      expv[24] = 128'h80000000000000000000000000000000;
      expv[25] = 128'h3f36e6175e204276bd200000014f2f26;
      expv[26] = 128'h80000000000000000000000000000000;
      expv[27] = 128'h00000000000000000000000000000000;
      expv[28] = 128'h00000000000000000000000000000000;
      expv[29] = 128'h80000000000000000000000000000000;
      expv[30] = 128'h00000000000000000000000000000000;
      expv[31] = 128'h00000000000000000000000000000000;
      expv[32] = 128'h80000000000000000000000000000000;
      expv[33] = 128'h00000000000000000000000000000000;
      expv[34] = 128'h00000000000000000000000000000000;
      expv[35] = 128'h00000000000000000000000000000000;
      expv[36] = 128'h00000000000000000000000000000000;
      expv[37] = 128'h00000000000000000000000000000000;
      expv[38] = 128'h00000000000000000000000000000000;
      expv[39] = 128'h00000000000000000000000000000000;
      expv[40] = 128'h80000000000000000000000000000000;
      expv[41] = 128'h80000000000000000000000000000000;
      expv[42] = 128'h00000000000000000000000000000000;
      expv[43] = 128'h80000000000000000000000000000000;
      expv[44] = 128'h00000000000000000000000000000000;
      expv[45] = 128'h80000000000000000000000000000000;
      expv[46] = 128'h00000000000000000000000000000000;
      expv[47] = 128'h80000000000000000000000000000000;
      expv[48] = 128'h00000000000000000000000000000000;
      expv[49] = 128'h00000000000000000000000000000000;
      expv[50] = 128'h80000000000000000000000000000000;
      expv[51] = 128'h00000000000000000000000000000000;
      expv[52] = 128'h00000000000000000000000000000000;
      expv[53] = 128'h80000000000000000000000000000000;
      expv[54] = 128'h80000000000000000000000000000000;
      expv[55] = 128'h00000000000000000000000000000000;
      expv[56] = 128'h80000000000000000000000000000000;
      expv[57] = 128'h00000000000000000000000000000000;
      expv[58] = 128'h00000000000000000000000000000000;
      expv[59] = 128'h80000000000000000000000000000000;
      expv[60] = 128'h80000000000000000000000000000000;
      expv[61] = 128'h00000000000000000000000000000000;
      expv[62] = 128'h00000000000000000000000000000000;
      expv[63] = 128'h80000000000000000000000000000000;
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
