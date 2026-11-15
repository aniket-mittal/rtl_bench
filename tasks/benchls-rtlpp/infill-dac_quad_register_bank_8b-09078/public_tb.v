// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09078 dut (
    .clk_i(clk),
    .rstn_i(in_vec[66:66]),
    .sys_addr(in_vec[65:34]),
    .sys_wdata(in_vec[33:2]),
    .sys_wen(in_vec[1:1]),
    .sys_ren(in_vec[0:0]),
    .dac_a_o(out_vec[65:58]),
    .dac_b_o(out_vec[57:50]),
    .dac_c_o(out_vec[49:42]),
    .dac_d_o(out_vec[41:34]),
    .sys_rdata(out_vec[33:2]),
    .sys_err(out_vec[1:1]),
    .sys_ack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h7bb9d5a8d62ddcddc;
    stim[1] = 67'h711d57ede80794766;
    stim[2] = 67'h04bba3022ca76a855;
    stim[3] = 67'h04059d183aafc8da4;
    stim[4] = 67'h4611a3a9b4f55ef5f;
    stim[5] = 67'h2133abf96b13ba9ab;
    stim[6] = 67'h32f48423170c3e3ab;
    stim[7] = 67'h35e3df756a80f55e8;
    stim[8] = 67'h03f36bd16df8c9e56;
    stim[9] = 67'h3fdfa1ddc8c78870c;
    stim[10] = 67'h1d6b4ce5785407c69;
    stim[11] = 67'h259a20ee90fb9ef7f;
    stim[12] = 67'h21b8fe927ab448cab;
    stim[13] = 67'h58a6a8d2aed773155;
    stim[14] = 67'h3099a7601f1649055;
    stim[15] = 67'h23175034e5850dc94;
    stim[16] = 67'h309b1fcfd3d827fa6;
    stim[17] = 67'h0b5d43a7640ccfdb6;
    stim[18] = 67'h132531e39cb4aea6a;
    stim[19] = 67'h1180b8d32f62fdc67;
    stim[20] = 67'h31838ae1b7f5ca575;
    stim[21] = 67'h07b66db7509a0fb49;
    stim[22] = 67'h0ae242655cb1e9ed2;
    stim[23] = 67'h0e9949ad8aac73afa;
    stim[24] = 67'h1136243dff8268818;
    stim[25] = 67'h0385776fbd81b86c9;
    stim[26] = 67'h116b4c884a07fb9ac;
    stim[27] = 67'h3dde58139467ddddd;
    stim[28] = 67'h0e7f9783c38601619;
    stim[29] = 67'h36c760677ad854dcf;
    stim[30] = 67'h0548e244826f13a85;
    stim[31] = 67'h14e3ae59ae3cfa066;
    stim[32] = 67'h075a226cffee1343b;
    stim[33] = 67'h3923f633741f294b3;
    stim[34] = 67'h1c8ec4d148d8e0a69;
    stim[35] = 67'h08522c2a0b82512ed;
    stim[36] = 67'h25c8fa6a1d155d6a9;
    stim[37] = 67'h17dce5834057b0ff3;
    stim[38] = 67'h21b97b1a87ee57f38;
    stim[39] = 67'h396040beda182d46d;
    stim[40] = 67'h167306f1b592b1b17;
    stim[41] = 67'h16366f4b4de6f6a47;
    stim[42] = 67'h2ecb8837afde115b8;
    stim[43] = 67'h19380ccf677d84811;
    stim[44] = 67'h1597ac706c2986027;
    stim[45] = 67'h2e9159a3dc706a79e;
    stim[46] = 67'h048ce811896136ea9;
    stim[47] = 67'h216888bc1e836c43b;
    stim[48] = 67'h0c52c1e0f8843500e;
    stim[49] = 67'h201fd3c8960658df7;
    stim[50] = 67'h3362b5d5a2c504085;
    stim[51] = 67'h370fb311c98f02c9d;
    stim[52] = 67'h231e24b45389577fd;
    stim[53] = 67'h344040a447382bbf8;
    stim[54] = 67'h18326d6a1b550b306;
    stim[55] = 67'h164d29daf5c65569d;
    stim[56] = 67'h2103dc680e81012ab;
    stim[57] = 67'h0beef3b1d7a768676;
    stim[58] = 67'h06ddd940b6ff3bc79;
    stim[59] = 67'h2a9261812c39fefa5;
    stim[60] = 67'h2b9dfc48794b5e00f;
    stim[61] = 67'h1bf39b8af410245a3;
    stim[62] = 67'h09ced709a80f356db;
    stim[63] = 67'h0e6cb30e8a70f63ba;
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
      expv[0] = 66'hxxxxxxxxxxxxxxxxx;
      expv[1] = 66'hxxxxxxxxx00000000;
      expv[2] = 66'hxxxxxxxxx00000001;
      expv[3] = 66'h03d39d67000000000;
      expv[4] = 66'h03d39d67000000000;
      expv[5] = 66'h03d39d67000000001;
      expv[6] = 66'h03d39d67000000000;
      expv[7] = 66'h03d39d67000000000;
      expv[8] = 66'h03d39d67000000000;
      expv[9] = 66'h03d39d67000000000;
      expv[10] = 66'h03d39d67000000000;
      expv[11] = 66'h03d39d67000000000;
      expv[12] = 66'h03d39d67000000000;
      expv[13] = 66'h03d39d67000000000;
      expv[14] = 66'h03d39d67000000001;
      expv[15] = 66'h03d39d67000000000;
      expv[16] = 66'h03d39d67000000000;
      expv[17] = 66'h03d39d67000000000;
      expv[18] = 66'h03d39d67000000000;
      expv[19] = 66'h03d39d67000000000;
      expv[20] = 66'h03d39d67000000000;
      expv[21] = 66'h03d39d67000000000;
      expv[22] = 66'h03d39d67000000000;
      expv[23] = 66'h03d39d67000000000;
      expv[24] = 66'h03d39d67000000000;
      expv[25] = 66'h03d39d67000000000;
      expv[26] = 66'h03d39d67000000000;
      expv[27] = 66'h03d39d67000000000;
      expv[28] = 66'h03d39d67000000000;
      expv[29] = 66'h03d39d67000000000;
      expv[30] = 66'h03d39d67000000000;
      expv[31] = 66'h03d39d67000000000;
      expv[32] = 66'h03d39d67000000000;
      expv[33] = 66'h03d39d67000000000;
      expv[34] = 66'h03d39d67000000000;
      expv[35] = 66'h03d39d67000000000;
      expv[36] = 66'h03d39d67000000000;
      expv[37] = 66'h03d39d67000000000;
      expv[38] = 66'h03d39d67000000000;
      expv[39] = 66'h03d39d67000000000;
      expv[40] = 66'h03d39d67000000000;
      expv[41] = 66'h03d39d67000000000;
      expv[42] = 66'h03d39d67000000000;
      expv[43] = 66'h03d39d67000000000;
      expv[44] = 66'h03d39d67000000000;
      expv[45] = 66'h03d39d67000000000;
      expv[46] = 66'h03d39d67000000000;
      expv[47] = 66'h03d39d67000000000;
      expv[48] = 66'h03d39d67000000000;
      expv[49] = 66'h03d39d67000000000;
      expv[50] = 66'h03d39d67000000000;
      expv[51] = 66'h03d39d67000000000;
      expv[52] = 66'h03d39d67000000000;
      expv[53] = 66'h03d39d67000000000;
      expv[54] = 66'h03d39d67000000000;
      expv[55] = 66'h03d39d67000000000;
      expv[56] = 66'h03d39d67000000000;
      expv[57] = 66'h03d39d67000000000;
      expv[58] = 66'h03d39d67000000000;
      expv[59] = 66'h03d39d67000000000;
      expv[60] = 66'h03d39d67000000000;
      expv[61] = 66'h03d39d67000000000;
      expv[62] = 66'h03d39d67000000000;
      expv[63] = 66'h03d39d67000000000;
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
