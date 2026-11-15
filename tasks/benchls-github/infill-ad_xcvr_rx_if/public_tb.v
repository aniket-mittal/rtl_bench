// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ad_xcvr_rx_if dut (
    .rx_clk(clk),
    .rx_ip_sof(in_vec[35:32]),
    .rx_ip_data(in_vec[31:0]),
    .rx_sof(out_vec[32:32]),
    .rx_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h6b5d5106b;
    stim[1] = 36'h201a9a601;
    stim[2] = 36'h756aa6cd2;
    stim[3] = 36'h72bf1a55a;
    stim[4] = 36'hc7e46b21b;
    stim[5] = 36'hdab3b6f4d;
    stim[6] = 36'h87c067137;
    stim[7] = 36'h179dcc9e0;
    stim[8] = 36'h7b3d976f5;
    stim[9] = 36'h5c3d4420e;
    stim[10] = 36'h36c39fc75;
    stim[11] = 36'h7e525865d;
    stim[12] = 36'h352842d06;
    stim[13] = 36'hccf5051c4;
    stim[14] = 36'hf8ed27006;
    stim[15] = 36'h2eaa07168;
    stim[16] = 36'h29e4ac16f;
    stim[17] = 36'he84927b59;
    stim[18] = 36'hfca58cb62;
    stim[19] = 36'h1d38fa222;
    stim[20] = 36'h305699c57;
    stim[21] = 36'h1b34c00ab;
    stim[22] = 36'h12376fea1;
    stim[23] = 36'h29d3380ae;
    stim[24] = 36'hf01cc2464;
    stim[25] = 36'hd295cead8;
    stim[26] = 36'h87368c4e3;
    stim[27] = 36'h3973eaa35;
    stim[28] = 36'hf364d06be;
    stim[29] = 36'he61b6c79a;
    stim[30] = 36'hd466e18de;
    stim[31] = 36'h0e4471596;
    stim[32] = 36'h9954b7a00;
    stim[33] = 36'hd185c2e29;
    stim[34] = 36'h6c888bc1e;
    stim[35] = 36'ha2cd77b94;
    stim[36] = 36'haaf892ee8;
    stim[37] = 36'h79b201132;
    stim[38] = 36'hc52686a59;
    stim[39] = 36'h13e52bfbd;
    stim[40] = 36'h81330cf71;
    stim[41] = 36'hdd9511564;
    stim[42] = 36'h4a5a40a50;
    stim[43] = 36'hfe81e9f2d;
    stim[44] = 36'h150665ac4;
    stim[45] = 36'h14d2c2eb5;
    stim[46] = 36'h8db9329e1;
    stim[47] = 36'h833cff014;
    stim[48] = 36'h1a952b6ef;
    stim[49] = 36'h89b42d5a5;
    stim[50] = 36'he994d284d;
    stim[51] = 36'h486bc3232;
    stim[52] = 36'h41202ec6c;
    stim[53] = 36'h517052c06;
    stim[54] = 36'h425de7639;
    stim[55] = 36'h187dde307;
    stim[56] = 36'h3333848b6;
    stim[57] = 36'h92f40bfa7;
    stim[58] = 36'hd559b78f9;
    stim[59] = 36'h392e1030b;
    stim[60] = 36'h663d6dc19;
    stim[61] = 36'hc92d8cb77;
    stim[62] = 36'h8c6a7d569;
    stim[63] = 36'h30379faf7;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'h0xxxxxxxx;
      expv[2] = 33'h101b5d510;
      expv[3] = 33'h1d201a9a6;
      expv[4] = 33'h12bf1a55a;
      expv[5] = 33'h17e46b21b;
      expv[6] = 33'h16f4d7e46;
      expv[7] = 33'h17c067137;
      expv[8] = 33'h1dcc9e07c;
      expv[9] = 33'h1b3d976f5;
      expv[10] = 33'h1c3d4420e;
      expv[11] = 33'h16c39fc75;
      expv[12] = 33'h1e525865d;
      expv[13] = 33'h152842d06;
      expv[14] = 33'h1cf5051c4;
      expv[15] = 33'h17006cf50;
      expv[16] = 33'h1eaa07168;
      expv[17] = 33'h16feaa071;
      expv[18] = 33'h1599e4ac1;
      expv[19] = 33'h16284927b;
      expv[20] = 33'h1d38fa222;
      expv[21] = 33'h105699c57;
      expv[22] = 33'h1b34c00ab;
      expv[23] = 33'h12376fea1;
      expv[24] = 33'h19d3380ae;
      expv[25] = 33'h1649d3380;
      expv[26] = 33'h1295cead8;
      expv[27] = 33'h17368c4e3;
      expv[28] = 33'h13eaa3573;
      expv[29] = 33'h1364d06be;
      expv[30] = 33'h161b6c79a;
      expv[31] = 33'h1de61b6c7;
      expv[32] = 33'h1e4471596;
      expv[33] = 33'h0954b7a00;
      expv[34] = 33'h1185c2e29;
      expv[35] = 33'h1c888bc1e;
      expv[36] = 33'h194c888bc;
      expv[37] = 33'h1e82cd77b;
      expv[38] = 33'h132af892e;
      expv[39] = 33'h152686a59;
      expv[40] = 33'h1bfbd5268;
      expv[41] = 33'h11330cf71;
      expv[42] = 33'h151156413;
      expv[43] = 33'h1a5a40a50;
      expv[44] = 33'h19f2da5a4;
      expv[45] = 33'h150665ac4;
      expv[46] = 33'h14d2c2eb5;
      expv[47] = 33'h1db9329e1;
      expv[48] = 33'h1cff014db;
      expv[49] = 33'h152b6ef33;
      expv[50] = 33'h19b42d5a5;
      expv[51] = 33'h14d284d9b;
      expv[52] = 33'h132994d28;
      expv[53] = 33'h1ec6c86bc;
      expv[54] = 33'h12c061202;
      expv[55] = 33'h125de7639;
      expv[56] = 33'h1e30725de;
      expv[57] = 33'h1333848b6;
      expv[58] = 33'h12f40bfa7;
      expv[59] = 33'h1559b78f9;
      expv[60] = 33'h192e1030b;
      expv[61] = 33'h163d6dc19;
      expv[62] = 33'h17763d6dc;
      expv[63] = 33'h1d56992d8;
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
