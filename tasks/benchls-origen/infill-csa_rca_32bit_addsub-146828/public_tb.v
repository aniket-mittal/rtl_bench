// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_146828 dut (
    .a(in_vec[64:33]),
    .b(in_vec[32:1]),
    .sub(in_vec[0:0]),
    .result(out_vec[32:1]),
    .cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h1094ac5117d0f3b16;
    stim[1] = 65'h1ac05784c00338e99;
    stim[2] = 65'h1040fdaaa6b81e3b6;
    stim[3] = 65'h1a1994d2efba70a27;
    stim[4] = 65'h00f5fba9c0bf1a82c;
    stim[5] = 65'h19343cee77642ffda;
    stim[6] = 65'h01f06e99a9bd2e3cf;
    stim[7] = 65'h06154a8b4fcb59630;
    stim[8] = 65'h1067dd0289ef6f96c;
    stim[9] = 65'h09c02192946cfc995;
    stim[10] = 65'h00ae5461e585066f7;
    stim[11] = 65'h029b950e90de4a960;
    stim[12] = 65'h054fc469b6194df45;
    stim[13] = 65'h0b3e6c68b27d225bf;
    stim[14] = 65'h0ae033d5f24bcb8f7;
    stim[15] = 65'h100eb9f88b2f5474f;
    stim[16] = 65'h190e2d53247be0b7d;
    stim[17] = 65'h06b69674fc9f44684;
    stim[18] = 65'h19e31e0804cc504dd;
    stim[19] = 65'h065108010d25cbfe5;
    stim[20] = 65'h16f5ed15013468a95;
    stim[21] = 65'h0c4d6bcfdbf40878e;
    stim[22] = 65'h1673942c4dda6f883;
    stim[23] = 65'h182895ba400648768;
    stim[24] = 65'h1c81a833e2599147f;
    stim[25] = 65'h1497a98f9a1dfaf4f;
    stim[26] = 65'h0f6acddb11d579b44;
    stim[27] = 65'h02446fb7a2050dcf9;
    stim[28] = 65'h10ba2ceb39a36cfb3;
    stim[29] = 65'h1ddcaf189dc4b9291;
    stim[30] = 65'h171b32e94b88175d7;
    stim[31] = 65'h1d80a228af81f4883;
    stim[32] = 65'h0ef60452a8899c550;
    stim[33] = 65'h183db3f022bc78e31;
    stim[34] = 65'h0f8efab43470fd197;
    stim[35] = 65'h1bf2cc598ece36e66;
    stim[36] = 65'h15f84df75e3202a0c;
    stim[37] = 65'h09c53634a32167211;
    stim[38] = 65'h144e12f8cf7545856;
    stim[39] = 65'h01c07a81c2b0d8e83;
    stim[40] = 65'h1cf473bc03a4a6e6b;
    stim[41] = 65'h05109de8d24de52d7;
    stim[42] = 65'h0bc2a0316f7f31a12;
    stim[43] = 65'h02f2268e9bb25b155;
    stim[44] = 65'h1ae16507848d634b9;
    stim[45] = 65'h10d5595ae066f2f6f;
    stim[46] = 65'h0e6faec4593a7b723;
    stim[47] = 65'h0b0163413e2a3d0c3;
    stim[48] = 65'h14724eb2676d49bed;
    stim[49] = 65'h05631fceb6d97ec90;
    stim[50] = 65'h12628f8460c77c6bc;
    stim[51] = 65'h0399ef74e0eb7fc5d;
    stim[52] = 65'h0d07451fa3fe71ae7;
    stim[53] = 65'h11d7c56deb4bdd0cb;
    stim[54] = 65'h0d1c0693d3302f8e6;
    stim[55] = 65'h1a82c71e2ababef73;
    stim[56] = 65'h0473ecb81834a6acd;
    stim[57] = 65'h02fe519b517d0b6e9;
    stim[58] = 65'h19216350705da0af8;
    stim[59] = 65'h18aa392898d33aee2;
    stim[60] = 65'h0c0e7166ce89bb466;
    stim[61] = 65'h1f09603e2c1abc7ee;
    stim[62] = 65'h161e7aa8d20a546a5;
    stim[63] = 65'h12db2e3296b08a837;
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
      expv[0] = 33'h1de5a0026;
      expv[1] = 33'h1abd1e9b4;
      expv[2] = 33'h17f91be60;
      expv[3] = 33'h1bff24308;
      expv[4] = 33'h07b5162c8;
      expv[5] = 33'h19f86cec0;
      expv[6] = 33'h19b3405cc;
      expv[7] = 33'h17e0a3ee4;
      expv[8] = 33'h1bd74c994;
      expv[9] = 33'h1dd324f94;
      expv[10] = 33'h1f294df28;
      expv[11] = 33'h1779dfa48;
      expv[12] = 33'h0f3676756;
      expv[13] = 33'h1dc14a0cc;
      expv[14] = 33'h19f468468;
      expv[15] = 33'h15df6583a;
      expv[16] = 33'h1d924c9b6;
      expv[17] = 33'h1755dadd2;
      expv[18] = 33'h1f16cdba4;
      expv[19] = 33'h1d2b3c02c;
      expv[20] = 33'h17c1846bc;
      expv[21] = 33'h1ce17448a;
      expv[22] = 33'h1bf924a42;
      expv[23] = 33'h18eede30c;
      expv[24] = 33'h1a6816ec0;
      expv[25] = 33'h1af9ae9aa;
      expv[26] = 33'h1fc0478f4;
      expv[27] = 33'h197f61e82;
      expv[28] = 33'h1736bff00;
      expv[29] = 33'h1c57f5ef8;
      expv[30] = 33'h1f931b8be;
      expv[31] = 33'h1dfeada08;
      expv[32] = 33'h177fa0a7a;
      expv[33] = 33'h17c13b0d2;
      expv[34] = 33'h1b1dfd9ac;
      expv[35] = 33'h1fc1033fe;
      expv[36] = 33'h1caa50980;
      expv[37] = 33'h1fe3cf13a;
      expv[38] = 33'h17e3587e2;
      expv[39] = 33'h1f2fa199a;
      expv[40] = 33'h1dcfccd56;
      expv[41] = 33'h1fc2b8bb6;
      expv[42] = 33'h1f61d1d28;
      expv[43] = 33'h073fcb794;
      expv[44] = 33'h1f7401bc0;
      expv[45] = 33'h1fee66640;
      expv[46] = 33'h173533522;
      expv[47] = 33'h0ef726350;
      expv[48] = 33'h1d0504f3a;
      expv[49] = 33'h1fbc9e97a;
      expv[50] = 33'h132a0bf02;
      expv[51] = 33'h1eee6faf2;
      expv[52] = 33'h1b68d3714;
      expv[53] = 33'h1eebe8614;
      expv[54] = 33'h1cec36222;
      expv[55] = 33'h1fc808270;
      expv[56] = 33'h0fff460b4;
      expv[57] = 33'h15e1462cc;
      expv[58] = 33'h1b7f03ffe;
      expv[59] = 33'h11fd7416a;
      expv[60] = 33'h1b982cad2;
      expv[61] = 33'h1f641cbd0;
      expv[62] = 33'h1fb4263e8;
      expv[63] = 33'h1f6aa3af2;
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
