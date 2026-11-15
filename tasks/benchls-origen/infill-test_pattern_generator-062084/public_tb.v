// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 83;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_062084 dut (
    .clk_sys(clk),
    .cfg_tp_base(in_vec[82:59]),
    .cfg_tp_step(in_vec[58:35]),
    .cfg_ad_fix(in_vec[34:11]),
    .cfg_ad_tp(in_vec[10:9]),
    .cfg_sample(in_vec[8:6]),
    .mod_id(in_vec[5:2]),
    .syn_vld(in_vec[1:1]),
    .rst_n(in_vec[0:0]),
    .tp_data(out_vec[24:1]),
    .tp_vld(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 83'h461d3e36df3b22866da2a;
    stim[1] = 83'h29935dfd80c3dad49a084;
    stim[2] = 83'h1c291f91ebe1c5a204095;
    stim[3] = 83'h2c2662eaa3cc045391777;
    stim[4] = 83'h22c1fdb881d8cfbf9453b;
    stim[5] = 83'h40cd14d7fb2ad35d94a4d;
    stim[6] = 83'h2733a892eba0d8314d2ff;
    stim[7] = 83'h4fc607b39c286cafbf36b;
    stim[8] = 83'h05a3ddb34e29b317f5b95;
    stim[9] = 83'h2dd37e721f1a3d76c908b;
    stim[10] = 83'h602fcaa43ec551c4b239b;
    stim[11] = 83'h6f72c84a6f104ff445c05;
    stim[12] = 83'h0f5bb62423de1a5fef729;
    stim[13] = 83'h13bd0039ca0b35c74db92;
    stim[14] = 83'h24515abd2c8a67597a97b;
    stim[15] = 83'h6d6ec963b45f1172f004b;
    stim[16] = 83'h65104b695a50186759173;
    stim[17] = 83'h4a57eed8ada0d5756e23b;
    stim[18] = 83'h105b0aefdf0f819004ee9;
    stim[19] = 83'h1c3c70a38d6c04ad26fcd;
    stim[20] = 83'h34d29ad4fc52cb1ddf41d;
    stim[21] = 83'h47af5df23b7cc8ce09785;
    stim[22] = 83'h51211b84cb0167235b0f7;
    stim[23] = 83'h0b0d809118cfc5a2cb82d;
    stim[24] = 83'h3be3179df22480c1d43eb;
    stim[25] = 83'h1e4ee081372cdb0a19af1;
    stim[26] = 83'h4b3e4f45ffbaf8b9197dd;
    stim[27] = 83'h767d2880164188bc4e5d5;
    stim[28] = 83'h6d17c2e04873d27a4b3dd;
    stim[29] = 83'h0ca5bbd9279d04b0209c7;
    stim[30] = 83'h6822097027030c8083af1;
    stim[31] = 83'h06c33d6b5b7dd5b7e4c05;
    stim[32] = 83'h7fafe4ddba38366b12295;
    stim[33] = 83'h6bb6aa34e864b8a7d10ab;
    stim[34] = 83'h134c0865f02fed113cb35;
    stim[35] = 83'h524bbd54a3fbf4eb1b18d;
    stim[36] = 83'h52d7560ff92a59e790707;
    stim[37] = 83'h46212e53cfc599418553b;
    stim[38] = 83'h76db59af953f0b486a82d;
    stim[39] = 83'h100decc8a334f77f67fcf;
    stim[40] = 83'h249f6f53841add5712845;
    stim[41] = 83'h2144df98e48822eebf503;
    stim[42] = 83'h40b405d4812d1d29ef6e1;
    stim[43] = 83'h007227b20dca10883d6bd;
    stim[44] = 83'h59e17e3172cddaf2cacd1;
    stim[45] = 83'h0263b0d1861fb10037ea1;
    stim[46] = 83'h0fbe63382421e3f558815;
    stim[47] = 83'h7c5935765c60c026670f7;
    stim[48] = 83'h4889b441e2a25d29b5b79;
    stim[49] = 83'h3f65524f6f7e993acd1ab;
    stim[50] = 83'h7299f536b06b69ab0be8f;
    stim[51] = 83'h55e2f1f9b930720202551;
    stim[52] = 83'h5b858a2c242f1898edec9;
    stim[53] = 83'h34776579b6d1fae605b6d;
    stim[54] = 83'h7f9d5cde85a5df3eb1653;
    stim[55] = 83'h3aa7fab9ed44f637ff49f;
    stim[56] = 83'h6a20c1131c770c3b08519;
    stim[57] = 83'h161a75dba156f37a70efb;
    stim[58] = 83'h7daf87bad14b9cf1bd76d;
    stim[59] = 83'h4550574bdc9bc6cdcff93;
    stim[60] = 83'h5eb1b48465c72b3e6a987;
    stim[61] = 83'h0e5cdf674c1bbba43fbe9;
    stim[62] = 83'h09dfbdaf0c55217457643;
    stim[63] = 83'h0b20cc41796dfa228767b;
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
      expv[0] = 25'h0000000;
      expv[1] = 25'h0000000;
      expv[2] = 25'h0000000;
      expv[3] = 25'h0000000;
      expv[4] = 25'h0000000;
      expv[5] = 25'h0114e44;
      expv[6] = 25'h0b0998a;
      expv[7] = 25'h08b07f6;
      expv[8] = 25'h1033452;
      expv[9] = 25'h09ccea2;
      expv[10] = 25'h000000a;
      expv[11] = 25'h0168f76;
      expv[12] = 25'h14712c8;
      expv[13] = 25'h0000000;
      expv[14] = 25'h0000000;
      expv[15] = 25'h0000000;
      expv[16] = 25'h000001c;
      expv[17] = 25'h0000004;
      expv[18] = 25'h1b5bb24;
      expv[19] = 25'h0000000;
      expv[20] = 25'h0000000;
      expv[21] = 25'h012b49a;
      expv[22] = 25'h0000000;
      expv[23] = 25'h0000002;
      expv[24] = 25'h000001a;
      expv[25] = 25'h144846e;
      expv[26] = 25'h02c3602;
      expv[27] = 25'h0000000;
      expv[28] = 25'h1e2e464;
      expv[29] = 25'h12cf93c;
      expv[30] = 25'h000000e;
      expv[31] = 25'h1b45f0a;
      expv[32] = 25'h032020e;
      expv[33] = 25'h1a08824;
      expv[34] = 25'h000000a;
      expv[35] = 25'h1febf92;
      expv[36] = 25'h000001a;
      expv[37] = 25'h0000000;
      expv[38] = 25'h1679e40;
      expv[39] = 25'h000001c;
      expv[40] = 25'h0000000;
      expv[41] = 25'h0000006;
      expv[42] = 25'h1755c4a;
      expv[43] = 25'h0000000;
      expv[44] = 25'h0000000;
      expv[45] = 25'h04220f4;
      expv[46] = 25'h0000000;
      expv[47] = 25'h0000010;
      expv[48] = 25'h000000a;
      expv[49] = 25'h03ef98c;
      expv[50] = 25'h000001c;
      expv[51] = 25'h0000000;
      expv[52] = 25'h1a6ac2e;
      expv[53] = 25'h0000000;
      expv[54] = 25'h1578bc6;
      expv[55] = 25'h0000000;
      expv[56] = 25'h17cfac4;
      expv[57] = 25'h1d8dffc;
      expv[58] = 25'h0000000;
      expv[59] = 25'h0000000;
      expv[60] = 25'h0000000;
      expv[61] = 25'h0000008;
      expv[62] = 25'h115415c;
      expv[63] = 25'h0000000;
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
