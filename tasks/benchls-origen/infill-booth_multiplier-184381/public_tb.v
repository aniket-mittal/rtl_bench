// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_184381 dut (
    .clk(clk),
    .state(in_vec[65:64]),
    .multiplicand(in_vec[63:32]),
    .multiplier(in_vec[31:0]),
    .op_done(out_vec[64:64]),
    .U(out_vec[63:32]),
    .V(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h3f915e8abf8e26e36;
    stim[1] = 66'h12c2c16d566efdd96;
    stim[2] = 66'h3807dd85355d3a18d;
    stim[3] = 66'h05b7037ba0a4dd539;
    stim[4] = 66'h2d4e8827397cd14b1;
    stim[5] = 66'h1f1d60ac108352f05;
    stim[6] = 66'h0ae855adfc1859285;
    stim[7] = 66'h3cfc0b874359cbe1c;
    stim[8] = 66'h0a7dbc189ec69f07a;
    stim[9] = 66'h14bc5cdc6d71dc010;
    stim[10] = 66'h3a3f40afef3da3686;
    stim[11] = 66'h22575ba4f6f870c6f;
    stim[12] = 66'h38616c901a94d2704;
    stim[13] = 66'h38ada1d8fc89eaa8c;
    stim[14] = 66'h2f815e6513c6ab976;
    stim[15] = 66'h1f63c49734d75c546;
    stim[16] = 66'h15039d136fa709681;
    stim[17] = 66'h15c6a17f24283bd8d;
    stim[18] = 66'h13f984fd1f661e3de;
    stim[19] = 66'h3ac8867586817e0ff;
    stim[20] = 66'h1a972240abd94f01e;
    stim[21] = 66'h06816723ec1f5dca8;
    stim[22] = 66'h2051132c8e565f376;
    stim[23] = 66'h1fe9d91d0b63c7a9d;
    stim[24] = 66'h004b606f2fa4e76fc;
    stim[25] = 66'h38e8f4dee95cccf13;
    stim[26] = 66'h3f1b861f88d28969a;
    stim[27] = 66'h113e523c4b44c29d8;
    stim[28] = 66'h2b4333e16d4d574a8;
    stim[29] = 66'h0a0c6fefe6361e88c;
    stim[30] = 66'h0742e0b60a602c288;
    stim[31] = 66'h02587981814dd4e57;
    stim[32] = 66'h2043cd3d5e476ac0a;
    stim[33] = 66'h1ba5b42b70cfb25a7;
    stim[34] = 66'h37830de132cb1e457;
    stim[35] = 66'h209bf3a12bc334002;
    stim[36] = 66'h1f110b655427a315c;
    stim[37] = 66'h08babcd508140a2ab;
    stim[38] = 66'h3b79de8d86f2a473a;
    stim[39] = 66'h038f5a35cfcee4cb6;
    stim[40] = 66'h266e39a95e0559b64;
    stim[41] = 66'h38064eb0e83881365;
    stim[42] = 66'h215db12fa80a15bb6;
    stim[43] = 66'h36031ee1e86cfd7b2;
    stim[44] = 66'h2387a93de6ac421d3;
    stim[45] = 66'h3e04faf649cb385d5;
    stim[46] = 66'h3a4c8fb20c0f7c6d6;
    stim[47] = 66'h2bcd147ca1ac78296;
    stim[48] = 66'h16a50349ae82b8b60;
    stim[49] = 66'h2f73765e95463c103;
    stim[50] = 66'h05acdce022fd8329b;
    stim[51] = 66'h213c7eae5f0f8285e;
    stim[52] = 66'h2aa889149d10370bc;
    stim[53] = 66'h1b7e39a73484556a1;
    stim[54] = 66'h275c17ed6deec177b;
    stim[55] = 66'h3d73b8e19141bd375;
    stim[56] = 66'h38e5bbe0bcea91a1b;
    stim[57] = 66'h1dfc82b0c965d8d7f;
    stim[58] = 66'h35fc155568fadb9cf;
    stim[59] = 66'h0d7db51791e9cc795;
    stim[60] = 66'h0e4d49c22fd6d3241;
    stim[61] = 66'h2b204478ec53f6427;
    stim[62] = 66'h2cfeae5b1eb890cee;
    stim[63] = 66'h02cd976df51c1ccf8;
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
      expv[0] = 65'hxxxxxxxxxxxxxxxxx;
      expv[1] = 65'h0xxxxxxxxxxxxxxxx;
      expv[2] = 65'h0xxxxxxxxxxxxxxxx;
      expv[3] = 65'h0xxxxxxxxxxxxxxxx;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'h00000000000000000;
      expv[6] = 65'h05b7037bab6e06f74;
      expv[7] = 65'h00000000000000000;
      expv[8] = 65'h00000000000000000;
      expv[9] = 65'h00000000000000000;
      expv[10] = 65'h00000000000000000;
      expv[11] = 65'h00000000000000000;
      expv[12] = 65'h00000000000000000;
      expv[13] = 65'h00000000000000000;
      expv[14] = 65'h00000000000000000;
      expv[15] = 65'h00000000000000000;
      expv[16] = 65'h0a7dbc1894fb78312;
      expv[17] = 65'h0000000004fb78312;
      expv[18] = 65'h0a7dbc189ef268936;
      expv[19] = 65'h0a7dbc189ef268936;
      expv[20] = 65'h0a7dbc189ef268936;
      expv[21] = 65'h0a7dbc189ef268936;
      expv[22] = 65'h00000000000000000;
      expv[23] = 65'h00000000000000000;
      expv[24] = 65'h00000000000000000;
      expv[25] = 65'h00000000000000000;
      expv[26] = 65'h00000000000000000;
      expv[27] = 65'h00000000000000000;
      expv[28] = 65'h00000000000000000;
      expv[29] = 65'h00000000000000000;
      expv[30] = 65'h00000000000000000;
      expv[31] = 65'h00000000000000000;
      expv[32] = 65'h00000000000000000;
      expv[33] = 65'h00000000000000000;
      expv[34] = 65'h0258798184b0f3030;
      expv[35] = 65'h0258798184b0f3030;
      expv[36] = 65'h0258798184b0f3030;
      expv[37] = 65'h0258798184b0f3030;
      expv[38] = 65'h00000000000000000;
      expv[39] = 65'h00000000000000000;
      expv[40] = 65'h00000000000000000;
      expv[41] = 65'h00000000000000000;
      expv[42] = 65'h00000000000000000;
      expv[43] = 65'h00000000000000000;
      expv[44] = 65'h00000000000000000;
      expv[45] = 65'h00000000000000000;
      expv[46] = 65'h00000000000000000;
      expv[47] = 65'h00000000000000000;
      expv[48] = 65'h00000000000000000;
      expv[49] = 65'h00000000000000000;
      expv[50] = 65'h00000000000000000;
      expv[51] = 65'h00000000000000000;
      expv[52] = 65'h00000000000000000;
      expv[53] = 65'h00000000000000000;
      expv[54] = 65'h05acdce02b59b9c04;
      expv[55] = 65'h05acdce02b59b9c04;
      expv[56] = 65'h05acdce02b59b9c04;
      expv[57] = 65'h05acdce02b59b9c04;
      expv[58] = 65'h05acdce02b59b9c04;
      expv[59] = 65'h05acdce02b59b9c04;
      expv[60] = 65'h00000000000000000;
      expv[61] = 65'h00000000000000000;
      expv[62] = 65'h00000000000000000;
      expv[63] = 65'h00000000000000000;
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
