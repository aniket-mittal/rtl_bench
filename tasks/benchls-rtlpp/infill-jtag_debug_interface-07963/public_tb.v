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

  rtlpp_07963 dut (
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
    stim[0] = 42'h031261d4bd8;
    stim[1] = 42'h047d59b7971;
    stim[2] = 42'h25c2c791ae2;
    stim[3] = 42'h0bc818ae77b;
    stim[4] = 42'h30d0f347c51;
    stim[5] = 42'h256015b62ef;
    stim[6] = 42'h16043d574b4;
    stim[7] = 42'h2b995395ef1;
    stim[8] = 42'h2dc42187d51;
    stim[9] = 42'h08cf9257162;
    stim[10] = 42'h1853b97505b;
    stim[11] = 42'h2214a0f96b8;
    stim[12] = 42'h32e815343e3;
    stim[13] = 42'h2cf516ac537;
    stim[14] = 42'h02b1cdac0b1;
    stim[15] = 42'h0fac45c83ea;
    stim[16] = 42'h1c5a7d7968b;
    stim[17] = 42'h3ab3598f9f7;
    stim[18] = 42'h2e27b85e378;
    stim[19] = 42'h2e44d6dd9ec;
    stim[20] = 42'h01ffb9bdb15;
    stim[21] = 42'h03379efbc36;
    stim[22] = 42'h0d0e912b10e;
    stim[23] = 42'h1b0b20da686;
    stim[24] = 42'h3baa3f163b7;
    stim[25] = 42'h33c94ca0a18;
    stim[26] = 42'h1f72aaccc08;
    stim[27] = 42'h2bd02c983f4;
    stim[28] = 42'h07acb952876;
    stim[29] = 42'h3c150e4a7e6;
    stim[30] = 42'h06ca1582383;
    stim[31] = 42'h1bda6dad786;
    stim[32] = 42'h1b4842122b0;
    stim[33] = 42'h3608478820a;
    stim[34] = 42'h0b66a443d97;
    stim[35] = 42'h0260415e5aa;
    stim[36] = 42'h260f398af68;
    stim[37] = 42'h3768771e9b9;
    stim[38] = 42'h0cae25e50fd;
    stim[39] = 42'h074a9f6bf41;
    stim[40] = 42'h367bf70892b;
    stim[41] = 42'h02cdb48f081;
    stim[42] = 42'h27f88acb130;
    stim[43] = 42'h2c6c81460d9;
    stim[44] = 42'h32c97836d56;
    stim[45] = 42'h3e517906dca;
    stim[46] = 42'h08e9bc7c5c4;
    stim[47] = 42'h2c860f8e8fe;
    stim[48] = 42'h297b750f531;
    stim[49] = 42'h1d15c130cdb;
    stim[50] = 42'h342f21ca27b;
    stim[51] = 42'h39ac93e5803;
    stim[52] = 42'h3e776d03464;
    stim[53] = 42'h00a30f055e9;
    stim[54] = 42'h13baf59e60c;
    stim[55] = 42'h05475f8a4c3;
    stim[56] = 42'h019f799e50f;
    stim[57] = 42'h28fde977d52;
    stim[58] = 42'h3268807e5b5;
    stim[59] = 42'h132fa4c2c8e;
    stim[60] = 42'h0153237d0ab;
    stim[61] = 42'h2fd63a35c78;
    stim[62] = 42'h3a0c64af946;
    stim[63] = 42'h2ab118278a1;
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
      expv[3] = 51'hxxxxxxxxxxxxx;
      expv[4] = 51'hxxxxxxxxxx000;
      expv[5] = 51'hxxxxxxxxxx000;
      expv[6] = 51'h2b00adb176080;
      expv[7] = 51'h2b00adb176000;
      expv[8] = 51'h2b00adb176000;
      expv[9] = 51'h6e210c3ea8020;
      expv[10] = 51'h6e210c3ea8000;
      expv[11] = 51'h6e210c3ea8000;
      expv[12] = 51'h6e210c3ea8000;
      expv[13] = 51'h1740a9a1f0001;
      expv[14] = 51'h1740a9a1f0000;
      expv[15] = 51'h1740a9a1f0000;
      expv[16] = 51'h7d622e41f4100;
      expv[17] = 51'h7d622e41f4000;
      expv[18] = 51'h7d622e41f4000;
      expv[19] = 51'h713dc2f1bc100;
      expv[20] = 51'h713dc2f1bc000;
      expv[21] = 51'h713dc2f1bc000;
      expv[22] = 51'h713dc2f1bc000;
      expv[23] = 51'h713dc2f1bc000;
      expv[24] = 51'h713dc2f1bc000;
      expv[25] = 51'h5d51f8b1da020;
      expv[26] = 51'h5d51f8b1da000;
      expv[27] = 51'h5d51f8b1da000;
      expv[28] = 51'h5d51f8b1da000;
      expv[29] = 51'h5d51f8b1da000;
      expv[30] = 51'h5d51f8b1da000;
      expv[31] = 51'h5d51f8b1da000;
      expv[32] = 51'h5ed36d6bc3000;
      expv[33] = 51'h5ed36d6bc2000;
      expv[34] = 51'h5ed36d6bc2000;
      expv[35] = 51'h5ed36d6bc2000;
      expv[36] = 51'h5ed36d6bc2000;
      expv[37] = 51'h3079cc57b4000;
      expv[38] = 51'h3079cc57b4000;
      expv[39] = 51'h3079cc57b4000;
      expv[40] = 51'h3079cc57b4000;
      expv[41] = 51'h3079cc57b4000;
      expv[42] = 51'h3079cc57b4000;
      expv[43] = 51'h3079cc57b4000;
      expv[44] = 51'h63640a306c000;
      expv[45] = 51'h63640a306c000;
      expv[46] = 51'h63640a306c000;
      expv[47] = 51'h63640a306c000;
      expv[48] = 51'h64307c747e002;
      expv[49] = 51'h64307c747e000;
      expv[50] = 51'h64307c747e000;
      expv[51] = 51'h21790e513c002;
      expv[52] = 51'h21790e513c000;
      expv[53] = 51'h73bb681a32000;
      expv[54] = 51'h73bb681a32000;
      expv[55] = 51'h73bb681a32000;
      expv[56] = 51'h73bb681a32000;
      expv[57] = 51'h73bb681a32000;
      expv[58] = 51'h73bb681a32000;
      expv[59] = 51'h134403f2da080;
      expv[60] = 51'h134403f2da000;
      expv[61] = 51'h134403f2da000;
      expv[62] = 51'h134403f2da000;
      expv[63] = 51'h5063257ca3000;
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
