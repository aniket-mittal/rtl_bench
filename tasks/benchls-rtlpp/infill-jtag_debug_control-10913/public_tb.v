// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10913 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[50:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h2e915877c0d;
    stim[1] = 42'h24299b132be;
    stim[2] = 42'h3cc1c18317b;
    stim[3] = 42'h2d73384a534;
    stim[4] = 42'h36f0fe619cd;
    stim[5] = 42'h2f7926cf46c;
    stim[6] = 42'h3f7ea3a0702;
    stim[7] = 42'h01ba7c04914;
    stim[8] = 42'h35c8226bc05;
    stim[9] = 42'h04699c79272;
    stim[10] = 42'h2f49641558b;
    stim[11] = 42'h04159194929;
    stim[12] = 42'h35bd0a80519;
    stim[13] = 42'h289c89396d8;
    stim[14] = 42'h0cc600d12a7;
    stim[15] = 42'h300aa13ec66;
    stim[16] = 42'h3fab7658541;
    stim[17] = 42'h02fa9e6c950;
    stim[18] = 42'h22e8074cbf4;
    stim[19] = 42'h28dc1655bf8;
    stim[20] = 42'h1ab3eb900cf;
    stim[21] = 42'h3426d3ddd15;
    stim[22] = 42'h1574c305c3c;
    stim[23] = 42'h255941169c8;
    stim[24] = 42'h3fe8c3b2a4e;
    stim[25] = 42'h1ce79d2865f;
    stim[26] = 42'h001afe36622;
    stim[27] = 42'h155fd8b64c8;
    stim[28] = 42'h314a29ed678;
    stim[29] = 42'h004c415d544;
    stim[30] = 42'h3acea8c5188;
    stim[31] = 42'h29201b02be7;
    stim[32] = 42'h3840a691252;
    stim[33] = 42'h034928450d9;
    stim[34] = 42'h3fe0f6c1def;
    stim[35] = 42'h2dca531579e;
    stim[36] = 42'h08a7d2fbe44;
    stim[37] = 42'h0980d5d765f;
    stim[38] = 42'h05377132550;
    stim[39] = 42'h08a1300a819;
    stim[40] = 42'h0f9c7795b01;
    stim[41] = 42'h0738410f910;
    stim[42] = 42'h0e2d5afc6ac;
    stim[43] = 42'h3a4169ff692;
    stim[44] = 42'h2807281fc79;
    stim[45] = 42'h18df0b3a63f;
    stim[46] = 42'h0590f0151ef;
    stim[47] = 42'h17618c7fb60;
    stim[48] = 42'h169a054a0ba;
    stim[49] = 42'h1301bd4c17e;
    stim[50] = 42'h0e80703a2bb;
    stim[51] = 42'h33991ada0c7;
    stim[52] = 42'h23fc41c49c3;
    stim[53] = 42'h1c5df8d3aa6;
    stim[54] = 42'h39a5dc72eca;
    stim[55] = 42'h2180ee5f5fd;
    stim[56] = 42'h173a1e8c2ce;
    stim[57] = 42'h01ba2ab4e98;
    stim[58] = 42'h23e657761ec;
    stim[59] = 42'h05476008a9a;
    stim[60] = 42'h2d7df31b146;
    stim[61] = 42'h1f7d0d1fb8a;
    stim[62] = 42'h36cc9a725b7;
    stim[63] = 42'h3c68ab6dce0;
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
      expv[0] = 51'hxxxxxxxxxxxxx;
      expv[1] = 51'hxxxxxxxxxxxxx;
      expv[2] = 51'hxxxxxxxxxxxxx;
      expv[3] = 51'hxxxxxxxxxx000;
      expv[4] = 51'h6b99c2529axx0;
      expv[5] = 51'h6b99c2529a000;
      expv[6] = 51'h6b99c2529a000;
      expv[7] = 51'h6b99c2529a000;
      expv[8] = 51'h6b99c2529a000;
      expv[9] = 51'h2e41135e02080;
      expv[10] = 51'h2e41135e02000;
      expv[11] = 51'h2e41135e02000;
      expv[12] = 51'h20ac8ca494008;
      expv[13] = 51'h20ac8ca494000;
      expv[14] = 51'h20ac8ca494000;
      expv[15] = 51'h20ac8ca494000;
      expv[16] = 51'h20ac8ca494000;
      expv[17] = 51'h7d5bb2c2a0000;
      expv[18] = 51'h7d5bb2c2a0000;
      expv[19] = 51'h7d5bb2c2a0000;
      expv[20] = 51'h7d5bb2c2a0000;
      expv[21] = 51'h7d5bb2c2a0000;
      expv[22] = 51'h7d5bb2c2a0000;
      expv[23] = 51'h2ba6182e1e040;
      expv[24] = 51'h2ba6182e1e000;
      expv[25] = 51'h2ba6182e1e000;
      expv[26] = 51'h2ba6182e1e000;
      expv[27] = 51'h00d7f1b310001;
      expv[28] = 51'h00d7f1b310000;
      expv[29] = 51'h00d7f1b310000;
      expv[30] = 51'h00d7f1b310000;
      expv[31] = 51'h00d7f1b310000;
      expv[32] = 51'h00d7f1b310000;
      expv[33] = 51'h00d7f1b310000;
      expv[34] = 51'h1a4942286c100;
      expv[35] = 51'h1a4942286c000;
      expv[36] = 51'h1a4942286c000;
      expv[37] = 51'h453e97df23000;
      expv[38] = 51'h453e97df22000;
      expv[39] = 51'h453e97df22000;
      expv[40] = 51'h450980540c002;
      expv[41] = 51'h450980540c000;
      expv[42] = 51'h450980540c000;
      expv[43] = 51'h450980540c000;
      expv[44] = 51'h450980540c000;
      expv[45] = 51'h450980540c000;
      expv[46] = 51'h46f859d31e002;
      expv[47] = 51'h46f859d31e000;
      expv[48] = 51'h3b0c63fdb0100;
      expv[49] = 51'h3b0c63fdb0000;
      expv[50] = 51'h3b0c63fdb0000;
      expv[51] = 51'h740381d15c100;
      expv[52] = 51'h740381d15c000;
      expv[53] = 51'h740381d15c000;
      expv[54] = 51'h740381d15c000;
      expv[55] = 51'h740381d15c000;
      expv[56] = 51'h740381d15c000;
      expv[57] = 51'h740381d15c000;
      expv[58] = 51'h740381d15c000;
      expv[59] = 51'h1f32bbb0f6100;
      expv[60] = 51'h1f32bbb0f6000;
      expv[61] = 51'h1f32bbb0f6000;
      expv[62] = 51'h7be868fdc4100;
      expv[63] = 51'h7be868fdc4000;
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
