// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01956 dut (
    .clk(clk),
    .reset(in_vec[69:69]),
    .enable(in_vec[68:68]),
    .address(in_vec[67:36]),
    .start(in_vec[35:35]),
    .waitrequest(in_vec[34:34]),
    .stall(in_vec[33:33]),
    .fifo_data(in_vec[32:1]),
    .fifo_empty(in_vec[0:0]),
    .write_data(out_vec[32:1]),
    .fifo_readack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h217bf17d533208122b;
    stim[1] = 70'h3a2f836d33cdc3c93a;
    stim[2] = 70'h061674051cf43561c6;
    stim[3] = 70'h13edcf663163dde2e3;
    stim[4] = 70'h11c22ada9759e41f7d;
    stim[5] = 70'h1b33aaa201ce3b27a7;
    stim[6] = 70'h1e40304651b4b5aff8;
    stim[7] = 70'h150100b773568c9b7c;
    stim[8] = 70'h0568f19f8de5da44a7;
    stim[9] = 70'h123d204232a9a6aeac;
    stim[10] = 70'h08942685d40d7d0553;
    stim[11] = 70'h1a10a946b3065ff6be;
    stim[12] = 70'h0ded496a4fbabe8363;
    stim[13] = 70'h1957bbcafa1eadec3d;
    stim[14] = 70'h027aea3138d020697c;
    stim[15] = 70'h0c538134996b225828;
    stim[16] = 70'h0d082969f48d42cf11;
    stim[17] = 70'h0247605c6e167b1028;
    stim[18] = 70'h045d5315488d50ab17;
    stim[19] = 70'h0fbb244a4dc0303161;
    stim[20] = 70'h197497bdcea5e545ee;
    stim[21] = 70'h137cb0810c2cc04985;
    stim[22] = 70'h166b56ba99ab0be9fc;
    stim[23] = 70'h1b034fa3b3b5731a99;
    stim[24] = 70'h0fb13105a7039abbfb;
    stim[25] = 70'h0b1b43e93ff4c6056f;
    stim[26] = 70'h0ac2fe43c7f6562dab;
    stim[27] = 70'h03d7650ca66acd3d4f;
    stim[28] = 70'h191ca6bb1482b15574;
    stim[29] = 70'h15c6f50edb29b02064;
    stim[30] = 70'h0b18fd5ec50666b372;
    stim[31] = 70'h05025039cfed825eba;
    stim[32] = 70'h056917b9074c1fdead;
    stim[33] = 70'h0a5e52149b740f81a4;
    stim[34] = 70'h19ff78a21469d78832;
    stim[35] = 70'h1c38990d28fd6c8bd9;
    stim[36] = 70'h184147d29a2e573034;
    stim[37] = 70'h079b9dec2305c81636;
    stim[38] = 70'h191cbd74784a77a513;
    stim[39] = 70'h013f0b5c0470b503bf;
    stim[40] = 70'h060d397cc5f60f1a63;
    stim[41] = 70'h1bb1b1269a57c55bb7;
    stim[42] = 70'h075b4fac78219516c7;
    stim[43] = 70'h1fb81b8bb034f59e5e;
    stim[44] = 70'h1ea38fee90779d6182;
    stim[45] = 70'h11d8bd2d27fa541557;
    stim[46] = 70'h1af154ec1a7bcefa4e;
    stim[47] = 70'h1b4165f726056bedb2;
    stim[48] = 70'h17893a4d7aeaa1fc6e;
    stim[49] = 70'h0707825be4891f96b8;
    stim[50] = 70'h026a6aea4c041224f6;
    stim[51] = 70'h0b26696612b95d32be;
    stim[52] = 70'h1e97265a141373b0a4;
    stim[53] = 70'h1db8dfcc9035500cc5;
    stim[54] = 70'h02803a26da66e33967;
    stim[55] = 70'h108b49723f9963cd57;
    stim[56] = 70'h04178421d6051a19fb;
    stim[57] = 70'h0926e8c973760080e3;
    stim[58] = 70'h1a5b3991282d61a908;
    stim[59] = 70'h1b3ef55ffb03d7fffb;
    stim[60] = 70'h10df99d7f88f8c17bd;
    stim[61] = 70'h113080eb6efd797ce2;
    stim[62] = 70'h12b758d0a1fa65681d;
    stim[63] = 70'h038fb4e7eb5b8e48e7;
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
      expv[0] = 33'h13208122a;
      expv[1] = 33'h1cdc3c93a;
      expv[2] = 33'h0f43561c6;
      expv[3] = 33'h163dde2e2;
      expv[4] = 33'h159e41f7c;
      expv[5] = 33'h1ce3b27a6;
      expv[6] = 33'h1b4b5aff9;
      expv[7] = 33'h1568c9b7c;
      expv[8] = 33'h1e5da44a6;
      expv[9] = 33'h0a9a6aeac;
      expv[10] = 33'h00d7d0552;
      expv[11] = 33'h1065ff6be;
      expv[12] = 33'h1babe8362;
      expv[13] = 33'h01eadec3c;
      expv[14] = 33'h0d020697c;
      expv[15] = 33'h16b225828;
      expv[16] = 33'h08d42cf10;
      expv[17] = 33'h0167b1028;
      expv[18] = 33'h08d50ab16;
      expv[19] = 33'h1c0303160;
      expv[20] = 33'h0a5e545ee;
      expv[21] = 33'h02cc04984;
      expv[22] = 33'h1ab0be9fd;
      expv[23] = 33'h1b5731a98;
      expv[24] = 33'h1039abbfa;
      expv[25] = 33'h1f4c6056e;
      expv[26] = 33'h1f6562daa;
      expv[27] = 33'h06acd3d4e;
      expv[28] = 33'h082b15574;
      expv[29] = 33'h129b02064;
      expv[30] = 33'h10666b372;
      expv[31] = 33'h1ed825eba;
      expv[32] = 33'h14c1fdeac;
      expv[33] = 33'h1740f81a4;
      expv[34] = 33'h069d78832;
      expv[35] = 33'h0fd6c8bd8;
      expv[36] = 33'h02e573034;
      expv[37] = 33'h105c81636;
      expv[38] = 33'h04a77a512;
      expv[39] = 33'h070b503be;
      expv[40] = 33'h1f60f1a62;
      expv[41] = 33'h057c55bb6;
      expv[42] = 33'h0219516c6;
      expv[43] = 33'h034f59e5f;
      expv[44] = 33'h0779d6183;
      expv[45] = 33'h1fa541556;
      expv[46] = 33'h07bcefa4e;
      expv[47] = 33'h0056bedb2;
      expv[48] = 33'h0eaa1fc6e;
      expv[49] = 33'h0891f96b8;
      expv[50] = 33'h0041224f6;
      expv[51] = 33'h0b95d32be;
      expv[52] = 33'h01373b0a4;
      expv[53] = 33'h035500cc4;
      expv[54] = 33'h066e33966;
      expv[55] = 33'h19963cd56;
      expv[56] = 33'h0051a19fa;
      expv[57] = 33'h1760080e2;
      expv[58] = 33'h02d61a909;
      expv[59] = 33'h103d7fffa;
      expv[60] = 33'h08f8c17bc;
      expv[61] = 33'h0fd797ce2;
      expv[62] = 33'h1fa65681c;
      expv[63] = 33'h15b8e48e6;
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
