// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_116984 dut (
    .clk(clk),
    .rst(in_vec[34:34]),
    .read_req(in_vec[33:33]),
    .write_data(in_vec[32:1]),
    .write_enable(in_vec[0:0]),
    .read_data(out_vec[33:2]),
    .fifo_empty(out_vec[1:1]),
    .rdata_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h4ea0bee52;
    stim[1] = 35'h7265256a5;
    stim[2] = 35'h21ac33a5f;
    stim[3] = 35'h2aa3409de;
    stim[4] = 35'h13efe82ee;
    stim[5] = 35'h23b41f080;
    stim[6] = 35'h14b57fc4e;
    stim[7] = 35'h1d6f08307;
    stim[8] = 35'h043bbc48d;
    stim[9] = 35'h38fe9a422;
    stim[10] = 35'h1b22405b9;
    stim[11] = 35'h34e8102f4;
    stim[12] = 35'h187c3191f;
    stim[13] = 35'h05d3640ba;
    stim[14] = 35'h1339b4b98;
    stim[15] = 35'h10898a41f;
    stim[16] = 35'h2e5f9a8e8;
    stim[17] = 35'h3d1ba303e;
    stim[18] = 35'h07cf67767;
    stim[19] = 35'h21b80f6b3;
    stim[20] = 35'h349ac4932;
    stim[21] = 35'h38c726883;
    stim[22] = 35'h237103c71;
    stim[23] = 35'h301e8f6b7;
    stim[24] = 35'h2333543e6;
    stim[25] = 35'h27d70de60;
    stim[26] = 35'h2208970c5;
    stim[27] = 35'h3471988ea;
    stim[28] = 35'h243b7921e;
    stim[29] = 35'h0c7ac895b;
    stim[30] = 35'h1986e3a8e;
    stim[31] = 35'h1f36cbb3d;
    stim[32] = 35'h25fa22e8e;
    stim[33] = 35'h3e82df9c0;
    stim[34] = 35'h2c970c767;
    stim[35] = 35'h398582112;
    stim[36] = 35'h094e0c680;
    stim[37] = 35'h2928004f0;
    stim[38] = 35'h383aac641;
    stim[39] = 35'h19b5ff1d3;
    stim[40] = 35'h16bec74cc;
    stim[41] = 35'h3f2613611;
    stim[42] = 35'h285d4545a;
    stim[43] = 35'h091a95f21;
    stim[44] = 35'h3c7f26b81;
    stim[45] = 35'h38d3dca8c;
    stim[46] = 35'h0153ab51d;
    stim[47] = 35'h2daa391d1;
    stim[48] = 35'h100062513;
    stim[49] = 35'h18e9944fb;
    stim[50] = 35'h0c59ae5e0;
    stim[51] = 35'h06b131ae4;
    stim[52] = 35'h2646d2f1f;
    stim[53] = 35'h47a79561f;
    stim[54] = 35'h0cb375109;
    stim[55] = 35'h18419c358;
    stim[56] = 35'h2382c996b;
    stim[57] = 35'h1f270711c;
    stim[58] = 35'h32dc38c21;
    stim[59] = 35'h2479cc7e4;
    stim[60] = 35'h24d948040;
    stim[61] = 35'h0506721b4;
    stim[62] = 35'h0047e5405;
    stim[63] = 35'h06b14bf8d;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'hxxxxxxxxx;
      expv[2] = 34'hxxxxxxxxx;
      expv[3] = 34'hxxxxxxxxx;
      expv[4] = 34'h0358674bf;
      expv[5] = 34'h0358674be;
      expv[6] = 34'h0358674be;
      expv[7] = 34'h0358674be;
      expv[8] = 34'h0358674bc;
      expv[9] = 34'h0358674bc;
      expv[10] = 34'h3ade1060d;
      expv[11] = 34'h3ade1060c;
      expv[12] = 34'h087778919;
      expv[13] = 34'h087778918;
      expv[14] = 34'h087778918;
      expv[15] = 34'h087778918;
      expv[16] = 34'h087778918;
      expv[17] = 34'h364480b71;
      expv[18] = 34'h30f86323d;
      expv[19] = 34'h30f86323c;
      expv[20] = 34'h21131483d;
      expv[21] = 34'h0f9eceecd;
      expv[22] = 34'h03701ed65;
      expv[23] = 34'h318e4d105;
      expv[24] = 34'h06e2078e1;
      expv[25] = 34'h203d1ed6f;
      expv[26] = 34'h203d1ed6e;
      expv[27] = 34'h203d1ed6c;
      expv[28] = 34'h04112e18b;
      expv[29] = 34'h04112e18a;
      expv[30] = 34'h04112e188;
      expv[31] = 34'h04112e188;
      expv[32] = 34'h04112e188;
      expv[33] = 34'h18f5912b5;
      expv[34] = 34'h3e6d9767b;
      expv[35] = 34'h3e6d97678;
      expv[36] = 34'h192e18ecf;
      expv[37] = 34'h192e18ece;
      expv[38] = 34'h192e18ece;
      expv[39] = 34'h192e18ecc;
      expv[40] = 34'h192e18ecc;
      expv[41] = 34'h192e18ecc;
      expv[42] = 34'h307558c81;
      expv[43] = 34'h336bfe3a5;
      expv[44] = 34'h336bfe3a4;
      expv[45] = 34'h3e4c26c21;
      expv[46] = 34'h12352be41;
      expv[47] = 34'h12352be40;
      expv[48] = 34'h38fe4d701;
      expv[49] = 34'h38fe4d700;
      expv[50] = 34'h38fe4d700;
      expv[51] = 34'h38fe4d700;
      expv[52] = 34'h38fe4d700;
      expv[53] = 34'h02a756a39;
      expv[54] = 34'h02a756a3a;
      expv[55] = 34'h02a756a38;
      expv[56] = 34'h02a756a38;
      expv[57] = 34'h1966ea211;
      expv[58] = 34'h1966ea210;
      expv[59] = 34'h0705932d5;
      expv[60] = 34'h25b871843;
      expv[61] = 34'h25b871842;
      expv[62] = 34'h25b871842;
      expv[63] = 34'h25b871840;
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
