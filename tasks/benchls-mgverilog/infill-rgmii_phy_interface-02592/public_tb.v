// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02592 dut (
    .reset(in_vec[22:22]),
    .generated_clk(in_vec[21:21]),
    .phy_rxd_rising(in_vec[20:17]),
    .phy_rxd_falling(in_vec[16:13]),
    .phy_rx_ctl_rising(in_vec[12:12]),
    .phy_rx_ctl_falling(in_vec[11:11]),
    .phy_rx_clk(in_vec[10:10]),
    .mac_tx_er(in_vec[9:9]),
    .mac_txd(in_vec[8:1]),
    .mac_tx_en(in_vec[0:0]),
    .phy_txd_rising(out_vec[24:21]),
    .phy_txd_falling(out_vec[20:17]),
    .phy_tx_ctl_rising(out_vec[16:16]),
    .phy_tx_ctl_falling(out_vec[15:15]),
    .phy_gtx_clk(out_vec[14:14]),
    .mac_tx_clk(out_vec[13:13]),
    .mac_col(out_vec[12:12]),
    .mac_rxd(out_vec[11:4]),
    .mac_rx_er(out_vec[3:3]),
    .mac_rx_clk(out_vec[2:2]),
    .mac_crs(out_vec[1:1]),
    .mac_rx_dv(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h6c24e2;
    stim[1] = 23'h5474b3;
    stim[2] = 23'h0e3d6b;
    stim[3] = 23'h1f3691;
    stim[4] = 23'h21650f;
    stim[5] = 23'h1e1301;
    stim[6] = 23'h29d2e0;
    stim[7] = 23'h3f4820;
    stim[8] = 23'h34f159;
    stim[9] = 23'h201b24;
    stim[10] = 23'h0203f9;
    stim[11] = 23'h179629;
    stim[12] = 23'h3a0dc9;
    stim[13] = 23'h2f5401;
    stim[14] = 23'h36ff0d;
    stim[15] = 23'h3c44cc;
    stim[16] = 23'h15cc3c;
    stim[17] = 23'h3d1736;
    stim[18] = 23'h22d656;
    stim[19] = 23'h2f017b;
    stim[20] = 23'h0ec819;
    stim[21] = 23'h0006a8;
    stim[22] = 23'h3e5fe2;
    stim[23] = 23'h2ccff6;
    stim[24] = 23'h29b8a0;
    stim[25] = 23'h0d81a8;
    stim[26] = 23'h0bdde6;
    stim[27] = 23'h30662b;
    stim[28] = 23'h0353d2;
    stim[29] = 23'h366be5;
    stim[30] = 23'h2a58a4;
    stim[31] = 23'h38ad68;
    stim[32] = 23'h007a79;
    stim[33] = 23'h1ccf5a;
    stim[34] = 23'h359648;
    stim[35] = 23'h170967;
    stim[36] = 23'h042a98;
    stim[37] = 23'h0afaa8;
    stim[38] = 23'h0c7138;
    stim[39] = 23'h1b5c02;
    stim[40] = 23'h2ee542;
    stim[41] = 23'h0ca572;
    stim[42] = 23'h19ed5e;
    stim[43] = 23'h34de25;
    stim[44] = 23'h031c44;
    stim[45] = 23'h1b3ac1;
    stim[46] = 23'h1ab0ed;
    stim[47] = 23'h339228;
    stim[48] = 23'h0dcd27;
    stim[49] = 23'h28a88d;
    stim[50] = 23'h1cea64;
    stim[51] = 23'h39c8ec;
    stim[52] = 23'h30b125;
    stim[53] = 23'h29e35d;
    stim[54] = 23'h0cac66;
    stim[55] = 23'h1e90f1;
    stim[56] = 23'h217438;
    stim[57] = 23'h273cb4;
    stim[58] = 23'h12968c;
    stim[59] = 23'h2f249f;
    stim[60] = 23'h117730;
    stim[61] = 23'h2c2529;
    stim[62] = 23'h12c154;
    stim[63] = 23'h005a4a;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 25'h02e6164;
      expv[1] = 25'h12b93af;
      expv[2] = 25'h0b79177;
      expv[3] = 25'h10919ff;
      expv[4] = 25'h0f1eb04;
      expv[5] = 25'h01110fb;
      expv[6] = 25'h00eee4b;
      expv[7] = 25'h0026af8;
      expv[8] = 25'h195f7ab;
      expv[9] = 25'h052e003;
      expv[10] = 25'h19f0010;
      expv[11] = 25'h0831cbf;
      expv[12] = 25'h09de0dc;
      expv[13] = 25'h001fa7f;
      expv[14] = 25'h0d177b7;
      expv[15] = 25'h0cc62e4;
      expv[16] = 25'h1c20eac;
      expv[17] = 25'h172e8ef;
      expv[18] = 25'h164e61f;
      expv[19] = 25'h1b7e870;
      expv[20] = 25'h1818678;
      expv[21] = 25'h08a8004;
      expv[22] = 25'h03ee2f7;
      expv[23] = 25'h17ee66c;
      expv[24] = 25'h00a6d43;
      expv[25] = 25'h09a0c60;
      expv[26] = 25'h07e0e57;
      expv[27] = 25'h0a36384;
      expv[28] = 25'h13c8a1b;
      expv[29] = 25'h05f63b8;
      expv[30] = 25'h04a6253;
      expv[31] = 25'h09665cc;
      expv[32] = 25'h1871303;
      expv[33] = 25'h1b486ec;
      expv[34] = 25'h084ecaf;
      expv[35] = 25'h07788b8;
      expv[36] = 25'h1888128;
      expv[37] = 25'h08a8753;
      expv[38] = 25'h192036b;
      expv[39] = 25'h0200ad7;
      expv[40] = 25'h0346774;
      expv[41] = 25'h1360564;
      expv[42] = 25'h1f40fcc;
      expv[43] = 25'h04376a7;
      expv[44] = 25'h0440817;
      expv[45] = 25'h00d19d3;
      expv[46] = 25'h0cf95db;
      expv[47] = 25'h082ec9b;
      expv[48] = 25'h0738e6c;
      expv[49] = 25'h0c9e548;
      expv[50] = 25'h04687e8;
      expv[51] = 25'h0ce6ec8;
      expv[52] = 25'h053f58b;
      expv[53] = 25'h1d56f40;
      expv[54] = 25'h066056c;
      expv[55] = 25'h10f94fb;
      expv[56] = 25'h1826b0f;
      expv[57] = 25'h14a6937;
      expv[58] = 25'h0c8849f;
      expv[59] = 25'h1e9e974;
      expv[60] = 25'h1128b8f;
      expv[61] = 25'h093e164;
      expv[62] = 25'h1540690;
      expv[63] = 25'h0a48203;
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
