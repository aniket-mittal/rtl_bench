// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 44;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04860 dut (
    .clk(clk),
    .gmii_tx_d(in_vec[43:36]),
    .gmii_tx_en(in_vec[35:35]),
    .gmii_tx_err(in_vec[34:34]),
    .reset_tx_clk(in_vec[33:33]),
    .reset_rx_clk(in_vec[32:32]),
    .address(in_vec[31:27]),
    .read(in_vec[26:26]),
    .writedata(in_vec[25:10]),
    .write(in_vec[9:9]),
    .reset(in_vec[8:8]),
    .rxp(in_vec[7:7]),
    .ref_clk(in_vec[6:6]),
    .reconfig_clk(in_vec[5:5]),
    .reconfig_togxb(in_vec[4:1]),
    .gxb_cal_blk_clk(in_vec[0:0]),
    .gmii_rx_d(out_vec[50:43]),
    .gmii_rx_dv(out_vec[42:42]),
    .gmii_rx_err(out_vec[41:41]),
    .tx_clk(out_vec[40:40]),
    .rx_clk(out_vec[39:39]),
    .readdata(out_vec[38:23]),
    .waitrequest(out_vec[22:22]),
    .txp(out_vec[21:21]),
    .reconfig_fromgxb(out_vec[20:4]),
    .led_an(out_vec[3:3]),
    .led_disp_err(out_vec[2:2]),
    .led_char_err(out_vec[1:1]),
    .led_link(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 44'h56e7460c1de;
    stim[1] = 44'h2d9a33be3ae;
    stim[2] = 44'h47649f73eef;
    stim[3] = 44'hec5c82f8007;
    stim[4] = 44'hae2bede08d5;
    stim[5] = 44'h5754788ba74;
    stim[6] = 44'h4e89095faf5;
    stim[7] = 44'h4cb6db1c807;
    stim[8] = 44'h310da0a523b;
    stim[9] = 44'h8620615ca53;
    stim[10] = 44'h304250a969d;
    stim[11] = 44'he961b0ff07e;
    stim[12] = 44'he9ffd0f1e11;
    stim[13] = 44'h5b0a63ae471;
    stim[14] = 44'hfefaccbda24;
    stim[15] = 44'h1097eeb00f7;
    stim[16] = 44'had522a744d7;
    stim[17] = 44'hf67027e180e;
    stim[18] = 44'hc0b368c4e22;
    stim[19] = 44'h45853487c64;
    stim[20] = 44'h41eb2530230;
    stim[21] = 44'hc9a3562b017;
    stim[22] = 44'h495fcc0f4a7;
    stim[23] = 44'hd4425a2206b;
    stim[24] = 44'hc08511e9292;
    stim[25] = 44'h1576c81565c;
    stim[26] = 44'h9bd8ad2ecff;
    stim[27] = 44'h27420c680c7;
    stim[28] = 44'hef8f17be8f7;
    stim[29] = 44'h370f8e57072;
    stim[30] = 44'hb626800c02c;
    stim[31] = 44'hd6b2790d6c6;
    stim[32] = 44'h49b722c8662;
    stim[33] = 44'hc59cf63b230;
    stim[34] = 44'hdd3d8a88c4d;
    stim[35] = 44'h3f90d7c1838;
    stim[36] = 44'hb4a38cea4c1;
    stim[37] = 44'h39f8bbd020e;
    stim[38] = 44'ha552e20f662;
    stim[39] = 44'ha6f4ff04ed7;
    stim[40] = 44'hc9c47716471;
    stim[41] = 44'hf5607c0e824;
    stim[42] = 44'h653feef3816;
    stim[43] = 44'ha98fcaf5a27;
    stim[44] = 44'h7ad9025a23e;
    stim[45] = 44'h9c79f10f778;
    stim[46] = 44'hcd8dd3dac11;
    stim[47] = 44'hd77d6b98e26;
    stim[48] = 44'h847bffc02fa;
    stim[49] = 44'h6684d622af0;
    stim[50] = 44'h2ad9d1a9ce3;
    stim[51] = 44'hace5beee4c5;
    stim[52] = 44'h4fb4e779811;
    stim[53] = 44'h29af5bd78ed;
    stim[54] = 44'hdda1425c247;
    stim[55] = 44'heaa57ab188c;
    stim[56] = 44'h8c8127aec1e;
    stim[57] = 44'h76979d430a7;
    stim[58] = 44'h5997a464836;
    stim[59] = 44'h496bbdd9240;
    stim[60] = 44'hfe58105bc55;
    stim[61] = 44'h85d7ce57276;
    stim[62] = 44'h32b528225a3;
    stim[63] = 44'h7a6fa7daef3;
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
      expv[0] = 51'h0000000000000;
      expv[1] = 51'h0000000000000;
      expv[2] = 51'h0000000000000;
      expv[3] = 51'h23b800020000f;
      expv[4] = 51'h7620000000000;
      expv[5] = 51'h571800020000f;
      expv[6] = 51'h2ba0000000000;
      expv[7] = 51'h275800020000f;
      expv[8] = 51'h2640000000000;
      expv[9] = 51'h189800020000f;
      expv[10] = 51'h4300000000000;
      expv[11] = 51'h183800020000f;
      expv[12] = 51'h74a0000000000;
      expv[13] = 51'h74f800020000f;
      expv[14] = 51'h2d80000000000;
      expv[15] = 51'h7f7800020000f;
      expv[16] = 51'h0840000000000;
      expv[17] = 51'h56b800020000f;
      expv[18] = 51'h7b20000000000;
      expv[19] = 51'h605800020000f;
      expv[20] = 51'h22c0000000000;
      expv[21] = 51'h20f800020000f;
      expv[22] = 51'h64c0000000000;
      expv[23] = 51'h24b800020000f;
      expv[24] = 51'h6a20000000000;
      expv[25] = 51'h605800020000f;
      expv[26] = 51'h0aa0000000000;
      expv[27] = 51'h4df800020000f;
      expv[28] = 51'h13a0000000000;
      expv[29] = 51'h77d800020000f;
      expv[30] = 51'h1b80000000000;
      expv[31] = 51'h5b1800020000f;
      expv[32] = 51'h6b40000000000;
      expv[33] = 51'h24d800020000f;
      expv[34] = 51'h62c0000000000;
      expv[35] = 51'h6e9800020000f;
      expv[36] = 51'h1fc0000000000;
      expv[37] = 51'h5a5800020000f;
      expv[38] = 51'h1ce0000000000;
      expv[39] = 51'h52b800020000f;
      expv[40] = 51'h5360000000000;
      expv[41] = 51'h64f800020000f;
      expv[42] = 51'h7aa0000000000;
      expv[43] = 51'h329800020000f;
      expv[44] = 51'h54c0000000000;
      expv[45] = 51'h0000000000000;
      expv[46] = 51'h0000000000000;
      expv[47] = 51'h66d800020000f;
      expv[48] = 51'h6ba0000000000;
      expv[49] = 51'h423800020000f;
      expv[50] = 51'h3340000000000;
      expv[51] = 51'h157800020000f;
      expv[52] = 51'h5660000000000;
      expv[53] = 51'h27d800020000f;
      expv[54] = 51'h14c0000000000;
      expv[55] = 51'h6ed800020000f;
      expv[56] = 51'h7540000000000;
      expv[57] = 51'h465800020000f;
      expv[58] = 51'h3b40000000000;
      expv[59] = 51'h2cd800020000f;
      expv[60] = 51'h24a0000000000;
      expv[61] = 51'h7f3800020000f;
      expv[62] = 51'h0000000000000;
      expv[63] = 51'h0000000000000;
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
