// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11075 dut (
    .clock(clk),
    .Dn(in_vec[30:23]),
    .Xn(in_vec[22:15]),
    .Wn(in_vec[14:7]),
    .memory_Dn_active(in_vec[6:6]),
    .memory_Xn_active(in_vec[5:5]),
    .memory_bobot_active(in_vec[4:4]),
    .y_active(in_vec[3:3]),
    .e_active(in_vec[2:2]),
    .w_active(in_vec[1:1]),
    .sys_reset_active(in_vec[0:0]),
    .z(out_vec[13:6]),
    .done_read_Dn(out_vec[5:5]),
    .done_read_Xn(out_vec[4:4]),
    .done_yn(out_vec[3:3]),
    .done_en(out_vec[2:2]),
    .done_write_wn(out_vec[1:1]),
    .done_wn1(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h7277eedd;
    stim[1] = 31'h6cb5fdaf;
    stim[2] = 31'h7cb2a612;
    stim[3] = 31'h4c206b80;
    stim[4] = 31'h56ca2302;
    stim[5] = 31'h6d1deec8;
    stim[6] = 31'h6afb7c7c;
    stim[7] = 31'h319e039c;
    stim[8] = 31'h60d59b0c;
    stim[9] = 31'h1fe14e68;
    stim[10] = 31'h0de28954;
    stim[11] = 31'h506ab4e6;
    stim[12] = 31'h7b1626b0;
    stim[13] = 31'h09f13e8c;
    stim[14] = 31'h7bf801b4;
    stim[15] = 31'h63bc7d9c;
    stim[16] = 31'h2eaddb82;
    stim[17] = 31'h0b865014;
    stim[18] = 31'h44f8c4c6;
    stim[19] = 31'h3466b2a8;
    stim[20] = 31'h00988da8;
    stim[21] = 31'h6518a332;
    stim[22] = 31'h0ad5aafe;
    stim[23] = 31'h241da816;
    stim[24] = 31'h5517c2e6;
    stim[25] = 31'h637a3daa;
    stim[26] = 31'h10dfdac0;
    stim[27] = 31'h7608abc0;
    stim[28] = 31'h019f52ce;
    stim[29] = 31'h509afef6;
    stim[30] = 31'h7779fefe;
    stim[31] = 31'h6d99fe40;
    stim[32] = 31'h7bb9fa42;
    stim[33] = 31'h0717939a;
    stim[34] = 31'h655af236;
    stim[35] = 31'h53bdb27a;
    stim[36] = 31'h1129b684;
    stim[37] = 31'h1107b746;
    stim[38] = 31'h752077f6;
    stim[39] = 31'h36be0094;
    stim[40] = 31'h190645a2;
    stim[41] = 31'h535b868a;
    stim[42] = 31'h06a831f0;
    stim[43] = 31'h3e906120;
    stim[44] = 31'h17b33a7a;
    stim[45] = 31'h3adec95a;
    stim[46] = 31'h723474d4;
    stim[47] = 31'h477b46de;
    stim[48] = 31'h1e0d1084;
    stim[49] = 31'h3bb7c182;
    stim[50] = 31'h4b9b242a;
    stim[51] = 31'h7011c462;
    stim[52] = 31'h21fb4dfe;
    stim[53] = 31'h3c3918e4;
    stim[54] = 31'h096fef2a;
    stim[55] = 31'h7de36ef6;
    stim[56] = 31'h1138cefa;
    stim[57] = 31'h59c3e99a;
    stim[58] = 31'h07e0f5d4;
    stim[59] = 31'h4a1675ac;
    stim[60] = 31'h5600e154;
    stim[61] = 31'h61f018f8;
    stim[62] = 31'h221177f0;
    stim[63] = 31'h1a831a00;
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
      expv[0] = 14'h0000;
      expv[1] = 14'h0000;
      expv[2] = 14'h0000;
      expv[3] = 14'h0003;
      expv[4] = 14'h0000;
      expv[5] = 14'h0001;
      expv[6] = 14'h0028;
      expv[7] = 14'h357e;
      expv[8] = 14'h18ce;
      expv[9] = 14'h304c;
      expv[10] = 14'h3078;
      expv[11] = 14'h06e6;
      expv[12] = 14'h2835;
      expv[13] = 14'h2812;
      expv[14] = 14'h04cc;
      expv[15] = 14'h0856;
      expv[16] = 14'h3c4e;
      expv[17] = 14'h3c41;
      expv[18] = 14'h1bc6;
      expv[19] = 14'h3865;
      expv[20] = 14'h3858;
      expv[21] = 14'h3858;
      expv[22] = 14'h3853;
      expv[23] = 14'h327f;
      expv[24] = 14'h07c7;
      expv[25] = 14'h2075;
      expv[26] = 14'h2059;
      expv[27] = 14'h2060;
      expv[28] = 14'h2060;
      expv[29] = 14'h14ed;
      expv[30] = 14'h1677;
      expv[31] = 14'h29bf;
      expv[32] = 14'h29a0;
      expv[33] = 14'h29a1;
      expv[34] = 14'h298b;
      expv[35] = 14'h2a57;
      expv[36] = 14'h2a7b;
      expv[37] = 14'h12c4;
      expv[38] = 14'h12e5;
      expv[39] = 14'h04f7;
      expv[40] = 14'h2586;
      expv[41] = 14'h2591;
      expv[42] = 14'h2589;
      expv[43] = 14'h25b2;
      expv[44] = 14'h2590;
      expv[45] = 14'h25bb;
      expv[46] = 14'h25ab;
      expv[47] = 14'h1e26;
      expv[48] = 14'h08af;
      expv[49] = 14'h2c04;
      expv[50] = 14'h2c01;
      expv[51] = 14'h2c19;
      expv[52] = 14'h2c31;
      expv[53] = 14'h0dff;
      expv[54] = 14'h3b34;
      expv[55] = 14'h3b19;
      expv[56] = 14'h1777;
      expv[57] = 14'h177b;
      expv[58] = 14'h174b;
      expv[59] = 14'h2b66;
      expv[60] = 14'h0c9c;
      expv[61] = 14'h1226;
      expv[62] = 14'h123a;
      expv[63] = 14'h1232;
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
