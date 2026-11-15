// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 97;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_059090 dut (
    .clk(clk),
    .reset(in_vec[96:96]),
    .xpos_playerR(in_vec[95:84]),
    .ypos_playerR(in_vec[83:72]),
    .xpos_sword_R(in_vec[71:60]),
    .ypos_sword_R(in_vec[59:48]),
    .xpos_playerL(in_vec[47:36]),
    .ypos_playerL(in_vec[35:24]),
    .xpos_sword_L(in_vec[23:12]),
    .ypos_sword_L(in_vec[11:0]),
    .dead_L(out_vec[1:1]),
    .dead_R(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 97'h15fe99d83cab96da635e32cac;
    stim[1] = 97'h111c163957de80ca59127c67c;
    stim[2] = 97'h0afa24cb9c5a76bbce1f633be;
    stim[3] = 97'h093520fc39a0485bebae36b93;
    stim[4] = 97'h0adf6605b9a1255cb92aa6613;
    stim[5] = 97'h005c5c988a23ae3e03bef4b66;
    stim[6] = 97'h01dded80d008929e547f82a70;
    stim[7] = 97'h0d9af67b812378b50f03e47ed;
    stim[8] = 97'h0676257ca0eca924d47f11ee4;
    stim[9] = 97'h04057cdf41a694c03731e0aa1;
    stim[10] = 97'h02b8e603fc81145f988039737;
    stim[11] = 97'h00efb3ea9a9ddaeffc96baa00;
    stim[12] = 97'h01fd98af2ac25ceb9dc4cdb0e;
    stim[13] = 97'h03827661ff9e7f74d4771da93;
    stim[14] = 97'h0d0a2a15cac505f73541204a3;
    stim[15] = 97'h0fd1c3c69dc7538c713455f1b;
    stim[16] = 97'h0fb635f1deb822f9ee964e5c2;
    stim[17] = 97'h0658e47095e5c3d433699139f;
    stim[18] = 97'h0fd846f8db8dffc531fd01a23;
    stim[19] = 97'h0b0a2e600f5cd18ab60734353;
    stim[20] = 97'h0838e8a59d7b5e463d0ae6379;
    stim[21] = 97'h0668a0ecdebf8f51fa7773eb9;
    stim[22] = 97'h0005599f3a362b4a265579c92;
    stim[23] = 97'h04179144dc68de4fb17c7f4d3;
    stim[24] = 97'h0842fcf863751fec6bb0c1ede;
    stim[25] = 97'h0e6806a5f3bf5543d98223824;
    stim[26] = 97'h0de18400fd1c7795fc7e8fba7;
    stim[27] = 97'h070a13d7efa3c2be8f424505e;
    stim[28] = 97'h03b95d494b092baa757ad18d3;
    stim[29] = 97'h0038be3b7e1932783679d9780;
    stim[30] = 97'h0d1cc4d7c0f162a9f36bb782c;
    stim[31] = 97'h0a9fe0adf5866565b7a028a74;
    stim[32] = 97'h015c1314c359f8975e7b65f3e;
    stim[33] = 97'h0f6fae6f3975af7a19d86a770;
    stim[34] = 97'h04a8928e67b5a5f49051254e4;
    stim[35] = 97'h0bf392a24b3116ca10f497a4b;
    stim[36] = 97'h00d18c406e8ca105cdcf9c0d4;
    stim[37] = 97'h16f5e56b5914b2ab491ffefcd;
    stim[38] = 97'h00bec207c82514d77268d6560;
    stim[39] = 97'h08a90e2deabde92b68abd9d5e;
    stim[40] = 97'h0822234ef952d3086f9ec6a0d;
    stim[41] = 97'h0897cddadbd6667d154e5df9d;
    stim[42] = 97'h095f76bb882229ffa28f12da2;
    stim[43] = 97'h06315eaff41ce97dc2de598fb;
    stim[44] = 97'h03559c57a2cfb7dcebd9dbff7;
    stim[45] = 97'h079656d08849c488dce5a1912;
    stim[46] = 97'h075cd7c5c91ff20b920ad7e48;
    stim[47] = 97'h0cc925a2a8ec5d6943c21226c;
    stim[48] = 97'h0b97b43806c5442fca1281440;
    stim[49] = 97'h02e841f8b4d49fe29b33a65ef;
    stim[50] = 97'h070dd60e49b6fdafce518af8a;
    stim[51] = 97'h0c84e5874069a1384cd11f499;
    stim[52] = 97'h0d540a84962949e2c1978f9fc;
    stim[53] = 97'h0bbc259f200ef4e58db962d0d;
    stim[54] = 97'h01f2b6f2c7d7d4bc541298dcc;
    stim[55] = 97'h0993797d0d2ccbeec3910e61e;
    stim[56] = 97'h03cc35b077713a2e3624b82dc;
    stim[57] = 97'h002c94d20ffa24ae7d56510fa;
    stim[58] = 97'h0defbdc86ffbfb1ae8a9f5945;
    stim[59] = 97'h04e60d0904a2cfad672088b18;
    stim[60] = 97'h0d71110c3dfafe0f6bc78531e;
    stim[61] = 97'h1ffb0ec89b9ea849a57ae38d4;
    stim[62] = 97'h0b8127548139c3f725b39a07e;
    stim[63] = 97'h037b6712bf25c1deaf6bf8cc3;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h0;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h0;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
